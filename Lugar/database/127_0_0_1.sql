-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-03-2024 a las 06:41:10
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
-- Base de datos: `place`
--
CREATE DATABASE IF NOT EXISTS `place` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `place`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudad`
--

CREATE TABLE `ciudad` (
  `ID_ciudad` int(11) NOT NULL,
  `Nombre` varchar(255) NOT NULL,
  `Pais` varchar(100) NOT NULL,
  `Poblacion` int(11) NOT NULL,
  `Clima` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ciudad`
--

INSERT INTO `ciudad` (`ID_ciudad`, `Nombre`, `Pais`, `Poblacion`, `Clima`) VALUES
(1, 'Nueva York', 'EEUU', 3990000, 'Frio'),
(2, 'Cartagena', 'Colombia', 15000, 'Calido'),
(3, 'Madrid', 'España', 20087, 'Frio Calido'),
(4, 'Medellin', 'Colombia', 150000, 'Calido'),
(5, 'Ciudad de Mexico', 'Mexico', 189000, 'Calido, Frio'),
(6, 'Moscu', 'Rusia', 9901234, 'Frio'),
(7, 'Los Angeles, California', 'EEUU', 1599000, 'Calido'),
(8, 'Quito', 'Ecuador', 1800045, 'Frio'),
(9, 'Ambato', 'Ecuador', 35000, 'Frio'),
(10, 'Buenos Aires', 'Argentina', 35086676, 'Frio, Calido'),
(11, 'Paris', 'Francia', 78099999, 'Calido, Frio'),
(12, 'Jersusalen', 'Israel', 9023442, 'Calido, seco'),
(13, 'Estambul', 'Turquia', 5656765, 'Frio'),
(14, 'San Salvador', 'El Salvador', 23423, 'calido');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `turistas`
--

CREATE TABLE `turistas` (
  `ID_turista` int(11) NOT NULL,
  `Nombre` varchar(255) NOT NULL,
  `Nacionalidad` varchar(100) NOT NULL,
  `Edad` int(3) NOT NULL,
  `Intereses` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `turistas`
--

INSERT INTO `turistas` (`ID_turista`, `Nombre`, `Nacionalidad`, `Edad`, `Intereses`) VALUES
(1, 'Fabian', 'Colombiano', 35, 'Conocer el lugar'),
(2, 'Jennyfer', 'Ecuatoriana', 25, 'Conocer lugar'),
(3, 'Ximena', 'Mexicana', 29, 'Trabajo'),
(4, 'Francisco', 'Español', 38, 'Conocer lugar'),
(5, 'Marialia', 'Colombiana', 31, 'Conocer el lugar');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `visita`
--

CREATE TABLE `visita` (
  `ID_visita` int(11) NOT NULL,
  `ID_turista` int(11) DEFAULT NULL,
  `ID_ciudad` int(11) DEFAULT NULL,
  `Fecha_visita` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `visita`
--

INSERT INTO `visita` (`ID_visita`, `ID_turista`, `ID_ciudad`, `Fecha_visita`) VALUES
(1, NULL, NULL, '2024-03-01'),
(2, NULL, NULL, '2024-03-01'),
(3, NULL, NULL, '2024-03-01'),
(4, NULL, NULL, '2024-03-01'),
(5, NULL, NULL, '2024-03-01');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ciudad`
--
ALTER TABLE `ciudad`
  ADD PRIMARY KEY (`ID_ciudad`);

--
-- Indices de la tabla `turistas`
--
ALTER TABLE `turistas`
  ADD PRIMARY KEY (`ID_turista`);

--
-- Indices de la tabla `visita`
--
ALTER TABLE `visita`
  ADD PRIMARY KEY (`ID_visita`),
  ADD KEY `ID_turista` (`ID_turista`),
  ADD KEY `ID_ciudad` (`ID_ciudad`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `ciudad`
--
ALTER TABLE `ciudad`
  MODIFY `ID_ciudad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `turistas`
--
ALTER TABLE `turistas`
  MODIFY `ID_turista` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `visita`
--
ALTER TABLE `visita`
  MODIFY `ID_visita` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `visita`
--
ALTER TABLE `visita`
  ADD CONSTRAINT `visita_ibfk_1` FOREIGN KEY (`ID_turista`) REFERENCES `turistas` (`ID_turista`),
  ADD CONSTRAINT `visita_ibfk_2` FOREIGN KEY (`ID_ciudad`) REFERENCES `ciudad` (`ID_ciudad`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
