USE MyTomilloCursos;

DROP PROCEDURE IF EXISTS sp_update_links;

DELIMITER $$

CREATE PROCEDURE sp_update_links (
    IN opcion			VARCHAR(10),
    IN ID_cur          INT,
    IN ID_niv          TINYINT,
    IN ID_cla          TINYINT,
    IN ID_lin          INT,
    IN link           VARCHAR(255)
)
BEGIN
    IF opcion = 'agregar' THEN
        INSERT INTO LINKS (ID_curso, ID_nivel, ID_clase, link)
        VALUES (ID_cur, ID_niv, ID_cla, link);
    END IF;
    IF opcion = 'eliminar' THEN
        DELETE FROM LINKS
        WHERE ID_link = ID_lin;
    END IF;
END
$$
DELIMITER ;