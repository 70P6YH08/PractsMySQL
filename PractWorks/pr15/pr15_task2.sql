CREATE TABLE logs_table(
	names_tables VARCHAR(50),
    operations VARCHAR(100),
    date_time DATETIME,
    user_current VARCHAR(50)
);

DELIMITER $$
CREATE TRIGGER book_delete_trigger AFTER DELETE ON books
FOR EACH ROW
BEGIN
INSERT INTO logs_table (names_tables, operations, date_time, user_current)
VALUES('books', 'удаление', curdate(), current_user);
END$$
DELIMITER ;



DELIMITER $$
CREATE TRIGGER order_delete_trigger AFTER DELETE ON orders
FOR EACH ROW
BEGIN
	DELETE FROM customers WHERE customer_id not in (SELECT customer_id FROM orders);
	INSERT INTO logs_table (names_tables, operations, date_time, user_current)
	VALUES('orders', 'удаление', curdate(), current_user);
END$$
DELIMITER ;




DELIMITER $$
CREATE TRIGGER book_update_trigger AFTER UPDATE ON books
FOR EACH ROW
BEGIN
INSERT INTO logs_table (names_tables, operations, date_time, user_current)
VALUES('books', 'обновление', curdate(), current_user);
END$$
DELIMITER ;


DELIMITER $$
CREATE TRIGGER order_update_trigger AFTER UPDATE ON orders
FOR EACH ROW
BEGIN
INSERT INTO logs_table (names_tables, operations, date_time, user_current)
VALUES('orders', 'обновление', curdate(), current_user);
END$$
DELIMITER ;


DELIMITER $$
CREATE TRIGGER book_insert_trigger AFTER INSERT ON books
FOR EACH ROW
BEGIN
INSERT INTO logs_table (names_tables, operations, date_time, user_current)
VALUES('books', 'добавление', curdate(), current_user);
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER order_insert_trigger AFTER INSERT ON orders
FOR EACH ROW
BEGIN
INSERT INTO logs_table (names_tables, operations, date_time, user_current)
VALUES('orders', 'добавление', curdate(), current_user);
END$$
DELIMITER ;


DROP TRIGGER book_delete_trigger;
DROP TRIGGER order_delete_trigger;
DROP TRIGGER book_update_trigger;
DROP TRIGGER order_update_trigger;
DROP TRIGGER book_insert_trigger;
DROP TRIGGER order_insert_trigger;



DELETE FROM books
WHERE book_id = 27;

DELETE FROM orders
WHERE order_id = 10;

UPDATE books
SET price = price + price * (-5/100)
WHERE book_id = 2;

UPDATE orders
SET customer_id = customer_id + 1
WHERE order_id = 11;

INSERT INTO books(book_id, author_id, title, genre, price, weight, pages, public_year)
VALUES(20, 2, "2 БАРАНА", "поэзия", 2324, 7, 200, 2026);

INSERT INTO orders(order_id, customer_id, datetime_order)
VALUES(138, 2, curdate());















