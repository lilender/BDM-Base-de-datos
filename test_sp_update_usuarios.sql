call sp_update_usuarios(
    'agregar', -- opcion
    1, -- genero
    'Juan', -- nombres
    'Perez', -- apellido_paterno
    'Gomez',  -- apellido_materno
    'juan@gmail.com', -- correo
    '123456', -- contrasena
    '1990-01-01', -- f_nacimiento
    null, -- foto
    'estudiante', -- rol
    null -- ID_usuario
);

call sp_update_usuarios(
    'actualizar', -- opcion
    1, -- genero
    'Juan', -- nombres
    'Perez', -- apellido_paterno
    'Gomez',  -- apellido_materno
    'juanPerez@gmail.com', -- correo
    '123456', -- contrasena
    '1990-01-01', -- f_nacimiento
    null, -- foto
    'estudiante', -- rol
    2 -- ID_usuario
);

call sp_update_usuarios(
    'eliminar', -- opcion
    null, -- genero
    null, -- nombres
    null, -- apellido_paterno
    null,  -- apellido_materno
    null, -- correo
    null, -- contrasena
    null, -- f_nacimiento
    null, -- foto
    null, -- rol
    1 -- ID_usuario
);

call sp_update_usuarios(
    'reactivar', -- opcion
    null, -- genero
    null, -- nombres
    null, -- apellido_paterno
    null,  -- apellido_materno
    null, -- correo
    null, -- contrasena
    null, -- f_nacimiento
    null, -- foto
    null, -- rol
    1 -- ID_usuario
);

call sp_update_usuarios(
    'agregar', -- opcion
    3, -- genero
    'Maria', -- nombres
    'Gomez', -- apellido_paterno
    'Perez',  -- apellido_materno
    'maria@gmail.com', -- correo
    '123456', -- contrasena
    '1990-01-01', -- f_nacimiento
    null, -- foto
    'maestro', -- rol
    null -- ID_usuario
);

call sp_update_usuarios(
	'contrasena', -- opcion
    null, -- genero
    null, -- nombres
    null, -- apellido_paterno
    null,  -- apellido_materno
    null, -- correo
    'Abc123...', -- contrasena
    null, -- f_nacimiento
    null, -- foto
    null, -- rol
    2 -- ID_usuario
);

select * from USUARIOS;
select * from ESTUDIANTES;
select * from MAESTROS;
select * from ADMINISTRADORES;