USE MyTomilloCursos;

INSERT INTO GENEROS (genero) VALUES ('MASCULINO');
INSERT INTO GENEROS (genero) VALUES ('FEMENINO');
INSERT INTO GENEROS (genero) VALUES ('NO BINARIO');
INSERT INTO GENEROS (genero) VALUES ('WALMART BAG');
INSERT INTO GENEROS (genero) VALUES ('PREFIERO NO ESPECIFICAR');
INSERT INTO GENEROS (genero) VALUES ('OTRO');

call sp_update_usuarios(
    'agregar', -- opcion
    2, -- genero
    'Marla Judith', -- nombres
    'Estrada', -- apellido_paterno
    'Valdez',  -- apellido_materno
    'marlita@gmail.com', -- correo
    'Admin123.', -- contrasena
    '2004-07-25', -- f_nacimiento
    null, -- foto
    'admin', -- rol
    null -- ID_usuario
);

