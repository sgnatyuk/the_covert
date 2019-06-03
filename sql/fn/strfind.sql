DELIMITER //
CREATE FUNCTION `STRFIND`(str VARCHAR(255), delimtr CHAR(1)) RETURNS INT
BEGIN
    DECLARE _cnt INT;
    DECLARE _start INT;
    SET _cnt = -1;
    SET _start = 1;
    WHILE _start > 0 DO
    SET _start = LOCATE(delimtr, str);
    SET str = SUBSTRING(str, _start + 1);
    SET _cnt = _cnt + 1;
    END WHILE;
    RETURN _cnt;
END //

