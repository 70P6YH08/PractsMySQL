DROP USER 'userTask3'@'localhost';

CREATE USER 'userTask3'@'localhost' IDENTIFIED BY 'qwerty';

GRANT select, insert, update, delete
ON pr1.*
TO 'userTask3'@'localhost';