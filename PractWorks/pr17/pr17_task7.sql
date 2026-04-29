DROP USER 'userTask7'@'localhost';

CREATE USER 'userTask7'@'localhost';

GRANT select
ON pr1.authors
TO 'userTask7'@'localhost';

GRANT select, insert
ON pr1.books
TO 'userTask7'@'localhost';
