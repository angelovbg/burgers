-- MySQL dump 10.13  Distrib 8.0.22, for Linux (x86_64)
--
-- Host: localhost    Database: burger
-- ------------------------------------------------------
-- Server version	8.0.22

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `buns`
--

DROP TABLE IF EXISTS `buns`;
CREATE TABLE `buns` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_mdpvgrnkjq2wretoeoaa70l9v` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `buns`
--

LOCK TABLES `buns` WRITE;
/*!40000 ALTER TABLE `buns` DISABLE KEYS */;
INSERT INTO `buns` VALUES (2,'Ciabatta Roll'),(3,'English Muffin'),(1,'Kaiser Roll'),(4,'Potato Roll'),(5,'Pretzel Roll'),(6,'Sesame Seed Bun');
/*!40000 ALTER TABLE `buns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `burgers`
--

DROP TABLE IF EXISTS `burgers`;
CREATE TABLE `burgers` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `bun_id` int DEFAULT NULL,
  `calories` int DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `is_vegan` tinyint(1) DEFAULT '0',
  `is_vegetarian` tinyint(1) DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `weight` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_180kqyxxuldgqrt6xpv5l5v15` (`name`),
  KEY `FKbdij0rpghj7j8dudaylwpom67` (`bun_id`),
  CONSTRAINT `FKbdij0rpghj7j8dudaylwpom67` FOREIGN KEY (`bun_id`) REFERENCES `buns` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `burgers`
--

LOCK TABLES `burgers` WRITE;
/*!40000 ALTER TABLE `burgers` DISABLE KEYS */;
INSERT INTO `burgers` VALUES (1,1,2000,'https://realfood.tesco.com/media/images/Burger-31LGH-a296a356-020c-4969-86e8-d8c26139f83f-0-1400x919.jpg',0,0,'Beef',4.5,400),(2,2,1300,'http://www.foodsofourlives.com/wp-content/uploads/2011/12/Elk-Burger-3.jpg',0,0,'Elk',3.88,200),(3,4,1800,'https://www.babemadeblog.com/wp-content/uploads/2018/07/Mushroom-5.jpg',0,0,'Portobello Mushroom',3.99,300),(4,2,800,'https://assets.bonappetit.com/photos/57acae2d1b33404414975121/4:3/w_3235,h_2426,c_limit/ultimate-veggie-burger.jpg',1,1,'Veggie',6.19,350),(5,1,1400,'https://www.cookingclassy.com/wp-content/uploads/2019/05/turkey-burger-12.jpg',0,0,'Turkey',8.99,450),(6,5,1800,'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/190523-bison-burger-161-horizontal-1559053724.png',0,0,'Bison',6.99,400),(7,2,1700,'https://pamelasalzman.com/wp-content/uploads//2018/05/2018-04-27-Pamela-Salzman-Web-Size-309-copy-588x882.jpg',0,0,'Wild Salmon',5.49,350),(8,1,1000,'https://cdn.sallysbakingaddiction.com/wp-content/uploads/2018/07/best-black-bean-burgers-2.jpg',0,0,'Black Bean',4.99,400),(9,4,1300,'https://cdnimg.webstaurantstore.com/images/products/large/528385/1940947.jpg',1,1,'Beyond Meat',7.29,350),(10,6,1800,'https://torontolife.com/wp-content/uploads/2013/07/TL-recipe-burger.jpg',0,0,'The harbord room',4.99,300),(11,5,2000,NULL,0,0,'Marben',6.19,500),(12,2,1400,NULL,0,0,'The stockyeards',3.99,200),(13,1,2000,NULL,0,0,'Nota bene',4.99,300),(14,4,1700,NULL,0,0,'Holy Chuck',4.99,400),(15,6,2000,NULL,0,0,'Bymark',5.49,250),(16,1,1700,NULL,0,1,'Allens',4.99,300),(17,5,2000,NULL,0,0,'The country general',7.29,500),(18,1,1800,NULL,0,0,'The Waldorf',8.99,550),(19,1,1750,NULL,0,0,'The Highwayman',5.49,300),(20,2,1800,NULL,0,0,'The Sheboygan',8.99,450),(21,1,1400,NULL,0,0,'The Caugh Potato',7.29,400),(22,4,1500,NULL,1,1,'The farmer John',4.99,350),(23,2,2000,NULL,0,0,'The Mona Lisa',5.49,300),(24,5,1400,NULL,0,0,'The Honky Tonk',3.99,250),(25,2,2200,NULL,0,0,'The Johny Appleseed',6.99,400),(26,3,1700,NULL,0,0,'The Havana',4.99,500),(27,1,1900,NULL,0,0,'The Bohemian',6.99,400),(28,2,2500,NULL,0,0,'The Isabella',8.99,550),(29,5,1700,NULL,0,0,'The Handyman',5.49,300),(30,4,1500,NULL,0,0,'The Auth Millie',5.49,250),(31,1,1800,NULL,0,0,'The Big Ben',6.99,400);
/*!40000 ALTER TABLE `burgers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `burgers_ingredients`
--

