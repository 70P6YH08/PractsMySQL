CREATE TABLE books_info(
	book_id INT,
    book_title VARCHAR(50),
    author_surname VARCHAR(50),
    author_name VARCHAR(50),
    public_year SMALLINT,
    book_price DECIMAL(6,2),
    count_pages SMALLINT,
	PRIMARY KEY (book_id)
)