USE MyTomilloCursos;

DROP PROCEDURE IF EXISTS sp_update_cursos;

DELIMITER $$

CREATE PROCEDURE sp_update_cursos (
    IN opcion			VARCHAR(10),
    IN ID_categoria      TINYINT,
    IN ID_maestro			INT,
    IN imagen            BLOB,
    IN titulo			VARCHAR(100), 
    IN descripcion       TEXT,
    IN precio            DECIMAL(10,2),
    IN ID_cur			INT
)
BEGIN
    IF opcion = 'agregar' THEN
        INSERT INTO CURSOS (ID_categoria, ID_maestro, imagen, titulo, descripcion, precio)
        VALUES (ID_categoria, ID_maestro, imagen, titulo, descripcion, precio);
    END IF;
    IF opcion = 'actualizar' THEN
        UPDATE CURSOS
        SET ID_categoria = ID_categoria,
            imagen = imagen,
            titulo = titulo,
            descripcion = descripcion,
            precio = precio
        WHERE ID_curso = ID_cur;
    END IF;
    IF opcion = 'eliminar' THEN     -- BORRADO LOGICO . . .
        UPDATE CURSOS
        SET estatus = 0
        WHERE ID_curso = ID_cur;
    END IF;


END $$

DELIMITER ;