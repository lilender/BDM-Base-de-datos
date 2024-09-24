USE MyTomilloCursos;

DROP TRIGGER IF EXISTS after_insert_clase;

DELIMITER $$
CREATE TRIGGER after_insert_clase
AFTER INSERT ON CLASES
FOR EACH ROW
BEGIN
    UPDATE NIVELES
    SET n_clases = n_clases + 1
    WHERE ID_curso = NEW.ID_curso AND ID_nivel = NEW.ID_nivel;
END;
$$
DELIMITER ;