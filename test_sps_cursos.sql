-- Autora: Marla Estrada :D

-- sp_update_categoria
call sp_update_categoria(
    'agregar', -- opcion
    1, -- ID_admin
    'Cocina', -- nombre
    'Cursos de cocina', -- descripcion
    null -- ID_cat
);
call sp_update_categoria(
    'actualizar', -- opcion
    1, -- ID_admin
    'Cocina', -- nombre
    'Cursos de cocina y reposteria', -- descripcion
    1 -- ID_cat
);  
call sp_update_categoria(
    'eliminar', -- opcion
    null, -- ID_admin
    null, -- nombre
    null, -- descripcion
    1 -- ID_cat
);

-- sp_update_categoria
call sp_update_categoria(
    'agregar', -- opcion
    1, -- ID_admin
    'Programacion', -- nombre
    'Aprende sobre lenguajes de programación y frameworks.', -- descripcion
    null -- ID_cat
);
call sp_update_categoria(
    'agregar', -- opcion
    1, -- ID_admin
    'Diseño', -- nombre
    'Cursos de diseño gráfico y diseño web.', -- descripcion
    null -- ID_cat
);
call sp_update_categoria(
    'agregar', -- opcion
    1, -- ID_admin
    'Idiomas', -- nombre
    'Aprende idiomas como inglés, francés, alemán, etc.', -- descripcion
    null -- ID_cat
);
call sp_update_categoria(
    'agregar', -- opcion
    1, -- ID_admin
    'Musica', -- nombre
    'Cursos de música y canto.', -- descripcion
    null -- ID_cat
);
call sp_update_categoria(
    'agregar', -- opcion
    1, -- ID_admin
    'Negocios', -- nombre
    'Cursos de emprendimiento y negocios.', -- descripcion
    null -- ID_cat
);
call sp_update_categoria(
    'agregar', -- opcion
    1, -- ID_admin
    'Salud', -- nombre
    'Cursos de salud y bienestar.', -- descripcion
    null -- ID_cat
);
call sp_update_categoria(
    'agregar', -- opcion
    1, -- ID_admin
    'Deportes', -- nombre
    'Cursos de deportes y actividad fisica.', -- descripcion
    null -- ID_cat
);
call sp_update_categoria(
    'agregar', -- opcion
    1, -- ID_admin
    'Arte', -- nombre
    'Cursos de arte y pintura.', -- descripcion
    null -- ID_cat
);
call sp_update_categoria(
    'agregar', -- opcion
    1, -- ID_admin
    'Cine', -- nombre
    'Cursos de cine y producción audiovisual.', -- descripcion
    null -- ID_cat
);

-- sp_update_cursos
call sp_update_cursos(
    'agregar', -- opcion
    2, -- ID_categoria
    1, -- ID_maestro
    null, -- imagen
    'Las bases de la cocina mexicana', -- titulo
    'A lo largo de este curso, los estudiantes aprenderán sobre los ingredientes esenciales, técnicas de cocina tradicionales y recetas emblemáticas que han definido la cocina mexicana a lo largo de los siglos. Desde la preparación de salsas auténticas como el mole y la salsa verde, hasta la elaboración de platillos icónicos como los tacos, tamales y enchiladas, este curso ofrece una experiencia culinaria completa. Además, se explorarán las influencias culturales e históricas que han dado forma a la cocina mexicana, proporcionando un contexto enriquecedor para cada receta. Ideal para aficionados y profesionales de la cocina, este curso no solo enseña a cocinar, sino que también celebra la herencia y el sabor únicos de México.',  -- descripcion
    100.00, -- precio
    null -- ID_cur
);
call sp_update_cursos(
    'actualizar', -- opcion
    2, -- ID_categoria
    1, -- ID_maestro
    null, -- imagen
    'Las bases de la cocina mexicana', -- titulo
    'A lo largo de este curso, los estudiantes aprenderán sobre los ingredientes esenciales, técnicas de cocina tradicionales y recetas emblemáticas que han definido la cocina mexicana a lo largo de los siglos. Desde la preparación de salsas auténticas como el mole y la salsa verde, hasta la elaboración de platillos icónicos como los tacos, tamales y enchiladas, este curso ofrece una experiencia culinaria completa. Además, se explorarán las influencias culturales e históricas que han dado forma a la cocina mexicana, proporcionando un contexto enriquecedor para cada receta. Ideal para aficionados y profesionales de la cocina, este curso no solo enseña a cocinar, sino que también celebra la herencia y el sabor únicos de México.',  -- descripcion
    500.00, -- precio
    1 -- ID_cur
);
call sp_update_cursos(
    'eliminar', -- opcion
    null, -- ID_categoria
    null, -- ID_maestro
    null, -- imagen
    null, -- titulo
    null, -- descripcion
    null, -- precio
    1 -- ID_cur
);

