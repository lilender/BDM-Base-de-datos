-- CREATE DATABASE MyTomilloCursos;
USE MyTomilloCursos;

DROP TABLE IF EXISTS RECURSOS;
DROP TABLE IF EXISTS LINKS;
DROP TABLE IF EXISTS COMENTARIOS;
DROP TABLE IF EXISTS MENSAJES;
DROP TABLE IF EXISTS CHATS;
DROP TABLE IF EXISTS ESTUDIANTES_CLASES;
DROP TABLE IF EXISTS NIVELES_COMPRADOS;
DROP TABLE IF EXISTS ESTUDIANTES_CURSOS;
DROP TABLE IF EXISTS CAUSAS_ELIMINACION;
DROP TABLE IF EXISTS CLASES;
DROP TABLE IF EXISTS NIVELES;
DROP TABLE IF EXISTS APRENDIZAJES;
DROP TABLE IF EXISTS CURSOS;
DROP TABLE IF EXISTS CATEGORIAS;
DROP TABLE IF EXISTS ADMINISTRADORES;
DROP TABLE IF EXISTS MAESTROS;
DROP TABLE IF EXISTS ESTUDIANTES;
DROP TABLE IF EXISTS USUARIOS;
DROP TABLE IF EXISTS GENEROS;

CREATE TABLE GENEROS (
    ID_genero   TINYINT(3) UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    genero      VARCHAR(25) NOT NULL
);
CREATE TABLE USUARIOS (
    ID_usuario          INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    ID_genero           TINYINT(3) UNSIGNED NOT NULL,
    nombres             VARCHAR(50) NOT NULL,
    apellido_paterno    VARCHAR(50) NOT NULL,
    apellido_materno    VARCHAR(50) NOT NULL,
    correo              VARCHAR(50) UNIQUE NOT NULL,
    contrasena_hash     CHAR(64) NOT NULL,
    f_nacimiento        DATE NOT NULL,
    f_registro          DATETIME DEFAULT CURRENT_TIMESTAMP,
    estatus             BOOLEAN DEFAULT 1, -- 1 = activo, 0 = inactivo
    f_actualizacion     DATETIME ON UPDATE CURRENT_TIMESTAMP,
    foto                BLOB,
    FOREIGN KEY (ID_genero) REFERENCES GENEROS(ID_genero)
);
CREATE TABLE ESTUDIANTES (
    ID_estudiante       INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    ID_usuario          INT UNSIGNED NOT NULL,
    FOREIGN KEY (ID_usuario) REFERENCES USUARIOS(ID_usuario)
);
CREATE TABLE MAESTROS (
    ID_maestro          INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    ID_usuario          INT UNSIGNED NOT NULL,
    FOREIGN KEY (ID_usuario) REFERENCES USUARIOS(ID_usuario)
);
CREATE TABLE ADMINISTRADORES (
    ID_administrador    SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    ID_usuario          INT UNSIGNED NOT NULL,
    FOREIGN KEY (ID_usuario) REFERENCES USUARIOS(ID_usuario)
);
CREATE TABLE CATEGORIAS (
    ID_categoria        TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    ID_creador          SMALLINT UNSIGNED NOT NULL,
    nombre              VARCHAR(50) NOT NULL,
    descripcion         TINYTEXT NOT NULL,
    f_registro          DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ID_creador) REFERENCES ADMINISTRADORES(ID_administrador)
);
CREATE TABLE CURSOS (
    ID_curso            INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    ID_categoria        TINYINT UNSIGNED NOT NULL,
    ID_maestro          INT UNSIGNED NOT NULL,
    imagen              BLOB,
    titulo              VARCHAR(100) NOT NULL,
    descripcion         TEXT NOT NULL,
    n_estudiantes       INT UNSIGNED DEFAULT 0,
    f_creacion          DATETIME DEFAULT CURRENT_TIMESTAMP,
    precio              DECIMAL(10,2) UNSIGNED NOT NULL,
    promedio_calificacion DECIMAL(3,2) UNSIGNED DEFAULT NULL,
    estatus             BOOLEAN DEFAULT 1, -- 1 = activo, 0 = inactivo
    n_niveles           TINYINT UNSIGNED DEFAULT 0,
    FOREIGN KEY (ID_categoria) REFERENCES CATEGORIAS(ID_categoria),
    FOREIGN KEY (ID_maestro) REFERENCES MAESTROS(ID_maestro)
);
CREATE TABLE APRENDIZAJES (
    ID_aprendizaje      INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    ID_curso            INT UNSIGNED NOT NULL,
    aprendizaje         TINYTEXT NOT NULL,   
    FOREIGN KEY (ID_curso) REFERENCES CURSOS(ID_curso)
);
CREATE TABLE NIVELES (
    ID_curso            INT UNSIGNED NOT NULL,
    ID_nivel            TINYINT UNSIGNED NOT NULL,
    titulo              VARCHAR(100) NOT NULL,
    precio              DECIMAL(10,2) UNSIGNED NOT NULL,
    n_clases            TINYINT UNSIGNED DEFAULT 0,
    CONSTRAINT PK_NIVELES PRIMARY KEY (ID_curso, ID_nivel),
    FOREIGN KEY (ID_curso) REFERENCES CURSOS(ID_curso)
);
CREATE TABLE CLASES (
    ID_curso            INT UNSIGNED NOT NULL,
    ID_nivel            TINYINT UNSIGNED NOT NULL,
    ID_clase            TINYINT UNSIGNED NOT NULL,
    titulo              VARCHAR(100) NOT NULL,
    descripcion         TEXT NOT NULL,
    video               MEDIUMBLOB NOT NULL,
    CONSTRAINT PK_CLASES PRIMARY KEY (ID_curso, ID_nivel, ID_clase),
    FOREIGN KEY (ID_curso, ID_nivel) REFERENCES NIVELES(ID_curso, ID_nivel)
);
CREATE TABLE RECURSOS (
    ID_recurso          INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    ID_curso            INT UNSIGNED NOT NULL,
    ID_nivel            TINYINT UNSIGNED NOT NULL,
    ID_clase            TINYINT UNSIGNED NOT NULL,
    archivo             BLOB NOT NULL,
    FOREIGN KEY (ID_curso, ID_nivel, ID_clase) REFERENCES CLASES(ID_curso, ID_nivel, ID_clase)
);
CREATE TABLE LINKS (
    ID_link             INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    ID_curso            INT UNSIGNED NOT NULL,
    ID_nivel            TINYINT UNSIGNED NOT NULL,
    ID_clase            TINYINT UNSIGNED NOT NULL,
    link                VARCHAR(255) NOT NULL,
    FOREIGN KEY (ID_curso, ID_nivel, ID_clase) REFERENCES CLASES(ID_curso, ID_nivel, ID_clase)
);
CREATE TABLE CAUSAS_ELIMINACION (
    ID_causa            TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    causa               VARCHAR(100) NOT NULL
);
CREATE TABLE COMENTARIOS (
    ID_comentario       INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    ID_curso            INT UNSIGNED NOT NULL,
    ID_estudiante       INT UNSIGNED NOT NULL,
    ID_administrador    SMALLINT UNSIGNED,
    -- ID_causa            TINYINT UNSIGNED,
    calificacion        TINYINT(3) UNSIGNED NOT NULL,
    comentario          TEXT NOT NULL,
    f_creacion          DATETIME DEFAULT CURRENT_TIMESTAMP,
    f_eliminacion       DATETIME,
    FOREIGN KEY (ID_curso) REFERENCES CURSOS(ID_curso),
    FOREIGN KEY (ID_estudiante) REFERENCES ESTUDIANTES(ID_estudiante),
    FOREIGN KEY (ID_administrador) REFERENCES ADMINISTRADORES(ID_administrador)
    -- FOREIGN KEY (ID_causa) REFERENCES CAUSAS_ELIMINACION(ID_causa)
);
CREATE TABLE CHATS (
    ID_chat             INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    ID_usuario1         INT UNSIGNED NOT NULL,
    ID_usuario2         INT UNSIGNED NOT NULL,
    FOREIGN KEY (ID_usuario1) REFERENCES USUARIOS(ID_usuario),
    FOREIGN KEY (ID_usuario2) REFERENCES USUARIOS(ID_usuario)
);
CREATE TABLE MENSAJES (
    ID_mensaje          INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    ID_chat             INT UNSIGNED NOT NULL,
    ID_usuario          INT UNSIGNED NOT NULL,
    mensaje             TEXT NOT NULL,
    f_envio             DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ID_chat) REFERENCES CHATS(ID_chat),
    FOREIGN KEY (ID_usuario) REFERENCES USUARIOS(ID_usuario)
);
CREATE TABLE ESTUDIANTES_CURSOS (
    ID_estudiante       INT UNSIGNED NOT NULL,
    ID_curso            INT UNSIGNED NOT NULL,
    f_inscripcion       DATETIME DEFAULT CURRENT_TIMESTAMP,
    progreso            DECIMAL(5,2) UNSIGNED DEFAULT 0,
    f_completado        DATETIME,
    estatus             BOOLEAN DEFAULT 0, -- 0 = incompleto, 1 = completo
    tipo_pago           BOOLEAN NOT NULL, -- 0 = por nivel, 1 = completo
    total_pagado        DECIMAL(10,2) UNSIGNED NOT NULL,
    CONSTRAINT PK_ESTUDIANTES_CURSOS PRIMARY KEY (ID_estudiante, ID_curso),
    FOREIGN KEY (ID_estudiante) REFERENCES ESTUDIANTES(ID_estudiante),
    FOREIGN KEY (ID_curso) REFERENCES CURSOS(ID_curso)
);
CREATE TABLE NIVELES_COMPRADOS (
    ID_estudiante       INT UNSIGNED NOT NULL,
    ID_curso            INT UNSIGNED NOT NULL,
    ID_nivel            TINYINT UNSIGNED NOT NULL,
    pago                DECIMAL(7,2) UNSIGNED NOT NULL,
    CONSTRAINT PK_NIVELES_COMPRADOS PRIMARY KEY (ID_estudiante, ID_curso, ID_nivel),
    FOREIGN KEY (ID_estudiante, ID_curso) REFERENCES ESTUDIANTES_CURSOS(ID_estudiante, ID_curso),
    FOREIGN KEY (ID_curso, ID_nivel) REFERENCES NIVELES(ID_curso, ID_nivel)
);
CREATE TABLE ESTUDIANTES_CLASES (
    ID_estudiante       INT UNSIGNED NOT NULL,
    ID_curso            INT UNSIGNED NOT NULL,
    ID_nivel            TINYINT UNSIGNED NOT NULL,
    ID_clase            TINYINT UNSIGNED NOT NULL,
    f_visualizacion     DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT PK_ESTUDIANTES_CLASES PRIMARY KEY (ID_estudiante, ID_curso, ID_nivel, ID_clase),
    FOREIGN KEY (ID_estudiante, ID_curso) REFERENCES ESTUDIANTES_CURSOS(ID_estudiante, ID_curso),
    FOREIGN KEY (ID_curso, ID_nivel, ID_clase) REFERENCES CLASES(ID_curso, ID_nivel, ID_clase)
);