-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: phone_store
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brands` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(50) NOT NULL,
  `country` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands`
--

/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
INSERT INTO `brands` VALUES (1,'Apple','USA','Hệ sinh thái iOS, macOS cao cấp','2026-01-05 19:16:12','2026-01-05 19:16:12'),(2,'Samsung','South Korea','Dẫn đầu công nghệ màn hình và Android','2026-01-05 19:16:12','2026-01-05 19:16:12'),(3,'Xiaomi','China','Cấu hình cao, giá rẻ, hệ sinh thái Mi Home','2026-01-05 19:16:12','2026-01-05 19:16:12'),(4,'Oppo','China','Chuyên gia selfie, thiết kế thời trang','2026-01-05 19:16:12','2026-01-05 19:16:12'),(5,'Sony','Japan','Công nghệ âm thanh và camera chuyên nghiệp','2026-01-05 19:16:12','2026-01-05 19:16:12'),(6,'Asus','Taiwan','Dòng ROG Phone gaming và Laptop văn phòng','2026-01-05 19:16:12','2026-01-05 19:16:12'),(7,'Google','USA','Điện thoại Pixel thuần Android','2026-01-05 19:16:12','2026-01-05 19:16:12');
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
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
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customers_phone_unique` (`phone`),
  UNIQUE KEY `customers_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Phạm Văn Long','0901000001',NULL,'long.pham@gmail.com','Nam','Hoàn Kiếm, Hà Nội','VIP',5000,NULL,'2026-01-05 19:16:22','2026-01-05 19:16:22'),(2,'Trần Thu Hà','0902000002',NULL,'ha.tran@yahoo.com','Nữ','Quận 1, TP.HCM','Vàng',2500,NULL,'2026-01-05 19:16:22','2026-01-05 19:16:22'),(3,'Lê Minh Trí','0903000003',NULL,'tri.le@outlook.com','Nam','Hải Châu, Đà Nẵng','Bạc',800,NULL,'2026-01-05 19:16:22','2026-01-05 19:16:22'),(4,'Nguyễn Thị Dung','0904000004',NULL,'dung.nt@gmail.com','Nữ','Cầu Giấy, Hà Nội','Đồng',200,NULL,'2026-01-05 19:16:22','2026-01-05 19:16:22'),(5,'Hoàng Văn Nam','0905000005',NULL,'nam.hoang@gmail.com','Nam','Thủ Đức, TP.HCM','Đồng',150,NULL,'2026-01-05 19:16:22','2026-01-05 19:16:22'),(6,'Đỗ Thị Mai','0906000006',NULL,'mai.do@gmail.com','Nữ','Ninh Kiều, Cần Thơ','Vàng',1800,NULL,'2026-01-05 19:16:22','2026-01-05 19:16:22'),(7,'Vũ Văn Kỷ','0907000007',NULL,'ky.vu@gmail.com','Nam','Biên Hòa, Đồng Nai','VIP',3200,NULL,'2026-01-05 19:16:22','2026-01-05 19:16:22'),(8,'Ngô Bích Thủy','0908000008',NULL,'thuy.ngo@gmail.com','Nữ','Vũng Tàu','Bạc',600,NULL,'2026-01-05 19:16:22','2026-01-05 19:16:22'),(9,'Lý Văn Phúc','0909000009',NULL,'phuc.ly@gmail.com','Nam','Nha Trang','Đồng',50,NULL,'2026-01-05 19:16:22','2026-01-05 19:16:22'),(10,'Trương Mỹ Lan','0910000010',NULL,'lan.truong@gmail.com','Nữ','Đà Lạt','Đồng',0,NULL,'2026-01-05 19:16:22','2026-01-05 19:16:22'),(11,'Khách Vãng Lai 1','0991112223',NULL,'vanglai1@store.com','Khác','Tại cửa hàng','Đồng',0,NULL,'2026-01-05 19:16:22','2026-01-05 19:16:22'),(12,'Khách Vãng Lai 2','0992223334',NULL,'vanglai2@store.com','Nam','Tại cửa hàng','Đồng',0,NULL,'2026-01-05 19:16:22','2026-01-05 19:16:22'),(13,'Bùi Tiến Dũng','0913334445',NULL,'dung.bui@gmail.com','Nam','Thanh Xuân, Hà Nội','Bạc',550,NULL,'2026-01-05 19:16:22','2026-01-05 19:16:22'),(14,'Phan Thị Mơ','0914445556',NULL,'mo.phan@gmail.com','Nữ','Long Biên, Hà Nội','Vàng',1200,NULL,'2026-01-05 19:16:22','2026-01-05 19:16:22'),(15,'Cao Thái Sơn','0915556667',NULL,'son.cao@gmail.com','Nam','Quận 7, TP.HCM','VIP',4000,NULL,'2026-01-05 19:16:22','2026-01-05 19:16:22');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
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
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'admin','$2y$10$wITCEmY2vt8tJ2O8fjg9GOvL7otWmZx/rFcpT3fcIQn/29gatjVzS','Quản Trị Viên Hệ Thống',NULL,NULL,'admin','staff',35000000.00,'2023-01-01','admin@store.com','active','2026-01-05 19:16:17','2026-01-05 19:16:17',NULL),(2,'sale_hoa','$2y$10$bufferhashfor123456...','Nguyễn Thị Hoa',NULL,NULL,'employee','Sell',12000000.00,'2023-06-15','hoa.sale@store.com','active','2026-01-05 19:16:17','2026-01-05 19:16:17',NULL),(3,'sale_tuan','$2y$10$bufferhashfor123456...','Trần Văn Tuấn',NULL,NULL,'employee','Sell',12500000.00,'2023-08-20','tuan.sale@store.com','active','2026-01-05 19:16:17','2026-01-05 19:16:17',NULL),(4,'kho_minh','$2y$10$bufferhashfor123456...','Lê Văn Minh',NULL,NULL,'employee','Warehouse employee',11000000.00,'2023-02-10','minh.kho@store.com','active','2026-01-05 19:16:17','2026-01-05 19:16:17',NULL),(5,'kt_lan','$2y$10$bufferhashfor123456...','Phạm Thị Lan',NULL,NULL,'employee','Accountant',16000000.00,'2023-01-05','lan.ketoan@store.com','active','2026-01-05 19:16:17','2026-01-05 19:16:17',NULL),(6,'sale_ngoc','$2y$10$bufferhashfor123456...','Hoàng Bích Ngọc',NULL,NULL,'employee','Sell',10000000.00,'2024-01-10','ngoc.hb@store.com','active','2026-01-05 19:16:17','2026-01-05 19:16:17',NULL),(7,'kho_hai','$2y$10$bufferhashfor123456...','Vũ Đức Hải',NULL,NULL,'employee','Warehouse employee',10500000.00,'2024-02-01','hai.kho@store.com','active','2026-01-05 19:16:17','2026-01-05 19:16:17',NULL),(8,'admin_phu','$2y$10$bufferhashfor123456...','Lê Hoàng Phú',NULL,NULL,'admin','staff',25000000.00,'2023-10-10','phu.admin@store.com','active','2026-01-05 19:16:17','2026-01-05 19:16:17',NULL),(9,'sale_tam','$2y$10$bufferhashfor123456...','Trương Thanh Tâm',NULL,NULL,'employee','Sell',9000000.00,'2024-03-01','tam.sale@store.com','take a break','2026-01-05 19:16:17','2026-01-05 19:16:17',NULL),(10,'kt_hung','$2y$10$bufferhashfor123456...','Nguyễn Quốc Hưng',NULL,'0243578348','employee','Accountant',15500000.00,'2023-05-05','hung.kt@store.com','inactive','2026-01-05 19:16:17','2026-01-12 19:12:56',NULL),(11,'NV00032','$2y$12$4mwzDa6Tk2n4v3NYFryh0OmrOIaSU9NWPsP6LaYHZ.SbArCBTisCW','Nguyễn Thành Vinh',NULL,'0243578345','employee','staff',35436225.00,'2005-12-06','Nguyenthanhvinh23@gmail.com','active','2026-01-12 18:59:58','2026-01-12 18:59:58',NULL);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;

