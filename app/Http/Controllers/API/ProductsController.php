<?php

namespace App\Http\Controllers\API;
use App\Http\Controllers\Controller;
use App\Models\brands;
use App\Models\invoice_details;
use App\Models\Products;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;

class ProductsController extends Controller
{
    /**
     * Lấy danh sách sản phẩm
     */
    public function index(Request $request)
    {
        try {
            $query = products::query()->with('brand');

            if ($request->has('category') && $request->category != '') {
                $query->where('category', $request->category);
            }

            if ($request->has('brand_id') && $request->brand_id != '') {
                $query->where('brand_id', $request->brand_id);
            }

            if ($request->has('stock_status') && $request->stock_status != '') {
                switch ($request->stock_status) {
                    case 'in-stock':
                        $query->where('stock', '>', 0);
                        break;
                    case 'out-of-stock':
                        $query->where('stock', 0);
                        break;
                    case 'low-stock':
                        $query->where('stock', '<', 10)->where('stock', '>', 0);
                        break;
                }
            }

            if ($request->has('status') && $request->status != '') {
                $query->where('status', $request->status);
            }

            if ($request->has('price_range') && $request->price_range != '') {
                switch ($request->price_range) {
                    case 'low':
                        $query->where('price', '<', 5000000);
                        break;
                    case 'medium':
                        $query->whereBetween('price', [5000000, 15000000]);
                        break;
                    case 'high':
                        $query->whereBetween('price', [15000000, 30000000]);
                        break;
                    case 'premium':
                        $query->where('price', '>', 30000000);
                        break;
                }
            }

            if ($request->has('search') && $request->search != '') {
                $search = $request->search;
                $query->where(function ($q) use ($search) {
                    $q->where('product_name', 'like', "%{$search}%")
                        ->orWhere('sku', 'like', "%{$search}%")
                        ->orWhere('ram', 'like', "%{$search}%")
                        ->orWhere('storage', 'like', "%{$search}%")
                        ->orWhere('description', 'like', "%{$search}%");
                });
            }

            $query->orderBy('created_at', 'desc');

            $perPage = $request->has('per_page') ? $request->per_page : 12;
            $products = $query->paginate($perPage);

            return response()->json([
                'success' => true,
                'data' => $products,
                'message' => 'Lấy danh sách sản phẩm thành công',
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Lỗi server: '.$e->getMessage(),
            ], 500);
        }
    }

    /**
     * Lấy thông tin sản phẩm theo ID
     */
    public function show($id)
    {
        try {
            $product = products::with('brand')->find($id);

            if (! $product) {
                return response()->json([
                    'success' => false,
                    'message' => 'Không tìm thấy sản phẩm',
                ], 404);
            }

            return response()->json([
                'success' => true,
                'data' => $product,
                'message' => 'Lấy thông tin sản phẩm thành công',
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Lỗi server: '.$e->getMessage(),
            ], 500);
        }
    }

