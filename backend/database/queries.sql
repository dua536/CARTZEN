-- ========================================

-- USERS
-- ========================================
COLUMN first_name FORMAT A15
COLUMN last_name FORMAT A15
COLUMN email FORMAT A25

SELECT id, first_name, last_name, email, role, is_active, created_at
FROM users;


-- ========================================
-- CATEGORIES
-- ========================================
COLUMN name FORMAT A20

SELECT id, name
FROM categories;


-- ========================================
-- PRODUCTS
-- ========================================
COLUMN name FORMAT A25
COLUMN sale_type FORMAT A10
COLUMN unit FORMAT A10

SELECT id, name, price, sale_type, unit, recommended, is_active
FROM products;


-- ========================================
-- PRODUCT CATEGORIES (JOIN)
-- ========================================
SELECT pc.product_id,
       p.name AS product_name,
       pc.category_id,
       c.name AS category_name
FROM product_categories pc
JOIN products p ON p.id = pc.product_id
JOIN categories c ON c.id = pc.category_id;


-- ========================================
-- ADDRESSES
-- ========================================
COLUMN address FORMAT A30
COLUMN city FORMAT A15
COLUMN province FORMAT A15

SELECT id,
       user_id,
       label,
       type,
       address,
       city,
       province,
       postal_code,
       phone_number,
       is_default
FROM addresses;


-- ========================================
-- CART ITEMS (JOIN)
-- ========================================
SELECT ci.user_id,
       ci.product_id,
       p.name,
       ci.quantity,
       p.price
FROM cart_items ci
JOIN products p ON p.id = ci.product_id;


-- ========================================
-- ORDERS
-- ========================================
COLUMN order_number FORMAT A12
COLUMN status FORMAT A12
COLUMN payment_method FORMAT A10

SELECT id,
       user_id,
       order_number,
       status,
       subtotal,
       shipping,
       tax_rate,
       total_price,
       payment_method,
       created_at
FROM orders
ORDER BY created_at DESC;


-- ========================================
-- ORDER ITEMS (JOIN)
-- ========================================
SELECT oi.order_id,
       o.order_number,
       oi.product_id,
       p.name AS product_name,
       oi.quantity,
       oi.price_at_purchase
FROM order_items oi
JOIN orders o ON o.id = oi.order_id
LEFT JOIN products p ON p.id = oi.product_id
ORDER BY oi.order_id DESC;


-- ========================================
-- AGGREGATION (FOR MARKS)
-- ========================================
SELECT COUNT(*) AS total_users FROM users;