-- --------------------------------------------------------
-- Dữ liệu mẫu cho bảng `warehouses` (nhiều hơn)
-- --------------------------------------------------------

INSERT INTO `warehouses` (`id`, `warehouse_code`, `warehouse_name`, `address`, `manager_id`, `phone`, `email`, `capacity`, `current_occupancy`, `status`, `notes`, `created_at`, `updated_at`) VALUES
(6, 'WH-HN-002', 'Kho Hà Nội 2', '234 Lê Văn Lương, Thanh Xuân, Hà Nội', 4, '0241234568', 'warehouse.hn2@store.com', 12000, 4200, 'active', 'Kho chuyên thiết bị Apple', '2026-01-08 03:01:00', '2026-01-08 03:01:00'),
(7, 'WH-HCM-002', 'Kho TP.HCM 2', '567 Lê Văn Việt, Quận 9, TP.HCM', 7, '0289876544', 'warehouse.hcm2@store.com', 10000, 3800, 'active', 'Kho chuyên Samsung và Xiaomi', '2026-01-08 03:01:00', '2026-01-08 03:01:00'),
(8, 'WH-HP-001', 'Kho Hải Phòng', '12 Trần Phú, Ngô Quyền, Hải Phòng', NULL, '0225369854', 'warehouse.hp@store.com', 6000, 1800, 'active', 'Kho phục vụ vùng Đông Bắc', '2026-01-08 03:01:00', '2026-01-08 03:01:00'),
(9, 'WH-BD-001', 'Kho Bình Dương', '34 Đại Lộ Bình Dương, Thủ Dầu Một', NULL, '0274387654', 'warehouse.bd@store.com', 7000, 2500, 'active', 'Khu công nghiệp Bình Dương', '2026-01-08 03:01:00', '2026-01-08 03:01:00'),
(10, 'WH-QN-001', 'Kho Quảng Ninh', '56 Hạ Long, Bãi Cháy, Quảng Ninh', NULL, '0203369852', 'warehouse.qn@store.com', 4000, 900, 'active', 'Kho du lịch', '2026-01-08 03:01:00', '2026-01-08 03:01:00'),
(11, 'WH-KG-001', 'Kho Kiên Giang', '78 Nguyễn Trung Trực, Rạch Giá', NULL, '0297365487', 'warehouse.kg@store.com', 3500, 700, 'inactive', 'Kho tạm ngưng hoạt động', '2026-01-08 03:01:00', '2026-01-08 03:01:00'),
(12, 'WH-DL-001', 'Kho Điện Lực', '90 Hoàng Diệu, Đà Lạt', NULL, '0263389765', 'warehouse.dl@store.com', 3000, 600, 'maintenance', 'Đang nâng cấp hệ thống', '2026-01-08 03:01:00', '2026-01-08 03:01:00'),
(13, 'WH-LA-001', 'Kho Long An', '123 Quốc Lộ 1, Tân An', NULL, '0272365487', 'warehouse.la@store.com', 5500, 1600, 'active', 'Kho vùng đồng bằng', '2026-01-08 03:01:00', '2026-01-08 03:01:00'),
(14, 'WH-TH-001', 'Kho Thanh Hóa', '45 Quang Trung, TP Thanh Hóa', NULL, '0237369852', 'warehouse.th@store.com', 4500, 1100, 'active', 'Kho vùng Bắc Trung Bộ', '2026-01-08 03:01:00', '2026-01-08 03:01:00'),
(15, 'WH-PY-001', 'Kho Phú Yên', '67 Lê Duẩn, Tuy Hòa', NULL, '0257365421', 'warehouse.py@store.com', 3200, 800, 'active', 'Kho vùng Nam Trung Bộ', '2026-01-08 03:01:00', '2026-01-08 03:01:00');

-- --------------------------------------------------------
-- Dữ liệu mẫu cho bảng `warehouse_locations` (nhiều hơn)
-- --------------------------------------------------------

INSERT INTO `warehouse_locations` (`id`, `warehouse_id`, `location_code`, `location_name`, `zone`, `aisle`, `rack`, `shelf`, `max_capacity`, `current_quantity`, `status`, `created_at`, `updated_at`) VALUES
-- Kho Hà Nội 2 (Apple chuyên dụng)
(15, 6, 'A-01-01-01', 'Khu iPhone Pro Max', 'A', '01', '01', '01', 80, 40, 'available', '2026-01-08 03:01:00', '2026-01-08 03:01:00'),
(16, 6, 'A-01-01-02', 'Khu iPhone Plus', 'A', '01', '01', '02', 100, 65, 'available', '2026-01-08 03:01:00', '2026-01-08 03:01:00'),
(17, 6, 'B-02-01-01', 'Khu MacBook', 'B', '02', '01', '01', 120, 45, 'available', '2026-01-08 03:01:00', '2026-01-08 03:01:00'),
(18, 6, 'B-02-01-02', 'Khu iPad', 'B', '02', '01', '02', 150, 88, 'available', '2026-01-08 03:01:00', '2026-01-08 03:01:00'),
(19, 6, 'C-03-01-01', 'Khu AirPods', 'C', '03', '01', '01', 300, 210, 'available', '2026-01-08 03:01:00', '2026-01-08 03:01:00'),
(20, 6, 'C-03-01-02', 'Khu Apple Watch', 'C', '03', '01', '02', 200, 95, 'available', '2026-01-08 03:01:00', '2026-01-08 03:01:00'),

-- Kho TP.HCM 2 (Samsung & Xiaomi)
(21, 7, 'A-01-01-01', 'Khu Samsung Galaxy S', 'A', '01', '01', '01', 60, 35, 'available', '2026-01-08 03:01:00', '2026-01-08 03:01:00'),
(22, 7, 'A-01-01-02', 'Khu Samsung Galaxy Z', 'A', '01', '01', '02', 40, 18, 'available', '2026-01-08 03:01:00', '2026-01-08 03:01:00'),
(23, 7, 'B-02-01-01', 'Khu Xiaomi Flagship', 'B', '02', '01', '01', 80, 42, 'available', '2026-01-08 03:01:00', '2026-01-08 03:01:00'),
(24, 7, 'B-02-01-02', 'Khu Redmi', 'B', '02', '01', '02', 120, 95, 'available', '2026-01-08 03:01:00', '2026-01-08 03:01:00'),
(25, 7, 'C-03-01-01', 'Khu Phụ kiện Xiaomi', 'C', '03', '01', '01', 250, 180, 'available', '2026-01-08 03:01:00', '2026-01-08 03:01:00'),
(26, 7, 'C-03-01-02', 'Khu Tablet Samsung', 'C', '03', '01', '02', 70, 25, 'available', '2026-01-08 03:01:00', '2026-01-08 03:01:00'),

