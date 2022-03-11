-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-02-2022 a las 22:14:24
-- Versión del servidor: 10.4.13-MariaDB
-- Versión de PHP: 7.2.31

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
-- Estructura de tabla para la tabla `documentos`
--

CREATE TABLE `documentos` (
  `documentID` int(11) NOT NULL,
  `documentName` varchar(50) NOT NULL,
  `documentURL` varchar(150) NOT NULL,
  `documentType` varchar(30) NOT NULL,
  `personId` int(11) DEFAULT NULL,
  `bActive` tinyint(1) DEFAULT 1,
  `fCreatedAt` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `noticias`
--

CREATE TABLE `noticias` (
  `noticeID` int(11) NOT NULL,
  `noticeTxt` text NOT NULL,
  `noticePhoto` varchar(200) DEFAULT NULL,
  `userID` int(11) DEFAULT NULL,
  `bActive` tinyint(1) DEFAULT 0,
  `fCreatedAt` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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

--
-- Volcado de datos para la tabla `personas`
--

INSERT INTO `personas` (`personId`, `personName`, `personLastName`, `personRFC`, `bActive`, `dtCreatedAt`) VALUES
(1, 'Admin', 'Admin', 'ADMI220222000', 1, '2022-02-22 12:39:57'),
(2, 'Secretario', 'General', 'SEGE220222001', 1, '2022-02-22 12:39:57'),
(3, 'Miembro', 'Activo', 'MIAC220222002', 1, '2022-02-22 12:39:57'),
(4, 'Miembro', 'Inactivo', 'MIIA220222003', 0, '2022-02-22 12:39:57'),
(5, 'Visitante', '', '', 1, '2022-02-22 12:39:57');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `userdata`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `userdata` (
`personId` int(11)
,`userId` int(11)
,`Name` varchar(50)
,`Lastname` varchar(100)
,`RFC` varchar(13)
,`personActive` tinyint(1)
,`user` varchar(20)
,`userType` varchar(20)
,`userActive` tinyint(1)
);

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
(1, 1, 'admin', '0192023a7bbd73250516f069df18b500', 'Administrador', 1, '2022-02-22 12:47:08'),
(2, 2, 'sege', '1c14dc03fc8dd53f7ed5df8dc63991df', 'Secretario General', 1, '2022-02-22 12:47:08'),
(3, 3, 'miac', 'de697fc11fe70771f92db92d004b8583', 'Miembro', 1, '2022-02-22 12:47:08'),
(4, 4, 'miin', 'de697fc11fe70771f92db92d004b8583', 'Miembro', 0, '2022-02-22 12:47:08'),
(5, 5, 'visit', 'a213033c0d9f7d83cd8f18d2f96be975', 'Visitante', 1, '2022-02-22 12:47:08');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vwuserdocuments`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vwuserdocuments` (
`documentID` int(11)
,`Document` varchar(50)
,`URL` varchar(150)
,`Type` varchar(30)
,`fCreatedAt` datetime
,`personId` int(11)
,`Editor` varchar(151)
,`user` varchar(20)
,`userType` varchar(20)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `allusers`
--
DROP TABLE IF EXISTS `allusers`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `allusers`  AS  select `users`.`user` AS `user`,`users`.`pass` AS `pass` from `users` where `users`.`bActive` = 1 ;

-- --------------------------------------------------------

--
-- Estructura para la vista `userdata`
--
DROP TABLE IF EXISTS `userdata`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `userdata`  AS  select `p`.`personId` AS `personId`,`u`.`userId` AS `userId`,`p`.`personName` AS `Name`,`p`.`personLastName` AS `Lastname`,`p`.`personRFC` AS `RFC`,`p`.`bActive` AS `personActive`,`u`.`user` AS `user`,`u`.`userType` AS `userType`,`u`.`bActive` AS `userActive` from (`personas` `p` join `users` `u` on(`u`.`personId` = `p`.`personId`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vwuserdocuments`
--
DROP TABLE IF EXISTS `vwuserdocuments`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vwuserdocuments`  AS  select `d`.`documentID` AS `documentID`,`d`.`documentName` AS `Document`,`d`.`documentURL` AS `URL`,`d`.`documentType` AS `Type`,`d`.`fCreatedAt` AS `fCreatedAt`,`p`.`personId` AS `personId`,concat(`p`.`Name`,' ',`p`.`Lastname`) AS `Editor`,`p`.`user` AS `user`,`p`.`userType` AS `userType` from (`documentos` `d` join `userdata` `p` on(`d`.`personId` = `p`.`personId`)) ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `documentos`
--
ALTER TABLE `documentos`
  ADD PRIMARY KEY (`documentID`);

--
-- Indices de la tabla `noticias`
--
ALTER TABLE `noticias`
  ADD PRIMARY KEY (`noticeID`);

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
-- AUTO_INCREMENT de la tabla `documentos`
--
ALTER TABLE `documentos`
  MODIFY `documentID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `noticias`
--
ALTER TABLE `noticias`
  MODIFY `noticeID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `personas`
--
ALTER TABLE `personas`
  MODIFY `personId` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Llave Principal', AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
