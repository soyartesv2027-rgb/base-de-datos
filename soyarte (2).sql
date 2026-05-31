-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 31-05-2026 a las 19:43:13
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
-- Estructura de tabla para la tabla `likes`
--

CREATE TABLE `likes` (
  `id` int(11) NOT NULL,
  `obra_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL
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
  `nombre_cantante` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `obras`
--

CREATE TABLE `obras` (
  `id` int(11) NOT NULL,
  `titulo` varchar(150) NOT NULL,
  `poema` text NOT NULL,
  `imagen` longblob DEFAULT NULL,
  `usuario_id` int(11) NOT NULL,
  `fecha_publicacion` timestamp NOT NULL DEFAULT current_timestamp()
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
(6, 14, 'pintura con girasoles', 'para los amantes de los girasoles', 10.00, '1780120649_girasoles.jpg', 'Pintura', 1, '2026-05-30 05:57:29');

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
(14, 'Jefferson Orellana', 'jefferson@gmail.com', '$2y$10$N9itAfM3vdK7OfZ48b3rRutq/uNEWnTETRmnyH/2dsvK6G7G8wrZy', 'usuario', NULL, 'perfil_14_1780123371.jpg', NULL, NULL, 'claro'),
(15, 'Jefferson Garcia', 'orellana@gmail.com', '$2y$10$ai3HI.EyN4we.x/IPXXdbe7iiCgOlGCkjNuuKA47CAFNtWjoO/Eza', 'usuario', NULL, NULL, NULL, NULL, 'claro'),
(16, 'Caleb Vladimir', 'caleb.cortez2027@adoc.superate.org.sv', '$2y$10$nuKgTG/RGFRYHgMJHUGMheTFN0GWOmWpghcy.Dsw1Pz5w9YNnq.yG', 'usuario', NULL, NULL, NULL, NULL, 'claro');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `musica`
--
ALTER TABLE `musica`
  ADD PRIMARY KEY (`musica_id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
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
-- AUTO_INCREMENT de la tabla `musica`
--
ALTER TABLE `musica`
  MODIFY `musica_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `respuestas`
--
ALTER TABLE `respuestas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