-- Kho Hải Phòng
(27, 8, 'A-01-01-01', 'Khu hàng cao cấp', 'A', '01', '01', '01', 50, 22, 'available', '2026-01-08 03:01:00', '2026-01-08 03:01:00'),
(28, 8, 'A-01-01-02', 'Khu hàng tầm trung', 'A', '01', '01', '02', 100, 48, 'available', '2026-01-08 03:01:00', '2026-01-08 03:01:00'),
(29, 8, 'B-02-01-01', 'Khu phụ kiện', 'B', '02', '01', '01', 200, 85, 'available', '2026-01-08 03:01:00', '2026-01-08 03:01:00'),

-- Kho Bình Dương
(30, 9, 'A-01-01-01', 'Khu Oppo/Reno', 'A', '01', '01', '01', 90, 55, 'available', '2026-01-08 03:01:00', '2026-01-08 03:01:00'),
(31, 9, 'A-01-01-02', 'Khu Vivo/Realme', 'A', '01', '01', '02', 80, 42, 'available', '2026-01-08 03:01:00', '2026-01-08 03:01:00'),
(32, 9, 'B-02-01-01', 'Khu Asus Gaming', 'B', '02', '01', '01', 60, 28, 'available', '2026-01-08 03:01:00', '2026-01-08 03:01:00'),
(33, 9, 'B-02-01-02', 'Khu Sony Audio', 'B', '02', '01', '02', 70, 35, 'available', '2026-01-08 03:01:00', '2026-01-08 03:01:00'),

-- Kho Quảng Ninh
(34, 10, 'A-01-01-01', 'Khu du lịch chính', 'A', '01', '01', '01', 40, 15, 'available', '2026-01-08 03:01:00', '2026-01-08 03:01:00'),
(35, 10, 'A-01-01-02', 'Khu phụ kiện du lịch', 'A', '01', '01', '02', 100, 32, 'available', '2026-01-08 03:01:00', '2026-01-08 03:01:00'),

-- Kho Long An
(36, 13, 'A-01-01-01', 'Khu chính Long An', 'A', '01', '01', '01', 70, 38, 'available', '2026-01-08 03:01:00', '2026-01-08 03:01:00'),
(37, 13, 'A-01-01-02', 'Khu nông thôn mới', 'A', '01', '01', '02', 90, 45, 'available', '2026-01-08 03:01:00', '2026-01-08 03:01:00'),

-- Kho Thanh Hóa
(38, 14, 'A-01-01-01', 'Khu trung tâm', 'A', '01', '01', '01', 60, 28, 'available', '2026-01-08 03:01:00', '2026-01-08 03:01:00'),
(39, 14, 'A-01-01-02', 'Khu vùng núi', 'A', '01', '01', '02', 80, 32, 'available', '2026-01-08 03:01:00', '2026-01-08 03:01:00'),

-- Kho Phú Yên
(40, 15, 'A-01-01-01', 'Khu biển đảo', 'A', '01', '01', '01', 50, 18, 'available', '2026-01-08 03:01:00', '2026-01-08 03:01:00'),
(41, 15, 'A-01-01-02', 'Khu ven biển', 'A', '01', '01', '02', 70, 24, 'available', '2026-01-08 03:01:00', '2026-01-08 03:01:00'),

-- Vị trí đặc biệt (khu hư hỏng, chờ sửa chữa)
(42, 1, 'X-99-01-01', 'Khu hàng hư hỏng', 'X', '99', '01', '01', 50, 12, 'restricted', '2026-01-08 03:01:00', '2026-01-08 03:01:00'),
(43, 1, 'X-99-01-02', 'Khu chờ kiểm tra', 'X', '99', '01', '02', 30, 8, 'restricted', '2026-01-08 03:01:00', '2026-01-08 03:01:00'),
(44, 2, 'X-99-01-01', 'Khu hàng trả về', 'X', '99', '01', '01', 40, 15, 'restricted', '2026-01-08 03:01:00', '2026-01-08 03:01:00'),
(45, 2, 'X-99-01-02', 'Khu chờ xuất', 'X', '99', '01', '02', 60, 22, 'restricted', '2026-01-08 03:01:00', '2026-01-08 03:01:00');

-- --------------------------------------------------------
-- Dữ liệu mẫu cho bảng `inventory_details` (nhiều hơn)
-- --------------------------------------------------------

INSERT INTO `inventory_details` (`id`, `product_id`, `warehouse_location_id`, `quantity`, `batch_number`, `expiry_date`, `manufacture_date`, `serial_numbers`, `cost_price`, `stock_status`, `last_counted_date`, `reorder_level`, `notes`, `created_at`, `updated_at`) VALUES
-- iPhone 15 Plus
(16, 2, 16, 25, 'BATCH-IP15P-2025-10', '2027-10-10', '2025-09-20', '["SN-IP15P-001", "SN-IP15P-002", "SN-IP15P-003", "SN-IP15P-004", "SN-IP15P-005", "SN-IP15P-006", "SN-IP15P-007", "SN-IP15P-008", "SN-IP15P-009", "SN-IP15P-010", "SN-IP15P-011", "SN-IP15P-012", "SN-IP15P-013", "SN-IP15P-014", "SN-IP15P-015", "SN-IP15P-016", "SN-IP15P-017", "SN-IP15P-018", "SN-IP15P-019", "SN-IP15P-020", "SN-IP15P-021", "SN-IP15P-022", "SN-IP15P-023", "SN-IP15P-024", "SN-IP15P-025"]', 22000000.00, 'available', '2026-01-05', 10, 'Hàng bán chạy', '2026-01-08 03:01:00', '2026-01-08 03:01:00'),
(17, 2, 12, 15, 'BATCH-IP15P-2025-11', '2027-11-15', '2025-10-25', '["SN-IP15P-101", "SN-IP15P-102", "SN-IP15P-103", "SN-IP15P-104", "SN-IP15P-105", "SN-IP15P-106", "SN-IP15P-107", "SN-IP15P-108", "SN-IP15P-109", "SN-IP15P-110", "SN-IP15P-111", "SN-IP15P-112", "SN-IP15P-113", "SN-IP15P-114", "SN-IP15P-115"]', 22000000.00, 'available', '2026-01-05', 5, 'Phân phối TP.HCM', '2026-01-08 03:01:00', '2026-01-08 03:01:00'),

