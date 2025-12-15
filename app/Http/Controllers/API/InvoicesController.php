<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Invoices;
use App\Models\Customer;
use App\Models\invoice_details;
use App\Models\InvoicesItem;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rules\In;

class InvoicesController extends Controller
{
    /**
     * Lấy danh sách đơn hàng với filter và pagination
     */
    public function index(Request $request)
    {
        try {
            // Build query
            $query = Invoices::with(['customer', 'employee', 'items.product'])
                ->InvoicesBy('created_at', 'desc');

            // Áp dụng filters
            if ($request->has('status') && $request->status) {
                $query->where('status', $request->status);
            }

            if ($request->has('payment_method') && $request->payment_method) {
                $query->where('payment_method', $request->payment_method);
            }

            if ($request->has('customer_id') && $request->customer_id) {
                $query->where('customer_id', $request->customer_id);
            }

            if ($request->has('employee_id') && $request->employee_id) {
                $query->where('employee_id', $request->employee_id);
            }

            if ($request->has('start_date') && $request->start_date) {
                $query->whereDate('created_at', '>=', $request->start_date);
            }

            if ($request->has('end_date') && $request->end_date) {
                $query->whereDate('created_at', '<=', $request->end_date);
            }

            if ($request->has('search') && $request->search) {
                $search = $request->search;
                $query->where(function($q) use ($search) {
                    $q->where('invoice_code', 'like', "%{$search}%")
                      ->orWhereHas('customer', function($q2) use ($search) {
                          $q2->where('name', 'like', "%{$search}%")
                             ->orWhere('phone', 'like', "%{$search}%");
                      });
                });
            }

            // Pagination
            $perPage = $request->per_page ?? 10;
            $Invoicess = $query->paginate($perPage);

            return response()->json([
                'success' => true,
                'data' => $Invoicess->items(),
                'current_page' => $Invoicess->currentPage(),
                'total' => $Invoicess->total(),
                'per_page' => $Invoicess->perPage(),
                'last_page' => $Invoicess->lastPage(),
                'from' => $Invoicess->firstItem(),
                'to' => $Invoicess->lastItem()
            ]);

        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Lỗi khi lấy danh sách đơn hàng',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    /**
     * Lấy thống kê đơn hàng
     */
    public function stats()
    {
        try {
            $stats = [
                'total' => invoices::count(),
                'pending' => invoices::where('status', 'pending')->count(),
                'processing' => invoices::where('status', 'processing')->count(),
                'shipping' => invoices::where('status', 'shipping')->count(),
                'completed' => invoices::where('status', 'completed')->count(),
                'cancelled' => invoices::where('status', 'cancelled')->count(),
            ];

            return response()->json([
                'success' => true,
                'data' => $stats
            ]);

        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Lỗi khi lấy thống kê',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    /**
     * Lấy chi tiết đơn hàng
     */
    public function show($id)
    {
        try {
            $Invoices = Invoices::with(['customer', 'employee', 'items.product'])
                ->find($id);

            if (!$Invoices) {
                return response()->json([
                    'success' => false,
                    'message' => 'Không tìm thấy đơn hàng'
                ], 404);
            }

            return response()->json([
                'success' => true,
                'data' => $Invoices
            ]);

        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Lỗi khi lấy chi tiết đơn hàng',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    /**
     * Tạo đơn hàng mới
     */
    public function store(Request $request)
    {
        try {
            // Validate dữ liệu
            $validator = Validator::make($request->all(), [
                'customer_id' => 'required|exists:customers,id',
                'employee_id' => 'nullable|exists:employees,id',
                'payment_method' => 'required|in:cash,credit_card,bank_transfer,cod,momo,zalopay',
                'items' => 'required|array|min:1',
                'items.*.product_id' => 'required|exists:products,id',
                'items.*.quantity' => 'required|integer|min:1',
                'items.*.price' => 'required|numeric|min:0',
            ]);

            if ($validator->fails()) {
                return response()->json([
                    'success' => false,
                    'message' => 'Dữ liệu không hợp lệ',
                    'errors' => $validator->errors()
                ], 422);
            }

            DB::beginTransaction();

            // Tạo đơn hàng
            $Invoices = Invoices::create([
                'invoice_code' => 'DH' . date('Ymd') . str_pad(Invoices::count() + 1, 4, '0', STR_PAD_LEFT),
                'customer_id' => $request->customer_id,
                'employee_id' => $request->employee_id,
                'payment_method' => $request->payment_method,
                'status' => 'pending',
                'total_amount' => 0,
                'notes' => $request->notes,
            ]);

            // Thêm các sản phẩm vào đơn hàng
            $totalAmount = 0;
            foreach ($request->items as $item) {
                $InvoicesItem = invoice_details::create([
                    'Invoices_id' => $Invoices->id,
                    'product_id' => $item['product_id'],
                    'quantity' => $item['quantity'],
                    'price' => $item['price'],
                    'subtotal' => $item['quantity'] * $item['price']
                ]);

                $totalAmount += $InvoicesItem->subtotal;
            }

            // Cập nhật tổng tiền
            $Invoices->update(['total_amount' => $totalAmount]);

            DB::commit();

            return response()->json([
                'success' => true,
                'message' => 'Tạo đơn hàng thành công',
                'data' => $Invoices->load(['customer', 'items.product'])
            ], 201);

        } catch (\Exception $e) {
            DB::rollBack();
            return response()->json([
                'success' => false,
                'message' => 'Lỗi khi tạo đơn hàng',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    /**
     * Cập nhật đơn hàng
     */
    public function update(Request $request, $id)
    {
        try {
            $Invoices = Invoices::find($id);

            if (!$Invoices) {
                return response()->json([
                    'success' => false,
                    'message' => 'Không tìm thấy đơn hàng'
                ], 404);
            }

            $validator = Validator::make($request->all(), [
                'customer_id' => 'exists:customers,id',
                'employee_id' => 'nullable|exists:employees,id',
                'payment_method' => 'in:cash,credit_card,bank_transfer,cod,momo,zalopay',
                'status' => 'in:pending,processing,shipping,completed,cancelled',
            ]);

            if ($validator->fails()) {
                return response()->json([
                    'success' => false,
                    'message' => 'Dữ liệu không hợp lệ',
                    'errors' => $validator->errors()
                ], 422);
            }

            $Invoices->update($request->only([
                'customer_id', 'employee_id', 'payment_method',
                'status', 'notes'
            ]));

            return response()->json([
                'success' => true,
                'message' => 'Cập nhật đơn hàng thành công',
                'data' => $Invoices->load(['customer', 'items.product'])
            ]);

        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Lỗi khi cập nhật đơn hàng',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    /**
     * Cập nhật trạng thái đơn hàng
     */
    public function updateStatus(Request $request, $id)
    {
        try {
            $Invoices = Invoices::find($id);

            if (!$Invoices) {
                return response()->json([
                    'success' => false,
                    'message' => 'Không tìm thấy đơn hàng'
                ], 404);
            }

            $validator = Validator::make($request->all(), [
                'status' => 'required|in:pending,processing,shipping,completed,cancelled',
                'note' => 'nullable|string'
            ]);

            if ($validator->fails()) {
                return response()->json([
                    'success' => false,
                    'message' => 'Dữ liệu không hợp lệ',
                    'errors' => $validator->errors()
                ], 422);
            }

            // Lưu lịch sử thay đổi trạng thái
            $Invoices->status_history()->create([
                'old_status' => $Invoices->status,
                'new_status' => $request->status,
                'note' => $request->note
                // 'changed_by' => auth()->user()?->id // Nếu có authentication
            ]);

            // Cập nhật trạng thái
            $Invoices->update([
                'status' => $request->status,
                'notes' => $request->note ? $Invoices->notes . "\n[Status Change]: " . $request->note : $Invoices->notes
            ]);

            return response()->json([
                'success' => true,
                'message' => 'Cập nhật trạng thái thành công',
                'data' => $Invoices
            ]);

        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Lỗi khi cập nhật trạng thái',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    /**
     * Xóa đơn hàng
     */
    public function destroy($id)
    {
        try {
            $Invoices = Invoices::find($id);

            if (!$Invoices) {
                return response()->json([
                    'success' => false,
                    'message' => 'Không tìm thấy đơn hàng'
                ], 404);
            }

            // Chỉ cho phép xóa đơn hàng ở trạng thái pending hoặc cancelled
            if (!in_array($Invoices->status, ['pending', 'cancelled'])) {
                return response()->json([
                    'success' => false,
                    'message' => 'Chỉ có thể xóa đơn hàng ở trạng thái "Chờ xử lý" hoặc "Đã hủy"'
                ], 400);
            }

            DB::beginTransaction();

            // Xóa các Invoices items trước
            $Invoices->items()->delete();

            // Xóa đơn hàng
            $Invoices->delete();

            DB::commit();

            return response()->json([
                'success' => true,
                'message' => 'Xóa đơn hàng thành công'
            ]);

        } catch (\Exception $e) {
            DB::rollBack();
            return response()->json([
                'success' => false,
                'message' => 'Lỗi khi xóa đơn hàng',
                'error' => $e->getMessage()
            ], 500);
        }
    }
}
