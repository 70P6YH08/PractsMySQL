ALTER TABLE books ADD COLUMN count SMALLINT DEFAULT 100;
UPDATE books SET count = 50 WHERE book_id > 0;

DROP TRIGGER structure_insert_before_trigger;

DELIMITER $$
CREATE TRIGGER structure_insert_before_trigger BEFORE INSERT ON structure
FOR EACH ROW
BEGIN
	UPDATE books
    SET count = count - NEW.count
    WHERE book_id = NEW.book_id;
END$$
DELIMITER ;

INSERT INTO structure(book_id, order_id, count)
VALUES(6, 1205, 17);