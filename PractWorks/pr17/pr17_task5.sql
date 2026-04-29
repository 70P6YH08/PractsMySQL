DROP USER 'userTask5'@'localhost';

CREATE USER 'userTask5'@'localhost';

GRANT select(book_id, title, price), update(price)
ON pr1.books
TO 'userTask5'@'localhost';
