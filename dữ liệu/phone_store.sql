-- Xóa database cũ nếu có
DROP DATABASE IF EXISTS phone_store;
CREATE DATABASE phone_store;
USE phone_store;

-- 1. Bảng brands (tương ứng với migration 2025_12_02_040905_create_brands_table.php)
CREATE TABLE brands (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    brand_name VARCHAR(50) NOT NULL,
    country VARCHAR(50),
    description TEXT,
    created_at TIMESTAMP NULL DEFAULT NULL,
    updated_at TIMESTAMP NULL DEFAULT NULL
);

-- 2. Bảng products (tương ứng với migration 2025_12_02_041332_create_products_table.php)
CREATE TABLE products (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL,
    sku VARCHAR(50) UNIQUE,
    brand_id BIGINT NOT NULL,
    category VARCHAR(50),
    ram VARCHAR(20),
    storage VARCHAR(20),
    price DECIMAL(12,2) NOT NULL DEFAULT 0,
    cost_price DECIMAL(12,2) NOT NULL DEFAULT 0,
    stock INT DEFAULT 0,
    status ENUM('Available', 'Out of Stock', 'Discontinued') DEFAULT 'Available',
    description TEXT,
    image VARCHAR(255),
    created_at TIMESTAMP NULL DEFAULT NULL,
    updated_at TIMESTAMP NULL DEFAULT NULL,
    FOREIGN KEY (brand_id) REFERENCES brands(id) ON DELETE CASCADE
);

-- 3. Bảng customers (tương ứng với migration 2025_12_03_033836_create_customers_table.php)
CREATE TABLE customers (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    phone VARCHAR(15) UNIQUE,
    date_of_birth DATE,
    email VARCHAR(100) UNIQUE,
    gender ENUM('Nam', 'Nữ', 'Khác'),
    address VARCHAR(255),
    membership ENUM('Đồng', 'Bạc', 'Vàng', 'VIP') DEFAULT 'Đồng',
    points INT DEFAULT 0,
    description TEXT,
    created_at TIMESTAMP NULL DEFAULT NULL,
    updated_at TIMESTAMP NULL DEFAULT NULL
);

-- 4. Bảng employees (tương ứng với migration 2025_12_05_014850_create_employees_table.php)
CREATE TABLE employees (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50),
    password VARCHAR(255) NOT NULL,
    full_name VARCHAR(255) NOT NULL,
    avartar VARCHAR(255),
    phone VARCHAR(15),
    role ENUM('admin', 'employee') NOT NULL,
    Position ENUM('staff','Sell','Warehouse employee','Accountant') NOT NULL,
    salary DECIMAL(12,2) NOT NULL DEFAULT 0,
    hire_date DATE NOT NULL,
    email VARCHAR(100) NOT NULL,
    status ENUM('active', 'inactive', 'take a break') NOT NULL,
    created_at TIMESTAMP NULL DEFAULT NULL,
    updated_at TIMESTAMP NULL DEFAULT NULL,
    UNIQUE KEY employees_username_unique (username)
);

-- 5. Bảng suppliers (tương ứng với migration 2025_12_05_022851_create_suppliers_table.php)
CREATE TABLE suppliers (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    supplier_name VARCHAR(255) NOT NULL,
    contact_name VARCHAR(255) NOT NULL,
    phone VARCHAR(15) NOT NULL,
    email VARCHAR(255) NOT NULL,
    address TEXT NOT NULL,
    created_at TIMESTAMP NULL DEFAULT NULL,
    updated_at TIMESTAMP NULL DEFAULT NULL
);

-- 6. Bảng invoices (tương ứng với migration 2025_12_05_020647_create_invoices_table.php)
CREATE TABLE invoices (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    customer_id BIGINT NOT NULL,
    employee_id BIGINT NOT NULL,
    invoice_date DATE NOT NULL,
    subtotal DECIMAL(12,2) NOT NULL,
    discount DECIMAL(12,2) NOT NULL,
    total_amount DECIMAL(12,2) NOT NULL,
    payment_method ENUM('cash', 'credit_card', 'bank_transfer') NOT NULL,
    status ENUM('paid', 'unpaid', 'pending') NOT NULL,
    created_at TIMESTAMP NULL DEFAULT NULL,
    updated_at TIMESTAMP NULL DEFAULT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(id) ON DELETE CASCADE,
    FOREIGN KEY (employee_id) REFERENCES employees(id) ON DELETE CASCADE
);