-- MacBook Air M2
(18, 3, 17, 12, 'BATCH-MBA-M2-2025-11', '2028-11-20', '2025-10-30', '["SN-MBA-M2-001", "SN-MBA-M2-002", "SN-MBA-M2-003", "SN-MBA-M2-004", "SN-MBA-M2-005", "SN-MBA-M2-006", "SN-MBA-M2-007", "SN-MBA-M2-008", "SN-MBA-M2-009", "SN-MBA-M2-010", "SN-MBA-M2-011", "SN-MBA-M2-012"]', 24000000.00, 'available', '2026-01-05', 4, 'Laptop cao cấp', '2026-01-08 03:01:00', '2026-01-08 03:01:00'),
(19, 3, 27, 3, 'BATCH-MBA-M2-2025-11', '2028-11-20', '2025-10-30', '["SN-MBA-M2-101", "SN-MBA-M2-102", "SN-MBA-M2-103"]', 24000000.00, 'available', '2026-01-05', 1, 'Dự trữ Hải Phòng', '2026-01-08 03:01:00', '2026-01-08 03:01:00'),

-- iPad Air 5
(20, 4, 18, 45, 'BATCH-IPA5-2025-10', '2028-10-25', '2025-09-28', NULL, 12500000.00, 'available', '2026-01-05', 15, 'Số lượng lớn', '2026-01-08 03:01:00', '2026-01-08 03:01:00'),
(21, 4, 26, 15, 'BATCH-IPA5-2025-10', '2028-10-25', '2025-09-28', NULL, 12500000.00, 'available', '2026-01-05', 5, 'Dự trữ TP.HCM', '2026-01-08 03:01:00', '2026-01-08 03:01:00'),

-- AirPods Pro 2 (thêm)
(22, 5, 19, 150, 'BATCH-APP2-2025-12', '2027-12-25', '2025-11-30', NULL, 4500000.00, 'available', '2026-01-05', 30, 'Lô mới nhất', '2026-01-08 03:01:00', '2026-01-08 03:01:00'),
(23, 5, 29, 50, 'BATCH-APP2-2025-11', '2027-11-30', '2025-10-28', NULL, 4500000.00, 'available', '2026-01-05', 15, 'Dự trữ Hải Phòng', '2026-01-08 03:01:00', '2026-01-08 03:01:00'),

-- Samsung Galaxy Z Fold 5
(24, 7, 22, 8, 'BATCH-ZFOLD5-2025-12', '2027-12-28', '2025-11-30', '["SN-ZFOLD5-001", "SN-ZFOLD5-002", "SN-ZFOLD5-003", "SN-ZFOLD5-004", "SN-ZFOLD5-005", "SN-ZFOLD5-006", "SN-ZFOLD5-007", "SN-ZFOLD5-008"]', 35000000.00, 'available', '2026-01-05', 2, 'Điện thoại gập cao cấp', '2026-01-08 03:01:00', '2026-01-08 03:01:00'),
(25, 7, 27, 2, 'BATCH-ZFOLD5-2025-12', '2027-12-28', '2025-11-30', '["SN-ZFOLD5-101", "SN-ZFOLD5-102"]', 35000000.00, 'available', '2026-01-05', 1, 'Dự trữ khu vực', '2026-01-08 03:01:00', '2026-01-08 03:01:00'),

-- Galaxy Tab S9
(26, 9, 26, 15, 'BATCH-TABS9-2025-11', '2028-11-15', '2025-10-20', NULL, 17000000.00, 'available', '2026-01-05', 5, 'Tablet Samsung', '2026-01-08 03:01:00', '2026-01-08 03:01:00'),
(27, 9, 38, 5, 'BATCH-TABS9-2025-11', '2028-11-15', '2025-10-20', NULL, 17000000.00, 'available', '2026-01-05', 2, 'Dự trữ Thanh Hóa', '2026-01-08 03:01:00', '2026-01-08 03:01:00'),

-- Redmi Note 13 Pro
(28, 11, 24, 80, 'BATCH-RMN13P-2025-12', '2027-12-20', '2025-11-25', NULL, 6000000.00, 'available', '2026-01-05', 25, 'Bán chạy nhất', '2026-01-08 03:01:00', '2026-01-08 03:01:00'),
(29, 11, 28, 40, 'BATCH-RMN13P-2025-12', '2027-12-20', '2025-11-25', NULL, 6000000.00, 'available', '2026-01-05', 15, 'Hải Phòng', '2026-01-08 03:01:00', '2026-01-08 03:01:00'),

-- Xiaomi Band 8 (thêm)
(30, 12, 25, 120, 'BATCH-MIB8-2025-12', '2027-12-30', '2025-11-28', NULL, 600000.00, 'available', '2026-01-05', 40, 'Lô mới', '2026-01-08 03:01:00', '2026-01-08 03:01:00'),
(31, 12, 35, 30, 'BATCH-MIB8-2025-12', '2027-12-30', '2025-11-28', NULL, 600000.00, 'available', '2026-01-05', 10, 'Quảng Ninh', '2026-01-08 03:01:00', '2026-01-08 03:01:00'),

-- Oppo Find N3 Flip
(32, 13, 30, 12, 'BATCH-OPFN3-2025-12', '2027-12-22', '2025-11-20', '["SN-OPFN3-001", "SN-OPFN3-002", "SN-OPFN3-003", "SN-OPFN3-004", "SN-OPFN3-005", "SN-OPFN3-006", "SN-OPFN3-007", "SN-OPFN3-008", "SN-OPFN3-009", "SN-OPFN3-010", "SN-OPFN3-011", "SN-OPFN3-012"]', 19000000.00, 'available', '2026-01-05', 4, 'Oppo cao cấp', '2026-01-08 03:01:00', '2026-01-08 03:01:00'),
(33, 13, 36, 6, 'BATCH-OPFN3-2025-12', '2027-12-22', '2025-11-20', '["SN-OPFN3-101", "SN-OPFN3-102", "SN-OPFN3-103", "SN-OPFN3-104", "SN-OPFN3-105", "SN-OPFN3-106"]', 19000000.00, 'available', '2026-01-05', 2, 'Long An', '2026-01-08 03:01:00', '2026-01-08 03:01:00'),

