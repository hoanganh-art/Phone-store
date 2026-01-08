-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th1 08, 2026 lúc 03:01 AM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `phone_store`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `brand_name` varchar(50) NOT NULL,
  `country` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `brands`
--

INSERT INTO `brands` (`id`, `brand_name`, `country`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Apple', 'USA', 'Hệ sinh thái iOS, macOS cao cấp', '2026-01-06 02:16:12', '2026-01-06 02:16:12'),
(2, 'Samsung', 'South Korea', 'Dẫn đầu công nghệ màn hình và Android', '2026-01-06 02:16:12', '2026-01-06 02:16:12'),
(3, 'Xiaomi', 'China', 'Cấu hình cao, giá rẻ, hệ sinh thái Mi Home', '2026-01-06 02:16:12', '2026-01-06 02:16:12'),
(4, 'Oppo', 'China', 'Chuyên gia selfie, thiết kế thời trang', '2026-01-06 02:16:12', '2026-01-06 02:16:12'),
(5, 'Sony', 'Japan', 'Công nghệ âm thanh và camera chuyên nghiệp', '2026-01-06 02:16:12', '2026-01-06 02:16:12'),
(6, 'Asus', 'Taiwan', 'Dòng ROG Phone gaming và Laptop văn phòng', '2026-01-06 02:16:12', '2026-01-06 02:16:12'),
(7, 'Google', 'USA', 'Điện thoại Pixel thuần Android', '2026-01-06 02:16:12', '2026-01-06 02:16:12');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `gender` enum('Nam','Nữ','Khác') DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `membership` enum('Đồng','Bạc','Vàng','VIP') NOT NULL DEFAULT 'Đồng',
  `points` int(11) NOT NULL DEFAULT 0,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `customers`
--

INSERT INTO `customers` (`id`, `full_name`, `phone`, `date_of_birth`, `email`, `gender`, `address`, `membership`, `points`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Phạm Văn Long', '0901000001', NULL, 'long.pham@gmail.com', 'Nam', 'Hoàn Kiếm, Hà Nội', 'VIP', 5000, NULL, '2026-01-06 02:16:22', '2026-01-06 02:16:22'),
(2, 'Trần Thu Hà', '0902000002', NULL, 'ha.tran@yahoo.com', 'Nữ', 'Quận 1, TP.HCM', 'Vàng', 2500, NULL, '2026-01-06 02:16:22', '2026-01-06 02:16:22'),
(3, 'Lê Minh Trí', '0903000003', NULL, 'tri.le@outlook.com', 'Nam', 'Hải Châu, Đà Nẵng', 'Bạc', 800, NULL, '2026-01-06 02:16:22', '2026-01-06 02:16:22'),
(4, 'Nguyễn Thị Dung', '0904000004', NULL, 'dung.nt@gmail.com', 'Nữ', 'Cầu Giấy, Hà Nội', 'Đồng', 200, NULL, '2026-01-06 02:16:22', '2026-01-06 02:16:22'),
(5, 'Hoàng Văn Nam', '0905000005', NULL, 'nam.hoang@gmail.com', 'Nam', 'Thủ Đức, TP.HCM', 'Đồng', 150, NULL, '2026-01-06 02:16:22', '2026-01-06 02:16:22'),
(6, 'Đỗ Thị Mai', '0906000006', NULL, 'mai.do@gmail.com', 'Nữ', 'Ninh Kiều, Cần Thơ', 'Vàng', 1800, NULL, '2026-01-06 02:16:22', '2026-01-06 02:16:22'),
(7, 'Vũ Văn Kỷ', '0907000007', NULL, 'ky.vu@gmail.com', 'Nam', 'Biên Hòa, Đồng Nai', 'VIP', 3200, NULL, '2026-01-06 02:16:22', '2026-01-06 02:16:22'),
(8, 'Ngô Bích Thủy', '0908000008', NULL, 'thuy.ngo@gmail.com', 'Nữ', 'Vũng Tàu', 'Bạc', 600, NULL, '2026-01-06 02:16:22', '2026-01-06 02:16:22'),
(9, 'Lý Văn Phúc', '0909000009', NULL, 'phuc.ly@gmail.com', 'Nam', 'Nha Trang', 'Đồng', 50, NULL, '2026-01-06 02:16:22', '2026-01-06 02:16:22'),
(10, 'Trương Mỹ Lan', '0910000010', NULL, 'lan.truong@gmail.com', 'Nữ', 'Đà Lạt', 'Đồng', 0, NULL, '2026-01-06 02:16:22', '2026-01-06 02:16:22'),
(11, 'Khách Vãng Lai 1', '0991112223', NULL, 'vanglai1@store.com', 'Khác', 'Tại cửa hàng', 'Đồng', 0, NULL, '2026-01-06 02:16:22', '2026-01-06 02:16:22'),
(12, 'Khách Vãng Lai 2', '0992223334', NULL, 'vanglai2@store.com', 'Nam', 'Tại cửa hàng', 'Đồng', 0, NULL, '2026-01-06 02:16:22', '2026-01-06 02:16:22'),
(13, 'Bùi Tiến Dũng', '0913334445', NULL, 'dung.bui@gmail.com', 'Nam', 'Thanh Xuân, Hà Nội', 'Bạc', 550, NULL, '2026-01-06 02:16:22', '2026-01-06 02:16:22'),
(14, 'Phan Thị Mơ', '0914445556', NULL, 'mo.phan@gmail.com', 'Nữ', 'Long Biên, Hà Nội', 'Vàng', 1200, NULL, '2026-01-06 02:16:22', '2026-01-06 02:16:22'),
(15, 'Cao Thái Sơn', '0915556667', NULL, 'son.cao@gmail.com', 'Nam', 'Quận 7, TP.HCM', 'VIP', 4000, NULL, '2026-01-06 02:16:22', '2026-01-06 02:16:22');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `employees`
--

CREATE TABLE `employees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `role` enum('admin','employee') NOT NULL,
  `position` enum('staff','Sell','Warehouse employee','Accountant') NOT NULL,
  `salary` decimal(12,2) NOT NULL,
  `hire_date` date NOT NULL,
  `email` varchar(100) NOT NULL,
  `status` enum('active','inactive','take a break') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `employees`
--

INSERT INTO `employees` (`id`, `username`, `password`, `full_name`, `avatar`, `phone`, `role`, `position`, `salary`, `hire_date`, `email`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'admin', '$2y$10$bufferhashfor123456...', 'Quản Trị Viên Hệ Thống', NULL, NULL, 'admin', 'staff', 35000000.00, '2023-01-01', 'admin@store.com', 'active', '2026-01-06 02:16:17', '2026-01-06 02:16:17', NULL),
(2, 'sale_hoa', '$2y$10$bufferhashfor123456...', 'Nguyễn Thị Hoa', NULL, NULL, 'employee', 'Sell', 12000000.00, '2023-06-15', 'hoa.sale@store.com', 'active', '2026-01-06 02:16:17', '2026-01-06 02:16:17', NULL),
(3, 'sale_tuan', '$2y$10$bufferhashfor123456...', 'Trần Văn Tuấn', NULL, NULL, 'employee', 'Sell', 12500000.00, '2023-08-20', 'tuan.sale@store.com', 'active', '2026-01-06 02:16:17', '2026-01-06 02:16:17', NULL),
(4, 'kho_minh', '$2y$10$bufferhashfor123456...', 'Lê Văn Minh', NULL, NULL, 'employee', 'Warehouse employee', 11000000.00, '2023-02-10', 'minh.kho@store.com', 'active', '2026-01-06 02:16:17', '2026-01-06 02:16:17', NULL),
(5, 'kt_lan', '$2y$10$bufferhashfor123456...', 'Phạm Thị Lan', NULL, NULL, 'employee', 'Accountant', 16000000.00, '2023-01-05', 'lan.ketoan@store.com', 'active', '2026-01-06 02:16:17', '2026-01-06 02:16:17', NULL),
(6, 'sale_ngoc', '$2y$10$bufferhashfor123456...', 'Hoàng Bích Ngọc', NULL, NULL, 'employee', 'Sell', 10000000.00, '2024-01-10', 'ngoc.hb@store.com', 'active', '2026-01-06 02:16:17', '2026-01-06 02:16:17', NULL),
(7, 'kho_hai', '$2y$10$bufferhashfor123456...', 'Vũ Đức Hải', NULL, NULL, 'employee', 'Warehouse employee', 10500000.00, '2024-02-01', 'hai.kho@store.com', 'active', '2026-01-06 02:16:17', '2026-01-06 02:16:17', NULL),
(8, 'admin_phu', '$2y$10$bufferhashfor123456...', 'Lê Hoàng Phú', NULL, NULL, 'admin', 'staff', 25000000.00, '2023-10-10', 'phu.admin@store.com', 'active', '2026-01-06 02:16:17', '2026-01-06 02:16:17', NULL),
(9, 'sale_tam', '$2y$10$bufferhashfor123456...', 'Trương Thanh Tâm', NULL, NULL, 'employee', 'Sell', 9000000.00, '2024-03-01', 'tam.sale@store.com', 'take a break', '2026-01-06 02:16:17', '2026-01-06 02:16:17', NULL),
(10, 'kt_hung', '$2y$10$bufferhashfor123456...', 'Nguyễn Quốc Hưng', NULL, NULL, 'employee', 'Accountant', 15500000.00, '2023-05-05', 'hung.kt@store.com', 'inactive', '2026-01-06 02:16:17', '2026-01-06 02:16:17', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `imports`
--

CREATE TABLE `imports` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `supplier_id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `import_date` date NOT NULL,
  `total_amount` decimal(12,2) NOT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `imports`
--

INSERT INTO `imports` (`id`, `supplier_id`, `employee_id`, `import_date`, `total_amount`, `notes`, `created_at`, `updated_at`) VALUES
(1, 1, 4, '2025-10-01', 500000000.00, 'Nhập lô iPhone 15 đầu tiên', '2026-01-06 02:16:29', '2026-01-06 02:16:29'),
(2, 2, 4, '2025-10-05', 300000000.00, 'Nhập Xiaomi và Redmi', '2026-01-06 02:16:29', '2026-01-06 02:16:29'),
(3, 3, 7, '2025-10-15', 250000000.00, 'Nhập Samsung Galaxy dòng A', '2026-01-06 02:16:29', '2026-01-06 02:16:29'),
(4, 1, 4, '2025-11-01', 150000000.00, 'Nhập bổ sung MacBook', '2026-01-06 02:16:29', '2026-01-06 02:16:29'),
(5, 5, 7, '2025-11-10', 80000000.00, 'Nhập phụ kiện các loại', '2026-01-06 02:16:29', '2026-01-06 02:16:29'),
(6, 4, 4, '2025-11-20', 400000000.00, 'Nhập Oppo Reno series', '2026-01-06 02:16:29', '2026-01-06 02:16:29'),
(7, 1, 7, '2025-12-01', 600000000.00, 'Nhập hàng chuẩn bị Tết Dương', '2026-01-06 02:16:29', '2026-01-06 02:16:29'),
(8, 2, 4, '2025-12-05', 120000000.00, 'Nhập thêm Xiaomi 14', '2026-01-06 02:16:29', '2026-01-06 02:16:29'),
(9, 3, 7, '2025-12-15', 350000000.00, 'Nhập S24 Ultra lô 1', '2026-01-06 02:16:29', '2026-01-06 02:16:29'),
(10, 1, 4, '2026-01-02', 200000000.00, 'Nhập hàng đầu năm', '2026-01-06 02:16:29', '2026-01-06 02:16:29');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `import_details`
--

CREATE TABLE `import_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `import_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `const_price` decimal(12,2) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `import_details`
--

INSERT INTO `import_details` (`id`, `import_id`, `product_id`, `quantity`, `const_price`, `amount`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 10, 30000000.00, 300000000.00, '2026-01-06 02:16:31', '2026-01-06 02:16:31'),
(2, 1, 2, 9, 22000000.00, 198000000.00, '2026-01-06 02:16:31', '2026-01-06 02:16:31'),
(3, 2, 10, 10, 18000000.00, 180000000.00, '2026-01-06 02:16:31', '2026-01-06 02:16:31'),
(4, 2, 11, 20, 6000000.00, 120000000.00, '2026-01-06 02:16:31', '2026-01-06 02:16:31'),
(5, 3, 8, 30, 8000000.00, 240000000.00, '2026-01-06 02:16:31', '2026-01-06 02:16:31'),
(6, 4, 3, 6, 24000000.00, 144000000.00, '2026-01-06 02:16:31', '2026-01-06 02:16:31'),
(7, 5, 5, 10, 4500000.00, 45000000.00, '2026-01-06 02:16:31', '2026-01-06 02:16:31'),
(8, 5, 12, 50, 600000.00, 30000000.00, '2026-01-06 02:16:31', '2026-01-06 02:16:31'),
(9, 6, 14, 40, 7000000.00, 280000000.00, '2026-01-06 02:16:31', '2026-01-06 02:16:31'),
(10, 6, 13, 6, 19000000.00, 114000000.00, '2026-01-06 02:16:31', '2026-01-06 02:16:31'),
(11, 7, 1, 10, 30000000.00, 300000000.00, '2026-01-06 02:16:31', '2026-01-06 02:16:31'),
(12, 7, 6, 9, 33000000.00, 297000000.00, '2026-01-06 02:16:31', '2026-01-06 02:16:31'),
(13, 8, 10, 6, 18000000.00, 108000000.00, '2026-01-06 02:16:31', '2026-01-06 02:16:31'),
(14, 9, 6, 10, 33000000.00, 330000000.00, '2026-01-06 02:16:31', '2026-01-06 02:16:31'),
(15, 10, 4, 16, 12500000.00, 200000000.00, '2026-01-06 02:16:31', '2026-01-06 02:16:31');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `inventory_details`
--

CREATE TABLE `inventory_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `warehouse_location_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `batch_number` varchar(100) DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `manufacture_date` date DEFAULT NULL,
  `serial_numbers` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`serial_numbers`)),
  `cost_price` decimal(12,2) NOT NULL DEFAULT 0.00,
  `stock_status` enum('available','reserved','damaged','expired') NOT NULL DEFAULT 'available',
  `last_counted_date` date DEFAULT NULL,
  `reorder_level` int(11) NOT NULL DEFAULT 0,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `invoices`
