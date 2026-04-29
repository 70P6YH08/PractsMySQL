DROP TRIGGER order_insert_before_trigger;

DELIMITER $$
CREATE TRIGGER order_insert_before_trigger BEFORE INSERT ON orders
FOR EACH ROW
BEGIN
	SET NEW.datetime_order = now();
END$$
DELIMITER ;

INSERT INTO orders(order_id, customer_id, datetime_order)
VALUES(1212, 101, '2025-12-12')