-- Sony WH-1000XM5
(34, 16, 33, 20, 'BATCH-WH1000XM5-2025-11', '2028-11-10', '2025-10-15', NULL, 6000000.00, 'available', '2026-01-05', 6, 'Tai nghe cao cấp', '2026-01-08 03:01:00', '2026-01-08 03:01:00'),
(35, 16, 29, 5, 'BATCH-WH1000XM5-2025-11', '2028-11-10', '2025-10-15', NULL, 6000000.00, 'available', '2026-01-05', 2, 'Hải Phòng', '2026-01-08 03:01:00', '2026-01-08 03:01:00'),

-- Asus ROG Phone 8
(36, 17, 32, 8, 'BATCH-ROG8-2025-12', '2027-12-18', '2025-11-22', '["SN-ROG8-001", "SN-ROG8-002", "SN-ROG8-003", "SN-ROG8-004", "SN-ROG8-005", "SN-ROG8-006", "SN-ROG8-007", "SN-ROG8-008"]', 25000000.00, 'available', '2026-01-05', 3, 'Gaming phone', '2026-01-08 03:01:00', '2026-01-08 03:01:00'),
(37, 17, 39, 2, 'BATCH-ROG8-2025-12', '2027-12-18', '2025-11-22', '["SN-ROG8-101", "SN-ROG8-102"]', 25000000.00, 'available', '2026-01-05', 1, 'Thanh Hóa', '2026-01-08 03:01:00', '2026-01-08 03:01:00'),

-- Asus Zenbook 14
(38, 18, 17, 8, 'BATCH-ZEN14-2025-12', '2028-12-05', '2025-11-10', '["SN-ZEN14-001", "SN-ZEN14-002", "SN-ZEN14-003", "SN-ZEN14-004", "SN-ZEN14-005", "SN-ZEN14-006", "SN-ZEN14-007", "SN-ZEN14-008"]', 21000000.00, 'available', '2026-01-05', 3, 'Laptop văn phòng', '2026-01-08 03:01:00', '2026-01-08 03:01:00'),
(39, 18, 27, 4, 'BATCH-ZEN14-2025-12', '2028-12-05', '2025-11-10', '["SN-ZEN14-101", "SN-ZEN14-102", "SN-ZEN14-103", "SN-ZEN14-104"]', 21000000.00, 'available', '2026-01-05', 2, 'Hải Phòng', '2026-01-08 03:01:00', '2026-01-08 03:01:00'),

-- Google Pixel 8 Pro
(40, 19, 21, 5, 'BATCH-PIXEL8P-2025-12', '2027-12-25', '2025-11-28', '["SN-PIXEL8P-001", "SN-PIXEL8P-002", "SN-PIXEL8P-003", "SN-PIXEL8P-004", "SN-PIXEL8P-005"]', 16000000.00, 'available', '2026-01-05', 2, 'Google Pixel', '2026-01-08 03:01:00', '2026-01-08 03:01:00'),
(41, 19, 34, 3, 'BATCH-PIXEL8P-2025-12', '2027-12-25', '2025-11-28', '["SN-PIXEL8P-101", "SN-PIXEL8P-102", "SN-PIXEL8P-103"]', 16000000.00, 'available', '2026-01-05', 1, 'Quảng Ninh', '2026-01-08 03:01:00', '2026-01-08 03:01:00'),

-- Hàng hư hỏng
(42, 1, 42, 2, 'BATCH-IP15PM-2025-10', '2027-10-01', '2025-09-15', '["SN-IP15PM-DAM-001", "SN-IP15PM-DAM-002"]', 30000000.00, 'damaged', '2026-01-05', 0, 'Màn hình vỡ, chờ sửa chữa', '2026-01-08 03:01:00', '2026-01-08 03:01:00'),
(43, 6, 42, 1, 'BATCH-S24U-2025-12', '2027-12-15', '2025-11-25', '["SN-S24U-DAM-001"]', 33000000.00, 'damaged', '2026-01-05', 0, 'Pin phồng', '2026-01-08 03:01:00', '2026-01-08 03:01:00'),
(44, 5, 42, 3, 'BATCH-APP2-2025-11', '2027-11-10', '2025-10-01', NULL, 4500000.00, 'damaged', '2026-01-05', 0, 'Mất kết nối Bluetooth', '2026-01-08 03:01:00', '2026-01-08 03:01:00'),

-- Hàng bảo quản
(45, 1, 43, 3, 'BATCH-IP15PM-2025-10', '2027-10-01', '2025-09-15', '["SN-IP15PM-CHK-001", "SN-IP15PM-CHK-002", "SN-IP15PM-CHK-003"]', 30000000.00, 'reserved', '2026-01-05', 0, 'Chờ kiểm tra chất lượng', '2026-01-08 03:01:00', '2026-01-08 03:01:00'),
(46, 10, 43, 5, 'BATCH-MI14-2025-10', '2027-10-05', '2025-09-20', NULL, 18000000.00, 'reserved', '2026-01-05', 0, 'Chờ kiểm tra phần mềm', '2026-01-08 03:01:00', '2026-01-08 03:01:00'),

-- Hàng hết hạn
(47, 20, 42, 10, 'BATCH-IP13M-2023-06', '2025-06-30', '2023-05-20', '["SN-IP13M-EXP-001", "SN-IP13M-EXP-002", "SN-IP13M-EXP-003", "SN-IP13M-EXP-004", "SN-IP13M-EXP-005", "SN-IP13M-EXP-006", "SN-IP13M-EXP-007", "SN-IP13M-EXP-008", "SN-IP13M-EXP-009", "SN-IP13M-EXP-010"]', 12000000.00, 'expired', '2026-01-05', 0, 'Hết hạn bảo hành', '2026-01-08 03:01:00', '2026-01-08 03:01:00');

-- --------------------------------------------------------
-- Dữ liệu mẫu cho bảng `stock_transactions` (nhiều hơn)
-- --------------------------------------------------------

