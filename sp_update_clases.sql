USE MyTomilloCursos;

DROP PROCEDURE IF EXISTS sp_update_clases;

DELIMITER $$

CREATE PROCEDURE sp_update_clases (
    IN opcion			VARCHAR(10),
    IN ID_cur          INT,
    IN ID_niv          TINYINT,
    IN titulo            VARCHAR(100),
    IN descripcion       TEXT,
    IN video             MEDIUMBLOB,
    IN ID_cla          TINYINT
)
BEGIN
    DECLARE n_clase TINYINT;
    IF opcion = 'agregar' THEN
        SET n_clase = (SELECT n_clases FROM NIVELES WHERE ID_curso = ID_cur AND ID_nivel = ID_niv) + 1;
        INSERT INTO CLASES (ID_curso, ID_nivel, ID_clase, titulo, descripcion, video)
        VALUES (ID_cur, ID_niv, n_clase, titulo, descripcion, video);
    END IF;
    IF opcion = 'actualizar' THEN
        UPDATE CLASES
        SET titulo = titulo,
            descripcion = descripcion,
            video = video
        WHERE ID_curso = ID_cur AND ID_nivel = ID_niv AND ID_clase = ID_cla;
    END IF;
    IF opcion = 'eliminar' THEN
        DELETE FROM CLASES
        WHERE ID_curso = ID_cur AND ID_nivel = ID_niv AND ID_clase = ID_cla;
    END IF;
END 
$$
DELIMITER ;