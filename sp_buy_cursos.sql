USE MyTomilloCursos;

DROP PROCEDURE IF EXISTS sp_buy_cursos;

DELIMITER $$

CREATE PROCEDURE sp_buy_cursos(
    IN p_ID_estudiante INT UNSIGNED,
    IN p_ID_curso INT UNSIGNED
)