INSERT INTO `stock_transactions` (`id`, `product_id`, `warehouse_location_id`, `transaction_type`, `quantity`, `unit_price`, `total_value`, `reference_number`, `reference_id`, `reference_type`, `from_warehouse_location_id`, `to_warehouse_location_id`, `employee_id`, `customer_id`, `supplier_id`, `notes`, `metadata`, `created_at`, `updated_at`) VALUES
-- Thêm giao dịch nhập hàng
(13, 2, 16, 'receive', 25, 22000000.00, 550000000.00, 'IMP-004', 4, 'import', NULL, NULL, 4, NULL, 1, 'Nhập MacBook Air M2', '{"batch_number": "BATCH-MBA-M2-2025-11"}', '2025-11-01 10:00:00', '2025-11-01 10:00:00'),
(14, 3, 17, 'receive', 12, 24000000.00, 288000000.00, 'IMP-004', 4, 'import', NULL, NULL, 4, NULL, 1, 'Nhập MacBook Air M2', '{"batch_number": "BATCH-MBA-M2-2025-11"}', '2025-11-01 10:30:00', '2025-11-01 10:30:00'),
(15, 4, 18, 'receive', 45, 12500000.00, 562500000.00, 'IMP-004', 4, 'import', NULL, NULL, 4, NULL, 1, 'Nhập iPad Air 5', '{"batch_number": "BATCH-IPA5-2025-10"}', '2025-11-01 11:00:00', '2025-11-01 11:00:00'),
(16, 5, 19, 'receive', 150, 4500000.00, 675000000.00, 'IMP-005', 5, 'import', NULL, NULL, 7, NULL, 5, 'Nhập AirPods Pro 2 lô lớn', '{"batch_number": "BATCH-APP2-2025-12"}', '2025-11-10 09:00:00', '2025-11-10 09:00:00'),
(17, 7, 22, 'receive', 8, 35000000.00, 280000000.00, 'IMP-006', 6, 'import', NULL, NULL, 4, NULL, 4, 'Nhập Oppo Reno series', '{"batch_number": "BATCH-ZFOLD5-2025-12"}', '2025-11-20 14:00:00', '2025-11-20 14:00:00'),
(18, 11, 24, 'receive', 80, 6000000.00, 480000000.00, 'IMP-006', 6, 'import', NULL, NULL, 4, NULL, 4, 'Nhập Oppo Reno 11 F', '{"batch_number": "BATCH-RMN13P-2025-12"}', '2025-11-20 14:30:00', '2025-11-20 14:30:00'),
(19, 13, 30, 'receive', 12, 19000000.00, 228000000.00, 'IMP-007', 7, 'import', NULL, NULL, 7, NULL, 1, 'Nhập hàng Tết Dương', '{"batch_number": "BATCH-OPFN3-2025-12"}', '2025-12-01 08:00:00', '2025-12-01 08:00:00'),
(20, 12, 25, 'receive', 120, 600000.00, 72000000.00, 'IMP-008', 8, 'import', NULL, NULL, 4, NULL, 2, 'Nhập Xiaomi Band 8', '{"batch_number": "BATCH-MIB8-2025-12"}', '2025-12-05 10:00:00', '2025-12-05 10:00:00'),
(21, 6, 2, 'receive', 12, 33000000.00, 396000000.00, 'IMP-009', 9, 'import', NULL, NULL, 7, NULL, 3, 'Nhập Samsung S24 Ultra', '{"batch_number": "BATCH-S24U-2025-12"}', '2025-12-15 11:00:00', '2025-12-15 11:00:00'),
(22, 4, 18, 'receive', 30, 12500000.00, 375000000.00, 'IMP-010', 10, 'import', NULL, NULL, 4, NULL, 1, 'Nhập hàng đầu năm', '{"batch_number": "BATCH-IPA5-2025-10"}', '2026-01-02 09:00:00', '2026-01-02 09:00:00'),

-- Thêm giao dịch bán hàng
(23, 2, 16, 'sale', -1, 24990000.00, 24990000.00, 'INV-002', 2, 'invoice', NULL, NULL, 3, 2, NULL, 'Bán iPhone 15 Plus', '{"invoice_number": "INV-002"}', '2025-12-02 15:30:00', '2025-12-02 15:30:00'),
(24, 2, 16, 'sale', -1, 24990000.00, 24990000.00, 'INV-009', 9, 'invoice', NULL, NULL, 3, 1, NULL, 'Bán iPhone 15 Plus cho khách VIP', '{"invoice_number": "INV-009"}', '2025-12-30 16:45:00', '2025-12-30 16:45:00'),
(25, 3, 17, 'sale', -1, 26990000.00, 26990000.00, 'INV-009', 9, 'invoice', NULL, NULL, 3, 1, NULL, 'Bán MacBook Air M2', '{"invoice_number": "INV-009"}', '2025-12-30 17:00:00', '2025-12-30 17:00:00'),
(26, 4, 18, 'sale', -1, 14990000.00, 14990000.00, 'INV-004', 4, 'invoice', NULL, NULL, 6, 4, NULL, 'Bán iPad Air 5', '{"invoice_number": "INV-004"}', '2025-12-10 11:20:00', '2025-12-10 11:20:00'),
(27, 4, 18, 'sale', -1, 14990000.00, 14990000.00, 'INV-015', 15, 'invoice', NULL, NULL, 3, 14, NULL, 'Bán iPad Air 5 cho khách Vàng', '{"invoice_number": "INV-015"}', '2026-01-06 14:15:00', '2026-01-06 14:15:00'),
(28, 5, 19, 'sale', -1, 5990000.00, 5990000.00, 'INV-005', 5, 'invoice', NULL, NULL, 2, 5, NULL, 'Bán AirPods Pro 2', '{"invoice_number": "INV-005"}', '2025-12-15 10:10:00', '2025-12-15 10:10:00'),
(29, 5, 19, 'sale', -1, 5990000.00, 5990000.00, 'INV-013', 13, 'invoice', NULL, NULL, 6, 12, NULL, 'Bán AirPods Pro 2 cho khách vãng lai', '{"invoice_number": "INV-013"}', '2026-01-04 09:45:00', '2026-01-04 09:45:00'),
(30, 8, 6, 'sale', -1, 9990000.00, 9990000.00, 'INV-008', 8, 'invoice', NULL, NULL, 2, 8, NULL, 'Bán Samsung Galaxy A55', '{"invoice_number": "INV-008"}', '2025-12-25 15:30:00', '2025-12-25 15:30:00'),
(31, 10, 4, 'sale', -1, 20990000.00, 20990000.00, 'INV-012', 12, 'invoice', NULL, NULL, 3, 11, NULL, 'Bán Xiaomi 14 cho khách vãng lai', '{"invoice_number": "INV-012"}', '2026-01-03 13:20:00', '2026-01-03 13:20:00'),
(32, 14, 5, 'sale', -1, 8990000.00, 8990000.00, 'INV-007', 7, 'invoice', NULL, NULL, 6, 7, NULL, 'Bán Oppo Reno 11 F', '{"invoice_number": "INV-007"}', '2025-12-24 16:50:00', '2025-12-24 16:50:00'),
(33, 17, 32, 'sale', -1, 28990000.00, 28990000.00, 'INV-014', 14, 'invoice', NULL, NULL, 2, 15, NULL, 'Bán Asus ROG Phone 8', '{"invoice_number": "INV-014"}', '2026-01-05 17:30:00', '2026-01-05 17:30:00'),