-- sp_update_aprendizajes
call sp_update_aprendizajes(
    'agregar', -- opcion
    1, -- ID_curso
    'Ingredientes esenciales', -- aprendizaje
    null -- ID_aprend
);
call sp_update_aprendizajes(
    'agregar', -- opcion
    1, -- ID_curso
    'Técnicas de cocina tradicionales', -- aprendizaje
    null -- ID_aprend
);
call sp_update_aprendizajes(
    'agregar', -- opcion
    1, -- ID_curso
    'Recetas emblemáticas', -- aprendizaje
    null -- ID_aprend
);
call sp_update_aprendizajes(
    'actualizar', -- opcion
    1, -- ID_curso
    'Influencias culturales e históricas', -- aprendizaje
    1 -- ID_aprend
);
call sp_update_aprendizajes(
    'eliminar', -- opcion
    null, -- ID_curso
    null, -- aprendizaje
    1 -- ID_aprend
);

-- sp_update_niveles
call sp_update_niveles(
    'agregar', -- opcion
    1, -- ID_curso
    'Introducción a la cocina mexicana', -- titulo
    50.00, -- precio
    null -- ID_niv
);
call sp_update_niveles(
    'agregar', -- opcion
    1, -- ID_curso
    'Platillos emblemáticos', -- titulo
    50.00, -- precio
    null -- ID_niv
);
call sp_update_niveles(
    'agregar', -- opcion
    1, -- ID_curso
    'Salsas auténticas', -- titulo
    50.00, -- precio
    null -- ID_niv
);
call sp_update_niveles(
    'agregar', -- opcion
    1, -- ID_curso
    'Postres tradicionales', -- titulo
    50.00, -- precio
    null -- ID_niv
);
call sp_update_niveles(
    'agregar', -- opcion
    1, -- ID_curso
    'Cocina regional', -- titulo
    50.00, -- precio
    null -- ID_niv
);
call sp_update_niveles(
    'actualizar', -- opcion
    1, -- ID_curso
    'Salsas auténticas', -- titulo
    100.00, -- precio
    3 -- ID_niv
);
call sp_update_niveles(
    'eliminar', -- opcion
    null, -- ID_curso
    null, -- titulo
    null, -- precio
    2 -- ID_niv
);

