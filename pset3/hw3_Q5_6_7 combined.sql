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


-- --------------------------------------
--  POPULATE Customer
-- --------------------------------------

INSERT INTO `Customer` VALUES(1,'Jake',3);
INSERT INTO `Customer` VALUES(2,'John',4);
INSERT INTO `Customer` VALUES(3,'Abel',5);
INSERT INTO `Customer` VALUES(4,'Aramael',6);
INSERT INTO `Customer` VALUES(5,'Mikaela',7);


-- --------------------------------------
--  POPULATE Author
-- --------------------------------------

INSERT INTO `Author` VALUES(1,'Tony',13);
INSERT INTO `Author` VALUES(2,'Matt',24);
INSERT INTO `Author` VALUES(3,'Lisa',35);
INSERT INTO `Author` VALUES(4,'Kate',46);
INSERT INTO `Author` VALUES(5,'Tommy',57);

-- --------------------------------------
--  POPULATE Editor
-- --------------------------------------

INSERT INTO `Editor` VALUES(1,'Alexis',8);
INSERT INTO `Editor` VALUES(2,'Jamie',9);
INSERT INTO `Editor` VALUES(3,'Jim',10);
INSERT INTO `Editor` VALUES(4,'Morgan',11);
INSERT INTO `Editor` VALUES(5,'Beans',12);
INSERT INTO `Editor` VALUES(6,'Linds',18);

-- --------------------------------------
--  POPULATE Publisher
-- --------------------------------------

INSERT INTO `Publisher` VALUES(1,'Rick',78);
INSERT INTO `Publisher` VALUES(2,'Gen',69);
INSERT INTO `Publisher` VALUES(3,'Janna',50);
INSERT INTO `Publisher` VALUES(4,'Josh',41);
INSERT INTO `Publisher` VALUES(5,'Lolo',32);

-- --------------------------------------
--  POPULATE Book
-- --------------------------------------

INSERT INTO `Book` VALUES(1, 'LOTR', 1, 1, 1, 20, 2, 'Fiction');
INSERT INTO `Book` VALUES(2, 'Harry Potter',2,2,2, 25, 4, 'Fiction');
INSERT INTO `Book` VALUES(2, 'Harry Potter',2,6,2, 25, 4, 'Fiction');
INSERT INTO `Book` VALUES(2, 'Harry Potter',2,5,2, 25, 4, 'Fiction');
INSERT INTO `Book` VALUES(3, 'Lincoln',3,3,3, 15, 3, 'Non-Fiction');
INSERT INTO `Book` VALUES(4, 'To Kill a M',4,4,4, 28, 2.5, 'Fiction');
INSERT INTO `Book` VALUES(5, 'Three Body Problem',5,5,5, 18, 1, 'Sci-Fi');
INSERT INTO `Book` VALUES(6, 'Invention of Wings',1,3,2, 10, 2.67, 'Historical Fiction');

-- --------------------------------------
--  POPULATE Orders
-- --------------------------------------

INSERT INTO `Orders` VALUES(1,'1',1,4);
INSERT INTO `Orders` VALUES(2,'2',1,3);
INSERT INTO `Orders` VALUES(4,'3',2,7);
INSERT INTO `Orders` VALUES(13,'1',6,6);
INSERT INTO `Orders` VALUES(22,'3',6,4);
INSERT INTO `Orders` VALUES(31,'5',5,2);
INSERT INTO `Orders` VALUES(41,'5',4,9);
INSERT INTO `Orders` VALUES(33,'2',2,5);
INSERT INTO `Orders` VALUES(53,'4',4,3);
INSERT INTO `Orders` VALUES(23,'2',3,2);
INSERT INTO `Orders` VALUES(55,'2',6,1);
INSERT INTO `Orders` VALUES(37,'4',5,1);
INSERT INTO `Orders` VALUES(38,'1',5,1);


-- --------------------------------------
--  7.1. Books per author.
-- --------------------------------------
	
select A.Name, A.num_pub_books
From Author A;


-- --------------------------------------
--  7.2. Authors per book.
-- --------------------------------------

select B.book_name, A.Name
from Book B
INNER JOIN Author A
ON B.author_id = A.author_id;

-- --------------------------------------
--  7.3. Author royalties on a book.
-- --------------------------------------

select B.book_name, B.author_royalty, A.Name
from Book B
INNER JOIN Author A
ON B.author_id = A.author_id;

-- --------------------------------------
--  7.4. Book royalties per author.
-- --------------------------------------

select A.Name, sum(B.Author_royalty)
from Book B
INNER JOIN Author A
ON B.author_id = A.author_id
Group By A.Name;

-- --------------------------------------
--  7.5. Books in a genre.
-- --------------------------------------

select count(B.book_name), B.genre
from Book B
Group By B.genre;

-- --------------------------------------
--  7.6. Books published by a publisher.
-- --------------------------------------
select count(B.book_name), B.publisher_id
from Book B
Group By B.publisher_id;

-- --------------------------------------
--  7.7. Editors per book.
-- --------------------------------------
Select B.book_name, count(B.editor_id)
From Book B
Inner JOIN Editor E
on B.editor_id = E.editor_id
Group By B.book_name;


-- --------------------------------------
--  7.8. Books per editor.
-- --------------------------------------
Select count(B.editor_id), E.Name
From Book B
Inner JOIN Editor E
on B.editor_id = E.editor_id
Group By E.Name;

-- or for their career count (beyond this data set)
Select E.num_pub_edited, E.Name
From Editor E;

-- --------------------------------------
--  7.9. Books in an order.
-- --------------------------------------
Select O.order_id, O.num_of_books
From Orders O;

-- --------------------------------------
--  7.10. Orders for a book.
-- --------------------------------------
Select B.book_name, count(O.ISBN)

from Book B
right JOIN Orders O
on B.ISBN = O.ISBN
group by B.book_name;


-- --------------------------------------
--  7.11. Customer orders.
-- --------------------------------------
select count(O.customer_id)
from Orders O;



-- --------------------------------------
--  7.12. Orders per customer.
-- --------------------------------------

select C.Name, O.customer_id, count(O.customer_id)
From Orders O
Inner Join Customer C
on O.customer_id = C.customer_id
group by O.customer_id
order by O.customer_id

