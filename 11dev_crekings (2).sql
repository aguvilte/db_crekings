-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost:5432
-- Tiempo de generación: 21-03-2019 a las 20:41:39
-- Versión del servidor: 5.7.25-0ubuntu0.16.04.2
-- Versión de PHP: 7.0.33-5+ubuntu16.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dev_crekings`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paises`
--

CREATE TABLE `paises` (
  `codigo` varchar(3) COLLATE utf8_spanish_ci NOT NULL,
  `pais` varchar(255) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `paises`
--

INSERT INTO `paises` (`codigo`, `pais`) VALUES
('1', 'Argentina'),
('2', 'Brasil'),
('3', 'Colombia'),
('4', 'Ecuador'),
('5', 'Perú');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rangos`
--

CREATE TABLE `rangos` (
  `id_rango` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `pago_semanal` double NOT NULL,
  `pago_mensual` double NOT NULL,
  `cantidad_minima` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `rangos`
--

INSERT INTO `rangos` (`id_rango`, `nombre`, `pago_semanal`, `pago_mensual`, `cantidad_minima`) VALUES
(1, 'Inicial', 7, 28, 0),
(2, 'Básico', 9, 36, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios_datos`
--

CREATE TABLE `usuarios_datos` (
  `id_usuario` int(11) NOT NULL,
  `nom_ape` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `telefono` varchar(32) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `codigo_pais` varchar(3) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ruta_imagen` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `fecha_registro` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuarios_datos`
--

INSERT INTO `usuarios_datos` (`id_usuario`, `nom_ape`, `email`, `telefono`, `fecha_nacimiento`, `codigo_pais`, `ruta_imagen`, `estado`, `fecha_registro`) VALUES
(1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 'Agustín Vilte', 'aguvilte@gmail.com', '3804313370', '2019-03-08', '1', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios_invitados`
--

CREATE TABLE `usuarios_invitados` (
  `id_usuario` int(11) NOT NULL,
  `id_usuario_invitado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuarios_invitados`
--

INSERT INTO `usuarios_invitados` (`id_usuario`, `id_usuario_invitado`) VALUES
(1, 1),
(1, 2),
(1, 5),
(1, 6),
(2, 3),
(2, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios_login`
--

CREATE TABLE `usuarios_login` (
  `id_usuario` int(11) NOT NULL,
  `nombre_usuario` varchar(32) COLLATE utf8_spanish_ci NOT NULL,
  `contrasena` varchar(255) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuarios_login`
--

INSERT INTO `usuarios_login` (`id_usuario`, `nombre_usuario`, `contrasena`) VALUES
(1, 'admin', '123456'),
(2, 'aguvilte', 'aguvilte14'),
(3, 'queseyo', 'no sé'),
(4, 'unusuario', 'no sé'),
(5, 'cualquiera', '123456'),
(6, 'cualquiera1', '123456');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios_rangos`
--

CREATE TABLE `usuarios_rangos` (
  `id_usuario` int(11) NOT NULL,
  `id_rango` int(11) NOT NULL,
  `hijos_activos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuarios_rangos`
--

INSERT INTO `usuarios_rangos` (`id_usuario`, `id_rango`, `hijos_activos`) VALUES
(1, 2, 4),
(2, 1, 2),
(3, 1, 0),
(4, 1, 0),
(6, 1, 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `paises`
--
ALTER TABLE `paises`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `rangos`
--
ALTER TABLE `rangos`
  ADD PRIMARY KEY (`id_rango`);

--
-- Indices de la tabla `usuarios_datos`
--
ALTER TABLE `usuarios_datos`
  ADD PRIMARY KEY (`id_usuario`);

--
-- Indices de la tabla `usuarios_invitados`
--
ALTER TABLE `usuarios_invitados`
  ADD PRIMARY KEY (`id_usuario`,`id_usuario_invitado`);

--
-- Indices de la tabla `usuarios_login`
--
ALTER TABLE `usuarios_login`
  ADD PRIMARY KEY (`id_usuario`);

--
-- Indices de la tabla `usuarios_rangos`
--
ALTER TABLE `usuarios_rangos`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `rangos`
--
ALTER TABLE `rangos`
  MODIFY `id_rango` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `usuarios_login`
--
ALTER TABLE `usuarios_login`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
