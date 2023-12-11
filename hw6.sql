DROP DATABASE IF EXISTS homework;
CREATE DATABASE IF NOT EXISTS homework;
USE homework;
DROP PROCEDURE IF EXISTS proc;
DELIMITER //
CREATE PROCEDURE proc(sec INT)
	BEGIN
    DECLARE days INT;
    DECLARE hours INT;
    DECLARE minutes INT;
		SET days = sec DIV 86400; 
        SET sec = sec MOD 86400;
        SET hours = sec DIV 3600;
        SET sec = sec MOD 3600;
        SET minutes = sec DIV 60;
        SET sec= sec MOD 60;
        SELECT concat(days,' days ',hours,' hours ',minutes,' minutes ',sec,' seconds') AS messages;
    END //
DELIMITER ;

CALL proc(123456);

DROP FUNCTION IF EXISTS fun;
DELIMITER //
CREATE FUNCTION fun()
RETURNS VARCHAR(255)
DETERMINISTIC
	BEGIN
		DECLARE num INT;
        DECLARE result VARCHAR(255) DEFAULT '';
        SET num=0;
			WHILE num < 10 DO
				SET num=num+2;
                SET result = concat(result,' ',num);
            END WHILE;
		RETURN result;
    END //
DELIMITER ;

SELECT fun();












