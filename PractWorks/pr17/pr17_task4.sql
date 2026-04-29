DROP USER 'userTask4'@'localhost';

CREATE USER 'userTask4'@'localhost';

GRANT select
ON pr1.books
TO 'userTask4'@'localhost';