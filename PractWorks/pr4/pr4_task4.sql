select customers.login,
	count(distinct orders.order_id) as orders_count,
	sum(structure.count * books.price) as total_order_price,
    sum(structure.count) as total_books_count
from customers
left join orders on orders.customer_id = customers.customer_id
left join structure on structure.order_id = orders.order_id
left join books on books.book_id = structure.book_id
group by customers.customer_id