-- sp_update_clases
-- clases del nivel introduccion a la cocina mexicana
call sp_update_clases(
    'agregar', -- opcion
    1, -- ID_cur
    1, -- ID_niv
    'Ingredientes básicos', -- titulo
    'En esta clase aprenderás sobre los ingredientes básicos de la cocina mexicana.', -- descripcion
    null, -- video
    null -- ID_cla
);
call sp_update_clases(
    'agregar', -- opcion
    1, -- ID_cur
    1, -- ID_niv
    'Técnicas de cocción', -- titulo
    'En esta clase aprenderás sobre las técnicas de cocción más comunes en la cocina mexicana.', -- descripcion
    null, -- video
    null -- ID_cla
);
-- clases del nivel salsa autenticas
call sp_update_clases(
    'agregar', -- opcion
    1, -- ID_cur
    2, -- ID_niv
    'Mole', -- titulo
    'En esta clase aprenderás a preparar el mole, una salsa emblemática de la cocina mexicana.', -- descripcion
    null, -- video
    null -- ID_cla
);
call sp_update_clases(
    'agregar', -- opcion
    1, -- ID_cur
    2, -- ID_niv
    'Salsa verde', -- titulo
    'En esta clase aprenderás a preparar la salsa verde, una salsa emblemática de la cocina mexicana.', -- descripcion
    null, -- video
    null -- ID_cla
);
call sp_update_clases(
    'agregar', -- opcion
    1, -- ID_cur
    2, -- ID_niv
    'Salsa roja', -- titulo
    'En esta clase aprenderás a preparar la salsa roja, una salsa emblemática de la cocina mexicana.', -- descripcion
    null, -- video
    null -- ID_cla
);
-- clases del nivel Postres tradicionales
call sp_update_clases(
    'agregar', -- opcion
    1, -- ID_cur
    3, -- ID_niv
    'Churros', -- titulo
    'En esta clase aprenderás a preparar churros, un postre tradicional de la cocina mexicana.', -- descripcion
    null, -- video
    null -- ID_cla
);
call sp_update_clases(
    'agregar', -- opcion
    1, -- ID_cur
    3, -- ID_niv
    'Arroz con leche', -- titulo
    'En esta clase aprenderás a preparar arroz con leche, un postre tradicional de la cocina mexicana.', -- descripcion
    null, -- video
    null -- ID_cla
);
call sp_update_clases(
    'agregar', -- opcion
    1, -- ID_cur
    3, -- ID_niv
    'Flan', -- titulo
    'En esta clase aprenderás a preparar flan, un postre tradicional de la cocina mexicana.', -- descripcion
    null, -- video
    null -- ID_cla
);
call sp_update_clases(
    'actualizar', -- opcion
    1, -- ID_cur
    3, -- ID_niv
    'Arroz con leche', -- titulo
    'En esta clase aprenderás a preparar arroz con leche, un postre tradicional de la cocina mexicana. Además, aprenderás a preparar arroz con leche con coco.', -- descripcion
    null, -- video
    2 -- ID_cla
);
call sp_update_clases(
    'eliminar', -- opcion
    1, -- ID_cur
    3, -- ID_niv
    null, -- titulo
    null, -- descripcion
    null, -- video
    2 -- ID_cla
);
-- clases del nivel cocina regional
call sp_update_clases(
    'agregar', -- opcion
    1, -- ID_cur
    4, -- ID_niv
    'Pozole', -- titulo
    'En esta clase aprenderás a preparar pozole, un platillo emblemático de la cocina mexicana.', -- descripcion
    null, -- video
    null -- ID_cla
);
call sp_update_clases(
    'agregar', -- opcion
    1, -- ID_cur
    4, -- ID_niv
    'Tacos al pastor', -- titulo
    'En esta clase aprenderás a preparar tacos al pastor, un platillo emblemático de la cocina mexicana.', -- descripcion
    null, -- video
    null -- ID_cla
);
call sp_update_clases(
    'agregar', -- opcion
    1, -- ID_cur
    4, -- ID_niv
    'Enchiladas', -- titulo
    'En esta clase aprenderás a preparar enchiladas, un platillo emblemático de la cocina mexicana.', -- descripcion
    null, -- video
    null -- ID_cla
);

-- sp_update_recursos
call sp_update_recursos(
    'agregar', -- opcion
    1, -- ID_cur
    1, -- ID_niv
    1, -- ID_cla
    null, -- ID_rec
    null -- archivo
);
call sp_update_recursos(
    'agregar', -- opcion
    1, -- ID_cur
    1, -- ID_niv
    2, -- ID_cla
    null, -- ID_rec
    null -- archivo
);
call sp_update_recursos(
    'eliminar', -- opcion
    null, -- ID_cur
    null, -- ID_niv
    null, -- ID_cla
    2, -- ID_rec
    null -- archivo
);

-- sp_update_links
call sp_update_links(
    'agregar', -- opcion
    1, -- ID_cur
    1, -- ID_niv
    1, -- ID_cla
    null, -- ID_lin
    'https://www.youtube.com/watch?v=r9oBVKqID7g' -- link
);
call sp_update_links(
    'agregar', -- opcion
    1, -- ID_cur
    1, -- ID_niv
    1, -- ID_cla
    null, -- ID_lin
    'https://www.myhusbandissohandsome.com' -- link
);
call sp_update_links(
    'eliminar', -- opcion
    null, -- ID_cur
    null, -- ID_niv
    null, -- ID_cla
    1, -- ID_lin
    null -- link
);