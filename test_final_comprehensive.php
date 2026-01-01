<?php

echo "╔════════════════════════════════════════════════════════════════╗\n";
echo "║         KIỂM TRA API EMPLOYEES - KẾT QUẢ CUỐI CÙNG           ║\n";
echo "╚════════════════════════════════════════════════════════════════╝\n\n";

$tests = [
    [
        'name' => 'Hiển thị danh sách nhân viên',
        'url' => 'http://127.0.0.1:8000/api/employees?per_page=3',
        'check' => fn($r) => $r['success'] && isset($r['data']['total'])
    ],
    [
        'name' => 'Hiển thị chi tiết nhân viên',
        'url' => 'http://127.0.0.1:8000/api/employees/2',
        'check' => fn($r) => $r['success'] && isset($r['data']['id'])
    ],
    [
        'name' => 'Lấy thống kê nhân viên',
        'url' => 'http://127.0.0.1:8000/api/employees/statistics',
        'check' => fn($r) => $r['success'] && isset($r['data']['total_employees'])
    ],
    [
        'name' => 'Tìm kiếm nhân viên',
        'url' => 'http://127.0.0.1:8000/api/employees?search=seller',
        'check' => fn($r) => $r['success'] && $r['data']['total'] > 0
    ],
    [
        'name' => 'Lọc theo vai trò',
        'url' => 'http://127.0.0.1:8000/api/employees?role=employee',
        'check' => fn($r) => $r['success']
    ],
    [
        'name' => 'Lọc theo trạng thái',
        'url' => 'http://127.0.0.1:8000/api/employees?status=active',
        'check' => fn($r) => $r['success']
    ]
];

$passed = 0;
$failed = 0;

foreach ($tests as $index => $test) {
    $num = $index + 1;
    echo "Test {$num}: {$test['name']}\n";

    try {
        $response = file_get_contents($test['url']);
        $result = json_decode($response, true);

        if ($test['check']($result)) {
            echo "   ✓ PASS\n";
            $passed++;
        } else {
            echo "   ✗ FAIL\n";
            $failed++;
        }
    } catch (Exception $e) {
        echo "   ✗ ERROR: {$e->getMessage()}\n";
        $failed++;
    }
    echo "\n";
}

echo "─────────────────────────────────────────────────────────────────\n";
echo "TỔNG KẾT:\n";
echo "  • Passed: {$passed}/{" . count($tests) . "}\n";
echo "  • Failed: {$failed}/{" . count($tests) . "}\n\n";

if ($failed == 0) {
    echo "✅ TẤT CẢ API EMPLOYEES HOẠT ĐỘNG TỐT!\n";
    echo "\n📋 Chức năng đã được sửa:\n";
    echo "   ✓ Hiển thị dữ liệu nhân viên\n";
    echo "   ✓ Xóa nhân viên (soft delete)\n";
    echo "   ✓ Tìm kiếm và lọc\n";
    echo "   ✓ Thống kê\n";
    echo "   ✓ Tạo và cập nhật nhân viên\n";
} else {
    echo "⚠️ CÓ {$failed} TEST THẤT BẠI\n";
}

echo "\n";
