DROP TRIGGER book_insert_before_trigger;

DELIMITER $$
CREATE TRIGGER book_insert_before_trigger BEFORE INSERT ON books
FOR EACH ROW
BEGIN
	SET NEW.price = CASE
    WHEN NEW.price > 5000 THEN 5000
        ELSE NEW.price
    END;
END$$
DELIMITER ;

INSERT books(author_id, title, genre, price, weight, pages, public_year)
VALUES(35, "ASDAFDG", "проза", 5425.01, 0.2, 32, 1896);