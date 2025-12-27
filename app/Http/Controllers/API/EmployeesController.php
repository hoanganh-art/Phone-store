<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Employees;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rule;

class EmployeesController extends Controller
{
    /**
     * Hiển thị danh sách nhân viên.
     */
    public function index(Request $request)
    {
        $query = Employees::query();

        // Tìm kiếm theo tên
        if ($request->has('search')) {
            $query->where('full_name', 'like', '%'.$request->search.'%')
                ->orWhere('username', 'like', '%'.$request->search.'%')
                ->orWhere('email', 'like', '%'.$request->search.'%');
        }

        // Lọc theo vai trò
        if ($request->has('role')) {
            $query->where('role', $request->role);
        }

        // Lọc theo trạng thái
        if ($request->has('status')) {
            $query->where('status', $request->status);
        }

        // Phân trang
        $perPage = $request->get('per_page', 10);
        $employees = $query->paginate($perPage);

        return response()->json([
            'success' => true,
            'data' => $employees,
        ]);
    }

    /**
     * Tạo nhân viên mới.
     */
    public function store(Request $request)
    {
        $validated = $request->validate([
            'username' => 'required|string|max:50|unique:employees',
            'password' => 'required|string|min:6',
            'full_name' => 'required|string|max:255',
            'avatar' => 'nullable|string|max:255',
            'phone' => 'nullable|string|max:15',
            'role' => ['required', Rule::in(['admin', 'employee'])],
            'position' => ['required', Rule::in(['staff', 'Sell', 'Warehouse employee', 'Accountant'])],
            'salary' => 'required|numeric|min:0',
            'hire_date' => 'required|date',
            'email' => 'required|email|max:100|unique:employees',
            'status' => ['required', Rule::in(['active', 'inactive', 'take a break'])],
        ]);

        // Mã hóa mật khẩu
        $validated['password'] = Hash::make($validated['password']);

        $employee = Employees::create($validated);

        return response()->json([
            'success' => true,
            'message' => 'Nhân viên đã được tạo thành công',
            'data' => $employee,
        ], 201);
    }

    /**
     * Hiển thị chi tiết nhân viên.
     */
    public function show($id)
    {
        $employee = Employees::find($id);

        if (! $employee) {
            return response()->json([
                'success' => false,
                'message' => 'Không tìm thấy nhân viên',
            ], 404);
        }

        return response()->json([
            'success' => true,
            'data' => $employee,
        ]);
    }

    /**
     * Cập nhật thông tin nhân viên.
     */
    public function update(Request $request, $id)
    {
        $employee = Employees::find($id);

        if (! $employee) {
            return response()->json([
                'success' => false,
                'message' => 'Không tìm thấy nhân viên',
            ], 404);
        }

        $validated = $request->validate([
            'username' => 'sometimes|string|max:50|unique:employees,username,'.$id,
            'password' => 'sometimes|string|min:6',
            'full_name' => 'sometimes|string|max:255',
            'avatar' => 'nullable|string|max:255',
            'phone' => 'nullable|string|max:15',
            'role' => ['sometimes', Rule::in(['admin', 'employee'])],
            'position' => ['sometimes', Rule::in(['staff', 'Sell', 'Warehouse employee', 'Accountant'])],
            'salary' => 'sometimes|numeric|min:0',
            'hire_date' => 'sometimes|date',
            'email' => 'sometimes|email|max:100|unique:employees,email,'.$id,
            'status' => ['sometimes', Rule::in(['active', 'inactive', 'take a break'])],
        ]);

        // Mã hóa mật khẩu nếu có
        if (isset($validated['password'])) {
            $validated['password'] = Hash::make($validated['password']);
        }

        $employee->update($validated);

        return response()->json([
            'success' => true,
            'message' => 'Cập nhật thông tin nhân viên thành công',
            'data' => $employee,
        ]);
    }

    /**
     * Xóa nhân viên.
     */
    public function destroy($id)
    {
        $employee = Employees::find($id);

        if (! $employee) {
            return response()->json([
                'success' => false,
                'message' => 'Không tìm thấy nhân viên',
            ], 404);
        }

        // Kiểm tra nếu nhân viên có liên quan đến hóa đơn hoặc phiếu nhập
        if ($employee->invoices()->exists() || $employee->imports()->exists()) {
            return response()->json([
                'success' => false,
                'message' => 'Không thể xóa nhân viên vì có dữ liệu liên quan',
            ], 400);
        }

        $employee->delete();

        return response()->json([
            'success' => true,
            'message' => 'Xóa nhân viên thành công',
        ]);
    }

    /**
     * API đăng nhập cho nhân viên.
     */
    public function login(Request $request)
    {
        $credentials = $request->validate([
            'username' => 'required|string',
            'password' => 'required|string',
        ]);

        $employee = Employees::where('username', $credentials['username'])->first();

        if (! $employee || ! Hash::check($credentials['password'], $employee->password)) {
            return response()->json([
                'success' => false,
                'message' => 'Tên đăng nhập hoặc mật khẩu không đúng',
            ], 401);
        }

        // Kiểm tra trạng thái tài khoản
        if ($employee->status !== 'active') {
            return response()->json([
                'success' => false,
                'message' => 'Tài khoản không hoạt động',
            ], 403);
        }

        // Tạo token (nếu dùng Sanctum hoặc Passport)
        // $token = $employee->createToken('auth_token')->plainTextToken;

        return response()->json([
            'success' => true,
            'message' => 'Đăng nhập thành công',
            'data' => [
                'employee' => $employee,
                // 'token' => $token // nếu dùng token authentication
            ],
        ]);
    }

    /**
     * API đổi mật khẩu.
     */
    public function changePassword(Request $request, $id)
    {
        $employee = Employees::find($id);

        if (! $employee) {
            return response()->json([
                'success' => false,
                'message' => 'Không tìm thấy nhân viên',
            ], 404);
        }

        $validated = $request->validate([
            'current_password' => 'required|string',
            'new_password' => 'required|string|min:6|confirmed',
        ]);

        // Kiểm tra mật khẩu hiện tại
        if (! Hash::check($validated['current_password'], $employee->password)) {
            return response()->json([
                'success' => false,
                'message' => 'Mật khẩu hiện tại không đúng',
            ], 400);
        }

        // Cập nhật mật khẩu mới
        $employee->update([
            'password' => Hash::make($validated['new_password']),
        ]);

        return response()->json([
            'success' => true,
            'message' => 'Đổi mật khẩu thành công',
        ]);
    }

    /**
     * API lấy thống kê nhân viên.
     */
    public function statistics()
    {
        $totalEmployees = Employees::count();
        $activeEmployees = Employees::where('status', 'active')->count();
        $adminCount = Employees::where('role', 'admin')->count();
        $employeeCount = Employees::where('role', 'employee')->count();

        // Thống kê theo chức vụ
        $positionStats = Employees::select('position', DB::raw('count(*) as count'))
            ->groupBy('position')
            ->get();

        return response()->json([
            'success' => true,
            'data' => [
                'total_employees' => $totalEmployees,
                'active_employees' => $activeEmployees,
                'admin_count' => $adminCount,
                'employee_count' => $employeeCount,
                'position_statistics' => $positionStats,
            ],
        ]);
    }
}
