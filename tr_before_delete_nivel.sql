USE MyTomilloCursos;

DROP TRIGGER IF EXISTS before_delete_nivel;

DELIMITER $$

CREATE TRIGGER before_delete_nivel
BEFORE DELETE ON NIVELES
FOR EACH ROW
BEGIN
    DECLARE n TINYINT;
    DECLARE i TINYINT;
    SET n = (SELECT n_niveles FROM CURSOS WHERE ID_curso = OLD.ID_curso);
    SET i = OLD.ID_nivel;
    WHILE i < n DO
        UPDATE NIVELES
        SET ID_nivel = i
        WHERE ID_curso = OLD.ID_curso AND ID_nivel = i + 1;
        SET i = i + 1;
    END WHILE;


    DELETE FROM CLASES 
    WHERE ID_curso = OLD.ID_curso AND ID_nivel = OLD.ID_nivel;
    DELETE FROM RECURSOS 
    WHERE ID_curso = OLD.ID_curso AND ID_nivel = OLD.ID_nivel;
    DELETE FROM LINKS 
    WHERE ID_curso = OLD.ID_curso AND ID_nivel = OLD.ID_nivel;
END;

$$

DELIMITER ;