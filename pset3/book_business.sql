DROP DATABASE IF EXISTS `education`;
CREATE DATABASE IF NOT EXISTS `education`; 
USE `education`;

SET NAMES UTF8MB4;
SET character_set_client = UTF8MB4;

-- --------------------------------------
--  TABLE Customer
-- --------------------------------------
CREATE TABLE `Customer` (
	`customer_id` 		int NOT NULL AUTO_INCREMENT,
	`Name` 				varchar (20) NOT NULL,
	`cust_order_num`	int NOT NULL ,
  	PRIMARY KEY (`customer_id`),	
	INDEX `Name` (`Name` ASC),
	INDEX `cust_order_num` (`cust_order_num` ASC)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------
--  TABLE Author
-- --------------------------------------
CREATE TABLE `Author` (
	`author_id` 		int NOT NULL AUTO_INCREMENT,
	`Name` 				varchar (20) NOT NULL,
	`num_pub_books`		int NOT NULL ,
  	PRIMARY KEY (`author_id`),	
	INDEX `Name` (`Name` ASC)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------
--  TABLE Editor
-- --------------------------------------
CREATE TABLE `Editor` (
	`editor_id` 		int NOT NULL AUTO_INCREMENT,
	`Name` 				varchar (20) NOT NULL,
	`num_pub_edited`		int NOT NULL ,
  	PRIMARY KEY (`editor_id`),	
	INDEX `Name` (`Name` ASC)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------
--  TABLE Publisher
-- --------------------------------------
CREATE TABLE `Publisher` (
	`publisher_id` 		int NOT NULL AUTO_INCREMENT,
	`Name` 				varchar (20) NOT NULL,
	`num_books_published`		int NOT NULL ,
  	PRIMARY KEY (`publisher_id`),	
	INDEX `Name` (`Name` ASC)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4 COLLATE=utf8mb4_0900_ai_ci;


-- --------------------------------------
--  TABLE Book
-- --------------------------------------

CREATE TABLE `Book` (
	`ISBN` 		int NOT NULL AUTO_INCREMENT,
	`book_name` 		varchar (20) NOT NULL ,
	`author_id`			int NOT NULL,	
	`editor_id`			int NOT NULL,	
	`publisher_id`		int NOT NULL,	
    `price` 			float NOT NULL ,	
	`author_royalty`	float NOT NULL ,
	`genre` 		    varchar (24) NULL ,	
  	PRIMARY KEY (`ISBN`, editor_id),	
	INDEX `book_name` (`book_name` ASC),
	INDEX `author_id` (`author_id` ASC),
	INDEX `editor_id` (`editor_id` ASC),
	INDEX `publisher_id` (`publisher_id` ASC),	
	INDEX `genre` (`genre` ASC),	
	FOREIGN KEY (`author_id`) REFERENCES `Author` (`author_id`),
	FOREIGN KEY (`editor_id`) REFERENCES `Editor` (`editor_id`),
	FOREIGN KEY (`publisher_id`) REFERENCES `Publisher` (`publisher_id`)

		ON DELETE NO ACTION
		ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------
--  TABLE Orders
-- --------------------------------------
CREATE TABLE `Orders` (
	`order_id` 		int NOT NULL,
	`customer_id` 	int NOT NULL ,
	`ISBN`			int NOT NULL ,
    `num_of_books` int Not Null,
  	PRIMARY KEY (`order_id`),	
	INDEX `order_id` (`order_id` ASC),
	FOREIGN KEY (`customer_id`) REFERENCES `Customer` (`customer_id`),
	FOREIGN KEY (`ISBN`) REFERENCES `Book` (`ISBN`)
    
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4 COLLATE=utf8mb4_0900_ai_ci;