--

CREATE TABLE `invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `invoice_date` date NOT NULL,
  `subtotal` decimal(12,2) NOT NULL,
  `discount` decimal(12,2) NOT NULL,
  `total_amount` decimal(12,2) NOT NULL,
  `payment_method` enum('cash','credit_card','bank_transfer') NOT NULL,
  `status` enum('paid','unpaid','pending','shipping','completed','cancelled','processing') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `invoices`
--

INSERT INTO `invoices` (`id`, `customer_id`, `employee_id`, `invoice_date`, `subtotal`, `discount`, `total_amount`, `payment_method`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 2, '2025-12-01', 33990000.00, 500000.00, 33490000.00, 'credit_card', 'completed', '2026-01-06 02:16:33', '2026-01-06 02:16:33'),
(2, 2, 3, '2025-12-02', 9990000.00, 0.00, 9990000.00, 'cash', 'completed', '2026-01-06 02:16:33', '2026-01-06 02:16:33'),
(3, 3, 2, '2025-12-05', 20990000.00, 200000.00, 20790000.00, 'bank_transfer', 'completed', '2026-01-06 02:16:33', '2026-01-06 02:16:33'),
(4, 4, 6, '2025-12-10', 7990000.00, 0.00, 7990000.00, 'cash', 'completed', '2026-01-06 02:16:33', '2026-01-06 02:16:33'),
(5, 5, 2, '2025-12-15', 5990000.00, 0.00, 5990000.00, 'cash', 'completed', '2026-01-06 02:16:33', '2026-01-06 02:16:33'),
(6, 6, 3, '2025-12-20', 36990000.00, 1000000.00, 35990000.00, 'credit_card', 'completed', '2026-01-06 02:16:33', '2026-01-06 02:16:33'),
(7, 7, 6, '2025-12-24', 28990000.00, 500000.00, 28490000.00, 'bank_transfer', 'shipping', '2026-01-06 02:16:33', '2026-01-06 02:16:33'),
(8, 8, 2, '2025-12-25', 8990000.00, 100000.00, 8890000.00, 'cash', 'completed', '2026-01-06 02:16:33', '2026-01-06 02:16:33'),
(9, 1, 3, '2025-12-30', 26990000.00, 1000000.00, 25990000.00, 'credit_card', 'completed', '2026-01-06 02:16:33', '2026-01-06 02:16:33'),
(10, 9, 6, '2026-01-01', 33990000.00, 0.00, 33990000.00, 'bank_transfer', 'pending', '2026-01-06 02:16:33', '2026-01-06 02:16:33'),
(11, 10, 2, '2026-01-02', 7990000.00, 0.00, 7990000.00, 'cash', 'cancelled', '2026-01-06 02:16:33', '2026-01-06 02:16:33'),
(12, 11, 3, '2026-01-03', 890000.00, 0.00, 890000.00, 'cash', 'completed', '2026-01-06 02:16:33', '2026-01-06 02:16:33'),
(13, 12, 6, '2026-01-04', 5990000.00, 0.00, 5990000.00, 'cash', 'processing', '2026-01-06 02:16:33', '2026-01-06 02:16:33'),
(14, 15, 2, '2026-01-05', 73980000.00, 2000000.00, 71980000.00, 'bank_transfer', 'completed', '2026-01-06 02:16:33', '2026-01-06 02:16:33'),
(15, 14, 3, '2026-01-06', 14990000.00, 300000.00, 14690000.00, 'credit_card', 'completed', '2026-01-06 02:16:33', '2026-01-05 19:30:01');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `invoice_details`
--

CREATE TABLE `invoice_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit_price` decimal(12,2) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `invoice_details`
--

INSERT INTO `invoice_details` (`id`, `invoice_id`, `product_id`, `quantity`, `unit_price`, `amount`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 33990000.00, 33990000.00, '2026-01-06 02:16:35', '2026-01-06 02:16:35'),
(2, 2, 8, 1, 9990000.00, 9990000.00, '2026-01-06 02:16:35', '2026-01-06 02:16:35'),
(3, 3, 10, 1, 20990000.00, 20990000.00, '2026-01-06 02:16:35', '2026-01-06 02:16:35'),
(4, 4, 11, 1, 7990000.00, 7990000.00, '2026-01-06 02:16:35', '2026-01-06 02:16:35'),
(5, 5, 5, 1, 5990000.00, 5990000.00, '2026-01-06 02:16:35', '2026-01-06 02:16:35'),
(6, 6, 6, 1, 36990000.00, 36990000.00, '2026-01-06 02:16:35', '2026-01-06 02:16:35'),
(7, 7, 17, 1, 28990000.00, 28990000.00, '2026-01-06 02:16:35', '2026-01-06 02:16:35'),
(8, 8, 14, 1, 8990000.00, 8990000.00, '2026-01-06 02:16:35', '2026-01-06 02:16:35'),
(9, 9, 3, 1, 26990000.00, 26990000.00, '2026-01-06 02:16:35', '2026-01-06 02:16:35'),
(10, 10, 1, 1, 33990000.00, 33990000.00, '2026-01-06 02:16:35', '2026-01-06 02:16:35'),
(11, 11, 11, 1, 7990000.00, 7990000.00, '2026-01-06 02:16:35', '2026-01-06 02:16:35'),
(12, 12, 12, 1, 890000.00, 890000.00, '2026-01-06 02:16:35', '2026-01-06 02:16:35'),
(13, 13, 5, 1, 5990000.00, 5990000.00, '2026-01-06 02:16:35', '2026-01-06 02:16:35'),
(14, 14, 6, 1, 36990000.00, 36990000.00, '2026-01-06 02:16:35', '2026-01-06 02:16:35'),
(15, 14, 1, 1, 33990000.00, 33990000.00, '2026-01-06 02:16:35', '2026-01-06 02:16:35'),
(16, 15, 4, 1, 14990000.00, 14990000.00, '2026-01-06 02:16:35', '2026-01-06 02:16:35');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000001_create_cache_table', 1),
(2, '0001_01_01_000002_create_jobs_table', 1),
(3, '2025_12_02_040905_create_brands_table', 1),
(4, '2025_12_02_041332_create_products_table', 1),
(5, '2025_12_03_033836_create_customers_table', 1),
(6, '2025_12_05_014850_create_employees_table', 1),
(7, '2025_12_05_020647_create_invoices_table', 1),
(8, '2025_12_05_022835_create_invoice_details_table', 1),
(9, '2025_12_05_022851_create_suppliers_table', 1),
(10, '2025_12_05_022902_create_imports_table', 1),
(11, '2025_12_05_022916_create_import_details_table', 1),
(12, '2025_12_07_085439_create_sessions_table', 1),
(13, '2025_12_13_000000_create_users_table', 1),
(14, '2026_01_08_014525_create_warehouses_table', 2),
(15, '2026_01_08_014947_create_warehouse_locations_table', 2),
(16, '2026_01_08_015017_create_inventory_details_table', 2),
(17, '2026_01_08_015055_create_stock_transactions_table', 2),
(18, '2026_01_08_015129_create_stock_takes_table', 2),
(19, '2026_01_08_015155_create_stock_take_items_table', 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `sku` varchar(50) NOT NULL,
  `brand_id` bigint(20) UNSIGNED NOT NULL,
  `category` varchar(50) NOT NULL,
  `ram` varchar(20) DEFAULT NULL,
  `storage` varchar(20) DEFAULT NULL,
  `price` decimal(12,2) NOT NULL,
  `cost_price` decimal(12,2) NOT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  `status` enum('Available','Out of Stock','Discontinued') NOT NULL DEFAULT 'Available',
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `product_name`, `sku`, `brand_id`, `category`, `ram`, `storage`, `price`, `cost_price`, `stock`, `status`, `description`, `image`, `created_at`, `updated_at`) VALUES
(1, 'iPhone 15 Pro Max', 'IP15PM-256', 1, 'Smartphone', '8GB', '256GB', 33990000.00, 30000000.00, 25, 'Available', NULL, NULL, '2026-01-06 02:16:26', '2026-01-06 02:16:26'),
(2, 'iPhone 15 Plus', 'IP15P-128', 1, 'Smartphone', '6GB', '128GB', 24990000.00, 22000000.00, 40, 'Available', NULL, NULL, '2026-01-06 02:16:26', '2026-01-06 02:16:26'),
(3, 'MacBook Air M2', 'MBA-M2', 1, 'Laptop', '8GB', '256GB', 26990000.00, 24000000.00, 15, 'Available', NULL, NULL, '2026-01-06 02:16:26', '2026-01-06 02:16:26'),
(4, 'iPad Air 5', 'IPA5-64', 1, 'Tablet', '8GB', '64GB', 14990000.00, 12500000.00, 30, 'Available', NULL, NULL, '2026-01-06 02:16:26', '2026-01-06 02:16:26'),
(5, 'AirPods Pro 2', 'APP2', 1, 'Accessory', NULL, NULL, 5990000.00, 4500000.00, 100, 'Available', NULL, NULL, '2026-01-06 02:16:26', '2026-01-06 02:16:26'),
(6, 'Samsung Galaxy S24 Ultra', 'S24U-512', 2, 'Smartphone', '12GB', '512GB', 36990000.00, 33000000.00, 20, 'Available', NULL, NULL, '2026-01-06 02:16:26', '2026-01-06 02:16:26'),
(7, 'Samsung Galaxy Z Fold 5', 'ZFOLD5-256', 2, 'Smartphone', '12GB', '256GB', 39990000.00, 35000000.00, 10, 'Available', NULL, NULL, '2026-01-06 02:16:26', '2026-01-06 02:16:26'),
(8, 'Samsung Galaxy A55', 'A55-128', 2, 'Smartphone', '8GB', '128GB', 9990000.00, 8000000.00, 80, 'Available', NULL, NULL, '2026-01-06 02:16:26', '2026-01-06 02:16:26'),
(9, 'Galaxy Tab S9', 'TABS9', 2, 'Tablet', '8GB', '128GB', 19990000.00, 17000000.00, 15, 'Available', NULL, NULL, '2026-01-06 02:16:26', '2026-01-06 02:16:26'),
(10, 'Xiaomi 14', 'MI14', 3, 'Smartphone', '12GB', '256GB', 20990000.00, 18000000.00, 35, 'Available', NULL, NULL, '2026-01-06 02:16:26', '2026-01-06 02:16:26'),
(11, 'Redmi Note 13 Pro', 'RMN13P', 3, 'Smartphone', '8GB', '256GB', 7990000.00, 6000000.00, 120, 'Available', NULL, NULL, '2026-01-06 02:16:26', '2026-01-06 02:16:26'),
(12, 'Xiaomi Band 8', 'MIBAND8', 3, 'Accessory', NULL, NULL, 890000.00, 600000.00, 200, 'Available', NULL, NULL, '2026-01-06 02:16:26', '2026-01-06 02:16:26'),
(13, 'Oppo Find N3 Flip', 'OPFN3', 4, 'Smartphone', '12GB', '256GB', 22990000.00, 19000000.00, 18, 'Available', NULL, NULL, '2026-01-06 02:16:26', '2026-01-06 02:16:26'),
(14, 'Oppo Reno 11 F', 'OPR11F', 4, 'Smartphone', '8GB', '256GB', 8990000.00, 7000000.00, 50, 'Available', NULL, NULL, '2026-01-06 02:16:26', '2026-01-06 02:16:26'),
(15, 'Sony Xperia 1 V', 'XPERIA1V', 5, 'Smartphone', '12GB', '256GB', 29990000.00, 26000000.00, 5, 'Out of Stock', NULL, NULL, '2026-01-06 02:16:26', '2026-01-06 02:16:26'),
(16, 'Sony WH-1000XM5', 'WH1000XM5', 5, 'Accessory', NULL, NULL, 7990000.00, 6000000.00, 25, 'Available', NULL, NULL, '2026-01-06 02:16:26', '2026-01-06 02:16:26'),
(17, 'Asus ROG Phone 8', 'ROG8', 6, 'Smartphone', '16GB', '512GB', 28990000.00, 25000000.00, 10, 'Available', NULL, NULL, '2026-01-06 02:16:26', '2026-01-06 02:16:26'),
(18, 'Asus Zenbook 14', 'ZEN14', 6, 'Laptop', '16GB', '512GB', 24990000.00, 21000000.00, 12, 'Available', NULL, NULL, '2026-01-06 02:16:26', '2026-01-06 02:16:26'),
(19, 'Google Pixel 8 Pro', 'PIXEL8P', 7, 'Smartphone', '12GB', '128GB', 18990000.00, 16000000.00, 8, 'Available', NULL, NULL, '2026-01-06 02:16:26', '2026-01-06 02:16:26'),
(20, 'iPhone 13 Mini', 'IP13M', 1, 'Smartphone', '4GB', '128GB', 14000000.00, 12000000.00, 0, 'Discontinued', NULL, NULL, '2026-01-06 02:16:26', '2026-01-06 02:16:26');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `stock_takes`
--

CREATE TABLE `stock_takes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `stock_take_number` varchar(50) NOT NULL,
  `warehouse_id` bigint(20) UNSIGNED NOT NULL,
  `stock_take_date` date NOT NULL,
  `status` enum('pending','in_progress','completed','cancelled') NOT NULL DEFAULT 'pending',
  `type` enum('full','partial','cycle') NOT NULL DEFAULT 'full',
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `notes` text DEFAULT NULL,
  `total_variance` decimal(12,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `stock_take_items`
--

CREATE TABLE `stock_take_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `stock_take_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `warehouse_location_id` bigint(20) UNSIGNED NOT NULL,
  `system_quantity` int(11) NOT NULL DEFAULT 0,
  `actual_quantity` int(11) NOT NULL DEFAULT 0,
  `variance` int(11) NOT NULL,
  `unit_cost` decimal(12,2) NOT NULL DEFAULT 0.00,
  `variance_value` decimal(12,2) NOT NULL DEFAULT 0.00,
  `status` enum('matched','excess','shortage','damaged') NOT NULL DEFAULT 'matched',
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `stock_transactions`
--

CREATE TABLE `stock_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `warehouse_location_id` bigint(20) UNSIGNED DEFAULT NULL,
  `transaction_type` enum('receive','adjust','transfer','return','sale','damage','expired') NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit_price` decimal(12,2) DEFAULT NULL,
  `total_value` decimal(12,2) DEFAULT NULL,
  `reference_number` varchar(100) DEFAULT NULL,
  `reference_id` bigint(20) UNSIGNED DEFAULT NULL,
  `reference_type` varchar(50) DEFAULT NULL,
  `from_warehouse_location_id` bigint(20) UNSIGNED DEFAULT NULL,
  `to_warehouse_location_id` bigint(20) UNSIGNED DEFAULT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `supplier_id` bigint(20) UNSIGNED DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`metadata`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `suppliers`
--

CREATE TABLE `suppliers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `supplier_code` varchar(50) NOT NULL,
  `supplier_name` varchar(255) NOT NULL,
  `tax_code` varchar(50) DEFAULT NULL,
  `contact_name` varchar(255) NOT NULL,
  `representative_name` varchar(255) DEFAULT NULL,
  `company_phone` varchar(15) NOT NULL,
  `representative_phone` varchar(15) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `website` varchar(255) DEFAULT NULL,
  `product_types` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`product_types`)),
  `rating` decimal(2,1) NOT NULL DEFAULT 0.0,
  `payment_terms` text DEFAULT NULL,
  `logo_url` varchar(500) DEFAULT NULL,
  `status` enum('active','inactive','pending') NOT NULL DEFAULT 'pending',
  `cooperation_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `suppliers`
--

INSERT INTO `suppliers` (`id`, `supplier_code`, `supplier_name`, `tax_code`, `contact_name`, `representative_name`, `company_phone`, `representative_phone`, `email`, `address`, `website`, `product_types`, `rating`, `payment_terms`, `logo_url`, `status`, `cooperation_date`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'NCC_FPT', 'FPT Synnex', '356724575', 'Nguyễn Văn Hùng', 'Nguyễn Văn Hùng', '02473008888', '8976456246', 'hung.nv@fpt.com.vn', 'Khu CNC Hòa Lạc, Hà Nội', NULL, '\"[\\\"tablet\\\",\\\"accessory\\\",\\\"watch\\\"]\"', 3.0, NULL, NULL, 'active', '2026-01-08', '2026-01-06 02:16:14', '2026-01-07 17:46:40', NULL),
(2, 'NCC_DGW', 'Digiworld', '6757357357', 'Trần Thị Mai', 'Trần Thị Mai', '02839290059', '8976456456', 'mai.tt@dgw.com.vn', 'Quận 3, TP.HCM', NULL, '\"[\\\"accessory\\\",\\\"watch\\\",\\\"battery\\\"]\"', 3.0, NULL, NULL, 'active', '2026-01-06', '2026-01-06 02:16:14', '2026-01-05 20:08:36', NULL),
(3, 'NCC_VTL', 'Viettel Distribution', '5678356783', 'Lê Thanh Sơn', 'Lê Thanh Sơn', '02462660447', '464567345', 'son.lt@viettel.com.vn', 'Tòa nhà Viettel, Cầu Giấy', NULL, '\"[\\\"accessory\\\",\\\"watch\\\",\\\"laptop\\\"]\"', 3.0, NULL, NULL, 'pending', '2026-01-06', '2026-01-06 02:16:14', '2026-01-05 19:25:26', NULL),
(4, 'NCC_PET', 'PetroSetco', '5473356754', 'Phạm Ngọc Châu', 'Phạm Ngọc Châu', '02839117777', '89764562436', 'chau.pn@petro.com.vn', 'Quận 1, TP.HCM', NULL, '\"[\\\"tablet\\\",\\\"accessory\\\"]\"', 3.0, NULL, NULL, 'inactive', '2026-01-06', '2026-01-06 02:16:14', '2026-01-05 19:24:40', NULL),
(5, 'NCC_MBF', 'Mobifone Global', '76247862454', 'Đỗ Văn Đạt', 'Đỗ Văn Đạt', '0909090909', '876142354', 'dat.dv@mobifone.vn', 'Đống Đa, Hà Nội', NULL, '\"[\\\"smartphone\\\",\\\"tablet\\\",\\\"accessory\\\",\\\"watch\\\",\\\"laptop\\\"]\"', 3.0, NULL, NULL, 'active', '2026-01-06', '2026-01-06 02:16:14', '2026-01-05 20:13:27', NULL),
(6, 'NCC_PETs', 'Mobifone Global', '76247862454', 'Lê Thanh Nghị', 'Lê Thanh Nghị', '09090987609', '8974562436', 'dat.dsv@mobifone.vn', '46qw46yregrf', NULL, '\"[\\\"smartphone\\\",\\\"tablet\\\"]\"', 4.0, NULL, NULL, 'active', '2026-01-06', '2026-01-05 19:28:31', '2026-01-05 19:28:31', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `warehouses`
--

CREATE TABLE `warehouses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `warehouse_code` varchar(50) NOT NULL,
  `warehouse_name` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `manager_id` bigint(20) UNSIGNED DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `capacity` int(11) NOT NULL DEFAULT 0,
  `current_occupancy` int(11) NOT NULL DEFAULT 0,
  `status` enum('active','inactive','maintenance') NOT NULL DEFAULT 'active',
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `warehouse_locations`
--

CREATE TABLE `warehouse_locations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `warehouse_id` bigint(20) UNSIGNED NOT NULL,
  `location_code` varchar(50) NOT NULL,
  `location_name` varchar(255) NOT NULL,
  `zone` varchar(50) DEFAULT NULL,
  `aisle` varchar(20) DEFAULT NULL,
  `rack` varchar(20) DEFAULT NULL,
  `shelf` varchar(20) DEFAULT NULL,
  `max_capacity` int(11) NOT NULL DEFAULT 0,
  `current_quantity` int(11) NOT NULL DEFAULT 0,
  `status` enum('available','full','restricted') NOT NULL DEFAULT 'available',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Chỉ mục cho bảng `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Chỉ mục cho bảng `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customers_phone_unique` (`phone`),
  ADD UNIQUE KEY `customers_email_unique` (`email`);

--
-- Chỉ mục cho bảng `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Chỉ mục cho bảng `imports`
--
ALTER TABLE `imports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `imports_supplier_id_foreign` (`supplier_id`),
  ADD KEY `imports_employee_id_foreign` (`employee_id`);

--
-- Chỉ mục cho bảng `import_details`
--
ALTER TABLE `import_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `import_details_import_id_foreign` (`import_id`),
  ADD KEY `import_details_product_id_foreign` (`product_id`);

--
-- Chỉ mục cho bảng `inventory_details`
--
ALTER TABLE `inventory_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `inventory_details_warehouse_location_id_foreign` (`warehouse_location_id`),
  ADD KEY `inventory_details_product_id_warehouse_location_id_index` (`product_id`,`warehouse_location_id`),
  ADD KEY `inventory_details_batch_number_index` (`batch_number`);

--
-- Chỉ mục cho bảng `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoices_customer_id_foreign` (`customer_id`),
  ADD KEY `invoices_employee_id_foreign` (`employee_id`);

--
-- Chỉ mục cho bảng `invoice_details`
--
ALTER TABLE `invoice_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_details_invoice_id_foreign` (`invoice_id`),
  ADD KEY `invoice_details_product_id_foreign` (`product_id`);

--
-- Chỉ mục cho bảng `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Chỉ mục cho bảng `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_sku_unique` (`sku`),
  ADD KEY `products_brand_id_foreign` (`brand_id`);

--
-- Chỉ mục cho bảng `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Chỉ mục cho bảng `stock_takes`
--
ALTER TABLE `stock_takes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `stock_takes_stock_take_number_unique` (`stock_take_number`),
  ADD KEY `stock_takes_warehouse_id_foreign` (`warehouse_id`),
  ADD KEY `stock_takes_employee_id_foreign` (`employee_id`);

--
-- Chỉ mục cho bảng `stock_take_items`
--
ALTER TABLE `stock_take_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stock_take_items_product_id_foreign` (`product_id`),
  ADD KEY `stock_take_items_warehouse_location_id_foreign` (`warehouse_location_id`),
  ADD KEY `stock_take_items_stock_take_id_product_id_index` (`stock_take_id`,`product_id`);

--
-- Chỉ mục cho bảng `stock_transactions`
--
ALTER TABLE `stock_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stock_transactions_warehouse_location_id_foreign` (`warehouse_location_id`),
  ADD KEY `stock_transactions_from_warehouse_location_id_foreign` (`from_warehouse_location_id`),
  ADD KEY `stock_transactions_to_warehouse_location_id_foreign` (`to_warehouse_location_id`),
  ADD KEY `stock_transactions_employee_id_foreign` (`employee_id`),
  ADD KEY `stock_transactions_customer_id_foreign` (`customer_id`),
  ADD KEY `stock_transactions_supplier_id_foreign` (`supplier_id`),
  ADD KEY `stock_transactions_product_id_created_at_index` (`product_id`,`created_at`),
  ADD KEY `stock_transactions_transaction_type_created_at_index` (`transaction_type`,`created_at`),
  ADD KEY `stock_transactions_reference_number_index` (`reference_number`);

--
-- Chỉ mục cho bảng `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `suppliers_supplier_code_unique` (`supplier_code`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Chỉ mục cho bảng `warehouses`
--
ALTER TABLE `warehouses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `warehouses_warehouse_code_unique` (`warehouse_code`),
  ADD KEY `warehouses_manager_id_foreign` (`manager_id`);

--
-- Chỉ mục cho bảng `warehouse_locations`
--
ALTER TABLE `warehouse_locations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `warehouse_locations_warehouse_id_location_code_unique` (`warehouse_id`,`location_code`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `employees`
--
ALTER TABLE `employees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `imports`
--
ALTER TABLE `imports`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `import_details`
--
ALTER TABLE `import_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `inventory_details`
--
ALTER TABLE `inventory_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `invoice_details`
--
ALTER TABLE `invoice_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `stock_takes`
--
ALTER TABLE `stock_takes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `stock_take_items`
--
ALTER TABLE `stock_take_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `stock_transactions`
--
ALTER TABLE `stock_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `warehouses`
--
ALTER TABLE `warehouses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `warehouse_locations`
--
ALTER TABLE `warehouse_locations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `imports`
--
ALTER TABLE `imports`
  ADD CONSTRAINT `imports_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  ADD CONSTRAINT `imports_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`);

--
-- Các ràng buộc cho bảng `import_details`
--
ALTER TABLE `import_details`
  ADD CONSTRAINT `import_details_import_id_foreign` FOREIGN KEY (`import_id`) REFERENCES `imports` (`id`),
  ADD CONSTRAINT `import_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Các ràng buộc cho bảng `inventory_details`
--
ALTER TABLE `inventory_details`
  ADD CONSTRAINT `inventory_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `inventory_details_warehouse_location_id_foreign` FOREIGN KEY (`warehouse_location_id`) REFERENCES `warehouse_locations` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  ADD CONSTRAINT `invoices_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`);

--
-- Các ràng buộc cho bảng `invoice_details`
--
ALTER TABLE `invoice_details`
  ADD CONSTRAINT `invoice_details_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`),
  ADD CONSTRAINT `invoice_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `stock_takes`
--
ALTER TABLE `stock_takes`
  ADD CONSTRAINT `stock_takes_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `stock_takes_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `stock_take_items`
--
ALTER TABLE `stock_take_items`
  ADD CONSTRAINT `stock_take_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `stock_take_items_stock_take_id_foreign` FOREIGN KEY (`stock_take_id`) REFERENCES `stock_takes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `stock_take_items_warehouse_location_id_foreign` FOREIGN KEY (`warehouse_location_id`) REFERENCES `warehouse_locations` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `stock_transactions`
--
ALTER TABLE `stock_transactions`
  ADD CONSTRAINT `stock_transactions_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `stock_transactions_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `stock_transactions_from_warehouse_location_id_foreign` FOREIGN KEY (`from_warehouse_location_id`) REFERENCES `warehouse_locations` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `stock_transactions_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `stock_transactions_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `stock_transactions_to_warehouse_location_id_foreign` FOREIGN KEY (`to_warehouse_location_id`) REFERENCES `warehouse_locations` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `stock_transactions_warehouse_location_id_foreign` FOREIGN KEY (`warehouse_location_id`) REFERENCES `warehouse_locations` (`id`) ON DELETE SET NULL;

--
-- Các ràng buộc cho bảng `warehouses`
--
ALTER TABLE `warehouses`
  ADD CONSTRAINT `warehouses_manager_id_foreign` FOREIGN KEY (`manager_id`) REFERENCES `employees` (`id`) ON DELETE SET NULL;

--
-- Các ràng buộc cho bảng `warehouse_locations`
--
ALTER TABLE `warehouse_locations`
  ADD CONSTRAINT `warehouse_locations_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
