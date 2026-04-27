SELECT authors.surname, authors.name, books.title, books.price
from authors
inner join books on authors.author_id = books.author_id00