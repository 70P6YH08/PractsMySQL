update books
inner join authors on books.author_id = authors.author_id
set books.price = case when authors.country = 'Россия' then books.price + 100 else books.price end;
select * from books