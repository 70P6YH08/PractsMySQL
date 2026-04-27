delete from customers
where customer_id not in (SELECT customer_id FROM orders);

SELECT * from customers