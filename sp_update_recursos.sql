USE MyTomilloCursos;

DROP PROCEDURE IF EXISTS sp_update_recursos;

DELIMITER $$

CREATE PROCEDURE sp_update_recursos (
    IN opcion			VARCHAR(10),
    IN ID_cur          INT,
    IN ID_niv          TINYINT,
    IN ID_cla          TINYINT,
    IN ID_rec          INT,
    IN recurso           BLOB
)
BEGIN
    IF opcion = 'agregar' THEN
        INSERT INTO RECURSOS (ID_curso, ID_nivel, ID_clase, archivo)
        VALUES (ID_cur, ID_niv, ID_cla, recurso);
    END IF;
    IF opcion = 'eliminar' THEN
        DELETE FROM RECURSOS
        WHERE ID_recurso = ID_rec;
    END IF;
END
$$
DELIMITER ;