--
-- Table structure for table `import_details`
--

DROP TABLE IF EXISTS `import_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `import_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `import_id` bigint(20) unsigned NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `quantity` int(11) NOT NULL,
  `const_price` decimal(12,2) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `import_details_import_id_foreign` (`import_id`),
  KEY `import_details_product_id_foreign` (`product_id`),
  CONSTRAINT `import_details_import_id_foreign` FOREIGN KEY (`import_id`) REFERENCES `imports` (`id`),
  CONSTRAINT `import_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `import_details`
--

/*!40000 ALTER TABLE `import_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `import_details` ENABLE KEYS */;

--
-- Table structure for table `imports`
--

DROP TABLE IF EXISTS `imports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imports` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `supplier_id` bigint(20) unsigned NOT NULL,
  `employee_id` bigint(20) unsigned NOT NULL,
  `import_date` date NOT NULL,
  `total_amount` decimal(12,2) NOT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `imports_supplier_id_foreign` (`supplier_id`),
  KEY `imports_employee_id_foreign` (`employee_id`),
  CONSTRAINT `imports_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `imports_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imports`
--

/*!40000 ALTER TABLE `imports` DISABLE KEYS */;
/*!40000 ALTER TABLE `imports` ENABLE KEYS */;

--
-- Table structure for table `invoice_details`
--

DROP TABLE IF EXISTS `invoice_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `invoice_id` bigint(20) unsigned NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit_price` decimal(12,2) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice_details_invoice_id_foreign` (`invoice_id`),
  KEY `invoice_details_product_id_foreign` (`product_id`),
  CONSTRAINT `invoice_details_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`),
  CONSTRAINT `invoice_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_details`
