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

        // Lọc theo xếp hạng
        if ($request->has('rating') && $request->rating !== '') {
            $query->where('rating', '>=', $request->rating);
        }

        // Tìm kiếm
        if ($request->has('search') && $request->search !== '') {
            $search = $request->search;
            $query->where(function($q) use ($search) {
                $q->where('supplier_name', 'LIKE', "%{$search}%")
                  ->orWhere('supplier_code', 'LIKE', "%{$search}%")
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
        $suppliers = $query->paginate($perPage);

        return response()->json([
            'success' => true,
            'data' => $suppliers->items(),
            'pagination' => [
                'total' => $suppliers->total(),
                'per_page' => $suppliers->perPage(),
                'current_page' => $suppliers->currentPage(),
                'last_page' => $suppliers->lastPage(),
                'from' => $suppliers->firstItem(),
                'to' => $suppliers->lastItem()
            ]
        ]);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'supplier_code' => 'required|string|max:50|unique:suppliers',
            'supplier_name' => 'required|string|max:255',
            'tax_code' => 'nullable|string|max:50',
            'contact_name' => 'required|string|max:255',
            'representative_name' => 'nullable|string|max:255',
            'company_phone' => 'required|string|max:15',
            'representative_phone' => 'nullable|string|max:15',
            'email' => 'required|email|max:255',
            'address' => 'required|string',
            'website' => 'nullable|url|max:255',
            'product_types' => 'nullable|array',
            'rating' => 'nullable|numeric|min:0|max:5',
            'payment_terms' => 'nullable|string',
            'logo_url' => 'nullable|url|max:500',
            'cooperation_date' => 'nullable|date',
            'status' => 'required|in:active,inactive,pending'
        ]);

        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'errors' => $validator->errors()
            ], 422);
        }

        $data = $request->all();

        // Chuyển product_types thành JSON nếu là array
        if (isset($data['product_types']) && is_array($data['product_types'])) {
            $data['product_types'] = json_encode($data['product_types']);
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
            'supplier_code' => 'string|max:50|unique:suppliers,supplier_code,' . $id,
            'supplier_name' => 'string|max:255',
            'tax_code' => 'nullable|string|max:50',
            'contact_name' => 'string|max:255',
            'representative_name' => 'nullable|string|max:255',
            'company_phone' => 'string|max:15',
            'representative_phone' => 'nullable|string|max:15',
            'email' => 'email|max:255',
            'address' => 'string',
            'website' => 'nullable|url|max:255',
            'product_types' => 'nullable|array',
            'rating' => 'nullable|numeric|min:0|max:5',
            'payment_terms' => 'nullable|string',
            'logo_url' => 'nullable|url|max:500',
            'cooperation_date' => 'nullable|date',
            'status' => 'in:active,inactive,pending'
        ]);

        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'errors' => $validator->errors()
            ], 422);
        }

        $data = $request->all();

        // Chuyển product_types thành JSON nếu là array
        if (isset($data['product_types']) && is_array($data['product_types'])) {
            $data['product_types'] = json_encode($data['product_types']);
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
