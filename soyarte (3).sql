-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-06-2026 a las 06:56:55
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `soyarte`
--

-- --------------------------------------------------------
-- Estructura para tabla conversaciones
--
CREATE TABLE conversaciones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    producto_id INT NOT NULL,
    usuario1_id INT NOT NULL,
    usuario2_id INT NOT NULL,
    ultimo_mensaje DATETIME DEFAULT CURRENT_TIMESTAMP,
    oculto_usuario1 TINYINT(1) DEFAULT 0,
    oculto_usuario2 TINYINT(1) DEFAULT 0,
    fecha_creacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (producto_id)
        REFERENCES productos(id)
        ON DELETE CASCADE,
    FOREIGN KEY (usuario1_id)
        REFERENCES usuarios(id)
        ON DELETE CASCADE,
    FOREIGN KEY (usuario2_id)
        REFERENCES usuarios(id)
        ON DELETE CASCADE
);
--
-- Estrutura de tabla mensajes
--
CREATE TABLE mensajes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    conversacion_id INT NOT NULL,
    emisor_id INT NOT NULL,
    mensaje TEXT NOT NULL,
    leido TINYINT(1) DEFAULT 0,
    fecha DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (conversacion_id)
        REFERENCES conversaciones(id)
        ON DELETE CASCADE,
    FOREIGN KEY (emisor_id)
        REFERENCES usuarios(id)
        ON DELETE CASCADE
);
--
-- Estructura de tabla para la tabla `carrito`
--

CREATE TABLE `carrito` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `producto_id` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios`
--

CREATE TABLE `comentarios` (
  `id` int(11) NOT NULL,
  `obra_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `texto` text NOT NULL,
  `creado_en` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `likes`
--

