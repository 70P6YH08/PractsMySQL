SELECT distinct country, count(author_id) as count_authors
FROM pr1.authors
group by country
having count(author_id) > 1