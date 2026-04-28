CREATE TABLE delete_customers LIKE customers;
ALTER TABLE delete_customers ADD date_delete_record DATETIME;

DELIMITER $$
CREATE TRIGGER customer_delete_trigger AFTER DELETE ON customers
FOR EACH ROW
BEGIN
INSERT INTO delete_customers (customer_id, login, surname, name, addres, phone, date_delete_record)
VALUES(OLD.customer_id, OLD.login, OLD.surname, OLD.name, OLD.addres, OLD.phone, curdate());
END$$
DELIMITER ;

	
DROP TRIGGER customer_delete_trigger;

DELETE FROM customers
WHERE customer_id = 103;