    /**
     * Tạo sản phẩm mới
     */
    public function store(Request $request)
    {
        try {
            $validator = Validator::make($request->all(), [
                'product_name' => 'required|string|max:100',
                'brand_id' => 'required|integer|exists:brands,id',
                'category' => 'required|string|max:50',
                'ram' => 'nullable|string|max:20',
                'storage' => 'nullable|string|max:20',
                'price' => 'required|numeric|min:0',
                'cost_price' => 'required|numeric|min:0',
                'stock' => 'required|integer|min:0',
                'status' => 'required|in:Available,Out of Stock,Discontinued',
                'description' => 'nullable|string',
                'image' => 'nullable|string', // Đổi từ url thành string
            ]);

            if ($validator->fails()) {
                return response()->json([
                    'success' => false,
                    'message' => 'Dữ liệu không hợp lệ',
                    'errors' => $validator->errors(),
                ], 422);
            }

            $sku = $request->sku ?: $this->generateSKU($request->brand_id, $request->category);

            // Sử dụng URL từ request hoặc ảnh mặc định
            $imageUrl = $request->image ?: 'https://images.unsplash.com/photo-1598327105666-5b89351aff97?w=400&h=400&fit=crop';

            $product = products::create([
                'product_name' => $request->product_name,
                'sku' => $sku,
                'brand_id' => $request->brand_id,
                'category' => $request->category,
                'ram' => $request->ram,
                'storage' => $request->storage,
                'price' => $request->price,
                'cost_price' => $request->cost_price,
                'stock' => $request->stock,
                'status' => $request->status,
                'description' => $request->description,
                'image' => $imageUrl,
            ]);

            return response()->json([
                'success' => true,
                'data' => $product->load('brand'),
                'message' => 'Tạo sản phẩm mới thành công',
            ], 201);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Lỗi server: '.$e->getMessage(),
            ], 500);
        }
    }

    /**
     * Cập nhật sản phẩm
     */
    public function update(Request $request, $id)
    {
        try {
            $product = products::find($id);

            if (! $product) {
                return response()->json([
                    'success' => false,
                    'message' => 'Không tìm thấy sản phẩm',
                ], 404);
            }

            $validator = Validator::make($request->all(), [
                'product_name' => 'nullable|string|max:100',
                'brand_id' => 'nullable|integer|exists:brands,id',
                'category' => 'nullable|string|max:50',
                'ram' => 'nullable|string|max:20',
                'storage' => 'nullable|string|max:20',
                'price' => 'nullable|numeric|min:0',
                'cost_price' => 'nullable|numeric|min:0',
                'stock' => 'nullable|integer|min:0',
                'status' => 'nullable|in:Available,Out of Stock,Coming Soon,Discontinued',
                'description' => 'nullable|string',
                'image' => 'nullable|url|max:255', // Thêm max:255
            ]);

            if ($validator->fails()) {
                return response()->json([
                    'success' => false,
                    'message' => 'Dữ liệu không hợp lệ',
                    'errors' => $validator->errors(),
                ], 422);
            }

            // Cập nhật từng trường thay vì dùng update($request->all())
            $updateData = $request->only([
                'product_name', 'brand_id', 'category', 'ram', 'storage',
                'price', 'cost_price', 'stock', 'status', 'description', 'image'
            ]);

            $product->update($updateData);

            return response()->json([
                'success' => true,
                'data' => $product->load('brand'),
                'message' => 'Cập nhật sản phẩm thành công',
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Lỗi server: '.$e->getMessage(),
            ], 500);
        }
    }

    /**
     * Xóa sản phẩm
     */
    public function destroy($id)
    {
        try {
            $product = products::find($id);

            if (! $product) {
                return response()->json([
                    'success' => false,
                    'message' => 'Không tìm thấy sản phẩm',
                ], 404);
            }

            // Kiểm tra xem sản phẩm có trong hóa đơn không
            $hasInvoices = invoice_details::where('product_id', $id)->exists();

            if ($hasInvoices) {
                return response()->json([
                    'success' => false,
                    'message' => 'Không thể xóa sản phẩm vì đã có trong hóa đơn',
                ], 400);
            }

            $product->delete();

            return response()->json([
                'success' => true,
                'message' => 'Xóa sản phẩm thành công',
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Lỗi server: '.$e->getMessage(),
            ], 500);
        }
    }

    /**
     * Lấy thống kê sản phẩm
     */
    public function stats()
    {
        try {
            return response()->json([
                'success' => true,
                'data' => [
                    'total' => products::count(),
                    'available' => products::where('stock', '>', 5)->count(),
                    'low_stock' => products::where('stock', '>', 0)->where('stock', '<=', 5)->count(),
                    'out_of_stock' => products::where('stock', '=', 0)->count(),
                ],
                'message' => 'Lấy thống kê thành công',
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Lỗi server: '.$e->getMessage(),
            ], 500);
        }
    }

    /**
     * Lấy danh sách thương hiệu
     */
    public function getBrands()
    {
        try {
            $brands = brands::all();

            return response()->json([
                'success' => true,
                'data' => $brands,
                'message' => 'Lấy danh sách thương hiệu thành công',
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Lỗi server: '.$e->getMessage(),
            ], 500);
        }
    }

    /**
     * Lấy danh sách danh mục
     */
    public function getCategories()
    {
        try {
            $categories = products::distinct()->pluck('category');

            return response()->json([
                'success' => true,
                'data' => $categories,
                'message' => 'Lấy danh sách danh mục thành công',
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Lỗi server: '.$e->getMessage(),
            ], 500);
        }
    }

    /**
     * Tự động tạo SKU
     */
    private function generateSKU($brandId, $category)
    {
        $brand = brands::find($brandId);
        $brandPrefix = strtoupper(substr($brand->brand_name, 0, 2));

        $categoryPrefix = '';
        switch ($category) {
            case 'Flagship':
                $categoryPrefix = 'FL';
                break;
            case 'Mid-range':
                $categoryPrefix = 'MR';
                break;
            case 'Budget':
                $categoryPrefix = 'BG';
                break;
            default:
                $categoryPrefix = 'OT';
                break;
        }

        $timestamp = time();
        $random = rand(100, 999);

        return $brandPrefix.$categoryPrefix.$timestamp.$random;
    }

    /**
     * Lấy các tùy chọn lọc
     */
    public function filterOptions()
    {
        try {
            $categories = products::distinct()->pluck('category');
            $statuses = ['Available', 'Out of Stock', 'Coming Soon', 'Discontinued'];
            $priceRanges = [
                ['value' => 'low', 'label' => 'Dưới 5 triệu'],
                ['value' => 'medium', 'label' => '5 - 15 triệu'],
                ['value' => 'high', 'label' => '15 - 30 triệu'],
                ['value' => 'premium', 'label' => 'Trên 30 triệu'],
            ];
            $stockStatuses = [
                ['value' => 'in-stock', 'label' => 'Còn hàng'],
                ['value' => 'low-stock', 'label' => 'Sắp hết'],
                ['value' => 'out-of-stock', 'label' => 'Hết hàng'],
            ];

            return response()->json([
                'success' => true,
                'data' => [
                    'categories' => $categories,
                    'statuses' => $statuses,
                    'price_ranges' => $priceRanges,
                    'stock_statuses' => $stockStatuses,
                ],
                'message' => 'Lấy tùy chọn lọc thành công',
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Lỗi server: '.$e->getMessage(),
            ], 500);
        }
    }
}