-- Thêm giao dịch chuyển kho
(34, 2, 12, 'transfer', 15, 22000000.00, 330000000.00, 'TRF-2025-12-03', NULL, 'transfer', 16, 12, 4, NULL, NULL, 'Chuyển iPhone 15 Plus vào TP.HCM', '{"reason": "nhu cầu thị trường miền Nam"}', '2025-12-03 11:00:00', '2025-12-03 11:00:00'),
(35, 3, 27, 'transfer', 3, 24000000.00, 72000000.00, 'TRF-2025-12-04', NULL, 'transfer', 17, 27, 4, NULL, NULL, 'Chuyển MacBook Air M2 ra Hải Phòng', '{"reason": "phân phối vùng"}', '2025-12-04 09:30:00', '2025-12-04 09:30:00'),
(36, 4, 26, 'transfer', 15, 12500000.00, 187500000.00, 'TRF-2025-12-05', NULL, 'transfer', 18, 26, 7, NULL, NULL, 'Chuyển iPad Air 5 vào TP.HCM', '{"reason": "nhu cầu tablet tăng"}', '2025-12-05 14:00:00', '2025-12-05 14:00:00'),
(37, 5, 29, 'transfer', 50, 4500000.00, 225000000.00, 'TRF-2025-12-06', NULL, 'transfer', 19, 29, 4, NULL, NULL, 'Chuyển AirPods ra Hải Phòng', '{"reason": "phân phối đều"}', '2025-12-06 10:15:00', '2025-12-06 10:15:00'),
(38, 11, 28, 'transfer', 40, 6000000.00, 240000000.00, 'TRF-2025-12-07', NULL, 'transfer', 24, 28, 7, NULL, NULL, 'Chuyển Redmi Note 13 Pro ra Hải Phòng', '{"reason": "nhu cầu vùng cảng"}', '2025-12-07 13:45:00', '2025-12-07 13:45:00'),
(39, 12, 35, 'transfer', 30, 600000.00, 18000000.00, 'TRF-2025-12-08', NULL, 'transfer', 25, 35, 4, NULL, NULL, 'Chuyển Xiaomi Band 8 ra Quảng Ninh', '{"reason": "du lịch"}', '2025-12-08 15:30:00', '2025-12-08 15:30:00'),
(40, 13, 36, 'transfer', 6, 19000000.00, 114000000.00, 'TRF-2025-12-09', NULL, 'transfer', 30, 36, 7, NULL, NULL, 'Chuyển Oppo Find N3 Flip vào Long An', '{"reason": "phân phối đồng bằng"}', '2025-12-09 11:20:00', '2025-12-09 11:20:00'),
(41, 16, 29, 'transfer', 5, 6000000.00, 30000000.00, 'TRF-2025-12-10', NULL, 'transfer', 33, 29, 4, NULL, NULL, 'Chuyển tai nghe Sony ra Hải Phòng', '{"reason": "nhu cầu âm thanh"}', '2025-12-10 16:00:00', '2025-12-10 16:00:00'),
(42, 17, 39, 'transfer', 2, 25000000.00, 50000000.00, 'TRF-2025-12-11', NULL, 'transfer', 32, 39, 7, NULL, NULL, 'Chuyển Asus ROG Phone 8 ra Thanh Hóa', '{"reason": "game thủ địa phương"}', '2025-12-11 14:30:00', '2025-12-11 14:30:00'),
(43, 18, 27, 'transfer', 4, 21000000.00, 84000000.00, 'TRF-2025-12-12', NULL, 'transfer', 17, 27, 4, NULL, NULL, 'Chuyển Asus Zenbook 14 ra Hải Phòng', '{"reason": "văn phòng khu công nghiệp"}', '2025-12-12 10:00:00', '2025-12-12 10:00:00'),
(44, 19, 34, 'transfer', 3, 16000000.00, 48000000.00, 'TRF-2025-12-13', NULL, 'transfer', 21, 34, 7, NULL, NULL, 'Chuyển Google Pixel 8 Pro ra Quảng Ninh', '{"reason": "khách du lịch nước ngoài"}', '2025-12-13 11:45:00', '2025-12-13 11:45:00'),
(45, 9, 38, 'transfer', 5, 17000000.00, 85000000.00, 'TRF-2025-12-14', NULL, 'transfer', 26, 38, 4, NULL, NULL, 'Chuyển Galaxy Tab S9 ra Thanh Hóa', '{"reason": "nhu cầu giáo dục"}', '2025-12-14 15:15:00', '2025-12-14 15:15:00'),

