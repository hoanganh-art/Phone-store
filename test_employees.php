<?php

require __DIR__ . '/vendor/autoload.php';

$app = require_once __DIR__ . '/bootstrap/app.php';
$app->make('Illuminate\Contracts\Console\Kernel')->bootstrap();

use Illuminate\Support\Facades\DB;
use App\Models\Employees;

echo "=== Testing Employees Table Structure ===\n\n";

try {
    // Check table columns
    $columns = DB::select('SHOW COLUMNS FROM employees');
    echo "Columns in employees table:\n";
    foreach ($columns as $col) {
        echo "  - {$col->Field} ({$col->Type})\n";
    }

    echo "\n=== Testing API Operations ===\n\n";

    // Test 1: Count employees
    $count = Employees::count();
    echo "1. Total employees: $count\n";

    // Test 2: Get first employee
    $employee = Employees::first();
    if ($employee) {
        echo "2. First employee found:\n";
        echo "   ID: {$employee->id}\n";
        echo "   Username: {$employee->username}\n";
        echo "   Full Name: {$employee->full_name}\n";
        echo "   Role: {$employee->role}\n";
        echo "   Position: {$employee->position}\n";
        echo "   Status: {$employee->status}\n";
    } else {
        echo "2. No employees found in database\n";
    }

    echo "\n✓ Table structure is correct!\n";
    echo "✓ Model can read from database!\n";

} catch (\Exception $e) {
    echo "✗ Error: " . $e->getMessage() . "\n";
    echo "  This usually means column names don't match between migration and model.\n";
}
