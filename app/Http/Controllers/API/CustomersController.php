<?php

namespace App\Http\Controllers\API;

use App\Models\Customer;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class CustomersController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $query = Customer::query();

        // Tìm kiếm
        if ($request->has('search')) {
            $search = $request->search;
            $query->where(function($q) use ($search) {
                $q->where('full_name', 'like', "%{$search}%")
                  ->orWhere('phone', 'like', "%{$search}%")
                  ->orWhere('email', 'like', "%{$search}%");
            });
        }

        // Lọc theo membership
        if ($request->has('membership')) {
            $query->where('membership', $request->membership);
        }

        // Lọc theo giới tính
        if ($request->has('gender')) {
            $query->where('gender', $request->gender);
        }

        // Phân trang
        $perPage = $request->get('per_page', 10);
        $customers = $query->paginate($perPage);

        return response()->json($customers);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validated = $request->validate([
            'full_name' => 'required|string|max:100',
            'phone' => 'required|string|max:15|unique:customers,phone',
            'email' => 'required|email|max:100|unique:customers,email',
            'date_of_birth' => 'nullable|date',
            'gender' => 'nullable|in:Nam,Nữ,Khác',
            'address' => 'nullable|string|max:255',
            'membership' => 'nullable|in:Đồng,Bạc,Vàng,VIP',
            'points' => 'nullable|integer|min:0',
            'description' => 'nullable|string'
        ]);

        $customer = Customer::create($validated);

        return response()->json([
            'message' => 'Khách hàng đã được tạo thành công',
            'data' => $customer
        ], 201);
    }

    /**
     * Display the specified resource.
     */
    public function show($id)
    {
        $customer = Customer::find($id);

        if (!$customer) {
            return response()->json([
                'message' => 'Không tìm thấy khách hàng'
            ], 404);
        }

        return response()->json($customer);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, $id)
    {
        $customer = Customer::find($id);

        if (!$customer) {
            return response()->json([
                'message' => 'Không tìm thấy khách hàng'
            ], 404);
        }

        $validated = $request->validate([
            'full_name' => 'sometimes|required|string|max:100',
            'phone' => 'sometimes|required|string|max:15|unique:customers,phone,' . $id,
            'email' => 'sometimes|required|email|max:100|unique:customers,email,' . $id,
            'date_of_birth' => 'nullable|date',
            'gender' => 'nullable|in:Nam,Nữ,Khác',
            'address' => 'nullable|string|max:255',
            'membership' => 'nullable|in:Đồng,Bạc,Vàng,VIP',
            'points' => 'nullable|integer|min:0',
            'description' => 'nullable|string'
        ]);

        $customer->update($validated);

        return response()->json([
            'message' => 'Thông tin khách hàng đã được cập nhật',
            'data' => $customer->fresh()
        ]);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
        $customer = Customer::find($id);

        if (!$customer) {
            return response()->json([
                'message' => 'Không tìm thấy khách hàng'
            ], 404);
        }

        // Kiểm tra nếu khách hàng có hóa đơn thì không xóa
        if ($customer->invoices()->count() > 0) {
            return response()->json([
                'message' => 'Không thể xóa khách hàng đã có hóa đơn'
            ], 400);
        }

        $customer->delete();

        return response()->json([
            'message' => 'Khách hàng đã được xóa thành công'
        ]);
    }

    /**
     * Thống kê khách hàng
     */
    public function stats()
    {
        $stats = [
            'total' => Customer::count(),
            'by_membership' => Customer::selectRaw('membership, count(*) as count')
                ->groupBy('membership')
                ->get(),
            'by_gender' => Customer::selectRaw('gender, count(*) as count')
                ->whereNotNull('gender')
                ->groupBy('gender')
                ->get(),
            'top_customers' => Customer::orderBy('points', 'desc')
                ->limit(10)
                ->get(['id', 'full_name', 'phone', 'points', 'membership'])
        ];

        return response()->json($stats);
    }
}
