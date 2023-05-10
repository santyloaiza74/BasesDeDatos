-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-05-2023 a las 00:22:42
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `biblioteca`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autor`
--

CREATE TABLE `autor` (
  `Id_Autor` int(11) NOT NULL,
  `Documento` varchar(20) NOT NULL,
  `Nombres` varchar(50) NOT NULL,
  `Apellidos` varchar(50) NOT NULL,
  `Email` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ejemplar`
--

CREATE TABLE `ejemplar` (
  `Id_Ejemplar` int(11) NOT NULL,
  `Nombre` varchar(60) NOT NULL,
  `Disponibilidad` tinyint(1) NOT NULL,
  `Id_Libro` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ejemplarprestamo`
--

CREATE TABLE `ejemplarprestamo` (
  `Id_EjemplarPrestamo` int(11) NOT NULL,
  `Id_Prestamo` int(11) NOT NULL,
  `Id_Ejemplar` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `idioma`
--

CREATE TABLE `idioma` (
  `Id_Idioma` int(11) NOT NULL,
  `Nombre` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libro`
--

CREATE TABLE `libro` (
  `Id_Libro` int(11) NOT NULL,
  `Titulo` varchar(50) NOT NULL,
  `ISBN` varchar(20) NOT NULL,
  `AñoPublicacion` date DEFAULT NULL,
  `Editorial` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libroautor`
--

CREATE TABLE `libroautor` (
  `Id_LibroAutor` int(11) NOT NULL,
  `Id_Libro` int(11) NOT NULL,
  `Id_Autor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libroidioma`
--

CREATE TABLE `libroidioma` (
  `Id_LibroIdioma` int(11) NOT NULL,
  `Id_Libro` int(11) NOT NULL,
  `Id_Idioma` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamo`
--

CREATE TABLE `prestamo` (
  `Id_prestamo` int(11) NOT NULL,
  `FechaPrestamo` date DEFAULT NULL,
  `FechaEntrega` date DEFAULT NULL,
  `Estado` tinyint(1) NOT NULL,
  `Id_Socio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `socio`
--

CREATE TABLE `socio` (
  `Id_Socio` int(11) NOT NULL,
  `Documento` varchar(15) NOT NULL,
  `Nombres` varchar(50) NOT NULL,
  `Apellidos` varchar(50) NOT NULL,
  `Email` varchar(40) NOT NULL,
  `Direccion` varchar(50) NOT NULL,
  `Celular` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tema`
--

CREATE TABLE `tema` (
  `Id_Tema` int(11) NOT NULL,
  `Categoria` varchar(40) NOT NULL,
  `Id_Libro` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `autor`
--
ALTER TABLE `autor`
  ADD PRIMARY KEY (`Id_Autor`),
  ADD UNIQUE KEY `Documento` (`Documento`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Indices de la tabla `ejemplar`
--
ALTER TABLE `ejemplar`
  ADD PRIMARY KEY (`Id_Ejemplar`),
  ADD KEY `ejemplat_libro` (`Id_Libro`);

--
-- Indices de la tabla `ejemplarprestamo`
--
ALTER TABLE `ejemplarprestamo`
  ADD PRIMARY KEY (`Id_EjemplarPrestamo`),
  ADD KEY `ejemplarPrestamo_prestamo` (`Id_Prestamo`),
  ADD KEY `ejemplarPrestamo_ejemplar` (`Id_Ejemplar`);

--
-- Indices de la tabla `idioma`
--
ALTER TABLE `idioma`
  ADD PRIMARY KEY (`Id_Idioma`);

--
-- Indices de la tabla `libro`
--
ALTER TABLE `libro`
  ADD PRIMARY KEY (`Id_Libro`),
  ADD UNIQUE KEY `ISBN` (`ISBN`);

--
-- Indices de la tabla `libroautor`
--
ALTER TABLE `libroautor`
  ADD PRIMARY KEY (`Id_LibroAutor`),
  ADD KEY `libroAutor_libro` (`Id_Libro`),
  ADD KEY `libroAutor_autor` (`Id_Autor`);

--
-- Indices de la tabla `libroidioma`
--
ALTER TABLE `libroidioma`
  ADD PRIMARY KEY (`Id_LibroIdioma`),
  ADD KEY `libroIdioma_Libro` (`Id_Libro`),
  ADD KEY `libroIdioma_Idioma` (`Id_Idioma`);

--
-- Indices de la tabla `prestamo`
--
ALTER TABLE `prestamo`
  ADD PRIMARY KEY (`Id_prestamo`),
  ADD KEY `prestamo_socio` (`Id_Socio`);

--
-- Indices de la tabla `socio`
--
ALTER TABLE `socio`
  ADD PRIMARY KEY (`Id_Socio`),
  ADD UNIQUE KEY `Documento` (`Documento`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Indices de la tabla `tema`
--
ALTER TABLE `tema`
  ADD PRIMARY KEY (`Id_Tema`),
  ADD KEY `tema_libro` (`Id_Libro`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `autor`
--
ALTER TABLE `autor`
  MODIFY `Id_Autor` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ejemplar`
--
ALTER TABLE `ejemplar`
  MODIFY `Id_Ejemplar` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ejemplarprestamo`
--
ALTER TABLE `ejemplarprestamo`
  MODIFY `Id_EjemplarPrestamo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `idioma`
--
ALTER TABLE `idioma`
  MODIFY `Id_Idioma` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `libro`
--
ALTER TABLE `libro`
  MODIFY `Id_Libro` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `libroautor`
--
ALTER TABLE `libroautor`
  MODIFY `Id_LibroAutor` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `libroidioma`
--
ALTER TABLE `libroidioma`
  MODIFY `Id_LibroIdioma` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `prestamo`
--
ALTER TABLE `prestamo`
  MODIFY `Id_prestamo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `socio`
--
ALTER TABLE `socio`
  MODIFY `Id_Socio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tema`
--
ALTER TABLE `tema`
  MODIFY `Id_Tema` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ejemplar`
--
ALTER TABLE `ejemplar`
  ADD CONSTRAINT `ejemplat_libro` FOREIGN KEY (`Id_Libro`) REFERENCES `libro` (`Id_Libro`);

--
-- Filtros para la tabla `ejemplarprestamo`
--
ALTER TABLE `ejemplarprestamo`
  ADD CONSTRAINT `ejemplarPrestamo_ejemplar` FOREIGN KEY (`Id_Ejemplar`) REFERENCES `ejemplar` (`Id_Ejemplar`),
  ADD CONSTRAINT `ejemplarPrestamo_prestamo` FOREIGN KEY (`Id_Prestamo`) REFERENCES `prestamo` (`Id_prestamo`);

--
-- Filtros para la tabla `libroautor`
--
ALTER TABLE `libroautor`
  ADD CONSTRAINT `libroAutor_autor` FOREIGN KEY (`Id_Autor`) REFERENCES `autor` (`Id_Autor`),
  ADD CONSTRAINT `libroAutor_libro` FOREIGN KEY (`Id_Libro`) REFERENCES `libro` (`Id_Libro`);

--
-- Filtros para la tabla `libroidioma`
--
ALTER TABLE `libroidioma`
  ADD CONSTRAINT `libroIdioma_Idioma` FOREIGN KEY (`Id_Idioma`) REFERENCES `idioma` (`Id_Idioma`),
  ADD CONSTRAINT `libroIdioma_Libro` FOREIGN KEY (`Id_Libro`) REFERENCES `libro` (`Id_Libro`);

--
-- Filtros para la tabla `prestamo`
--
ALTER TABLE `prestamo`
  ADD CONSTRAINT `prestamo_socio` FOREIGN KEY (`Id_Socio`) REFERENCES `socio` (`Id_Socio`);

--
-- Filtros para la tabla `tema`
--
ALTER TABLE `tema`
  ADD CONSTRAINT `tema_libro` FOREIGN KEY (`Id_Libro`) REFERENCES `libro` (`Id_Libro`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
