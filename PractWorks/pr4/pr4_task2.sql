SELECT authors.surname, authors.name, COUNT(books.book_id)
from authors
left join books on books.author_id = authors.author_id
group by authors.author_id