upda# Kiểm tra kết nối các bảng Database

## 📊 Sơ đồ Quan hệ các Bảng

### 1. **Bảng Brands (Thương hiệu)**
- **Primary Key:** `id`
- **Relationships:**
  - ➜ Products (1:N) - qua `brand_id`

---

### 2. **Bảng Products (Sản phẩm)**
- **Primary Key:** `id`
- **Foreign Keys:**
  - ← Brands (N:1) qua `brand_id` ✅
- **Relationships:**
  - ➜ Invoice Details (1:N) qua `product_id`
  - ➜ Import Details (1:N) qua `product_id`
  - ➜ Inventory Details (1:N) qua `product_id`
  - ➜ Stock Transactions (1:N) qua `product_id`
  - ➜ Stock Take Items (1:N) qua `product_id`

---

### 3. **Bảng Customers (Khách hàng)**
- **Primary Key:** `id`
- **Relationships:**
  - ➜ Invoices (1:N) qua `customer_id`
  - ➜ Stock Transactions (1:N) qua `customer_id` (nullable)

---

### 4. **Bảng Employees (Nhân viên)**
- **Primary Key:** `id`
- **Relationships:**
  - ➜ Invoices (1:N) qua `employee_id`
  - ➜ Imports (1:N) qua `employee_id`
  - ➜ Warehouses (1:N) qua `manager_id` (nullable)
  - ➜ Stock Takes (1:N) qua `employee_id`
  - ➜ Stock Transactions (1:N) qua `employee_id`

---

### 5. **Bảng Suppliers (Nhà cung cấp)**
- **Primary Key:** `id`
- **Relationships:**
  - ➜ Imports (1:N) qua `supplier_id`
  - ➜ Stock Transactions (1:N) qua `supplier_id` (nullable)

---

### 6. **Bảng Invoices (Hóa đơn bán hàng)**
- **Primary Key:** `id`
- **Foreign Keys:**
  - ← Customers (N:1) qua `customer_id` ✅
  - ← Employees (N:1) qua `employee_id` ✅
- **Relationships:**
  - ➜ Invoice Details (1:N) qua `invoice_id`
  - ➜ Stock Transactions (1:N) - tham chiếu qua `reference_id` + `reference_type`

---

### 7. **Bảng Invoice Details (Chi tiết hóa đơn)**
- **Primary Key:** `id`
- **Foreign Keys:**
  - ← Invoices (N:1) qua `invoice_id` ✅
  - ← Products (N:1) qua `product_id` ✅

---

### 8. **Bảng Imports (Phiếu nhập hàng)**
- **Primary Key:** `id`
- **Foreign Keys:**
  - ← Suppliers (N:1) qua `supplier_id` ✅
  - ← Employees (N:1) qua `employee_id` ✅
- **Relationships:**
  - ➜ Import Details (1:N) qua `import_id`
  - ➜ Stock Transactions (1:N) - tham chiếu qua `reference_id` + `reference_type`

---

### 9. **Bảng Import Details (Chi tiết nhập hàng)**
- **Primary Key:** `id`
- **Foreign Keys:**
  - ← Imports (N:1) qua `import_id` ✅
  - ← Products (N:1) qua `product_id` ✅
- **⚠️ LỖI TÌM THẤY:**
  - Column name: `const_price` (nên là `cost_price`)

---

### 10. **Bảng Warehouses (Kho)**
- **Primary Key:** `id`
- **Foreign Keys:**
  - ← Employees (N:1) qua `manager_id` (nullable) ✅
- **Relationships:**
  - ➜ Warehouse Locations (1:N) qua `warehouse_id`
  - ➜ Stock Takes (1:N) qua `warehouse_id`

---

### 11. **Bảng Warehouse Locations (Vị trí kho)**
- **Primary Key:** `id`
- **Foreign Keys:**
  - ← Warehouses (N:1) qua `warehouse_id` ✅
- **Relationships:**
  - ➜ Inventory Details (1:N) qua `warehouse_location_id`
  - ➜ Stock Transactions (1:N) qua `warehouse_location_id` (nullable)
  - ➜ Stock Take Items (1:N) qua `warehouse_location_id`
  - ➜ Stock Transactions - source & destination (N:1)

---

### 12. **Bảng Inventory Details (Chi tiết hàng tồn kho)**
- **Primary Key:** `id`
- **Foreign Keys:**
  - ← Products (N:1) qua `product_id` ✅
  - ← Warehouse Locations (N:1) qua `warehouse_location_id` ✅

---

### 13. **Bảng Stock Takes (Phiếu kiểm kê kho)**
- **Primary Key:** `id`
- **Foreign Keys:**
  - ← Warehouses (N:1) qua `warehouse_id` ✅
  - ← Employees (N:1) qua `employee_id` ✅
- **Relationships:**
  - ➜ Stock Take Items (1:N) qua `stock_take_id`

---

### 14. **Bảng Stock Take Items (Chi tiết kiểm kê)**
- **Primary Key:** `id`
- **Foreign Keys:**
  - ← Stock Takes (N:1) qua `stock_take_id` ✅
  - ← Products (N:1) qua `product_id` ✅
  - ← Warehouse Locations (N:1) qua `warehouse_location_id` ✅

---

### 15. **Bảng Stock Transactions (Giao dịch kho)**
- **Primary Key:** `id`
- **Foreign Keys:**
  - ← Products (N:1) qua `product_id` ✅
  - ← Warehouse Locations (N:1) qua `warehouse_location_id` (nullable) ✅
  - ← Employees (N:1) qua `employee_id` ✅
  - ← Customers (N:1) qua `customer_id` (nullable) ✅
  - ← Suppliers (N:1) qua `supplier_id` (nullable) ✅
  - ← Warehouse Locations (N:1) qua `from_warehouse_location_id` (nullable) ✅
  - ← Warehouse Locations (N:1) qua `to_warehouse_location_id` (nullable) ✅

---

## ✅ Kết luận Kiểm tra

### **Tổng quan:**
- **Total Tables:** 15
- **Total Foreign Keys:** 32+
- **Status:** ✅ Kết nối đúng

### **Lỗi tìm thấy:**

| Lỗi | Vị trí | Mô tả | Mức độ |
|-----|--------|-------|-------|
| ❌ Typo column name | `import_details` table | Column: `const_price` → nên là `cost_price` | 🔴 High |

### **Ghi chú:**
1. ✅ Tất cả Foreign Keys đều chỉ đến bảng tồn tại
2. ✅ Sử dụng `onDelete('cascade')` cho các quan hệ phụ thuộc
3. ✅ Sử dụng `onDelete('set null')` cho các quan hệ tùy chọn (nullable)
4. ✅ Có indexes đầy đủ cho các truy vấn thường xuyên
5. ⚠️ Bảng `stock_transactions` sử dụng `polymorphic relationships` qua `reference_type` và `reference_id`
6. ⚠️ Kiểm tra xem Model có implement đúng relationships không

### **Khuyến nghị:**
1. **Sửa typo** trong `import_details` table: `const_price` → `cost_price`
2. **Kiểm tra Models** để đảm bảo định nghĩa relationships chính xác
3. **Thêm migrations** để fix typo này (tạo migration mới để rename column)
