INSERT INTO authors (name, surname, country)
VALUES ('й', 'ц', 'у')
ON DUPLICATE KEY UPDATE 
    country = 'Россия';

select * from authors
