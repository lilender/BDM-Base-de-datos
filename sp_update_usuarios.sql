USE MyTomilloCursos;

DROP PROCEDURE IF EXISTS sp_update_usuarios;

DELIMITER $$

CREATE PROCEDURE sp_update_usuarios (
	IN opcion			VARCHAR(10),
    IN genero           TINYINT(3),
	IN nombres			VARCHAR(50), 
    IN apellido_paterno VARCHAR(50),
    IN apellido_materno VARCHAR(50),
    IN correo           VARCHAR(50),
    IN contrasena_hash  CHAR(64),
    IN f_nacimiento     DATE,
    IN foto             BLOB,
    IN rol              VARCHAR(10),
	IN ID_usu			INT
)
BEGIN
    IF opcion = 'agregar' THEN
        INSERT INTO USUARIOS (ID_genero, nombres, apellido_paterno, apellido_materno, correo, contrasena_hash, f_nacimiento, foto)
        VALUES (genero, nombres, apellido_paterno, apellido_materno, correo, SHA2(contrasena_hash, 256), f_nacimiento, foto);
        IF rol = 'estudiante' THEN
            INSERT INTO ESTUDIANTES (ID_usuario)
            VALUES (LAST_INSERT_ID());
        END IF;
        IF rol = 'maestro' THEN
            INSERT INTO MAESTROS (ID_usuario)
            VALUES (LAST_INSERT_ID());
        END IF;
        IF rol = 'admin' THEN
            INSERT INTO ADMINISTRADORES (ID_usuario)
            VALUES (LAST_INSERT_ID());
        END IF;
    END IF;
    IF opcion = 'actualizar' THEN
        UPDATE USUARIOS
        SET ID_genero = genero,
            nombres = nombres,
            apellido_paterno = apellido_paterno,
            apellido_materno = apellido_materno,
            correo = correo,
            -- contrasena_hash = SHA2(contrasena_hash, 256),
            f_nacimiento = f_nacimiento
            -- foto = foto
        WHERE ID_usuario = ID_usu;
    END IF;
    IF opcion = 'contrasena' THEN
		UPDATE USUARIOS
        SET contrasena_hash = SHA2(contrasena_hash, 256)
        WHERE ID_usuario = ID_usu;
    END IF;
    IF opcion = 'eliminar' THEN
        UPDATE USUARIOS
        SET estatus = 0
        WHERE ID_usuario = ID_usu;
    END IF;
    IF opcion = 'reactivar' THEN
        UPDATE USUARIOS
        SET estatus = 1
        WHERE ID_usuario = ID_usu;
    END IF;

	


END$$

DELIMITER ;