-- 7. Bảng invoice_details (tương ứng với migration 2025_12_05_022835_create_invoice_details_table.php)
CREATE TABLE invoice_details (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    invoice_id BIGINT NOT NULL,
    product_id BIGINT NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(12,2) NOT NULL,
    amount DECIMAL(12,2) NOT NULL,
    created_at TIMESTAMP NULL DEFAULT NULL,
    updated_at TIMESTAMP NULL DEFAULT NULL,
    FOREIGN KEY (invoice_id) REFERENCES invoices(id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE
);

-- 8. Bảng imports (tương ứng với migration 2025_12_05_022902_create_imports_table.php)
CREATE TABLE imports (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    supplier_id BIGINT NOT NULL,
    employee_id BIGINT NOT NULL,
    import_date DATE NOT NULL,
    total_amount DECIMAL(12,2) NOT NULL,
    notes TEXT,
    created_at TIMESTAMP NULL DEFAULT NULL,
    updated_at TIMESTAMP NULL DEFAULT NULL,
    FOREIGN KEY (supplier_id) REFERENCES suppliers(id) ON DELETE CASCADE,
    FOREIGN KEY (employee_id) REFERENCES employees(id) ON DELETE CASCADE
);

-- 9. Bảng import_details (tương ứng với migration đã sửa)
CREATE TABLE import_details (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    import_id BIGINT NOT NULL,
    product_id BIGINT NOT NULL,
    quantity INT NOT NULL,
    cost_price DECIMAL(12,2) NOT NULL,  -- Đã sửa từ const_price
    amount DECIMAL(12,2) NOT NULL,
    created_at TIMESTAMP NULL DEFAULT NULL,
    updated_at TIMESTAMP NULL DEFAULT NULL,
    FOREIGN KEY (import_id) REFERENCES imports(id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE
);

-- Tạo indexes để tối ưu hiệu suất
CREATE INDEX idx_products_brand ON products(brand_id);
CREATE INDEX idx_products_status ON products(status);
CREATE INDEX idx_invoices_customer ON invoices(customer_id);
CREATE INDEX idx_invoices_employee ON invoices(employee_id);
CREATE INDEX idx_invoice_details_invoice ON invoice_details(invoice_id);
CREATE INDEX idx_invoice_details_product ON invoice_details(product_id);
CREATE INDEX idx_imports_supplier ON imports(supplier_id);
CREATE INDEX idx_imports_employee ON imports(employee_id);
CREATE INDEX idx_import_details_import ON import_details(import_id);
CREATE INDEX idx_import_details_product ON import_details(product_id);
CREATE INDEX idx_customers_email ON customers(email);
CREATE INDEX idx_customers_phone ON customers(phone);
CREATE INDEX idx_employees_username ON employees(username);

-- Thêm dữ liệu mẫu (đã điều chỉnh phù hợp với migration)
INSERT INTO brands (brand_name, country, description, created_at, updated_at) VALUES
('Apple', 'USA', 'Premium smartphone manufacturer', NOW(), NOW()),
('Samsung', 'South Korea', 'Leading electronics company', NOW(), NOW()),
('Xiaomi', 'China', 'Affordable tech innovator', NOW(), NOW()),
('Oppo', 'China', 'Camera-focused smartphones', NOW(), NOW()),
('Vivo', 'China', 'Innovation-driven brand', NOW(), NOW());

INSERT INTO products (product_name, sku, brand_id, category, ram, storage, price, cost_price, stock, status, created_at, updated_at) VALUES
('iPhone 15 Pro', 'IP15P256', 1, 'Flagship', '8GB', '256GB', 999.99, 650.00, 50, 'Available', NOW(), NOW()),
('iPhone 15', 'IP15128', 1, 'Flagship', '6GB', '128GB', 799.99, 520.00, 45, 'Available', NOW(), NOW()),
('Galaxy S24 Ultra', 'GS24U512', 2, 'Flagship', '12GB', '512GB', 1299.99, 850.00, 30, 'Available', NOW(), NOW()),
('Galaxy A54', 'GA54256', 2, 'Mid-range', '8GB', '256GB', 449.99, 280.00, 60, 'Available', NOW(), NOW()),
('Xiaomi 14', 'XM14512', 3, 'Flagship', '12GB', '512GB', 699.99, 420.00, 40, 'Available', NOW(), NOW());

INSERT INTO customers (full_name, phone, date_of_birth, email, gender, address, membership, points, created_at, updated_at) VALUES
('Nguyễn Văn A', '0901234567', '1990-01-01', 'nguyenvana@email.com', 'Nam', '123 Đường Lê Lợi, TP.HCM', 'Vàng', 500, NOW(), NOW()),
('Trần Thị B', '0912345678', '1992-05-15', 'tranthib@email.com', 'Nữ', '456 Đường Nguyễn Huệ, TP.HCM', 'Bạc', 300, NOW(), NOW()),
('Phạm Văn C', '0923456789', '1988-11-20', 'phamvanc@email.com', 'Nam', '789 Đường Trần Hưng Đạo, Hà Nội', 'Đồng', 100, NOW(), NOW());

INSERT INTO employees (username, password, full_name, avartar, phone, role, Position, salary, hire_date, email, status, created_at, updated_at) VALUES
('admin', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Nguyễn Văn Admin', NULL, '0900000001', 'admin', 'staff', 15000000.00, '2023-01-01', 'admin@store.com', 'active', NOW(), NOW()),
('sales1', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Trần Thị Sales', NULL, '0900000002', 'employee', 'Sell', 8000000.00, '2023-03-01', 'sales@store.com', 'active', NOW(), NOW());

INSERT INTO invoices (customer_id, employee_id, invoice_date, subtotal, discount, total_amount, payment_method, status, created_at, updated_at) VALUES
(1, 2, '2024-06-01', 1799.98, 100.00, 1699.98, 'cash', 'paid', NOW(), NOW()),
(2, 2, '2024-06-02', 449.99, 0.00, 449.99, 'credit_card', 'paid', NOW(), NOW());

INSERT INTO invoice_details (invoice_id, product_id, quantity, unit_price, amount, created_at, updated_at) VALUES
(1, 1, 1, 999.99, 999.99, NOW(), NOW()),
(1, 2, 1, 799.99, 799.99, NOW(), NOW()),
(2, 4, 1, 449.99, 449.99, NOW(), NOW());

-- Kiểm tra dữ liệu
SELECT 'brands' as table_name, COUNT(*) as count FROM brands
UNION ALL
SELECT 'products', COUNT(*) FROM products
UNION ALL
SELECT 'customers', COUNT(*) FROM customers
UNION ALL
SELECT 'employees', COUNT(*) FROM employees
UNION ALL
SELECT 'invoices', COUNT(*) FROM invoices
UNION ALL
SELECT 'invoice_details', COUNT(*) FROM invoice_details;
