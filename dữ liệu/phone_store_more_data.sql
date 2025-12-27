-- Chèn dữ liệu vào bảng brands
INSERT INTO `brands` (`id`, `brand_name`, `country`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Apple', 'USA', 'Hãng công nghệ hàng đầu thế giới với các sản phẩm iPhone, iPad, Mac', NOW(), NOW()),
(2, 'Samsung', 'Hàn Quốc', 'Tập đoàn điện tử đa quốc gia, sản xuất điện thoại Galaxy series', NOW(), NOW()),
(3, 'Xiaomi', 'Trung Quốc', 'Công ty công nghệ với các sản phẩm chất lượng cao, giá cả phải chăng', NOW(), NOW()),
(4, 'OPPO', 'Trung Quốc', 'Chuyên về điện thoại thông minh với camera chất lượng cao', NOW(), NOW()),
(5, 'Vivo', 'Trung Quốc', 'Tập trung vào điện thoại chụp ảnh và selfie', NOW(), NOW()),
(6, 'Realme', 'Trung Quốc', 'Thương hiệu điện thoại thông minh giá rẻ cho giới trẻ', NOW(), NOW()),
(7, 'Nokia', 'Phần Lan', 'Thương hiệu lâu đời với điện thoại bền bỉ', NOW(), NOW()),
(8, 'Google', 'USA', 'Sản xuất điện thoại Pixel với camera AI', NOW(), NOW());

-- Chèn dữ liệu vào bảng suppliers
INSERT INTO `suppliers` (`id`, `supplier_name`, `contact_name`, `phone`, `email`, `address`, `created_at`, `updated_at`) VALUES
(1, 'Công ty TNHH Thế Giới Di Động', 'Nguyễn Văn A', '0912345678', 'contact@thegioididong.com', '123 Nguyễn Văn Linh, Quận 7, TP.HCM', NOW(), NOW()),
(2, 'Công ty TNHH Điện Máy Xanh', 'Trần Thị B', '0923456789', 'supplier@dienmayxanh.com', '456 Lê Văn Việt, Quận 9, TP.HCM', NOW(), NOW()),
(3, 'Công ty TNHH FPT Shop', 'Lê Văn C', '0934567890', 'order@fptshop.com.vn', '789 Cách Mạng Tháng 8, Quận 3, TP.HCM', NOW(), NOW()),
(4, 'Công ty TNHH Viễn Thông A', 'Phạm Thị D', '0945678901', 'info@vienthonga.com', '321 Trần Hưng Đạo, Quận 1, TP.HCM', NOW(), NOW()),
(5, 'Công ty TNHH Phân Phối ABC', 'Hoàng Văn E', '0956789012', 'sales@abc.com.vn', '654 Nguyễn Trãi, Quận 5, TP.HCM', NOW(), NOW());

-- Chèn dữ liệu vào bảng employees
INSERT INTO `employees` (`id`, `username`, `password`, `full_name`, `avartar`, `phone`, `role`, `Position`, `salary`, `hire_date`, `email`, `status`, `created_at`, `updated_at`) VALUES
(1, 'admin01', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Nguyễn Văn Quản Lý', 'avatar1.jpg', '0901111111', 'admin', 'staff', 25000000.00, '2022-01-15', 'admin01@store.com', 'active', NOW(), NOW()),
(2, 'seller01', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Trần Thị Bán Hàng', 'avatar2.jpg', '0902222222', 'employee', 'Sell', 12000000.00, '2023-03-20', 'seller01@store.com', 'active', NOW(), NOW()),
(3, 'warehouse01', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Lê Văn Kho', 'avatar3.jpg', '0903333333', 'employee', 'Warehouse employee', 10000000.00, '2023-06-10', 'warehouse01@store.com', 'active', NOW(), NOW()),
(4, 'accountant01', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Phạm Thị Kế Toán', 'avatar4.jpg', '0904444444', 'employee', 'Accountant', 15000000.00, '2022-11-05', 'accountant01@store.com', 'active', NOW(), NOW()),
(5, 'seller02', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Hoàng Văn Bán', 'avatar5.jpg', '0905555555', 'employee', 'Sell', 11000000.00, '2024-01-18', 'seller02@store.com', 'active', NOW(), NOW()),
(6, 'seller03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Vũ Thị Mến Khách', 'avatar6.jpg', '0906666666', 'employee', 'Sell', 11500000.00, '2023-09-22', 'seller03@store.com', 'take a break', NOW(), NOW());

-- Chèn dữ liệu vào bảng products
INSERT INTO `products` (`id`, `product_name`, `sku`, `brand_id`, `category`, `ram`, `storage`, `price`, `cost_price`, `stock`, `status`, `description`, `image`, `created_at`, `updated_at`) VALUES
(1, 'iPhone 15 Pro Max', 'IP15PM-256GB', 1, 'Smartphone', '8GB', '256GB', 32990000.00, 28000000.00, 25, 'Available', 'iPhone 15 Pro Max 256GB, chip A17 Pro, màn hình 6.7 inch', 'iphone15promax.jpg', NOW(), NOW()),
(2, 'Samsung Galaxy S24 Ultra', 'SGS24U-512GB', 2, 'Smartphone', '12GB', '512GB', 28990000.00, 24500000.00, 18, 'Available', 'Samsung Galaxy S24 Ultra 512GB, camera 200MP, bút S-Pen', 's24ultra.jpg', NOW(), NOW()),
(3, 'Xiaomi 14 Pro', 'XM14P-256GB', 3, 'Smartphone', '12GB', '256GB', 19990000.00, 16500000.00, 32, 'Available', 'Xiaomi 14 Pro 256GB, camera Leica, chip Snapdragon 8 Gen 3', 'xiaomi14pro.jpg', NOW(), NOW()),
(4, 'OPPO Reno 11', 'OPR11-128GB', 4, 'Smartphone', '8GB', '128GB', 10990000.00, 8900000.00, 45, 'Available', 'OPPO Reno 11 128GB, camera 50MP, sạc nhanh 67W', 'opporeno11.jpg', NOW(), NOW()),
(5, 'Vivo V30 Pro', 'VV30P-256GB', 5, 'Smartphone', '12GB', '256GB', 14990000.00, 12500000.00, 22, 'Available', 'Vivo V30 Pro 256GB, camera Zeiss, thiết kế mỏng nhẹ', 'vivov30pro.jpg', NOW(), NOW()),
(6, 'Realme 12 Pro+', 'RM12P+-256GB', 6, 'Smartphone', '12GB', '256GB', 12990000.00, 10500000.00, 30, 'Available', 'Realme 12 Pro+ 256GB, camera periscope, thiết kế sang trọng', 'realme12pro.jpg', NOW(), NOW()),
(7, 'Nokia G42', 'NKG42-128GB', 7, 'Smartphone', '6GB', '128GB', 4990000.00, 3800000.00, 15, 'Available', 'Nokia G42 128GB, bền bỉ, pin khủng', 'nokiag42.jpg', NOW(), NOW()),
(8, 'Google Pixel 8 Pro', 'GP8P-256GB', 8, 'Smartphone', '12GB', '256GB', 23990000.00, 20500000.00, 12, 'Available', 'Google Pixel 8 Pro 256GB, camera AI, Android thuần', 'pixel8pro.jpg', NOW(), NOW()),
(9, 'iPhone 14', 'IP14-128GB', 1, 'Smartphone', '6GB', '128GB', 18990000.00, 15500000.00, 8, 'Available', 'iPhone 14 128GB, chip A15, hỗ trợ 5G', 'iphone14.jpg', NOW(), NOW()),
(10, 'Samsung Galaxy A54', 'SGA54-256GB', 2, 'Smartphone', '8GB', '256GB', 8990000.00, 7200000.00, 28, 'Available', 'Samsung Galaxy A54 256GB, camera 50MP, màn hình 120Hz', 'galaxya54.jpg', NOW(), NOW()),
(11, 'iPad Air 5', 'IPAIR5-64GB', 1, 'Tablet', '8GB', '64GB', 16990000.00, 14000000.00, 10, 'Available', 'iPad Air 5 WiFi 64GB, chip M1, hỗ trợ Apple Pencil 2', 'ipadair5.jpg', NOW(), NOW()),
(12, 'Samsung Galaxy Tab S9', 'SGTS9-256GB', 2, 'Tablet', '12GB', '256GB', 21990000.00, 18500000.00, 7, 'Available', 'Samsung Galaxy Tab S9 256GB, màn hình AMOLED, bút S-Pen', 'tabS9.jpg', NOW(), NOW()),
(13, 'Apple Watch Series 9', 'AWS9-GPS', 1, 'Smartwatch', '2GB', '32GB', 11990000.00, 9800000.00, 20, 'Available', 'Apple Watch Series 9 GPS 45mm, đo nhịp tim, hỗ trợ thể thao', 'applewatch9.jpg', NOW(), NOW()),
(14, 'Samsung Galaxy Watch 6', 'SGW6-44MM', 2, 'Smartwatch', '2GB', '16GB', 6990000.00, 5600000.00, 16, 'Available', 'Samsung Galaxy Watch 6 Classic 44mm, đo huyết áp, ECG', 'galaxywatch6.jpg', NOW(), NOW()),
(15, 'AirPods Pro 2', 'APP2', 1, 'Headphone', 'N/A', 'N/A', 6990000.00, 5500000.00, 35, 'Available', 'AirPods Pro 2 chống ồn chủ động, sạc MagSafe', 'airpodspro2.jpg', NOW(), NOW());

-- Chèn dữ liệu vào bảng customers
INSERT INTO `customers` (`id`, `full_name`, `phone`, `date_of_birth`, `email`, `gender`, `address`, `membership`, `points`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Trần Minh Anh', '0911111111', '1990-05-15', 'tranminhanh@gmail.com', 'Nữ', '12 Lý Thường Kiệt, Quận 10, TP.HCM', 'VIP', 1250, 'Khách hàng thân thiết, mua hàng thường xuyên', NOW(), NOW()),
(2, 'Nguyễn Văn Bình', '0922222222', '1985-08-22', 'nguyenvanbinh@yahoo.com', 'Nam', '45 Nguyễn Thị Minh Khai, Quận 1, TP.HCM', 'Vàng', 780, 'Khách hàng doanh nhân, thích sản phẩm cao cấp', NOW(), NOW()),
(3, 'Lê Thị Cẩm Tú', '0933333333', '1995-11-30', 'lethicamtu@gmail.com', 'Nữ', '78 Võ Văn Tần, Quận 3, TP.HCM', 'Bạc', 420, 'Khách hàng trẻ, thích công nghệ mới', NOW(), NOW()),
(4, 'Phạm Hoàng Duy', '0944444444', '1992-03-18', 'phamhoangduy@outlook.com', 'Nam', '23 Hoàng Văn Thụ, Quận Phú Nhuận, TP.HCM', 'Đồng', 150, 'Khách hàng mới, mua hàng lần đầu', NOW(), NOW()),
(5, 'Vũ Mai Hương', '0955555555', '1988-07-25', 'vumaihuong@gmail.com', 'Nữ', '56 Trường Chinh, Quận Tân Bình, TP.HCM', 'Vàng', 920, 'Khách hàng thường xuyên mua đồ công nghệ cho gia đình', NOW(), NOW()),
(6, 'Đặng Quốc Bảo', '0966666666', '1993-12-05', 'dangquocbao@yahoo.com', 'Nam', '89 Lê Đức Thọ, Quận Gò Vấp, TP.HCM', 'Bạc', 380, 'Khách hàng kỹ sư IT', NOW(), NOW()),
(7, 'Hoàng Thị Diễm', '0977777777', '1997-09-14', 'hoangthidiem@gmail.com', 'Nữ', '34 Nguyễn Văn Cừ, Quận 5, TP.HCM', 'Đồng', 95, 'Sinh viên, thích sản phẩm giá rẻ', NOW(), NOW()),
(8, 'Trịnh Văn Đạt', '0988888888', '1983-04-20', 'trinhvandat@outlook.com', 'Nam', '67 Phan Đăng Lưu, Quận Bình Thạnh, TP.HCM', 'Vàng', 1100, 'Doanh nhân, mua nhiều sản phẩm làm quà tặng', NOW(), NOW());

-- Chèn dữ liệu vào bảng imports
INSERT INTO `imports` (`id`, `supplier_id`, `employee_id`, `import_date`, `total_amount`, `notes`, `created_at`, `updated_at`) VALUES
(1, 1, 3, '2024-01-10', 210000000.00, 'Nhập hàng iPhone 15 series', NOW(), NOW()),
(2, 2, 3, '2024-01-12', 180000000.00, 'Nhập hàng Samsung S24 series', NOW(), NOW()),
(3, 3, 3, '2024-01-15', 125000000.00, 'Nhập hàng Xiaomi và OPPO', NOW(), NOW()),
(4, 4, 3, '2024-01-18', 95000000.00, 'Nhập hàng Vivo và Realme', NOW(), NOW()),
(5, 5, 3, '2024-01-20', 80000000.00, 'Nhập hàng phụ kiện và tablet', NOW(), NOW());

-- Chèn dữ liệu vào bảng import_details
INSERT INTO `import_details` (`id`, `import_id`, `product_id`, `quantity`, `const_price`, `amount`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 10, 28000000.00, 280000000.00, NOW(), NOW()),
(2, 1, 9, 15, 15500000.00, 232500000.00, NOW(), NOW()),
(3, 2, 2, 8, 24500000.00, 196000000.00, NOW(), NOW()),
(4, 2, 10, 20, 7200000.00, 144000000.00, NOW(), NOW()),
(5, 3, 3, 12, 16500000.00, 198000000.00, NOW(), NOW()),
(6, 3, 4, 18, 8900000.00, 160200000.00, NOW(), NOW()),
(7, 4, 5, 10, 12500000.00, 125000000.00, NOW(), NOW()),
(8, 4, 6, 15, 10500000.00, 157500000.00, NOW(), NOW()),
(9, 5, 11, 6, 14000000.00, 84000000.00, NOW(), NOW()),
(10, 5, 15, 20, 5500000.00, 110000000.00, NOW(), NOW());

-- Chèn dữ liệu vào bảng invoices
INSERT INTO `invoices` (`id`, `customer_id`, `employee_id`, `invoice_date`, `subtotal`, `discount`, `total_amount`, `payment_method`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 2, '2024-01-25', 32990000.00, 0.00, 32990000.00, 'credit_card', 'completed', NOW(), NOW()),
(2, 2, 2, '2024-01-26', 46980000.00, 500000.00, 46480000.00, 'bank_transfer', 'completed', NOW(), NOW()),
(3, 3, 5, '2024-01-27', 12990000.00, 0.00, 12990000.00, 'cash', 'completed', NOW(), NOW()),
(4, 4, 5, '2024-01-28', 19990000.00, 1000000.00, 18990000.00, 'credit_card', 'paid', NOW(), NOW()),
(5, 5, 2, '2024-01-29', 55970000.00, 2000000.00, 53970000.00, 'bank_transfer', 'completed', NOW(), NOW()),
(6, 6, 5, '2024-01-30', 4990000.00, 0.00, 4990000.00, 'cash', 'completed', NOW(), NOW()),
(7, 7, 2, '2024-02-01', 8990000.00, 500000.00, 8490000.00, 'credit_card', 'shipping', NOW(), NOW()),
(8, 8, 5, '2024-02-02', 70980000.00, 3000000.00, 67980000.00, 'bank_transfer', 'processing', NOW(), NOW());

-- Chèn dữ liệu vào bảng invoice_details
INSERT INTO `invoice_details` (`id`, `invoice_id`, `product_id`, `quantity`, `unit_price`, `amount`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 32990000.00, 32990000.00, NOW(), NOW()),
(2, 2, 2, 1, 28990000.00, 28990000.00, NOW(), NOW()),
(3, 2, 13, 1, 11990000.00, 11990000.00, NOW(), NOW()),
(4, 2, 15, 1, 6990000.00, 6990000.00, NOW(), NOW()),
(5, 3, 6, 1, 12990000.00, 12990000.00, NOW(), NOW()),
(6, 4, 3, 1, 19990000.00, 19990000.00, NOW(), NOW()),
(7, 5, 1, 1, 32990000.00, 32990000.00, NOW(), NOW()),
(8, 5, 9, 1, 18990000.00, 18990000.00, NOW(), NOW()),
(9, 5, 15, 2, 6990000.00, 13980000.00, NOW(), NOW()),
(10, 6, 7, 1, 4990000.00, 4990000.00, NOW(), NOW()),
(11, 7, 10, 1, 8990000.00, 8990000.00, NOW(), NOW()),
(12, 8, 8, 2, 23990000.00, 47980000.00, NOW(), NOW()),
(13, 8, 14, 1, 6990000.00, 6990000.00, NOW(), NOW()),
(14, 8, 15, 2, 6990000.00, 13980000.00, NOW(), NOW());

-- Chèn dữ liệu vào bảng users (cho hệ thống đăng nhập)
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'System Admin', 'admin@phonestore.com', NOW(), '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NOW(), NOW()),
(2, 'Manager User', 'manager@phonestore.com', NOW(), '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NOW(), NOW());
-- Thêm tài khoản admin để đăng nhập (mật khẩu: "password")
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(3, 'Super Admin', 'superadmin@phonestore.com', NOW(), '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NOW(), NOW());

-- Thêm nhân viên admin tương ứng
INSERT INTO `employees` (`id`, `username`, `password`, `full_name`, `avartar`, `phone`, `role`, `Position`, `salary`, `hire_date`, `email`, `status`, `created_at`, `updated_at`) VALUES
(7, 'admin02', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Nguyễn Quản Trị', 'avatar7.jpg', '0907777777', 'admin', 'staff', 30000000.00, '2024-02-15', 'admin02@store.com', 'active', NOW(), NOW());