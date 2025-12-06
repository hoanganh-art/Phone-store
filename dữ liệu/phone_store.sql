CREATE DATABASE phone_store;
use phone_store;
-- 1. Bảng brands
CREATE TABLE brands (
    brand_id INT PRIMARY KEY AUTO_INCREMENT,
    brand_name VARCHAR(50) NOT NULL,
    country VARCHAR(50),
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. Bảng products
CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL,
    brand_id INT NOT NULL,
    category VARCHAR(50),
    ram VARCHAR(20),
    storage VARCHAR(20),
    price DECIMAL(12,2) NOT NULL DEFAULT 0,
    cost_price DECIMAL(12,2) NOT NULL DEFAULT 0,
    stock INT DEFAULT 0,
    status ENUM('Available', 'Out of Stock', 'Discontinued') DEFAULT 'Available',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (brand_id) REFERENCES brands(brand_id) ON DELETE CASCADE
);

-- 3. Bảng customers
CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    phone VARCHAR(15),
    email VARCHAR(100),
    address TEXT,
    membership ENUM('Standard', 'Silver', 'Gold', 'Platinum') DEFAULT 'Standard',
    points INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 4. Bảng employees
CREATE TABLE employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    full_name VARCHAR(100) NOT NULL,
    role ENUM('Admin', 'Manager', 'Sales', 'Warehouse') NOT NULL,
    phone VARCHAR(15),
    salary DECIMAL(12,2) DEFAULT 0,
    hire_date DATE,
    status ENUM('Active', 'Inactive') DEFAULT 'Active',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 5. Bảng invoices
CREATE TABLE invoices (
    invoice_id VARCHAR(20) PRIMARY KEY,
    customer_id INT,
    employee_id INT NOT NULL,
    invoice_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    subtotal DECIMAL(12,2) DEFAULT 0,
    discount DECIMAL(12,2) DEFAULT 0,
    total_amount DECIMAL(12,2) DEFAULT 0,
    payment_method ENUM('Cash', 'Credit Card', 'Bank Transfer', 'E-Wallet') DEFAULT 'Cash',
    status ENUM('Pending', 'Paid', 'Cancelled', 'Refunded') DEFAULT 'Pending',
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE SET NULL,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id) ON DELETE RESTRICT
);

-- 6. Bảng invoice_details
CREATE TABLE invoice_details (
    detail_id INT PRIMARY KEY AUTO_INCREMENT,
    invoice_id VARCHAR(20) NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL DEFAULT 1,
    unit_price DECIMAL(12,2) NOT NULL,
    amount DECIMAL(12,2) NOT NULL DEFAULT 0,
    FOREIGN KEY (invoice_id) REFERENCES invoices(invoice_id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(product_id) ON DELETE RESTRICT
);

-- 7. Bảng suppliers
CREATE TABLE suppliers (
    supplier_id INT PRIMARY KEY AUTO_INCREMENT,
    supplier_name VARCHAR(100) NOT NULL,
    contact_person VARCHAR(100),
    phone VARCHAR(15),
    email VARCHAR(100),
    address TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 8. Bảng imports
CREATE TABLE imports (
    import_id VARCHAR(20) PRIMARY KEY,
    supplier_id INT NOT NULL,
    employee_id INT NOT NULL,
    import_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    total_cost DECIMAL(12,2) DEFAULT 0,
    note TEXT,
    FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id) ON DELETE RESTRICT,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id) ON DELETE RESTRICT
);

-- 9. Bảng import_details
CREATE TABLE import_details (
    import_detail_id INT PRIMARY KEY AUTO_INCREMENT,
    import_id VARCHAR(20) NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL DEFAULT 1,
    cost_price DECIMAL(12,2) NOT NULL,
    amount DECIMAL(12,2) NOT NULL DEFAULT 0,
    FOREIGN KEY (import_id) REFERENCES imports(import_id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(product_id) ON DELETE RESTRICT
);

-- Tạo indexes để tối ưu hiệu suất
CREATE INDEX idx_products_brand ON products(brand_id);
CREATE INDEX idx_products_status ON products(status);
CREATE INDEX idx_invoices_customer ON invoices(customer_id);
CREATE INDEX idx_invoices_employee ON invoices(employee_id);
CREATE INDEX idx_invoices_date ON invoices(invoice_date);
CREATE INDEX idx_invoice_details_invoice ON invoice_details(invoice_id);
CREATE INDEX idx_invoice_details_product ON invoice_details(product_id);
CREATE INDEX idx_imports_supplier ON imports(supplier_id);
CREATE INDEX idx_imports_employee ON imports(employee_id);
CREATE INDEX idx_import_details_import ON import_details(import_id);
CREATE INDEX idx_import_details_product ON import_details(product_id);
CREATE INDEX idx_customers_email ON customers(email);
CREATE INDEX idx_employees_username ON employees(username);


--Truy vấn dữ liệu


