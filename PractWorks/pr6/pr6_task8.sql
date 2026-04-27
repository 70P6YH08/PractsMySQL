SELECT genre, title, price, dense_rank() OVER (PARTITION BY genre order by price desc) as row_num
FROM books