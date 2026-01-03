<?php
/**
 * Test kiểm tra dữ liệu suppliers có đầy đủ không
 */

require __DIR__ . '/vendor/autoload.php';

$app = require_once __DIR__ . '/bootstrap/app.php';
$kernel = $app->make(Illuminate\Contracts\Console\Kernel::class);
$kernel->bootstrap();

echo "╔════════════════════════════════════════════════════════════════╗\n";
echo "║      KIỂM TRA DỮ LIỆU SUPPLIERS - DATA VERIFICATION           ║\n";
echo "╚════════════════════════════════════════════════════════════════╝\n\n";

// 1. Kiểm tra tổng số suppliers
$total = App\Models\suppliers::count();
echo "✓ Tổng số suppliers trong DB: $total\n\n";

if ($total == 0) {
    echo "⚠️  CẢNH BÁO: Không có suppliers nào trong database!\n";
    echo "   Chạy: php artisan db:seed --class=SuppliersSeeder\n";
    exit;
}

// 2. Lấy một supplier để kiểm tra fields
$supplier = App\Models\suppliers::first();

echo "┌─ KIỂM TRA FIELDS CỦA SUPPLIER #1 ────────────────────────┐\n";
echo "Supplier: {$supplier->supplier_name}\n\n";

// Danh sách 16 fields cần có
$expectedFields = [
    'id',
    'supplier_code',
    'supplier_name',
    'tax_code',
    'contact_name',
    'representative_name',
    'company_phone',
    'representative_phone',
    'email',
    'address',
    'website',
    'product_types',
    'rating',
    'payment_terms',
    'logo_url',
    'status',
    'cooperation_date',
    'created_at',
    'updated_at',
    'deleted_at'
];

$supplierArray = $supplier->toArray();
$actualFields = array_keys($supplierArray);

echo "CÁC FIELD ĐANG CÓ:\n";
foreach ($actualFields as $field) {
    $value = $supplierArray[$field];
    if (is_array($value)) {
        $value = json_encode($value);
    }
    $valueDisplay = $value ? substr($value, 0, 50) : 'null';
    if (strlen((string)$value) > 50) $valueDisplay .= '...';
    echo "  ✓ $field: $valueDisplay\n";
}

echo "\n";

// Kiểm tra fields bị thiếu
$missingFields = array_diff($expectedFields, $actualFields);
if (!empty($missingFields)) {
    echo "⚠️  THIẾU CÁC FIELDS:\n";
    foreach ($missingFields as $field) {
        echo "  ✗ $field\n";
    }
} else {
    echo "✓ TẤT CẢ FIELDS CẦN THIẾT ĐỀU CÓ!\n";
}

echo "└" . str_repeat("─", 63) . "┘\n\n";

// 3. Kiểm tra API response
echo "┌─ KIỂM TRA API RESPONSE ───────────────────────────────────┐\n";
echo "Endpoint: GET /api/suppliers\n\n";

// Simulate API call
$suppliers = App\Models\suppliers::query()->paginate(1);
$response = [
    'success' => true,
    'data' => $suppliers->items(),
    'pagination' => [
        'total' => $suppliers->total(),
        'per_page' => $suppliers->perPage(),
        'current_page' => $suppliers->currentPage(),
        'last_page' => $suppliers->lastPage(),
    ]
];

echo "Response structure:\n";
echo "  ✓ success: " . ($response['success'] ? 'true' : 'false') . "\n";
echo "  ✓ data: " . count($response['data']) . " items\n";
echo "  ✓ pagination: {\n";
foreach ($response['pagination'] as $key => $value) {
    echo "      $key: $value\n";
}
echo "    }\n\n";

// Kiểm tra data fields
if (!empty($response['data'])) {
    $firstItem = $response['data'][0];
    $dataFields = array_keys($firstItem->toArray());
    echo "Fields trong data response: " . count($dataFields) . " fields\n";

    // Check if all expected fields are present
    $dataFieldsList = [];
    foreach ($dataFields as $field) {
        $dataFieldsList[] = $field;
    }

    $criticalFields = [
        'id', 'supplier_code', 'supplier_name', 'contact_name',
        'company_phone', 'email', 'address', 'status', 'rating'
    ];

    echo "\nKiểm tra các fields quan trọng:\n";
    foreach ($criticalFields as $field) {
        $exists = in_array($field, $dataFieldsList);
        echo "  " . ($exists ? '✓' : '✗') . " $field\n";
    }
}

echo "└" . str_repeat("─", 63) . "┘\n\n";

// 4. Kiểm tra statistics
echo "┌─ KIỂM TRA STATISTICS ─────────────────────────────────────┐\n";
$stats = [
    'total' => App\Models\suppliers::count(),
    'active' => App\Models\suppliers::where('status', 'active')->count(),
    'inactive' => App\Models\suppliers::where('status', 'inactive')->count(),
    'pending' => App\Models\suppliers::where('status', 'pending')->count(),
];

echo "Thống kê:\n";
foreach ($stats as $key => $value) {
    echo "  ✓ $key: $value\n";
}
echo "└" . str_repeat("─", 63) . "┘\n\n";

// 5. Sample data display
echo "┌─ MẪU DỮ LIỆU SUPPLIER ────────────────────────────────────┐\n";
$sampleSupplier = App\Models\suppliers::first();
if ($sampleSupplier) {
    echo json_encode($sampleSupplier->toArray(), JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE);
}
echo "\n└" . str_repeat("─", 63) . "┘\n\n";

// KẾT LUẬN
echo "╔════════════════════════════════════════════════════════════════╗\n";
if (count($actualFields) >= 16 && empty($missingFields)) {
    echo "║  ✅ DỮ LIỆU ĐẦY ĐỦ - API SẴN SÀNG SỬ DỤNG                    ║\n";
} else {
    echo "║  ⚠️  CÓ VẤN ĐỀ VỚI DỮ LIỆU - CẦN KIỂM TRA                    ║\n";
}
echo "╚════════════════════════════════════════════════════════════════╝\n";
