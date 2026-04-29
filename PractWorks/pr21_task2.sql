SELECT * FROM new_pr1.books;
DELETE FROM books WHERE book_id = 73;

DROP TRIGGER delete_book_before_trigger;

DELIMITER $$
CREATE TRIGGER delete_book_before_trigger BEFORE DELETE ON books
FOR EACH ROW
BEGIN
	DELETE FROM structure WHERE book_id = OLD.book_id;
END$$
DELIMITER ;