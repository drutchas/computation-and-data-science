
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
