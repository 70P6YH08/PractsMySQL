DROP TRIGGER structure_insert_trigger;
SET @orderCost = 0;
SELECT @orderCost;

CREATE TRIGGER structure_insert_trigger AFTER INSERT ON structure
FOR EACH ROW
	SET @orderCost = (
			SELECT SUM(books.price * structure.count)
			FROM structure
			LEFT JOIN books ON structure.book_id = books.book_id
            LEFT JOIN orders ON structure.order_id = orders.order_id
			WHERE structure.order_id = NEW.order_id);
        
INSERT INTO structure (book_id, order_id, count) VALUES (3, 3, 2);
        
SELECT @orderCost;