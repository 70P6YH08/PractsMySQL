SELECT * FROM new_pr1.books;
DELETE FROM books WHERE book_id = 2;

DROP TRIGGER delete_book_before_trigger;

DELIMITER $$
CREATE TRIGGER delete_book_before_trigger BEFORE DELETE ON books
FOR EACH ROW
BEGIN
	DELETE FROM structure WHERE book_id = OLD.book_id;
END$$
DELIMITER ;

insert into books(author_id, title, genre, price, weight, pages, public_year, count)
VALUES(2, "asd", "проза", 335, 2, 2, 45, 224);

-- insert into book(AuthorId, Title, Genre, Price, Weight, PageCount, ReleaseYear)
-- VALUES(2, "фывфы", "проза", 2653, 2, 23, 2025);

ALTER TABLE books DROP COLUMN price;

ALTER TABLE books ADD COLUMN price SMALLINT;

DESCRIBE books;

EXPLAIN SELECT * FROM books WHERE price = 100;