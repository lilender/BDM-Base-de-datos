USE MyTomilloCursos;

DROP PROCEDURE IF EXISTS sp_update_comentarios;

DELIMITER $$
CREATE PROCEDURE sp_update_comentarios(
    IN opcion			VARCHAR(10),
    IN ID_cur           INT,
    IN ID_est           INT,
    IN ID_admin         SMALLINT,
    in calificacion     TINYINT(3),
    IN comentario       TEXT,
    IN ID_com           INT
)
BEGIN
    IF opcion = 'agregar' THEN
        INSERT INTO COMENTARIOS (ID_curso, ID_estudiante, calificacion, comentario)
        VALUES (ID_cur, ID_est, calificacion, comentario);
    END IF;
    IF opcion = 'eliminar' THEN
        UPDATE COMENTARIOS
        SET 
        ID_administrador = ID_admin,
        f_eliminacion = CURRENT_TIMESTAMP
        WHERE ID_comentario = ID_com;
    END IF;

END
$$
DELIMITER ;