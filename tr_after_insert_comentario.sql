USE MyTomilloCursos;

DROP TRIGGER IF EXISTS tr_after_insert_comentario;

DELIMITER $$
CREATE TRIGGER tr_after_insert_comentario
AFTER INSERT ON COMENTARIOS
FOR EACH ROW
BEGIN
	UPDATE CURSOS
    SET promedio_calificacion = (SELECT TRUNCATE((SELECT AVG(calificacion) FROM COMENTARIOS WHERE ID_curso = NEW.ID_curso), 2))
    WHERE ID_curso = NEW.ID_curso;
END
$$
DELIMITER ;