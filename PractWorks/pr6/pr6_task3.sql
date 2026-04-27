SELECT REGEXP_REPLACE(title, '[ ]+', ' ') as title, round(price, -1) as price
FROM books;