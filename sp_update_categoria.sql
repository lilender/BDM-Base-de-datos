USE MyTomilloCursos;

DROP PROCEDURE IF EXISTS sp_update_categoria;

DELIMITER $$

CREATE PROCEDURE sp_update_categoria (
    IN opcion			VARCHAR(10),
    IN ID_admin        SMALLINT UNSIGNED,
    IN nombre         VARCHAR(50),
    IN descripcion       TINYTEXT,
    IN ID_cat			TINYINT UNSIGNED
)
BEGIN
    IF opcion = 'agregar' THEN
        INSERT INTO CATEGORIAS (ID_creador, nombre, descripcion)
        VALUES (ID_admin, nombre, descripcion);
    END IF;
    IF opcion = 'actualizar' THEN
        UPDATE CATEGORIAS
        SET nombre = nombre,
            descripcion = descripcion
        WHERE ID_categoria = ID_cat;
    END IF;
    IF opcion = 'eliminar' THEN
        DELETE FROM CATEGORIAS
        WHERE ID_categoria = ID_cat;
    END IF;

END $$

DELIMITER ;