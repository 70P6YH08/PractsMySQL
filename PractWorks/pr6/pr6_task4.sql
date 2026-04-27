SELECT
concat_ws(' ', authors.surname, SUBSTRING(authors.name, 1, 1)) as bio,
concat_ws(' ', books.title, books.price, '$') as title_price_book
FROM authors
left join books on books.author_id = authors.author_id;