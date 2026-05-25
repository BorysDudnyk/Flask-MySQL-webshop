# Flask-MySQL-webshop

This project is an online store system built with Python (Flask) and MySQL. 
It includes database structure, user roles, product management, orders, carts, offers, and delivery system.

## Development Tools

![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![Flask](https://img.shields.io/badge/Flask_Web_Framework-000000?style=for-the-badge&logo=flask&logoColor=white)
![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)

## Technologies

![SQLAlchemy](https://img.shields.io/badge/Flask--SQLAlchemy-ORM-D71F00?style=for-the-badge)
![Flask-WTF](https://img.shields.io/badge/Flask--WTF-Forms-2E8B57?style=for-the-badge)
![PyMySQL](https://img.shields.io/badge/PyMySQL-MySQL_Client-F7DF1E?style=for-the-badge)
![MySQL Connector](https://img.shields.io/badge/MySQL_Connector-Driver-005C84?style=for-the-badge)
![YAML](https://img.shields.io/badge/YAML-Config-CC0000?style=for-the-badge)

## Features

### Admin
* Manage products and categories
* View orders and analytics
* Manage delivery staff
* Create discount offers

### Customer
* Browse products
* Add products to cart
* Place orders
* Leave reviews and ratings

### Seller
* Manage product listings
* Track sales

### Delivery
* Assign and track orders
* Rating system for delivery performance

---

## Screenshots

### DB
![DB](Screenshot/DatabaseDesign/DB.jpg)

### Activity Diagram
![Activity Diagram](Screenshot/UML/ActivityDiagram.png)

### Main Page
![Main Page](Screenshot/OnlineStore/MainPage.jpg)

### Entrance Selection
![Entrance Selection](Screenshot/OnlineStore/EntranceSelection.jpg)

### Store Products
![Store Products](Screenshot/OnlineStore/StoreProducts.jpg)

### Shopping Cart
![Shopping Cart](Screenshot/OnlineStore/ShoppingCart.jpg)

### Order Details
![Order Details](Screenshot/OnlineStore/OrderDetails.jpg)

### Admin Panel
![Admin Panel](Screenshot/AdminDashboard/AdminPanel.png)

---

## Database Structure

The database `online_store` includes the following main tables:

- admin
- customer
- seller
- delivery_boy
- product
- category
- cart
- orders
- offer
- product_feedback
- rates_order_delivery
- selects
- sells
- associated_with
- admin_views
- rating_table (view)

The schema supports:
- Product catalog with categories
- Shopping cart system
- Order management
- Delivery tracking
- Product reviews and ratings
- Discount offers
- Admin analytics

---

## Setup Instructions

### 1. Clone the repository

```bash
git clone <repo_url>
cd <project_folder>
```

### 2. Create database

Open MySQL and run:
```
CREATE DATABASE online_store;
USE online_store;
```

Then import the dump file:
```
mysql -u root -p online_store < dump.sql
```

### 3. Configure database connection

Create a file named database.yaml:
```
mysql_host: localhost
mysql_user: root
mysql_password: 1234
mysql_db: online_store
```

### 4. Install dependencies

```
pip install -r requirements.txt
```

### 5. Run the application
```
python app.py
```
or
```
python run.py
```
