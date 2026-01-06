-- ================================================================
-- DỮ LIỆU MẪU CHO PHONE_STORE (FULL)
-- Mật khẩu mặc định cho tất cả nhân viên: 123456
-- Hash: $2y$10$wW1t/i.f.Xy.E/Xy.E/Xy.E/Xy.E/Xy.E/Xy.E/Xy.E/Xy.E
-- ================================================================

-- 1. TẮT KIỂM TRA KHÓA NGOẠI (Để tránh lỗi khi xóa/chèn dữ liệu)
SET FOREIGN_KEY_CHECKS = 0;

-- ================================================================
-- 2. BẢNG BRANDS (Thương hiệu)
-- ================================================================
TRUNCATE TABLE `brands`;
INSERT INTO `brands` (`id`, `brand_name`, `country`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Apple', 'USA', 'Hệ sinh thái iOS, macOS cao cấp', NOW(), NOW()),
(2, 'Samsung', 'South Korea', 'Dẫn đầu công nghệ màn hình và Android', NOW(), NOW()),
(3, 'Xiaomi', 'China', 'Cấu hình cao, giá rẻ, hệ sinh thái Mi Home', NOW(), NOW()),
(4, 'Oppo', 'China', 'Chuyên gia selfie, thiết kế thời trang', NOW(), NOW()),
(5, 'Sony', 'Japan', 'Công nghệ âm thanh và camera chuyên nghiệp', NOW(), NOW()),
(6, 'Asus', 'Taiwan', 'Dòng ROG Phone gaming và Laptop văn phòng', NOW(), NOW()),
(7, 'Google', 'USA', 'Điện thoại Pixel thuần Android', NOW(), NOW());

-- ================================================================
-- 3. BẢNG SUPPLIERS (Nhà cung cấp)
-- ================================================================
TRUNCATE TABLE `suppliers`;
INSERT INTO `suppliers` (`id`, `supplier_code`, `supplier_name`, `contact_name`, `company_phone`, `email`, `address`, `status`, `created_at`, `updated_at`) VALUES
(1, 'NCC_FPT', 'FPT Synnex', 'Nguyễn Văn Hùng', '02473008888', 'hung.nv@fpt.com.vn', 'Khu CNC Hòa Lạc, Hà Nội', 'active', NOW(), NOW()),
(2, 'NCC_DGW', 'Digiworld', 'Trần Thị Mai', '02839290059', 'mai.tt@dgw.com.vn', 'Quận 3, TP.HCM', 'active', NOW(), NOW()),
(3, 'NCC_VTL', 'Viettel Distribution', 'Lê Thanh Sơn', '02462660447', 'son.lt@viettel.com.vn', 'Tòa nhà Viettel, Cầu Giấy', 'active', NOW(), NOW()),
(4, 'NCC_PET', 'PetroSetco', 'Phạm Ngọc Châu', '02839117777', 'chau.pn@petro.com.vn', 'Quận 1, TP.HCM', 'inactive', NOW(), NOW()),
(5, 'NCC_MBF', 'Mobifone Global', 'Đỗ Văn Đạt', '0909090909', 'dat.dv@mobifone.vn', 'Đống Đa, Hà Nội', 'active', NOW(), NOW());

-- ================================================================
-- 4. BẢNG EMPLOYEES (Nhân viên)
-- Password mặc định là: 123456 (Bcrypt Hash)
-- ================================================================
TRUNCATE TABLE `employees`;
INSERT INTO `employees` (`id`, `username`, `password`, `full_name`, `role`, `position`, `salary`, `hire_date`, `email`, `status`, `created_at`, `updated_at`) VALUES
(1, 'admin', '$2y$10$bufferhashfor123456...', 'Quản Trị Viên Hệ Thống', 'admin', 'staff', 35000000.00, '2023-01-01', 'admin@store.com', 'active', NOW(), NOW()),
(2, 'sale_hoa', '$2y$10$bufferhashfor123456...', 'Nguyễn Thị Hoa', 'employee', 'Sell', 12000000.00, '2023-06-15', 'hoa.sale@store.com', 'active', NOW(), NOW()),
(3, 'sale_tuan', '$2y$10$bufferhashfor123456...', 'Trần Văn Tuấn', 'employee', 'Sell', 12500000.00, '2023-08-20', 'tuan.sale@store.com', 'active', NOW(), NOW()),
(4, 'kho_minh', '$2y$10$bufferhashfor123456...', 'Lê Văn Minh', 'employee', 'Warehouse employee', 11000000.00, '2023-02-10', 'minh.kho@store.com', 'active', NOW(), NOW()),
(5, 'kt_lan', '$2y$10$bufferhashfor123456...', 'Phạm Thị Lan', 'employee', 'Accountant', 16000000.00, '2023-01-05', 'lan.ketoan@store.com', 'active', NOW(), NOW()),
(6, 'sale_ngoc', '$2y$10$bufferhashfor123456...', 'Hoàng Bích Ngọc', 'employee', 'Sell', 10000000.00, '2024-01-10', 'ngoc.hb@store.com', 'active', NOW(), NOW()),
(7, 'kho_hai', '$2y$10$bufferhashfor123456...', 'Vũ Đức Hải', 'employee', 'Warehouse employee', 10500000.00, '2024-02-01', 'hai.kho@store.com', 'active', NOW(), NOW()),
(8, 'admin_phu', '$2y$10$bufferhashfor123456...', 'Lê Hoàng Phú', 'admin', 'staff', 25000000.00, '2023-10-10', 'phu.admin@store.com', 'active', NOW(), NOW()),
(9, 'sale_tam', '$2y$10$bufferhashfor123456...', 'Trương Thanh Tâm', 'employee', 'Sell', 9000000.00, '2024-03-01', 'tam.sale@store.com', 'take a break', NOW(), NOW()),
(10, 'kt_hung', '$2y$10$bufferhashfor123456...', 'Nguyễn Quốc Hưng', 'employee', 'Accountant', 15500000.00, '2023-05-05', 'hung.kt@store.com', 'inactive', NOW(), NOW());

-- ================================================================
-- 5. BẢNG CUSTOMERS (Khách hàng)
-- ================================================================
TRUNCATE TABLE `customers`;
INSERT INTO `customers` (`id`, `full_name`, `phone`, `email`, `gender`, `address`, `membership`, `points`, `created_at`, `updated_at`) VALUES
(1, 'Phạm Văn Long', '0901000001', 'long.pham@gmail.com', 'Nam', 'Hoàn Kiếm, Hà Nội', 'VIP', 5000, NOW(), NOW()),
(2, 'Trần Thu Hà', '0902000002', 'ha.tran@yahoo.com', 'Nữ', 'Quận 1, TP.HCM', 'Vàng', 2500, NOW(), NOW()),
(3, 'Lê Minh Trí', '0903000003', 'tri.le@outlook.com', 'Nam', 'Hải Châu, Đà Nẵng', 'Bạc', 800, NOW(), NOW()),
(4, 'Nguyễn Thị Dung', '0904000004', 'dung.nt@gmail.com', 'Nữ', 'Cầu Giấy, Hà Nội', 'Đồng', 200, NOW(), NOW()),
(5, 'Hoàng Văn Nam', '0905000005', 'nam.hoang@gmail.com', 'Nam', 'Thủ Đức, TP.HCM', 'Đồng', 150, NOW(), NOW()),
(6, 'Đỗ Thị Mai', '0906000006', 'mai.do@gmail.com', 'Nữ', 'Ninh Kiều, Cần Thơ', 'Vàng', 1800, NOW(), NOW()),
(7, 'Vũ Văn Kỷ', '0907000007', 'ky.vu@gmail.com', 'Nam', 'Biên Hòa, Đồng Nai', 'VIP', 3200, NOW(), NOW()),
(8, 'Ngô Bích Thủy', '0908000008', 'thuy.ngo@gmail.com', 'Nữ', 'Vũng Tàu', 'Bạc', 600, NOW(), NOW()),
(9, 'Lý Văn Phúc', '0909000009', 'phuc.ly@gmail.com', 'Nam', 'Nha Trang', 'Đồng', 50, NOW(), NOW()),
(10, 'Trương Mỹ Lan', '0910000010', 'lan.truong@gmail.com', 'Nữ', 'Đà Lạt', 'Đồng', 0, NOW(), NOW()),
(11, 'Khách Vãng Lai 1', '0991112223', 'vanglai1@store.com', 'Khác', 'Tại cửa hàng', 'Đồng', 0, NOW(), NOW()),
(12, 'Khách Vãng Lai 2', '0992223334', 'vanglai2@store.com', 'Nam', 'Tại cửa hàng', 'Đồng', 0, NOW(), NOW()),
(13, 'Bùi Tiến Dũng', '0913334445', 'dung.bui@gmail.com', 'Nam', 'Thanh Xuân, Hà Nội', 'Bạc', 550, NOW(), NOW()),
(14, 'Phan Thị Mơ', '0914445556', 'mo.phan@gmail.com', 'Nữ', 'Long Biên, Hà Nội', 'Vàng', 1200, NOW(), NOW()),
(15, 'Cao Thái Sơn', '0915556667', 'son.cao@gmail.com', 'Nam', 'Quận 7, TP.HCM', 'VIP', 4000, NOW(), NOW());

-- ================================================================
-- 6. BẢNG PRODUCTS (Sản phẩm)
-- ================================================================
TRUNCATE TABLE `products`;
INSERT INTO `products` (`id`, `product_name`, `sku`, `brand_id`, `category`, `ram`, `storage`, `price`, `cost_price`, `stock`, `status`, `created_at`, `updated_at`) VALUES
-- APPLE
(1, 'iPhone 15 Pro Max', 'IP15PM-256', 1, 'Smartphone', '8GB', '256GB', 33990000.00, 30000000.00, 25, 'Available', NOW(), NOW()),
(2, 'iPhone 15 Plus', 'IP15P-128', 1, 'Smartphone', '6GB', '128GB', 24990000.00, 22000000.00, 40, 'Available', NOW(), NOW()),
(3, 'MacBook Air M2', 'MBA-M2', 1, 'Laptop', '8GB', '256GB', 26990000.00, 24000000.00, 15, 'Available', NOW(), NOW()),
(4, 'iPad Air 5', 'IPA5-64', 1, 'Tablet', '8GB', '64GB', 14990000.00, 12500000.00, 30, 'Available', NOW(), NOW()),
(5, 'AirPods Pro 2', 'APP2', 1, 'Accessory', NULL, NULL, 5990000.00, 4500000.00, 100, 'Available', NOW(), NOW()),
-- SAMSUNG
(6, 'Samsung Galaxy S24 Ultra', 'S24U-512', 2, 'Smartphone', '12GB', '512GB', 36990000.00, 33000000.00, 20, 'Available', NOW(), NOW()),
(7, 'Samsung Galaxy Z Fold 5', 'ZFOLD5-256', 2, 'Smartphone', '12GB', '256GB', 39990000.00, 35000000.00, 10, 'Available', NOW(), NOW()),
(8, 'Samsung Galaxy A55', 'A55-128', 2, 'Smartphone', '8GB', '128GB', 9990000.00, 8000000.00, 80, 'Available', NOW(), NOW()),
(9, 'Galaxy Tab S9', 'TABS9', 2, 'Tablet', '8GB', '128GB', 19990000.00, 17000000.00, 15, 'Available', NOW(), NOW()),
-- XIAOMI
(10, 'Xiaomi 14', 'MI14', 3, 'Smartphone', '12GB', '256GB', 20990000.00, 18000000.00, 35, 'Available', NOW(), NOW()),
(11, 'Redmi Note 13 Pro', 'RMN13P', 3, 'Smartphone', '8GB', '256GB', 7990000.00, 6000000.00, 120, 'Available', NOW(), NOW()),
(12, 'Xiaomi Band 8', 'MIBAND8', 3, 'Accessory', NULL, NULL, 890000.00, 600000.00, 200, 'Available', NOW(), NOW()),
-- OPPO
(13, 'Oppo Find N3 Flip', 'OPFN3', 4, 'Smartphone', '12GB', '256GB', 22990000.00, 19000000.00, 18, 'Available', NOW(), NOW()),
(14, 'Oppo Reno 11 F', 'OPR11F', 4, 'Smartphone', '8GB', '256GB', 8990000.00, 7000000.00, 50, 'Available', NOW(), NOW()),
-- SONY
(15, 'Sony Xperia 1 V', 'XPERIA1V', 5, 'Smartphone', '12GB', '256GB', 29990000.00, 26000000.00, 5, 'Out of Stock', NOW(), NOW()),
(16, 'Sony WH-1000XM5', 'WH1000XM5', 5, 'Accessory', NULL, NULL, 7990000.00, 6000000.00, 25, 'Available', NOW(), NOW()),
-- ASUS
(17, 'Asus ROG Phone 8', 'ROG8', 6, 'Smartphone', '16GB', '512GB', 28990000.00, 25000000.00, 10, 'Available', NOW(), NOW()),
(18, 'Asus Zenbook 14', 'ZEN14', 6, 'Laptop', '16GB', '512GB', 24990000.00, 21000000.00, 12, 'Available', NOW(), NOW()),
-- GOOGLE
(19, 'Google Pixel 8 Pro', 'PIXEL8P', 7, 'Smartphone', '12GB', '128GB', 18990000.00, 16000000.00, 8, 'Available', NOW(), NOW()),
-- HÀNG CŨ / NGỪNG KINH DOANH
(20, 'iPhone 13 Mini', 'IP13M', 1, 'Smartphone', '4GB', '128GB', 14000000.00, 12000000.00, 0, 'Discontinued', NOW(), NOW());

-- ================================================================
-- 7. BẢNG IMPORTS (Nhập hàng - Kho)
-- ================================================================
TRUNCATE TABLE `imports`;
INSERT INTO `imports` (`id`, `supplier_id`, `employee_id`, `import_date`, `total_amount`, `notes`, `created_at`, `updated_at`) VALUES
(1, 1, 4, '2025-10-01', 500000000.00, 'Nhập lô iPhone 15 đầu tiên', NOW(), NOW()),
(2, 2, 4, '2025-10-05', 300000000.00, 'Nhập Xiaomi và Redmi', NOW(), NOW()),
(3, 3, 7, '2025-10-15', 250000000.00, 'Nhập Samsung Galaxy dòng A', NOW(), NOW()),
(4, 1, 4, '2025-11-01', 150000000.00, 'Nhập bổ sung MacBook', NOW(), NOW()),
(5, 5, 7, '2025-11-10', 80000000.00, 'Nhập phụ kiện các loại', NOW(), NOW()),
(6, 4, 4, '2025-11-20', 400000000.00, 'Nhập Oppo Reno series', NOW(), NOW()),
(7, 1, 7, '2025-12-01', 600000000.00, 'Nhập hàng chuẩn bị Tết Dương', NOW(), NOW()),
(8, 2, 4, '2025-12-05', 120000000.00, 'Nhập thêm Xiaomi 14', NOW(), NOW()),
(9, 3, 7, '2025-12-15', 350000000.00, 'Nhập S24 Ultra lô 1', NOW(), NOW()),
(10, 1, 4, '2026-01-02', 200000000.00, 'Nhập hàng đầu năm', NOW(), NOW());

-- ================================================================
-- 8. BẢNG IMPORT_DETAILS (Chi tiết nhập hàng)
-- ================================================================
TRUNCATE TABLE `import_details`;
INSERT INTO `import_details` (`import_id`, `product_id`, `quantity`, `const_price`, `amount`, `created_at`, `updated_at`) VALUES
-- Phieu 1: iPhone
(1, 1, 10, 30000000.00, 300000000.00, NOW(), NOW()),
(1, 2, 9, 22000000.00, 198000000.00, NOW(), NOW()),
-- Phieu 2: Xiaomi
(2, 10, 10, 18000000.00, 180000000.00, NOW(), NOW()),
(2, 11, 20, 6000000.00, 120000000.00, NOW(), NOW()),
-- Phieu 3: Samsung A55
(3, 8, 30, 8000000.00, 240000000.00, NOW(), NOW()),
-- Phieu 4: Macbook
(4, 3, 6, 24000000.00, 144000000.00, NOW(), NOW()),
-- Phieu 5: Phu kien
(5, 5, 10, 4500000.00, 45000000.00, NOW(), NOW()),
(5, 12, 50, 600000.00, 30000000.00, NOW(), NOW()),
-- Phieu 6: Oppo
(6, 14, 40, 7000000.00, 280000000.00, NOW(), NOW()),
(6, 13, 6, 19000000.00, 114000000.00, NOW(), NOW()),
-- Phieu 7: Tet
(7, 1, 10, 30000000.00, 300000000.00, NOW(), NOW()),
(7, 6, 9, 33000000.00, 297000000.00, NOW(), NOW()),
-- Phieu 8: Them Xiaomi
(8, 10, 6, 18000000.00, 108000000.00, NOW(), NOW()),
-- Phieu 9: S24 Ultra
(9, 6, 10, 33000000.00, 330000000.00, NOW(), NOW()),
-- Phieu 10: Dau nam
(10, 4, 16, 12500000.00, 200000000.00, NOW(), NOW());

-- ================================================================
-- 9. BẢNG INVOICES (Hóa đơn bán hàng)
-- ================================================================
TRUNCATE TABLE `invoices`;
INSERT INTO `invoices` (`id`, `customer_id`, `employee_id`, `invoice_date`, `subtotal`, `discount`, `total_amount`, `payment_method`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 2, '2025-12-01', 33990000.00, 500000.00, 33490000.00, 'credit_card', 'completed', NOW(), NOW()),
(2, 2, 3, '2025-12-02', 9990000.00, 0.00, 9990000.00, 'cash', 'completed', NOW(), NOW()),
(3, 3, 2, '2025-12-05', 20990000.00, 200000.00, 20790000.00, 'bank_transfer', 'completed', NOW(), NOW()),
(4, 4, 6, '2025-12-10', 7990000.00, 0.00, 7990000.00, 'cash', 'completed', NOW(), NOW()),
(5, 5, 2, '2025-12-15', 5990000.00, 0.00, 5990000.00, 'cash', 'completed', NOW(), NOW()),
(6, 6, 3, '2025-12-20', 36990000.00, 1000000.00, 35990000.00, 'credit_card', 'completed', NOW(), NOW()),
(7, 7, 6, '2025-12-24', 28990000.00, 500000.00, 28490000.00, 'bank_transfer', 'shipping', NOW(), NOW()),
(8, 8, 2, '2025-12-25', 8990000.00, 100000.00, 8890000.00, 'cash', 'completed', NOW(), NOW()),
(9, 1, 3, '2025-12-30', 26990000.00, 1000000.00, 25990000.00, 'credit_card', 'completed', NOW(), NOW()),
(10, 9, 6, '2026-01-01', 33990000.00, 0.00, 33990000.00, 'bank_transfer', 'pending', NOW(), NOW()),
(11, 10, 2, '2026-01-02', 7990000.00, 0.00, 7990000.00, 'cash', 'cancelled', NOW(), NOW()),
(12, 11, 3, '2026-01-03', 890000.00, 0.00, 890000.00, 'cash', 'completed', NOW(), NOW()),
(13, 12, 6, '2026-01-04', 5990000.00, 0.00, 5990000.00, 'cash', 'processing', NOW(), NOW()),
(14, 15, 2, '2026-01-05', 73980000.00, 2000000.00, 71980000.00, 'bank_transfer', 'completed', NOW(), NOW()),
(15, 14, 3, '2026-01-06', 14990000.00, 300000.00, 14690000.00, 'credit_card', 'shipping', NOW(), NOW());

-- ================================================================
-- 10. BẢNG INVOICE_DETAILS (Chi tiết hóa đơn)
-- ================================================================
TRUNCATE TABLE `invoice_details`;
INSERT INTO `invoice_details` (`invoice_id`, `product_id`, `quantity`, `unit_price`, `amount`, `created_at`, `updated_at`) VALUES
-- HD1: iPhone 15PM
(1, 1, 1, 33990000.00, 33990000.00, NOW(), NOW()),
-- HD2: Galaxy A55
(2, 8, 1, 9990000.00, 9990000.00, NOW(), NOW()),
-- HD3: Xiaomi 14
(3, 10, 1, 20990000.00, 20990000.00, NOW(), NOW()),
-- HD4: Redmi Note 13
(4, 11, 1, 7990000.00, 7990000.00, NOW(), NOW()),
-- HD5: AirPods
(5, 5, 1, 5990000.00, 5990000.00, NOW(), NOW()),
-- HD6: S24 Ultra
(6, 6, 1, 36990000.00, 36990000.00, NOW(), NOW()),
-- HD7: ROG Phone 8
(7, 17, 1, 28990000.00, 28990000.00, NOW(), NOW()),
-- HD8: Oppo Reno
(8, 14, 1, 8990000.00, 8990000.00, NOW(), NOW()),
-- HD9: Macbook Air (Khach 1 quay lai mua)
(9, 3, 1, 26990000.00, 26990000.00, NOW(), NOW()),
-- HD10: iPhone 15PM
(10, 1, 1, 33990000.00, 33990000.00, NOW(), NOW()),
-- HD11: Huy don Redmi
(11, 11, 1, 7990000.00, 7990000.00, NOW(), NOW()),
-- HD12: Xiaomi Band
(12, 12, 1, 890000.00, 890000.00, NOW(), NOW()),
-- HD13: AirPods
(13, 5, 1, 5990000.00, 5990000.00, NOW(), NOW()),
-- HD14: Khach VIP mua 2 cai (S24 Ultra + iPhone 15 PM)
(14, 6, 1, 36990000.00, 36990000.00, NOW(), NOW()),
(14, 1, 1, 33990000.00, 33990000.00, NOW(), NOW()),
-- HD15: iPad Air
(15, 4, 1, 14990000.00, 14990000.00, NOW(), NOW());

-- 11. BẬT LẠI KIỂM TRA KHÓA NGOẠI
SET FOREIGN_KEY_CHECKS = 1;
