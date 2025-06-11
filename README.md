# E-Commerce Database Schema with Data

### Overview
This project models a simple yet comprehensive e-commerce database schema that covers core business entities and their relationships. It provides the foundation for managing customers, products, categories, orders, payments, shipping, inventory, and product reviews.

### Entity Relationship Diagram (ERD)
The ERD visually represents the following key tables and their relationships:

#### Customers:
Stores customer information including contact details and registration date.

#### Categories: 
Defines product categories (e.g., Electronics, Clothing).

#### Products: 
Contains product details linked to categories.

#### Orders: 
Records customer orders with order status and dates.

#### OrderItems: 
Details products within each order, supporting multiple products per order with quantities and prices. This table uses a composite primary key on order_id and product_id.

#### Payments:
Tracks payment details linked to orders.

#### ProductReviews: 
Captures customer reviews and ratings for products.

#### ProductInventory: 
Maintains inventory stock levels and last updated date.

#### ShippingAddresses: 
Stores shipping address information associated with customers and orders.

#### Key Features:

#### Primary Keys and Composite Keys
Each table has a primary key to uniquely identify records. The OrderItems table demonstrates a composite primary key combining order_id and product_id to uniquely identify each order-product pair.

#### Foreign Key Relationships
Relationships between tables enforce data integrity, such as orders linked to customers, products linked to categories, and payments linked to orders.

#### Cascade Delete/Update (SQL implementation detail)
While the ERD visualization omits cascade rules, the SQL schema enforces cascading deletes and updates on key foreign keys to maintain referential integrity.