DROP TABLE IF EXISTS `burgers_ingredients`;
CREATE TABLE `burgers_ingredients` (
  `burger_id` bigint NOT NULL,
  `ingredient_id` int NOT NULL,
  PRIMARY KEY (`burger_id`,`ingredient_id`),
  KEY `FK8kef10uoglkfmy482n4koav0` (`ingredient_id`),
  CONSTRAINT `FK8kef10uoglkfmy482n4koav0` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredients` (`id`),
  CONSTRAINT `FKsacj2ltvbu0qms951xy3am88g` FOREIGN KEY (`burger_id`) REFERENCES `burgers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `burgers_ingredients`
--

LOCK TABLES `burgers_ingredients` WRITE;
/*!40000 ALTER TABLE `burgers_ingredients` DISABLE KEYS */;
INSERT INTO `burgers_ingredients` VALUES (1,1),(3,1),(4,1),(5,1),(2,2),(4,2),(2,5),(5,5),(1,6),(2,6),(3,6),(4,6),(5,6),(2,7),(4,8),(5,8),(1,11),(3,11),(4,11);
/*!40000 ALTER TABLE `burgers_ingredients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `burgers_meats`
--

DROP TABLE IF EXISTS `burgers_meats`;
CREATE TABLE `burgers_meats` (
  `burger_id` bigint NOT NULL,
  `meat_id` bigint NOT NULL,
  PRIMARY KEY (`burger_id`,`meat_id`),
  KEY `FKpws17e418q7xlaaid9rfwniy9` (`meat_id`),
  CONSTRAINT `FK83vxosh1vxw8x16svi77g4vq7` FOREIGN KEY (`burger_id`) REFERENCES `burgers` (`id`),
  CONSTRAINT `FKpws17e418q7xlaaid9rfwniy9` FOREIGN KEY (`meat_id`) REFERENCES `meats` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `burgers_meats`
--

LOCK TABLES `burgers_meats` WRITE;
/*!40000 ALTER TABLE `burgers_meats` DISABLE KEYS */;
INSERT INTO `burgers_meats` VALUES (1,1),(6,1),(12,1),(13,1),(10,2),(11,2),(3,3),(14,3),(15,3),(5,5),(7,6),(9,8);
/*!40000 ALTER TABLE `burgers_meats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `burgers_nuts`
--

DROP TABLE IF EXISTS `burgers_nuts`;
CREATE TABLE `burgers_nuts` (
  `burger_id` bigint NOT NULL,
  `nut_id` int NOT NULL,
  `sauce_id` int NOT NULL,
  PRIMARY KEY (`burger_id`,`nut_id`),
  KEY `FKknxw56naen2s7pqc2svg6tv2d` (`nut_id`),
  CONSTRAINT `FKdc838nh8lymyb2r6xewy4sfdu` FOREIGN KEY (`burger_id`) REFERENCES `burgers` (`id`),
  CONSTRAINT `FKknxw56naen2s7pqc2svg6tv2d` FOREIGN KEY (`nut_id`) REFERENCES `nuts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `burgers_nuts`
--

LOCK TABLES `burgers_nuts` WRITE;
/*!40000 ALTER TABLE `burgers_nuts` DISABLE KEYS */;
INSERT INTO `burgers_nuts` VALUES (1,1,0);
/*!40000 ALTER TABLE `burgers_nuts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `burgers_sauces`
--

DROP TABLE IF EXISTS `burgers_sauces`;
CREATE TABLE `burgers_sauces` (
  `burger_id` bigint NOT NULL,
  `sauce_id` int NOT NULL,
  PRIMARY KEY (`burger_id`,`sauce_id`),
  KEY `FKa42cckn6t4g7561grcm9bmget` (`sauce_id`),
  CONSTRAINT `FKa42cckn6t4g7561grcm9bmget` FOREIGN KEY (`sauce_id`) REFERENCES `sauces` (`id`),
  CONSTRAINT `FKpsrtmpp1g3ugiaajqib5xuydc` FOREIGN KEY (`burger_id`) REFERENCES `burgers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `burgers_sauces`
--

LOCK TABLES `burgers_sauces` WRITE;
/*!40000 ALTER TABLE `burgers_sauces` DISABLE KEYS */;
INSERT INTO `burgers_sauces` VALUES (1,1),(2,3),(1,5),(4,5),(1,6),(3,6),(3,8),(2,9),(5,9);
/*!40000 ALTER TABLE `burgers_sauces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredients`
--

DROP TABLE IF EXISTS `ingredients`;
CREATE TABLE `ingredients` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_j6tsl15xx76y4kv41yxr4uxab` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ingredients`
--

LOCK TABLES `ingredients` WRITE;
/*!40000 ALTER TABLE `ingredients` DISABLE KEYS */;
INSERT INTO `ingredients` VALUES (3,'broccoli'),(4,'cabbage'),(11,'cheese'),(2,'cucumber'),(10,'egg'),(9,'garlic'),(6,'lettuce'),(8,'onion'),(5,'potato'),(7,'spinach'),(1,'tomato');
/*!40000 ALTER TABLE `ingredients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meats`
--

DROP TABLE IF EXISTS `meats`;
CREATE TABLE `meats` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_b0eoqu7wn2rcbmdu8luit6pa1` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `meats`
--

LOCK TABLES `meats` WRITE;
/*!40000 ALTER TABLE `meats` DISABLE KEYS */;
INSERT INTO `meats` VALUES (1,'Beef'),(8,'Beyond Meat'),(3,'Chicken'),(4,'Lamb'),(2,'Pork'),(7,'Rabbit'),(6,'Seafood'),(5,'Turkey');
/*!40000 ALTER TABLE `meats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nuts`
--

DROP TABLE IF EXISTS `nuts`;
CREATE TABLE `nuts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_c855tlo0hkk36sba7ychow108` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `nuts`
--

LOCK TABLES `nuts` WRITE;
/*!40000 ALTER TABLE `nuts` DISABLE KEYS */;
INSERT INTO `nuts` VALUES (1,'Almonds'),(8,'Brazil Nuts'),(5,'Cashews'),(2,'Elk'),(9,'Hazelnuts'),(7,'Macadamia Nuts'),(6,'Pecans'),(3,'Pistachios'),(4,'Walnuts');
/*!40000 ALTER TABLE `nuts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sauces`
--

DROP TABLE IF EXISTS `sauces`;
CREATE TABLE `sauces` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_1ph5w71q8nid74tile8ec7lu6` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sauces`
--

LOCK TABLES `sauces` WRITE;
/*!40000 ALTER TABLE `sauces` DISABLE KEYS */;
INSERT INTO `sauces` VALUES (2,'Brown'),(3,'Butter'),(4,'Green'),(1,'Ketchup'),(6,'Meat-based'),(7,'Pink'),(8,'Sweet'),(5,'Tomato'),(9,'White');
/*!40000 ALTER TABLE `sauces` ENABLE KEYS */;
UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-23 23:19:40
