SELECT title, price,
CASE
    WHEN price < 100
        THEN 'дешевые'
    WHEN price >= 100 AND price < 1000
        THEN 'средние'
    ELSE 'дорогие'
END AS category
FROM pr1.books
order by price desc