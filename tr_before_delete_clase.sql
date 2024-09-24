USE MyTomilloCursos;

DROP TRIGGER IF EXISTS before_delete_clase;
DELIMITER $$

CREATE TRIGGER before_delete_clase
BEFORE DELETE ON CLASES
FOR EACH ROW
BEGIN
    DECLARE n TINYINT;
    DECLARE i TINYINT;
    SET n = (SELECT n_clases FROM NIVELES WHERE ID_curso = OLD.ID_curso AND ID_nivel = OLD.ID_nivel);
    SET i = OLD.ID_clase;
    WHILE i < n DO
        UPDATE CLASES
        SET ID_clase = i
        WHERE ID_curso = OLD.ID_curso AND ID_nivel = OLD.ID_nivel AND ID_clase = i + 1;
        SET i = i + 1;
    END WHILE;

    DELETE FROM RECURSOS 
    WHERE ID_curso = OLD.ID_curso AND ID_nivel = OLD.ID_nivel AND ID_clase = OLD.ID_clase;
    DELETE FROM LINKS 
    WHERE ID_curso = OLD.ID_curso AND ID_nivel = OLD.ID_nivel AND ID_clase = OLD.ID_clase;
END;

$$

DELIMITER ;