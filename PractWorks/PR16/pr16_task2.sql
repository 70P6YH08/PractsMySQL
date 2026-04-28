DROP TRIGGER customer_insert_before_trigger;

DELIMITER $$
CREATE TRIGGER customer_insert_before_trigger BEFORE INSERT ON books
FOR EACH ROW
BEGIN
    CASE
    WHEN price > 5000 THEN SET NEW.price = 5000;
    else SET NEW.price = price;
    end case;
END$$
DELIMITER ;

DELETE FROM customers
WHERE customer_id = 104;