

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
