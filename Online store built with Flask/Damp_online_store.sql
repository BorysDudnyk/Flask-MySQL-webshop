-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: online_store
-- ------------------------------------------------------
-- Server version	8.0.40

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `Admin_ID` int NOT NULL AUTO_INCREMENT,
  `First_Name` varchar(15) NOT NULL,
  `Last_Name` varchar(15) DEFAULT NULL,
  `Admin_Password` varchar(20) NOT NULL,
  PRIMARY KEY (`Admin_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `admin_views`
--

DROP TABLE IF EXISTS `admin_views`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_views` (
  `Admin_ID` int NOT NULL,
  `Order_ID` int NOT NULL,
  `No_Of_Orders_Viewed` int DEFAULT NULL,
  PRIMARY KEY (`Order_ID`,`Admin_ID`),
  KEY `admin_views_admin_Admin_ID_fk` (`Admin_ID`),
  CONSTRAINT `admin_views_admin_Admin_ID_fk` FOREIGN KEY (`Admin_ID`) REFERENCES `admin` (`Admin_ID`) ON DELETE CASCADE,
  CONSTRAINT `admin_views_orders_Order_ID_fk` FOREIGN KEY (`Order_ID`) REFERENCES `orders` (`Order_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `associated_with`
--

DROP TABLE IF EXISTS `associated_with`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `associated_with` (
  `Customer_ID` int NOT NULL,
  `Cart_ID` int NOT NULL,
  `Product_ID` int NOT NULL,
  PRIMARY KEY (`Customer_ID`,`Cart_ID`,`Product_ID`),
  KEY `Associated_With_cart_Cart_ID_fk` (`Cart_ID`),
  KEY `Associated_With_product_Product_ID_fk` (`Product_ID`),
  CONSTRAINT `associated_with_cart_Cart_ID_fk` FOREIGN KEY (`Cart_ID`) REFERENCES `cart` (`Cart_ID`) ON DELETE CASCADE,
  CONSTRAINT `Associated_With_customer_Customer_ID_fk` FOREIGN KEY (`Customer_ID`) REFERENCES `customer` (`Customer_ID`) ON DELETE CASCADE,
  CONSTRAINT `Associated_With_product_Product_ID_fk` FOREIGN KEY (`Product_ID`) REFERENCES `product` (`Product_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `Cart_ID` int NOT NULL AUTO_INCREMENT,
  `Total_Value` int DEFAULT NULL,
  `Total_Count` int DEFAULT NULL,
  `Offer_ID` int DEFAULT NULL,
  `Final_Amount` int NOT NULL,
  PRIMARY KEY (`Cart_ID`),
  KEY `cart_offer_Offer_ID_fk` (`Offer_ID`),
  KEY `totalcount` (`Total_Count`),
  KEY `finalvalue` (`Final_Amount`),
  CONSTRAINT `cart_offer_Offer_ID_fk` FOREIGN KEY (`Offer_ID`) REFERENCES `offer` (`Offer_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `Category_ID` int NOT NULL AUTO_INCREMENT,
  `Category_Name` varchar(30) NOT NULL,
  PRIMARY KEY (`Category_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `Customer_ID` int NOT NULL AUTO_INCREMENT,
  `First_Name` varchar(15) NOT NULL,
  `Last_Name` varchar(15) DEFAULT NULL,
  `Email` varchar(35) NOT NULL,
  `Mobile_No` varchar(14) NOT NULL,
  `Password` varchar(20) NOT NULL,
  PRIMARY KEY (`Customer_ID`),
  KEY `customerpassword` (`Password`)
) ENGINE=InnoDB AUTO_INCREMENT=231 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `delivery_boy`
--

DROP TABLE IF EXISTS `delivery_boy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_boy` (
  `Delivery_Boy_ID` int NOT NULL AUTO_INCREMENT,
  `First_Name` varchar(15) NOT NULL,
  `Last_Name` varchar(15) DEFAULT NULL,
  `Mobile_No` varchar(10) NOT NULL,
  `Email` varchar(35) NOT NULL,
  `Password` varchar(20) NOT NULL,
  `Average_Rating` decimal(3,2) DEFAULT NULL,
  `Admin_ID` int NOT NULL,
  PRIMARY KEY (`Delivery_Boy_ID`),
  KEY `delivery_boy_admin_Admin_ID_fk` (`Admin_ID`),
  KEY `deliveryboyavgrating` (`Average_Rating`),
  CONSTRAINT `delivery_boy_admin_Admin_ID_fk` FOREIGN KEY (`Admin_ID`) REFERENCES `admin` (`Admin_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `offer`
--

DROP TABLE IF EXISTS `offer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `offer` (
  `Offer_ID` int NOT NULL AUTO_INCREMENT,
  `Promo_Code` varchar(20) NOT NULL,
  `Percentage_Discount` int NOT NULL,
  `Min_OrderValue` int NOT NULL,
  `Max_Discount` int NOT NULL,
  `Admin_ID` int NOT NULL,
  PRIMARY KEY (`Offer_ID`),
  KEY `offer_admin_Admin_ID_fk` (`Admin_ID`),
  CONSTRAINT `offer_admin_Admin_ID_fk` FOREIGN KEY (`Admin_ID`) REFERENCES `admin` (`Admin_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `Order_ID` int NOT NULL AUTO_INCREMENT,
  `Mode` varchar(15) DEFAULT NULL,
  `Amount` int DEFAULT NULL,
  `City` varchar(15) DEFAULT NULL,
  `State` varchar(25) DEFAULT NULL,
  `Order_Time` varchar(20) DEFAULT NULL,
  `House_Flat_No` varchar(30) DEFAULT NULL,
  `Pincode` varchar(10) DEFAULT NULL,
  `Cart_ID` int DEFAULT NULL,
  `Date` varchar(20) DEFAULT NULL,
  `Delivery_Boy_ID` int NOT NULL,
  PRIMARY KEY (`Order_ID`),
  KEY `orders_cart_Cart_ID_fk` (`Cart_ID`),
  KEY `orders_delivery_boy_Delivery_Boy_ID_fk` (`Delivery_Boy_ID`),
  KEY `ordermode` (`Mode`),
  CONSTRAINT `orders_cart_Cart_ID_fk` FOREIGN KEY (`Cart_ID`) REFERENCES `cart` (`Cart_ID`) ON DELETE CASCADE,
  CONSTRAINT `orders_delivery_boy_Delivery_Boy_ID_fk` FOREIGN KEY (`Delivery_Boy_ID`) REFERENCES `delivery_boy` (`Delivery_Boy_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `Product_ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(35) NOT NULL,
  `Price` int NOT NULL,
  `Brand` varchar(15) DEFAULT NULL,
  `Measurement` varchar(15) DEFAULT NULL,
  `Admin_ID` int DEFAULT NULL,
  `Category_ID` int DEFAULT NULL,
  `Unit` varchar(15) NOT NULL,
  PRIMARY KEY (`Product_ID`),
  KEY `product_admin_Admin_ID_fk` (`Admin_ID`),
  KEY `product_category_Category ID_fk` (`Category_ID`),
  KEY `priceindex` (`Price`),
  CONSTRAINT `product_admin_Admin_ID_fk` FOREIGN KEY (`Admin_ID`) REFERENCES `admin` (`Admin_ID`) ON DELETE SET NULL,
  CONSTRAINT `product_category_Category ID_fk` FOREIGN KEY (`Category_ID`) REFERENCES `category` (`Category_ID`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `product_feedback`
--

DROP TABLE IF EXISTS `product_feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_feedback` (
  `Review_ID` int NOT NULL AUTO_INCREMENT,
  `Rating` int DEFAULT NULL,
  `Review_Body` varchar(50) DEFAULT NULL,
  `Product_ID` int NOT NULL,
  `Customer_ID` int DEFAULT NULL,
  `Review_Date` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Review_ID`,`Product_ID`),
  KEY `product_feedback_customer_Customer_ID_fk` (`Customer_ID`),
  KEY `product_feedback_product_Product_ID_fk` (`Product_ID`),
  KEY `productreview` (`Rating`,`Product_ID`),
  CONSTRAINT `product_feedback_customer_Customer_ID_fk` FOREIGN KEY (`Customer_ID`) REFERENCES `customer` (`Customer_ID`) ON DELETE SET NULL,
  CONSTRAINT `product_feedback_product_Product_ID_fk` FOREIGN KEY (`Product_ID`) REFERENCES `product` (`Product_ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rates_order_delivery`
--

DROP TABLE IF EXISTS `rates_order_delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rates_order_delivery` (
  `Order_ID` int NOT NULL,
  `Delivery_Boy_ID` int NOT NULL,
  `Customer_ID` int NOT NULL,
  `Rating_Given` int NOT NULL,
  PRIMARY KEY (`Order_ID`),
  KEY `rates_order_delivery_customer_Customer_ID_fk` (`Customer_ID`),
  KEY `rates_order_delivery_delivery_boy_Delivery_Boy_ID_fk` (`Delivery_Boy_ID`),
  KEY `customerratingdeliveryboy` (`Customer_ID`,`Rating_Given`),
  CONSTRAINT `rates_order_delivery_customer_Customer_ID_fk` FOREIGN KEY (`Customer_ID`) REFERENCES `customer` (`Customer_ID`) ON UPDATE CASCADE,
  CONSTRAINT `rates_order_delivery_delivery_boy_Delivery_Boy_ID_fk` FOREIGN KEY (`Delivery_Boy_ID`) REFERENCES `delivery_boy` (`Delivery_Boy_ID`) ON UPDATE CASCADE,
  CONSTRAINT `rates_order_delivery_orders_Order_ID_fk` FOREIGN KEY (`Order_ID`) REFERENCES `orders` (`Order_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `rating_table`
--

DROP TABLE IF EXISTS `rating_table`;
/*!50001 DROP VIEW IF EXISTS `rating_table`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `rating_table` AS SELECT 
 1 AS `Average_Rating`,
 1 AS `Product_ID`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `selects`
--

DROP TABLE IF EXISTS `selects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `selects` (
  `Customer_ID` int NOT NULL,
  `Category_ID` int NOT NULL,
  PRIMARY KEY (`Customer_ID`,`Category_ID`),
  KEY `selects_category_Category_ID_fk` (`Category_ID`),
  CONSTRAINT `selects_category_Category_ID_fk` FOREIGN KEY (`Category_ID`) REFERENCES `category` (`Category_ID`) ON DELETE CASCADE,
  CONSTRAINT `selects_customer_Customer_ID_fk` FOREIGN KEY (`Customer_ID`) REFERENCES `customer` (`Customer_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seller`
--

DROP TABLE IF EXISTS `seller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seller` (
  `Seller_ID` int NOT NULL AUTO_INCREMENT,
  `First_Name` varchar(15) NOT NULL,
  `Last_Name` varchar(15) DEFAULT NULL,
  `Email` varchar(35) NOT NULL,
  `Phone_Number` varchar(15) NOT NULL,
  `Password` varchar(30) NOT NULL,
  `Place_Of_Operation` varchar(30) DEFAULT NULL,
  `Admin_ID` int DEFAULT NULL,
  PRIMARY KEY (`Seller_ID`),
  KEY `Seller_admin_Admin_ID_fk` (`Admin_ID`),
  CONSTRAINT `Seller_admin_Admin_ID_fk` FOREIGN KEY (`Admin_ID`) REFERENCES `admin` (`Admin_ID`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sells`
--

DROP TABLE IF EXISTS `sells`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sells` (
  `Seller_ID` int NOT NULL,
  `Product_ID` int NOT NULL,
  `No_of_Product_Sold` int DEFAULT NULL,
  PRIMARY KEY (`Product_ID`,`Seller_ID`),
  KEY `sells_seller_Seller_ID_fk` (`Seller_ID`),
  CONSTRAINT `sells_product_Product_ID_fk` FOREIGN KEY (`Product_ID`) REFERENCES `product` (`Product_ID`) ON DELETE CASCADE,
  CONSTRAINT `sells_seller_Seller_ID_fk` FOREIGN KEY (`Seller_ID`) REFERENCES `seller` (`Seller_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Final view structure for view `rating_table`
--

/*!50001 DROP VIEW IF EXISTS `rating_table`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `rating_table` AS select avg(`product_feedback`.`Rating`) AS `Average_Rating`,`product_feedback`.`Product_ID` AS `Product_ID` from `product_feedback` group by `product_feedback`.`Product_ID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-29 15:51:30
