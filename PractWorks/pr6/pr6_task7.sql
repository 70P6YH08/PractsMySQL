SELECT row_number() OVER (ORDER BY title) as row_num, books.*
FROM books