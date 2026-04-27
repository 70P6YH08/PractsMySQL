SELECT authors.surname, authors.name
from authors
left join books as books on books.author_id = authors.author_id
where authors.author_id not in
	(select author_id from books where title like '%linux%' or title like '%windows%')