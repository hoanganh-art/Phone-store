<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\invoices;        // Model cho bảng invoices
use App\Models\invoice_details;  // Model cho bảng invoice_details
use App\Models\Customer;       // Model cho khách hàng
use App\Models\Employee;       // Model cho nhân viên
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;            // Xử lý ngày tháng

class invoicesController extends Controller
{
    /**
     * Lấy danh sách đơn hàng với phân trang và lọc
     */
    public function index(Request $request)
    {
        try {
            // Bắt đầu query với các quan hệ
            $query = invoices::with(['customer', 'employee', 'invoiceDetails.product'])
                ->orderBy('created_at', 'desc');  // Sắp xếp mới nhất trước

            // 🔍 LỌC THEO TRẠNG THÁI
            if ($request->has('status') && $request->status != 'all') {
                $query->where('status', $request->status);
            }

            // 💳 LỌC THEO PHƯƠNG THỨC THANH TOÁN
            if ($request->has('payment_method')) {
                $query->where('payment_method', $request->payment_method);
            }

            // 📅 LỌC THEO KHOẢNG THỜI GIAN
            if ($request->has('start_date')) {
                $query->whereDate('invoice_date', '>=', $request->start_date);
            }
            if ($request->has('end_date')) {
                $query->whereDate('invoice_date', '<=', $request->end_date);
            }

            // 👤 LỌC THEO KHÁCH HÀNG
            if ($request->has('customer_id')) {
                $query->where('customer_id', $request->customer_id);
            }

            // 🔍 TÌM KIẾM THEO MÃ ĐƠN HOẶC TÊN KHÁCH
            if ($request->has('search')) {
                $search = $request->search;
                $query->where(function($q) use ($search) {
                    $q->where('id', 'LIKE', "%{$search}%")
                      ->orWhereHas('customer', function($q2) use ($search) {
                          $q2->where('name', 'LIKE', "%{$search}%")
                             ->orWhere('phone', 'LIKE', "%{$search}%");
                      });
                });
            }

            // 📄 PHÂN TRANG
            $perPage = $request->get('per_page', 10);  // Mặc định 10 bản ghi/trang
            $invoicess = $query->paginate($perPage);

            // ✨ ĐỊNH DẠNG DỮ LIỆU TRẢ VỀ
            $formattedinvoicess = $invoicess->map(function($invoices) {
                return [
                    'id' => $invoices->id,
                    'invoices_code' => 'DH' . str_pad($invoices->id, 6, '0', STR_PAD_LEFT),  // Tạo mã đơn: DH000001
                    'customer' => [
                        'id' => $invoices->customer->id,
                        'name' => $invoices->customer->name,
                        'phone' => $invoices->customer->phone,
                        'email' => $invoices->customer->email,
                    ],
                    'employee' => [
                        'id' => $invoices->employee->id,
                        'name' => $invoices->employee->name,
                    ],
                    'invoice_date' => $invoices->invoice_date,
                    'created_at' => $invoices->created_at?->format('d/m/Y H:i'),
                    'items_count' => $invoices->invoiceDetails->count(),  // Số lượng sản phẩm
                    'products' => $invoices->invoiceDetails->map(function($detail) {
                        return [
                            'name' => $detail->product->name,
                            'quantity' => $detail->quantity,
                            'unit_price' => number_format((float)$detail->unit_price, 0, ',', '.') . '₫',
                        ];
                    }),
                    'subtotal' => number_format((float)$invoices->subtotal, 0, ',', '.') . '₫',
                    'discount' => number_format((float)$invoices->discount, 0, ',', '.') . '₫',
                    'total_amount' => number_format((float)$invoices->total_amount, 0, ',', '.') . '₫',
                    'payment_method' => $this->getPaymentMethodText($invoices->payment_method),  // Chuyển đổi text
                    'payment_method_value' => $invoices->payment_method,  // Giá trị gốc
                    'status' => $this->getStatusText($invoices->status),  // Chuyển đổi text
                    'status_value' => $invoices->status,  // Giá trị gốc
                    'status_class' => $this->getStatusClass($invoices->status),  // Class CSS
                ];
            });

            return response()->json([
                'success' => true,
                'data' => $formattedinvoicess,
                'meta' => [
                    'current_page' => $invoicess->currentPage(),
                    'last_page' => $invoicess->lastPage(),
                    'per_page' => $invoicess->perPage(),
                    'total' => $invoicess->total(),
                    'from' => $invoicess->firstItem(),
                    'to' => $invoicess->lastItem(),
                ]
            ]);

        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Lỗi khi tải dữ liệu đơn hàng: ' . $e->getMessage()
            ], 500);
        }
    }

    /**
     * Lấy thống kê đơn hàng
     */
    public function stats(Request $request)
    {
        try {
            // Mặc định lấy tháng hiện tại
            $startDate = $request->get('start_date', Carbon::now()->startOfMonth());
            $endDate = $request->get('end_date', Carbon::now()->endOfMonth());

            // 📊 TÍNH CÁC CHỈ SỐ THỐNG KÊ
            $stats = [
                'total' => invoices::count(),  // Tổng số đơn
                'total_revenue' => invoices::sum('total_amount'),  // Tổng doanh thu

                // Đếm theo trạng thái
                'pending' => invoices::where('status', 'pending')->count(),
                'processing' => invoices::where('status', 'processing')->count(),
                'completed' => invoices::where('status', 'completed')->count(),
                'cancelled' => invoices::where('status', 'cancelled')->count(),

                // Thống kê theo tháng
                'monthly_total' => invoices::whereBetween('invoice_date', [$startDate, $endDate])->count(),
                'monthly_revenue' => invoices::whereBetween('invoice_date', [$startDate, $endDate])->sum('total_amount'),
                'monthly_pending' => invoices::whereBetween('invoice_date', [$startDate, $endDate])
                    ->where('status', 'pending')->count(),
                'monthly_processing' => invoices::whereBetween('invoice_date', [$startDate, $endDate])
                    ->where('status', 'processing')->count(),
            ];

            return response()->json([
                'success' => true,
                'data' => $stats
            ]);

        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Lỗi khi tải thống kê: ' . $e->getMessage()
            ], 500);
        }
    }

    /**
     * Lấy chi tiết một đơn hàng
     */
    public function show($id)
    {
        try {
            // Lấy đơn hàng với tất cả quan hệ
            $invoices = invoices::with(['customer', 'employee', 'invoiceDetails.product'])
                ->findOrFail($id);  // Tìm hoặc báo lỗi 404

            $formattedinvoices = [
                'id' => $invoices->id,
                'invoices_code' => 'DH' . str_pad($invoices->id, 6, '0', STR_PAD_LEFT),
                'customer' => [
                    'id' => $invoices->customer->id,
                    'name' => $invoices->customer->name,
                    'phone' => $invoices->customer->phone,
                    'email' => $invoices->customer->email,
                    'address' => $invoices->customer->address,
                ],
                'employee' => [
                    'id' => $invoices->employee->id,
                    'name' => $invoices->employee->name,
                    'phone' => $invoices->employee->phone,
                    'email' => $invoices->employee->email,
                ],
                'invoice_date' => $invoices->invoice_date,
                'created_at' => $invoices->created_at?->format('d/m/Y H:i:s'),
                'items' => $invoices->invoiceDetails->map(function($detail) {
                    return [
                        'product_id' => $detail->product_id,
                        'product_name' => $detail->product->name,
                        'product_code' => $detail->product->code,
                        'quantity' => $detail->quantity,
                        'unit_price' => number_format((float)$detail->unit_price, 0, ',', '.') . '₫',
                        'amount' => number_format((float)$detail->amount, 0, ',', '.') . '₫',
                    ];
                }),
                'subtotal' => number_format((float)$invoices->subtotal, 0, ',', '.') . '₫',
                'discount' => number_format((float)$invoices->discount, 0, ',', '.') . '₫',
                'total_amount' => number_format((float)$invoices->total_amount, 0, ',', '.') . '₫',
                'payment_method' => $this->getPaymentMethodText($invoices->payment_method),
                'payment_method_value' => $invoices->payment_method,
                'status' => $this->getStatusText($invoices->status),
                'status_value' => $invoices->status,
                'status_class' => $this->getStatusClass($invoices->status),
            ];

            return response()->json([
                'success' => true,
                'data' => $formattedinvoices
            ]);

        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Không tìm thấy đơn hàng: ' . $e->getMessage()
            ], 404);
        }
    }

    /**
     * Cập nhật trạng thái đơn hàng
     */
    public function updateStatus(Request $request, $id)
    {
        try {
            // Validate dữ liệu đầu vào
            $request->validate([
                'status' => 'required|in:paid,unpaid,pending',
                'note' => 'nullable|string|max:500'
            ]);

            $invoices = invoices::findOrFail($id);
            $oldStatus = $invoices->status;
            $invoices->status = $request->status;
            $invoices->save();

            // Có thể ghi log thay đổi trạng thái ở đây
            // StatusLog::create([...]);

            return response()->json([
                'success' => true,
                'message' => 'Cập nhật trạng thái thành công',
                'data' => [
                    'id' => $invoices->id,
                    'status' => $this->getStatusText($invoices->status),
                    'status_value' => $invoices->status,
                    'status_class' => $this->getStatusClass($invoices->status),
                ]
            ]);

        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Lỗi khi cập nhật trạng thái: ' . $e->getMessage()
            ], 500);
        }
    }

    /**
     * Các hàm hỗ trợ chuyển đổi
     */

    // 🔄 Chuyển trạng thái từ tiếng Anh sang tiếng Việt
    private function getStatusText($status)
    {
        $statuses = [
            'pending' => 'Chờ xử lý',
            'unpaid' => 'Chưa thanh toán',
            'paid' => 'Đã thanh toán',
            'processing' => 'Đang xử lý',
            'shipping' => 'Đang giao hàng',
            'completed' => 'Hoàn thành',
            'cancelled' => 'Đã hủy',
        ];

        return $statuses[$status] ?? $status;
    }

    // 🎨 Lấy class CSS tương ứng với trạng thái
    private function getStatusClass($status)
    {
        $classes = [
            'pending' => 'status-pending',        // Màu cam
            'unpaid' => 'status-pending',
            'paid' => 'status-processing',        // Màu xanh dương
            'processing' => 'status-processing',
            'shipping' => 'status-processing',
            'completed' => 'status-completed',    // Màu xanh lá
            'cancelled' => 'status-cancelled',    // Màu đỏ
        ];

        return $classes[$status] ?? 'status-pending';
    }

    // 💳 Chuyển phương thức thanh toán sang tiếng Việt
    private function getPaymentMethodText($method)
    {
        $methods = [
            'cash' => 'Tiền mặt',
            'credit_card' => 'Thẻ tín dụng',
            'bank_transfer' => 'Chuyển khoản',
            'cod' => 'Thanh toán khi nhận hàng',
            'momo' => 'Ví MoMo',
        ];

        return $methods[$method] ?? $method;
    }
}
