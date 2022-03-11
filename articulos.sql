-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-02-2022 a las 16:48:23
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dblogin`
--

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `allusers`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `allusers` (
`user` varchar(20)
,`pass` varchar(40)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas`
--

CREATE TABLE `personas` (
  `personId` int(11) NOT NULL COMMENT 'Llave Principal',
  `personName` varchar(50) DEFAULT NULL COMMENT 'Nombre(s) de la persona',
  `personLastName` varchar(100) NOT NULL COMMENT 'Apellido(s) de la Persona',
  `personRFC` varchar(13) NOT NULL DEFAULT '0' COMMENT 'RFC de pa Persona',
  `bActive` tinyint(1) NOT NULL COMMENT 'Activo o inactivo',
  `dtCreatedAt` datetime NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de creación del registro'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `userId` int(11) NOT NULL,
  `personId` int(11) NOT NULL,
  `user` varchar(20) NOT NULL,
  `pass` varchar(40) NOT NULL,
  `userType` varchar(20) NOT NULL,
  `bActive` tinyint(1) NOT NULL DEFAULT 0,
  `dtCreatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`userId`, `personId`, `user`, `pass`, `userType`, `bActive`, `dtCreatedAt`) VALUES
(1, 1, 'Admin', 'admin123', 'Administrador', 1, '2022-02-21 09:13:03'),
(2, 2, 'Empleado', 'empleado123', 'Empleado', 1, '2022-02-21 09:13:03'),
(3, 3, 'Cliente', 'cliente123', 'Cliente', 0, '2022-02-21 09:13:03');

-- --------------------------------------------------------

--
-- Estructura para la vista `allusers`
--
DROP TABLE IF EXISTS `allusers`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `allusers`  AS SELECT `users`.`user` AS `user`, `users`.`pass` AS `pass` FROM `users` WHERE `users`.`bActive` = 1 ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `personas`
--
ALTER TABLE `personas`
  ADD PRIMARY KEY (`personId`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userId`),
  ADD UNIQUE KEY `usuario` (`user`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `personas`
--
ALTER TABLE `personas`
  MODIFY `personId` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Llave Principal';

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
