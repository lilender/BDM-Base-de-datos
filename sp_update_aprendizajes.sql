USE MyTomilloCursos;

DROP PROCEDURE IF EXISTS sp_update_aprendizajes;

DELIMITER $$

CREATE PROCEDURE sp_update_aprendizajes (
    IN opcion			VARCHAR(10),
    IN ID_curso          INT,
    IN aprendizaje       TINYTEXT,
    IN ID_aprend        INT
)
BEGIN
    IF opcion = 'agregar' THEN
        INSERT INTO APRENDIZAJES (ID_curso, aprendizaje)
        VALUES (ID_curso, aprendizaje);
    END IF;
    IF opcion = 'eliminar' THEN     -- BORRADO LOGICO . . .
        DELETE FROM APRENDIZAJES
        WHERE ID_aprendizaje = ID_aprend;
    END IF;

END $$
DELIMITER ;