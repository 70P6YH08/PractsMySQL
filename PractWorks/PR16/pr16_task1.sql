DROP TRIGGER customer_delete_before_trigger;

DELIMITER $$
CREATE TRIGGER customer_delete_before_trigger BEFORE DELETE ON customers
FOR EACH ROW
BEGIN
    DELETE FROM structure WHERE order_id in (SELECT order_id FROM orders WHERE customer_id = OLD.customer_id);
	DELETE FROM orders WHERE customer_id = OLD.customer_id;
END$$
DELIMITER ;

DELETE FROM customers
WHERE customer_id = 15;