create table tempBooks
(
	surname varchar(50),
    name varchar(50),
    title_book varchar(50),
    price_book decimal(6,2)
);

INSERT into tempBooks (surname, name, title_book, price_book) 
SELECT authors.surname, authors.name, books.title, books.price
from authors
inner join books on authors.author_id = books.author_id