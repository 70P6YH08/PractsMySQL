ALTER TABLE books_info
ADD CONSTRAINT unique_tsn UNIQUE (book_title, author_surname, author_name)