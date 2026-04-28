DROP TRIGGER order_insert_before_trigger;

DELIMITER $$
CREATE TRIGGER order_insert_before_trigger BEFORE INSERT ON orders
FOR EACH ROW
BEGIN
	SET NEW.datetime_order = curdate();
END$$
DELIMITER ;

INSERT INTO orders(order_id, customer_id, datetime_order)
VALUES(27, 16, '2025-12-12')