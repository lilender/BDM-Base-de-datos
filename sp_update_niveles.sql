USE MyTomilloCursos;

DROP PROCEDURE IF EXISTS sp_update_niveles;

DELIMITER $$

CREATE PROCEDURE sp_update_niveles (
    IN opcion			VARCHAR(10),
    IN ID_cur          INT,
    IN titulo            VARCHAR(100),
    IN precio            DECIMAL(10,2),
    IN ID_niv          INT
)
BEGIN
    DECLARE n_nivel TINYINT;
    IF opcion = 'agregar' THEN
        SET n_nivel = (SELECT n_niveles FROM CURSOS WHERE ID_curso = ID_cur) + 1;
        INSERT INTO NIVELES (ID_curso, ID_nivel, titulo, precio)
        VALUES (ID_cur, n_nivel, titulo, precio);
    END IF;
    IF opcion = 'actualizar' THEN
        UPDATE NIVELES
        SET titulo = titulo,
            precio = precio
        WHERE ID_curso = ID_cur AND ID_nivel = ID_niv;
    END IF;
    IF opcion = 'eliminar' THEN
        DELETE FROM NIVELES
        WHERE ID_curso = ID_cur AND ID_nivel = ID_niv;
    END IF;

END $$
DELIMITER ;