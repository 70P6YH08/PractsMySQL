SELECT author_id, title as unique_title, count(distinct book_id)  as count_book
FROM pr1.books
group by author_id, title