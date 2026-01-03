<?php

namespace Database\Seeders;

use App\Models\suppliers;
use Illuminate\Database\Seeder;

class SuppliersSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $suppliersData = [
            [
                'supplier_code' => 'NCC001',
                'supplier_name' => 'Việt Electronic Co., Ltd',
                'tax_code' => '0123456789',
                'contact_name' => 'Nguyễn Văn A',
                'representative_name' => 'Trần Thị B',
                'company_phone' => '(02) 123-4567',
                'representative_phone' => '0987654321',
                'email' => 'contact@vietnamelectronic.com',
                'address' => '123 Lê Lợi, Hà Nội, Việt Nam',
                'website' => 'https://vietnamelectronic.com',
                'product_types' => ['Smartphone', 'Tablet', 'Accessories'],
                'rating' => 4.5,
                'payment_terms' => 'Net 30',
                'logo_url' => 'https://example.com/logo1.png',
                'status' => 'active',
                'cooperation_date' => '2023-01-15'
            ],
            [
                'supplier_code' => 'NCC002',
                'supplier_name' => 'Công Ty Điện Tử Hàng Thanh',
                'tax_code' => '0234567890',
                'contact_name' => 'Lê Văn C',
                'representative_name' => 'Phạm Thị D',
                'company_phone' => '(02) 234-5678',
                'representative_phone' => '0912345678',
                'email' => 'info@hangthanhelectric.vn',
                'address' => '456 Trần Hưng Đạo, Hà Nội, Việt Nam',
                'website' => 'https://hangthanhelectric.vn',
                'product_types' => ['Laptop', 'Components', 'Accessories'],
                'rating' => 4.2,
                'payment_terms' => 'Net 45',
                'logo_url' => 'https://example.com/logo2.png',
                'status' => 'active',
                'cooperation_date' => '2023-02-20'
            ],
            [
                'supplier_code' => 'NCC003',
                'supplier_name' => 'Samsung Vietnam',
                'tax_code' => '0345678901',
                'contact_name' => 'Kim Ji-hoon',
                'representative_name' => 'Park Min-jun',
                'company_phone' => '(02) 345-6789',
                'representative_phone' => '0901234567',
                'email' => 'sales@samsung.com.vn',
                'address' => '789 Đường Nguyễn Hữu Cảnh, Hồ Chí Minh, Việt Nam',
                'website' => 'https://samsung.com.vn',
                'product_types' => ['Smartphone', 'Display', 'Components'],
                'rating' => 4.8,
                'payment_terms' => 'Net 60',
                'logo_url' => 'https://example.com/logo3.png',
                'status' => 'active',
                'cooperation_date' => '2022-06-10'
            ],
            [
                'supplier_code' => 'NCC004',
                'supplier_name' => 'Apple Authorized Distributor',
                'tax_code' => '0456789012',
                'contact_name' => 'John Smith',
                'representative_name' => 'Michael Brown',
                'company_phone' => '(02) 456-7890',
                'representative_phone' => '0923456789',
                'email' => 'distributor@apple.com.vn',
                'address' => '321 Lý Thường Kiệt, Hồ Chí Minh, Việt Nam',
                'website' => 'https://apple-distributor.com.vn',
                'product_types' => ['iPhone', 'iPad', 'MacBook'],
                'rating' => 4.9,
                'payment_terms' => 'Net 30',
                'logo_url' => 'https://example.com/logo4.png',
                'status' => 'active',
                'cooperation_date' => '2022-10-05'
            ],
            [
                'supplier_code' => 'NCC005',
                'supplier_name' => 'Huawei Việt Nam',
                'tax_code' => '0567890123',
                'contact_name' => 'Zhang Wei',
                'representative_name' => 'Liu Zhang',
                'company_phone' => '(02) 567-8901',
                'representative_phone' => '0934567890',
                'email' => 'sales@huawei.com.vn',
                'address' => '654 Võ Văn Tần, Hồ Chí Minh, Việt Nam',
                'website' => 'https://huawei.com.vn',
                'product_types' => ['Smartphone', 'Tablet', 'Accessories'],
                'rating' => 3.8,
                'payment_terms' => 'Net 45',
                'logo_url' => 'https://example.com/logo5.png',
                'status' => 'inactive',
                'cooperation_date' => '2023-03-12'
            ],
            [
                'supplier_code' => 'NCC006',
                'supplier_name' => 'Công Ty Cấp Linh Kiện JDVN',
                'tax_code' => '0678901234',
                'contact_name' => 'Vũ Văn E',
                'representative_name' => 'Hoàng Thị F',
                'company_phone' => '(02) 678-9012',
                'representative_phone' => '0945678901',
                'email' => 'supplier@jdvn.com.vn',
                'address' => '987 Phan Bội Châu, Hà Nội, Việt Nam',
                'website' => 'https://jdvn.com.vn',
                'product_types' => ['Components', 'Accessories', 'Parts'],
                'rating' => 3.5,
                'payment_terms' => 'Net 15',
                'logo_url' => 'https://example.com/logo6.png',
                'status' => 'pending',
                'cooperation_date' => null
            ]
        ];

        foreach ($suppliersData as $data) {
            suppliers::create($data);
        }
    }
}
