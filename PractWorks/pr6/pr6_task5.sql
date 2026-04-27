SELECT authors.*, group_concat(books.title, ' ')
FROM authors
left join books on books.author_id = authors.author_id
GROUP BY authors.author_id;