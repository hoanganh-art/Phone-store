<?php
// File: app/Http/Controllers/API/SuppliersController.php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\suppliers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class SuppliersController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $query = suppliers::query();

        // Lọc theo trạng thái
        if ($request->has('status') && $request->status !== '') {
            $query->where('status', $request->status);
        }

        // Lọc theo loại sản phẩm
        if ($request->has('category') && $request->category !== '') {
            $query->whereJsonContains('product_categories', $request->category);
        }

        // Tìm kiếm
        if ($request->has('search') && $request->search !== '') {
            $search = $request->search;
            $query->where(function($q) use ($search) {
                $q->where('suppliers_name', 'LIKE', "%{$search}%")
                  ->orWhere('suppliers_code', 'LIKE', "%{$search}%")
                  ->orWhere('email', 'LIKE', "%{$search}%")
                  ->orWhere('contact_name', 'LIKE', "%{$search}%");
            });
        }

        // Sắp xếp
        $sortBy = $request->get('sort_by', 'id');
        $sortOrder = $request->get('sort_order', 'desc');
        $query->orderBy($sortBy, $sortOrder);

        // Phân trang
        $perPage = $request->get('per_page', 12);
        $supplierss = $query->paginate($perPage);

        return response()->json([
            'success' => true,
            'data' => $supplierss->items(),
            'pagination' => [
                'total' => $supplierss->total(),
                'per_page' => $supplierss->perPage(),
                'current_page' => $supplierss->currentPage(),
                'last_page' => $supplierss->lastPage(),
                'from' => $supplierss->firstItem(),
                'to' => $supplierss->lastItem()
            ]
        ]);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'suppliers_name' => 'required|string|max:255',
            'suppliers_code' => 'required|string|max:50|unique:supplierss',
            'tax_code' => 'nullable|string|max:20',
            'contact_name' => 'required|string|max:255',
            'contact_phone' => 'required|string|max:15',
            'phone' => 'required|string|max:15',
            'email' => 'required|email|max:255',
            'address' => 'required|string',
            'website' => 'nullable|url',
            'product_categories' => 'nullable|array',
            'payment_terms' => 'nullable|string',
            'rating' => 'nullable|numeric|min:1|max:5',
            'status' => 'required|in:active,inactive,pending'
        ]);

        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'errors' => $validator->errors()
            ], 422);
        }

        $data = $request->all();
        $data['join_date'] = now();

        // Chuyển categories thành JSON nếu là array
        if (isset($data['product_categories']) && is_array($data['product_categories'])) {
            $data['product_categories'] = json_encode($data['product_categories']);
        }

        $suppliers = suppliers::create($data);

        return response()->json([
            'success' => true,
            'message' => 'Nhà cung cấp đã được tạo thành công',
            'data' => $suppliers
        ], 201);
    }

    /**
     * Display the specified resource.
     */
    public function show($id)
    {
        $suppliers = suppliers::find($id);

        if (!$suppliers) {
            return response()->json([
                'success' => false,
                'message' => 'Không tìm thấy nhà cung cấp'
            ], 404);
        }

        return response()->json([
            'success' => true,
            'data' => $suppliers
        ]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, $id)
    {
        $suppliers = suppliers::find($id);

        if (!$suppliers) {
            return response()->json([
                'success' => false,
                'message' => 'Không tìm thấy nhà cung cấp'
            ], 404);
        }

        $validator = Validator::make($request->all(), [
            'suppliers_name' => 'string|max:255',
            'suppliers_code' => 'string|max:50|unique:supplierss,suppliers_code,' . $id,
            'tax_code' => 'nullable|string|max:20',
            'contact_name' => 'string|max:255',
            'contact_phone' => 'string|max:15',
            'phone' => 'string|max:15',
            'email' => 'email|max:255',
            'address' => 'string',
            'website' => 'nullable|url',
            'product_categories' => 'nullable|array',
            'payment_terms' => 'nullable|string',
            'rating' => 'nullable|numeric|min:1|max:5',
            'status' => 'in:active,inactive,pending'
        ]);

        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'errors' => $validator->errors()
            ], 422);
        }

        $data = $request->all();

        // Chuyển categories thành JSON nếu là array
        if (isset($data['product_categories']) && is_array($data['product_categories'])) {
            $data['product_categories'] = json_encode($data['product_categories']);
        }

        $suppliers->update($data);

        return response()->json([
            'success' => true,
            'message' => 'Nhà cung cấp đã được cập nhật thành công',
            'data' => $suppliers
        ]);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
        $suppliers = suppliers::find($id);

        if (!$suppliers) {
            return response()->json([
                'success' => false,
                'message' => 'Không tìm thấy nhà cung cấp'
            ], 404);
        }

        $suppliers->delete();

        return response()->json([
            'success' => true,
            'message' => 'Nhà cung cấp đã được xóa thành công'
        ]);
    }

    /**
     * Get statistics for suppliers
     */
    public function getStats()
    {
        $total = suppliers::count();
        $active = suppliers::where('status', 'active')->count();
        $inactive = suppliers::where('status', 'inactive')->count();
        $pending = suppliers::where('status', 'pending')->count();

        return response()->json([
            'success' => true,
            'data' => [
                'total' => $total,
                'active' => $active,
                'inactive' => $inactive,
                'pending' => $pending
            ]
        ]);
    }
}