-- Thêm giao dịch điều chỉnh
(46, 1, 42, 'adjust', -2, 30000000.00, 60000000.00, 'ADJ-2025-12-20', NULL, 'adjustment', NULL, NULL, 4, NULL, NULL, 'iPhone 15 Pro Max bị vỡ màn hình', '{"reason": "hư hỏng", "damage_type": "màn hình vỡ", "responsible": "vận chuyển"}', '2025-12-20 09:00:00', '2025-12-20 09:00:00'),
(47, 6, 42, 'adjust', -1, 33000000.00, 33000000.00, 'ADJ-2025-12-21', NULL, 'adjustment', NULL, NULL, 7, NULL, NULL, 'Samsung S24 Ultra pin phồng', '{"reason": "hư hỏng", "damage_type": "pin phồng", "responsible": "nhà sản xuất"}', '2025-12-21 10:30:00', '2025-12-21 10:30:00'),
(48, 5, 42, 'adjust', -3, 4500000.00, 13500000.00, 'ADJ-2025-12-22', NULL, 'adjustment', NULL, NULL, 4, NULL, NULL, 'AirPods Pro 2 mất kết nối', '{"reason": "hư hỏng", "damage_type": "lỗi Bluetooth", "responsible": "nhà sản xuất"}', '2025-12-22 14:15:00', '2025-12-22 14:15:00'),
(49, 1, 43, 'adjust', 3, 30000000.00, 90000000.00, 'ADJ-2025-12-23', NULL, 'adjustment', NULL, NULL, 7, NULL, NULL, 'Chuyển sang chờ kiểm tra', '{"reason": "chuyển trạng thái", "from": "available", "to": "reserved"}', '2025-12-23 11:00:00', '2025-12-23 11:00:00'),
(50, 10, 43, 'adjust', 5, 18000000.00, 90000000.00, 'ADJ-2025-12-24', NULL, 'adjustment', NULL, NULL, 4, NULL, NULL, 'Chuyển sang chờ kiểm tra phần mềm', '{"reason": "chuyển trạng thái", "from": "available", "to": "reserved"}', '2025-12-24 09:30:00', '2025-12-24 09:30:00'),
(51, 20, 42, 'adjust', -10, 12000000.00, 120000000.00, 'ADJ-2025-12-25', NULL, 'adjustment', NULL, NULL, 7, NULL, NULL, 'iPhone 13 Mini hết hạn bảo hành', '{"reason": "hết hạn", "disposal_method": "tái chế"}', '2025-12-25 13:00:00', '2025-12-25 13:00:00'),

-- Giao dịch kiểm kê
(52, 1, 1, 'adjust', 0, 30000000.00, 0.00, 'ST-2025-12-001', 1, 'stock_take', NULL, NULL, 4, NULL, NULL, 'Kiểm kê khớp số lượng', '{"stock_take_number": "ST-2025-12-001"}', '2025-12-31 10:00:00', '2025-12-31 10:00:00'),
(53, 5, 10, 'adjust', -2, 4500000.00, -9000000.00, 'ST-2025-12-001', 1, 'stock_take', NULL, NULL, 4, NULL, NULL, 'Phát hiện 2 sản phẩm hư hỏng', '{"stock_take_number": "ST-2025-12-001", "variance_type": "shortage"}', '2025-12-31 10:30:00', '2025-12-31 10:30:00'),
(54, 12, 11, 'adjust', 5, 600000.00, 3000000.00, 'ST-2025-12-001', 1, 'stock_take', NULL, NULL, 4, NULL, NULL, 'Thừa 5 sản phẩm', '{"stock_take_number": "ST-2025-12-001", "variance_type": "excess"}', '2025-12-31 11:00:00', '2025-12-31 11:00:00'),
(55, 8, 6, 'adjust', 0, 8000000.00, 0.00, 'ST-2025-12-001', 1, 'stock_take', NULL, NULL, 4, NULL, NULL, 'Kiểm kê khớp số lượng', '{"stock_take_number": "ST-2025-12-001"}', '2025-12-31 11:30:00', '2025-12-31 11:30:00'),
(56, 1, 12, 'adjust', 0, 30000000.00, 0.00, 'ST-2026-01-001', 2, 'stock_take', NULL, NULL, 7, NULL, NULL, 'Kiểm kê khớp số lượng TP.HCM', '{"stock_take_number": "ST-2026-01-001"}', '2026-01-05 09:00:00', '2026-01-05 09:00:00'),
(57, 6, 12, 'adjust', 0, 33000000.00, 0.00, 'ST-2026-01-001', 2, 'stock_take', NULL, NULL, 7, NULL, NULL, 'Kiểm kê khớp số lượng', '{"stock_take_number": "ST-2026-01-001"}', '2026-01-05 09:30:00', '2026-01-05 09:30:00'),
(58, 10, 4, 'adjust', 0, 18000000.00, 0.00, 'ST-2026-01-002', 3, 'stock_take', NULL, NULL, 4, NULL, NULL, 'Kiểm kê theo chu kỳ', '{"stock_take_number": "ST-2026-01-002"}', '2026-01-06 09:00:00', '2026-01-06 09:00:00'),
(59, 14, 5, 'adjust', 0, 7000000.00, 0.00, 'ST-2026-01-002', 3, 'stock_take', NULL, NULL, 4, NULL, NULL, 'Kiểm kê theo chu kỳ', '{"stock_take_number": "ST-2026-01-002"}', '2026-01-06 09:30:00', '2026-01-06 09:30:00');

-- --------------------------------------------------------
-- Dữ liệu mẫu cho bảng `stock_takes` (nhiều hơn)
-- --------------------------------------------------------

INSERT INTO `stock_takes` (`id`, `stock_take_number`, `warehouse_id`, `stock_take_date`, `status`, `type`, `employee_id`, `notes`, `total_variance`, `created_at`, `updated_at`) VALUES
(5, 'ST-2026-01-003', 6, '2026-01-07', 'completed', 'partial', 4, 'Kiểm kê khu vực Apple', -15000000.00, '2026-01-07 08:00:00', '2026-01-07 16:00:00'),
(6, 'ST-2026-01-004', 7, '2026-01-08', 'in_progress', 'full', 7, 'Kiểm kê toàn bộ kho TP.HCM 2', 0.00, '2026-01-08 08:00:00', '2026-01-08 11:30:00'),
(7, 'ST-2025-12-003', 8, '2025-12-29', 'completed', 'full', NULL, 'Kiểm kê kho Hải Phòng', 8000000.00, '2025-12-29 08:00:00', '2025-12-29 17:00:00'),
(8, 'ST-2026-01-005', 9, '2026-01-09', 'pending', 'cycle', NULL, 'Kiểm kê định kỳ Bình Dương', 0.00, '2026-01-08 08:00:00', '2026-01-08 08:00:00'),
(9, 'ST-2026-01-006', 10, '2026-01-10', 'pending', 'partial', NULL, 'Kiểm kê khu vực chính Quảng Ninh', 0.00, '2026-01-08 08:00:00', '2026-01-08 08:00:00'),
(10, 'ST-2026-01-007', 13, '2026-01-11', 'pending', 'full', NULL, 'Kiểm kê toàn bộ kho Long An', 0.00, '2026-01-08 08:00:00', '2026-01-08 08:00:00'),
(11, 'ST-2026-01-008', 14, '2026-01-12', 'pending', 'partial', NULL, 'Kiểm kê khu vực trung tâm Thanh Hóa', 0.00, '2026-01-08 08:00:00', '2026-01-08 08:00:00'),
(12, 'ST-2026-01-009', 15, '2026-01-13', 'pending', 'full', NULL, 'Kiểm kê toàn bộ kho Phú Yên', 0.00, '2026-01-08 08:00:00', '2026-01-08 08:00:00'),
(13, 'ST-2025-12-004', 1, '2025-12-20', 'completed', 'cycle', 4, 'Kiểm kê định kỳ khu vực D', -4500000.00, '2025-12-20 08:00:00', '2025-12-20 14:00:00'),
(14, 'ST-2025-12-005', 2, '2025-12-22', 'completed', 'partial', 7, 'Kiểm kê khu vực phụ kiện', 1800000.00, '2025-12-22 08:00:00', '2025-12-22 12:30:00');

