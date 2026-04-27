DELIMITER $$
CREATE EVENT eventAuthor
ON SCHEDULE EVERY 24 HOUR
STARTS '2026-04-25 15:00:00'
ON COMPLETION PRESERVE
DO
BEGIN
    INSERT INTO my_event_table(eventTime, eventName)
    VALUES(CURRENT_TIMESTAMP, 'событие 4');
    
    DELETE FROM authors
    WHERE author_id not in (SELECT author_id FROM books);
END$$

DELIMITER ;