--

/*!40000 ALTER TABLE `invoice_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoice_details` ENABLE KEYS */;

--
-- Table structure for table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoices` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` bigint(20) unsigned NOT NULL,
  `employee_id` bigint(20) unsigned NOT NULL,
  `invoice_date` date NOT NULL,
  `subtotal` decimal(12,2) NOT NULL,
  `discount` decimal(12,2) NOT NULL,
  `total_amount` decimal(12,2) NOT NULL,
  `payment_method` enum('cash','credit_card','bank_transfer') NOT NULL,
  `status` enum('paid','unpaid','pending','shipping','completed','cancelled','processing') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoices_customer_id_foreign` (`customer_id`),
  KEY `invoices_employee_id_foreign` (`employee_id`),
  CONSTRAINT `invoices_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  CONSTRAINT `invoices_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoices`
--

/*!40000 ALTER TABLE `invoices` DISABLE KEYS */;
INSERT INTO `invoices` VALUES (1,1,2,'2025-12-01',33990000.00,500000.00,33490000.00,'credit_card','completed','2026-01-05 19:16:33','2026-01-05 19:16:33'),(2,2,3,'2025-12-02',9990000.00,0.00,9990000.00,'cash','completed','2026-01-05 19:16:33','2026-01-05 19:16:33'),(3,3,2,'2025-12-05',20990000.00,200000.00,20790000.00,'bank_transfer','completed','2026-01-05 19:16:33','2026-01-05 19:16:33'),(4,4,6,'2025-12-10',7990000.00,0.00,7990000.00,'cash','completed','2026-01-05 19:16:33','2026-01-05 19:16:33'),(5,5,2,'2025-12-15',5990000.00,0.00,5990000.00,'cash','completed','2026-01-05 19:16:33','2026-01-05 19:16:33'),(6,6,3,'2025-12-20',36990000.00,1000000.00,35990000.00,'credit_card','completed','2026-01-05 19:16:33','2026-01-05 19:16:33'),(7,7,6,'2025-12-24',28990000.00,500000.00,28490000.00,'bank_transfer','shipping','2026-01-05 19:16:33','2026-01-05 19:16:33'),(8,8,2,'2025-12-25',8990000.00,100000.00,8890000.00,'cash','completed','2026-01-05 19:16:33','2026-01-05 19:16:33'),(9,1,3,'2025-12-30',26990000.00,1000000.00,25990000.00,'credit_card','completed','2026-01-05 19:16:33','2026-01-05 19:16:33'),(10,9,6,'2026-01-01',33990000.00,0.00,33990000.00,'bank_transfer','pending','2026-01-05 19:16:33','2026-01-05 19:16:33'),(11,10,2,'2026-01-02',7990000.00,0.00,7990000.00,'cash','cancelled','2026-01-05 19:16:33','2026-01-05 19:16:33'),(12,11,3,'2026-01-03',890000.00,0.00,890000.00,'cash','completed','2026-01-05 19:16:33','2026-01-05 19:16:33'),(13,12,6,'2026-01-04',5990000.00,0.00,5990000.00,'cash','processing','2026-01-05 19:16:33','2026-01-05 19:16:33'),(14,15,2,'2026-01-05',73980000.00,2000000.00,71980000.00,'bank_transfer','completed','2026-01-05 19:16:33','2026-01-05 19:16:33'),(15,14,3,'2026-01-06',14990000.00,300000.00,14690000.00,'credit_card','completed','2026-01-05 19:16:33','2026-01-05 12:30:01');
/*!40000 ALTER TABLE `invoices` ENABLE KEYS */;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
  `finished_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000001_create_cache_table',1),(2,'0001_01_01_000002_create_jobs_table',1),(3,'2025_12_02_040905_create_brands_table',1),(4,'2025_12_02_041332_create_products_table',1),(5,'2025_12_03_033836_create_customers_table',1),(6,'2025_12_05_014850_create_employees_table',1),(7,'2025_12_05_020647_create_invoices_table',1),(8,'2025_12_05_022835_create_invoice_details_table',1),(9,'2025_12_05_022851_create_suppliers_table',1),(10,'2025_12_05_022902_create_imports_table',1),(11,'2025_12_05_022916_create_import_details_table',1),(12,'2025_12_07_085439_create_sessions_table',1),(13,'2025_12_13_000000_create_users_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_name` varchar(100) NOT NULL,
  `sku` varchar(50) NOT NULL,
  `brand_id` bigint(20) unsigned NOT NULL,
  `category` varchar(50) NOT NULL,
  `ram` varchar(20) DEFAULT NULL,
  `storage` varchar(20) DEFAULT NULL,
  `price` decimal(12,2) NOT NULL,
  `cost_price` decimal(12,2) NOT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  `min_stock` int(11) NOT NULL DEFAULT 5,
  `max_stock` int(11) NOT NULL DEFAULT 100,
  `reorder_point` int(11) DEFAULT NULL,
  `location_code` varchar(255) DEFAULT NULL,
  `status` enum('Available','Out of Stock','Discontinued') NOT NULL DEFAULT 'Available',
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_sku_unique` (`sku`),
  KEY `products_brand_id_foreign` (`brand_id`),
  CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'iPhone 15 Pro Max','IP15PM-256',1,'Smartphone','8GB','256GB',33990000.00,30000000.00,25,5,100,NULL,NULL,'Available',NULL,NULL,'2026-01-05 19:16:26','2026-01-05 19:16:26'),(2,'iPhone 15 Plus','IP15P-128',1,'Smartphone','6GB','128GB',24990000.00,22000000.00,40,5,100,NULL,NULL,'Available',NULL,NULL,'2026-01-05 19:16:26','2026-01-05 19:16:26'),(3,'MacBook Air M2','MBA-M2',1,'Laptop','8GB','256GB',26990000.00,24000000.00,15,5,100,NULL,NULL,'Available',NULL,NULL,'2026-01-05 19:16:26','2026-01-05 19:16:26'),(4,'iPad Air 5','IPA5-64',1,'Tablet','8GB','64GB',14990000.00,12500000.00,30,5,100,NULL,NULL,'Available',NULL,NULL,'2026-01-05 19:16:26','2026-01-05 19:16:26'),(5,'AirPods Pro 2','APP2',1,'Accessory',NULL,NULL,5990000.00,4500000.00,100,5,100,NULL,NULL,'Available',NULL,NULL,'2026-01-05 19:16:26','2026-01-05 19:16:26'),(6,'Samsung Galaxy S24 Ultra','S24U-512',2,'Smartphone','12GB','512GB',36990000.00,33000000.00,20,5,100,NULL,NULL,'Available',NULL,NULL,'2026-01-05 19:16:26','2026-01-05 19:16:26'),(7,'Samsung Galaxy Z Fold 5','ZFOLD5-256',2,'Smartphone','12GB','256GB',39990000.00,35000000.00,10,5,100,NULL,NULL,'Available',NULL,NULL,'2026-01-05 19:16:26','2026-01-05 19:16:26'),(8,'Samsung Galaxy A55','A55-128',2,'Smartphone','8GB','128GB',9990000.00,8000000.00,80,5,100,NULL,NULL,'Available',NULL,NULL,'2026-01-05 19:16:26','2026-01-05 19:16:26'),(9,'Galaxy Tab S9','TABS9',2,'Tablet','8GB','128GB',19990000.00,17000000.00,15,5,100,NULL,NULL,'Available',NULL,NULL,'2026-01-05 19:16:26','2026-01-05 19:16:26'),(10,'Xiaomi 14','MI14',3,'Smartphone','12GB','256GB',20990000.00,18000000.00,35,5,100,NULL,NULL,'Available',NULL,NULL,'2026-01-05 19:16:26','2026-01-05 19:16:26'),(11,'Redmi Note 13 Pro','RMN13P',3,'Smartphone','8GB','256GB',7990000.00,6000000.00,120,5,100,NULL,NULL,'Available',NULL,NULL,'2026-01-05 19:16:26','2026-01-05 19:16:26'),(12,'Xiaomi Band 8','MIBAND8',3,'Accessory',NULL,NULL,890000.00,600000.00,200,5,100,NULL,NULL,'Available',NULL,NULL,'2026-01-05 19:16:26','2026-01-05 19:16:26'),(13,'Oppo Find N3 Flip','OPFN3',4,'Smartphone','12GB','256GB',22990000.00,19000000.00,18,5,100,NULL,NULL,'Available',NULL,NULL,'2026-01-05 19:16:26','2026-01-05 19:16:26'),(14,'Oppo Reno 11 F','OPR11F',4,'Smartphone','8GB','256GB',8990000.00,7000000.00,50,5,100,NULL,NULL,'Available',NULL,NULL,'2026-01-05 19:16:26','2026-01-05 19:16:26'),(15,'Sony Xperia 1 V','XPERIA1V',5,'Smartphone','12GB','256GB',29990000.00,26000000.00,5,5,100,NULL,NULL,'Out of Stock',NULL,NULL,'2026-01-05 19:16:26','2026-01-05 19:16:26'),(16,'Sony WH-1000XM5','WH1000XM5',5,'Accessory',NULL,NULL,7990000.00,6000000.00,25,5,100,NULL,NULL,'Available',NULL,NULL,'2026-01-05 19:16:26','2026-01-05 19:16:26'),(17,'Asus ROG Phone 8','ROG8',6,'Smartphone','16GB','512GB',28990000.00,25000000.00,10,5,100,NULL,NULL,'Available',NULL,NULL,'2026-01-05 19:16:26','2026-01-05 19:16:26'),(18,'Asus Zenbook 14','ZEN14',6,'Laptop','16GB','512GB',24990000.00,21000000.00,12,5,100,NULL,NULL,'Available',NULL,NULL,'2026-01-05 19:16:26','2026-01-05 19:16:26'),(19,'Google Pixel 8 Pro','PIXEL8P',7,'Smartphone','12GB','128GB',18990000.00,16000000.00,8,5,100,NULL,NULL,'Available',NULL,NULL,'2026-01-05 19:16:26','2026-01-05 19:16:26'),(20,'iPhone 13 Mini','IP13M',1,'Smartphone','4GB','128GB',14000000.00,12000000.00,0,5,100,NULL,NULL,'Discontinued',NULL,NULL,'2026-01-05 19:16:26','2026-01-05 19:16:26');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;

--
-- Table structure for table `stock_transactions`
--

DROP TABLE IF EXISTS `stock_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_transactions` (
  `id` bigint(20) unsigned NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `warehouse_location_id` bigint(20) unsigned DEFAULT NULL,
  `transaction_type` enum('receive','adjust','transfer','return','sale','damage','expired') NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit_price` decimal(12,2) DEFAULT NULL,
  `total_value` decimal(12,2) DEFAULT NULL,
  `reference_number` varchar(100) DEFAULT NULL,
  `reference_id` bigint(20) unsigned DEFAULT NULL,
  `reference_type` varchar(50) DEFAULT NULL,
  `from_warehouse_location_id` bigint(20) unsigned DEFAULT NULL,
  `to_warehouse_location_id` bigint(20) unsigned DEFAULT NULL,
  `employee_id` bigint(20) unsigned NOT NULL,
  `customer_id` bigint(20) unsigned DEFAULT NULL,
  `supplier_id` bigint(20) unsigned DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`metadata`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_transactions`
--

/*!40000 ALTER TABLE `stock_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock_transactions` ENABLE KEYS */;

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suppliers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
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
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `suppliers_supplier_code_unique` (`supplier_code`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
INSERT INTO `suppliers` VALUES (1,'NCC_FPT','FPT Synnex','356724575','Nguyễn Văn Hùng','Nguyễn Văn Hùng','02473008888','8976456246','hung.nv@fpt.com.vn','Khu CNC Hòa Lạc, Hà Nội',NULL,'\"[\\\"tablet\\\",\\\"accessory\\\",\\\"watch\\\"]\"',3.0,NULL,NULL,'active','2026-01-08','2026-01-05 19:16:14','2026-01-07 10:46:40',NULL),(2,'NCC_DGW','Digiworld','6757357357','Trần Thị Mai','Trần Thị Mai','02839290059','8976456456','mai.tt@dgw.com.vn','Quận 3, TP.HCM',NULL,'\"[\\\"accessory\\\",\\\"watch\\\",\\\"battery\\\"]\"',3.0,NULL,NULL,'active','2026-01-06','2026-01-05 19:16:14','2026-01-05 13:08:36',NULL),(3,'NCC_VTL','Viettel Distribution','5678356783','Lê Thanh Sơn','Lê Thanh Sơn','02462660447','464567345','son.lt@viettel.com.vn','Tòa nhà Viettel, Cầu Giấy',NULL,'\"[\\\"accessory\\\",\\\"watch\\\",\\\"laptop\\\"]\"',3.0,NULL,NULL,'pending','2026-01-06','2026-01-05 19:16:14','2026-01-05 12:25:26',NULL),(4,'NCC_PET','PetroSetco','5473356754','Phạm Ngọc Châu','Phạm Ngọc Châu','02839117777','89764562436','chau.pn@petro.com.vn','Quận 1, TP.HCM',NULL,'\"[\\\"tablet\\\",\\\"accessory\\\"]\"',3.0,NULL,NULL,'inactive','2026-01-06','2026-01-05 19:16:14','2026-01-05 12:24:40',NULL),(5,'NCC_MBF','Mobifone Global','76247862454','Đỗ Văn Đạt','Đỗ Văn Đạt','0909090909','876142354','dat.dv@mobifone.vn','Đống Đa, Hà Nội',NULL,'\"[\\\"smartphone\\\",\\\"tablet\\\",\\\"accessory\\\",\\\"watch\\\",\\\"laptop\\\"]\"',3.0,NULL,NULL,'active','2026-01-06','2026-01-05 19:16:14','2026-01-05 13:13:27',NULL),(6,'NCC_PETs','Mobifone Global','76247862454','Lê Thanh Nghị','Lê Thanh Nghị','09090987609','8974562436','dat.dsv@mobifone.vn','46qw46yregrf',NULL,'\"[\\\"smartphone\\\",\\\"tablet\\\"]\"',4.0,NULL,NULL,'active','2026-01-06','2026-01-05 12:28:31','2026-01-05 12:28:31',NULL);
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

--
-- Dumping routines for database 'phone_store'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-13  9:19:59