-- --------------------------------------------------------
-- Dữ liệu mẫu cho bảng `stock_take_items` (nhiều hơn)
-- --------------------------------------------------------

INSERT INTO `stock_take_items` (`id`, `stock_take_id`, `product_id`, `warehouse_location_id`, `system_quantity`, `actual_quantity`, `variance`, `unit_cost`, `variance_value`, `status`, `notes`, `created_at`, `updated_at`) VALUES
-- Kiểm kê kho Apple
(9, 5, 1, 15, 40, 40, 0, 30000000.00, 0.00, 'matched', 'Khớp số lượng', '2026-01-07 09:00:00', '2026-01-07 09:00:00'),
(10, 5, 2, 16, 65, 64, -1, 22000000.00, -22000000.00, 'shortage', 'Thiếu 1 sản phẩm', '2026-01-07 09:30:00', '2026-01-07 09:30:00'),
(11, 5, 3, 17, 12, 12, 0, 24000000.00, 0.00, 'matched', 'Khớp số lượng', '2026-01-07 10:00:00', '2026-01-07 10:00:00'),
(12, 5, 4, 18, 45, 45, 0, 12500000.00, 0.00, 'matched', 'Khớp số lượng', '2026-01-07 10:30:00', '2026-01-07 10:30:00'),
(13, 5, 5, 19, 210, 212, 2, 4500000.00, 9000000.00, 'excess', 'Thừa 2 sản phẩm', '2026-01-07 11:00:00', '2026-01-07 11:00:00'),
(14, 5, 20, 42, 10, 10, 0, 12000000.00, 0.00, 'matched', 'Khớp số lượng hàng hết hạn', '2026-01-07 11:30:00', '2026-01-07 11:30:00'),

-- Kiểm kê kho TP.HCM 2
(15, 6, 7, 22, 18, 18, 0, 35000000.00, 0.00, 'matched', 'Khớp số lượng', '2026-01-08 09:00:00', '2026-01-08 09:00:00'),
(16, 6, 10, 23, 42, 42, 0, 18000000.00, 0.00, 'matched', 'Khớp số lượng', '2026-01-08 09:30:00', '2026-01-08 09:30:00'),
(17, 6, 11, 24, 95, 95, 0, 6000000.00, 0.00, 'matched', 'Khớp số lượng', '2026-01-08 10:00:00', '2026-01-08 10:00:00'),
(18, 6, 12, 25, 180, 180, 0, 600000.00, 0.00, 'matched', 'Khớp số lượng', '2026-01-08 10:30:00', '2026-01-08 10:30:00'),
(19, 6, 9, 26, 25, 25, 0, 17000000.00, 0.00, 'matched', 'Khớp số lượng', '2026-01-08 11:00:00', '2026-01-08 11:00:00'),

-- Kiểm kê kho Hải Phòng
(20, 7, 3, 27, 3, 3, 0, 24000000.00, 0.00, 'matched', 'Khớp số lượng', '2025-12-29 09:00:00', '2025-12-29 09:00:00'),
(21, 7, 5, 29, 50, 52, 2, 4500000.00, 9000000.00, 'excess', 'Thừa 2 sản phẩm', '2025-12-29 09:30:00', '2025-12-29 09:30:00'),
(22, 7, 7, 27, 2, 2, 0, 35000000.00, 0.00, 'matched', 'Khớp số lượng', '2025-12-29 10:00:00', '2025-12-29 10:00:00'),
(23, 7, 11, 28, 40, 39, -1, 6000000.00, -6000000.00, 'shortage', 'Thiếu 1 sản phẩm', '2025-12-29 10:30:00', '2025-12-29 10:30:00'),
(24, 7, 16, 29, 5, 5, 0, 6000000.00, 0.00, 'matched', 'Khớp số lượng', '2025-12-29 11:00:00', '2025-12-29 11:00:00'),
(25, 7, 18, 27, 4, 4, 0, 21000000.00, 0.00, 'matched', 'Khớp số lượng', '2025-12-29 11:30:00', '2025-12-29 11:30:00'),

-- Kiểm kê định kỳ khu vực D
(26, 13, 5, 10, 80, 78, -2, 4500000.00, -9000000.00, 'damaged', '2 sản phẩm hư hỏng', '2025-12-20 09:00:00', '2025-12-20 09:00:00'),
(27, 13, 12, 11, 150, 152, 2, 600000.00, 1200000.00, 'excess', 'Thừa 2 sản phẩm', '2025-12-20 09:30:00', '2025-12-20 09:30:00'),
(28, 13, 16, 10, 25, 25, 0, 6000000.00, 0.00, 'matched', 'Khớp số lượng', '2025-12-20 10:00:00', '2025-12-20 10:00:00'),

-- Kiểm kê khu vực phụ kiện TP.HCM
(29, 14, 5, 12, 20, 20, 0, 4500000.00, 0.00, 'matched', 'Khớp số lượng', '2025-12-22 09:00:00', '2025-12-22 09:00:00'),
(30, 14, 12, 13, 50, 53, 3, 600000.00, 1800000.00, 'excess', 'Thừa 3 sản phẩm', '2025-12-22 09:30:00', '2025-12-22 09:30:00'),
(31, 14, 16, 12, 0, 0, 0, 6000000.00, 0.00, 'matched', 'Khớp số lượng', '2025-12-22 10:00:00', '2025-12-22 10:00:00');