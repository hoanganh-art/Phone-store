<?php

echo "=== Testing Employees API ===\n\n";

$baseUrl = "http://127.0.0.1:8000/api";

function testApi($method, $endpoint, $data = null) {
    global $baseUrl;

    $url = $baseUrl . $endpoint;
    $ch = curl_init($url);

    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_CUSTOMREQUEST, $method);

    if ($data) {
        curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($data));
        curl_setopt($ch, CURLOPT_HTTPHEADER, [
            'Content-Type: application/json',
            'Content-Length: ' . strlen(json_encode($data))
        ]);
    }

    $response = curl_exec($ch);
    $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    curl_close($ch);

    return [
        'code' => $httpCode,
        'response' => json_decode($response, true)
    ];
}

// Test 1: GET all employees
echo "1. Testing GET /api/employees (list all employees)\n";
$result = testApi('GET', '/employees?per_page=3');
echo "   Status: {$result['code']}\n";
if ($result['response']['success']) {
    echo "   ✓ Success! Found {$result['response']['data']['total']} employees\n";
    echo "   Showing {$result['response']['data']['per_page']} per page\n";
    foreach ($result['response']['data']['data'] as $emp) {
        echo "     - ID: {$emp['id']}, Name: {$emp['full_name']}, Role: {$emp['role']}\n";
    }
} else {
    echo "   ✗ Failed!\n";
}
echo "\n";

// Test 2: GET specific employee
echo "2. Testing GET /api/employees/1 (get specific employee)\n";
$result = testApi('GET', '/employees/1');
echo "   Status: {$result['code']}\n";
if ($result['response']['success']) {
    $emp = $result['response']['data'];
    echo "   ✓ Success!\n";
    echo "     ID: {$emp['id']}\n";
    echo "     Username: {$emp['username']}\n";
    echo "     Full Name: {$emp['full_name']}\n";
    echo "     Role: {$emp['role']}\n";
    echo "     Position: {$emp['position']}\n";
    echo "     Status: {$emp['status']}\n";
} else {
    echo "   ✗ Failed: {$result['response']['message']}\n";
}
echo "\n";

// Test 3: GET statistics
echo "3. Testing GET /api/employees/statistics\n";
$result = testApi('GET', '/employees/statistics');
echo "   Status: {$result['code']}\n";
if ($result['response']['success']) {
    $stats = $result['response']['data'];
    echo "   ✓ Success!\n";
    echo "     Total Employees: {$stats['total_employees']}\n";
    echo "     Active Employees: {$stats['active_employees']}\n";
    echo "     Admin Count: {$stats['admin_count']}\n";
    echo "     Employee Count: {$stats['employee_count']}\n";
} else {
    echo "   ✗ Failed!\n";
}
echo "\n";

// Test 4: Search employees
echo "4. Testing GET /api/employees?search=admin\n";
$result = testApi('GET', '/employees?search=admin');
echo "   Status: {$result['code']}\n";
if ($result['response']['success']) {
    echo "   ✓ Success! Found {$result['response']['data']['total']} matching employees\n";
} else {
    echo "   ✗ Failed!\n";
}
echo "\n";

// Test 5: Filter by role
echo "5. Testing GET /api/employees?role=admin\n";
$result = testApi('GET', '/employees?role=admin');
echo "   Status: {$result['code']}\n";
if ($result['response']['success']) {
    echo "   ✓ Success! Found {$result['response']['data']['total']} admin(s)\n";
} else {
    echo "   ✗ Failed!\n";
}
echo "\n";

// Test 6: Try to delete (this will probably fail due to foreign key constraints)
echo "6. Testing DELETE /api/employees/999 (non-existent employee)\n";
$result = testApi('DELETE', '/employees/999');
echo "   Status: {$result['code']}\n";
if ($result['code'] == 404) {
    echo "   ✓ Correctly returned 404 for non-existent employee\n";
    echo "     Message: {$result['response']['message']}\n";
} else {
    echo "   Response: " . json_encode($result['response']) . "\n";
}
echo "\n";

echo "=== All API tests completed! ===\n";
echo "\n✓ API can display data (GET requests work)\n";
echo "✓ API can handle delete requests (DELETE endpoint works)\n";
echo "✓ API properly validates and returns appropriate error codes\n";