CREATE TABLE `likes` (
  `id` int(11) NOT NULL,
  `obra_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `creado_en` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `musica`
--

CREATE TABLE `musica` (
  `musica_id` int(11) NOT NULL,
  `nombre_cancion` varchar(25) DEFAULT NULL,
  `video` varchar(255) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `nombre_cantante` varchar(25) DEFAULT NULL,
  `usuario_id` int(11) NOT NULL,
  `portada` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `obras`
--

CREATE TABLE `obras` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `titulo` varchar(200) NOT NULL,
  `contenido` text NOT NULL,
  `imagen` longblob DEFAULT NULL,
  `fecha_publicacion` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pinturas`
--

CREATE TABLE `pinturas` (
  `ID` int(11) NOT NULL,
  `nombre_pintura` varchar(100) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `autor` varchar(80) NOT NULL,
  `comentarios` varchar(100) DEFAULT NULL,
  `perfil` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL,
  `imagen` varchar(255) NOT NULL,
  `categoria` varchar(100) DEFAULT NULL,
  `stock` int(11) DEFAULT 1,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `usuario_id`, `nombre`, `descripcion`, `precio`, `imagen`, `categoria`, `stock`, `fecha_creacion`) VALUES
(6, 14, 'pintura con girasoles', 'Pintura hecha de girasoles.', 5.00, '1780120649_girasoles.jpg', 'Pintura', 1, '2026-05-30 05:57:29');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `realidad_virtual`
--

CREATE TABLE `realidad_virtual` (
  `id` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `portada` varchar(255) DEFAULT NULL,
  `video_url` varchar(255) DEFAULT NULL,
  `enlace` varchar(255) DEFAULT NULL,
  `qr_imagen` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `realidad_virtual`
--

INSERT INTO `realidad_virtual` (`id`, `titulo`, `descripcion`, `portada`, `video_url`, `enlace`, `qr_imagen`, `fecha_creacion`) VALUES
(2, 'Museo Realida Virtual', 'Disfruta de esta activida inmersiva del museo', '1780360879_portada_perfil.jpg', 'https://edu.delightex.com/UGG-EDF', '', '1780360879_qr_Museo Virtual de SoyArteSV QR.png', '2026-06-02 00:41:19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `respuestas`
--

CREATE TABLE `respuestas` (
  `id` int(11) NOT NULL,
  `tipo_usuario` varchar(100) DEFAULT NULL,
  `intereses` text DEFAULT NULL,
  `tipo_tutorial` varchar(100) DEFAULT NULL,
  `frecuencia` varchar(100) DEFAULT NULL,
  `manualidades` text DEFAULT NULL,
  `subir_obras` varchar(10) DEFAULT NULL,
  `interactuar` varchar(10) DEFAULT NULL,
  `comentarios` varchar(10) DEFAULT NULL,
  `funcion_nueva` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `rol` enum('admin','usuario') DEFAULT 'usuario',
  `biografia` varchar(250) DEFAULT NULL,
  `foto_perfil` varchar(250) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `pais` varchar(30) DEFAULT NULL,
  `tema` enum('claro','oscuro','sistema') DEFAULT 'claro'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `correo`, `password`, `rol`, `biografia`, `foto_perfil`, `fecha_nacimiento`, `pais`, `tema`) VALUES
(1, 'sofia hernadez', 'sofia_coquette@gmail.com', '$2y$10$XJBivZb2lWPEPsb3vOu8iuZ7Mv4htvxnxhHYPGUXdxJgxD4AnjLR.', 'usuario', NULL, NULL, NULL, NULL, 'claro'),
(2, 'Angie Sánchez', 'angita!2@gmail.com', '$2y$10$yrGKUsdUzevPEsj9k69dnOrVW9B1j/Hw1wvUr3VejgrLLxGiDY5sm', 'usuario', NULL, NULL, NULL, NULL, 'claro'),
(3, 'Carmen Flores', 'carmen_flore@gmail.com', '$2y$10$rY6PjC3Y4jJmrsbHvhrWD.39QL.TclrT4/zNv6V9tkF4DzGfsO2qS', 'usuario', NULL, NULL, NULL, NULL, 'claro'),
(12, 'Julia', 'juliana@gmail.com', '$2y$10$59611zIH5GvVy4feSAiH5OBc4MsiXgj6L3tTMomas0Wm016RRdJk6', 'usuario', NULL, NULL, NULL, NULL, 'claro'),
(13, 'Jefferson Orellana', 'jefferonorellana6@gmail.com', '$2y$10$Gr46aPiaU2a0EYTNi2GFveFaeKf92NpZ92fKgnkmKVXAQmHdFw6uu', 'usuario', NULL, NULL, NULL, NULL, 'claro'),
(14, 'Jefferson Orellana', 'jefferson@gmail.com', '$2y$10$N9itAfM3vdK7OfZ48b3rRutq/uNEWnTETRmnyH/2dsvK6G7G8wrZy', 'admin', NULL, 'perfil_14_1780123371.jpg', NULL, NULL, 'claro'),
(15, 'Jefferson Garcia', 'orellana@gmail.com', '$2y$10$ai3HI.EyN4we.x/IPXXdbe7iiCgOlGCkjNuuKA47CAFNtWjoO/Eza', 'usuario', NULL, NULL, NULL, NULL, 'claro'),
(16, 'Caleb Vladimir', 'caleb.cortez2027@adoc.superate.org.sv', '$2y$10$nuKgTG/RGFRYHgMJHUGMheTFN0GWOmWpghcy.Dsw1Pz5w9YNnq.yG', 'usuario', NULL, NULL, NULL, NULL, 'claro'),
(17, 'Admin Soyarte', 'admin@gmail.com', '$2y$10$N9itAfM3vdK7OfZ48b3rRutq/uNEWnTETRmnyH/2dsvK6G7G8wrZy', 'admin', NULL, NULL, NULL, NULL, 'claro');
-- alterar tabla usuarios
--
ALTER TABLE usuarios
ADD ultima_actividad DATETIME NULL;
--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `obra_id` (`obra_id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indices de la tabla `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unico_like` (`obra_id`,`usuario_id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indices de la tabla `musica`
--
ALTER TABLE `musica`
  ADD PRIMARY KEY (`musica_id`);

--
-- Indices de la tabla `obras`
--
ALTER TABLE `obras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indices de la tabla `pinturas`
--
ALTER TABLE `pinturas`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `realidad_virtual`
--
ALTER TABLE `realidad_virtual`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `respuestas`
--
ALTER TABLE `respuestas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `correo` (`correo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `carrito`
--
ALTER TABLE `carrito`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `musica`
--
ALTER TABLE `musica`
  MODIFY `musica_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `obras`
--
ALTER TABLE `obras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `realidad_virtual`
--
ALTER TABLE `realidad_virtual`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `respuestas`
--
ALTER TABLE `respuestas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `comentarios_ibfk_1` FOREIGN KEY (`obra_id`) REFERENCES `obras` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comentarios_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`obra_id`) REFERENCES `obras` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `obras`
--
ALTER TABLE `obras`
  ADD CONSTRAINT `obras_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
