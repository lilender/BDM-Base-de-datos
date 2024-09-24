USE MyTomilloCursos;

DROP TRIGGER IF EXISTS after_insert_nivel;

DELIMITER $$

CREATE TRIGGER after_insert_nivel
AFTER INSERT ON NIVELES
FOR EACH ROW
BEGIN
    UPDATE CURSOS
    SET n_niveles = n_niveles + 1
    WHERE ID_curso = NEW.ID_curso;
END;

$$

DELIMITER ;