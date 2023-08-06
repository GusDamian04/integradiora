-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-08-2023 a las 00:23:26
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `papeleria`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id_product` smallint(3) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `price` double NOT NULL,
  `stock` int(11) NOT NULL,
  `category` varchar(30) NOT NULL,
  `brand` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id_product`, `name`, `price`, `stock`, `category`, `brand`) VALUES
(16, 'BIC Round Stic Grip', 5.5, 12, 'Lapiceros', 'BIC'),
(17, 'Pentel Wow! Retráctil', 7.5, 5, 'Lapiceros', 'Pentel'),
(18, 'Paper Mate InkJoy 300RT', 6.25, 8, 'Lapiceros', 'Paper Mate'),
(19, 'Staedtler Triplus Fineliner', 5, 10, 'Lapiceros', 'Staedtler'),
(20, 'Pilot G2 Premium', 8.2, 13, 'Lapiceros', ' Pilot'),
(21, 'Ticonderoga Pencil', 6.5, 12, 'Lapices', 'Pencil'),
(22, 'Faber-Castell 2HB', 3.5, 20, 'Lapices', 'Faber-Castell'),
(23, 'Staedtler Norica', 5.5, 8, 'Lapices', 'Staedtler'),
(24, 'Prismacolor Premier Col-Erase', 7.5, 6, 'Lapices', 'Prismacolor'),
(25, 'Palomino Blackwing 602', 5.5, 8, 'Lapices', 'Palomino'),
(26, 'Maped Shaker', 3.5, 10, 'Sacapuntas', 'Maped'),
(27, 'Kum AS2', 2, 15, 'Sacapuntas', 'Kum'),
(28, 'Staedtler Double Hole Tub', 4, 11, 'Sacapuntas', 'Staedtler'),
(29, 'Faber-Castell Grip Trio', 3, 10, 'Sacapuntas', 'Faber-Castell'),
(30, 'Prismacolor Scholar', 4.5, 15, 'Sacapuntas', 'Prismacolor'),
(31, ' Pentel Hi-Polymer', 4, 16, 'Gomas', 'Pentel'),
(32, 'Sakura SumoGrip', 5.5, 9, 'Gomas', 'Sakura'),
(33, 'Faber-Castell Dust-Free', 3.5, 25, 'Gomas', 'Faber-Castell'),
(34, 'Staedtler Mars Plastic', 6.5, 4, 'Gomas', 'Staedtler'),
(35, 'Milan 430', 3, 36, 'Gomas', 'Milan'),
(36, ' Sharpie Accent Highlighter', 7.5, 16, 'Marcatextos', 'Sharpie'),
(37, ' Stabilo BOSS Original', 4, 16, 'Marcatextos', 'Stabilo'),
(38, 'Zebra Mildliner', 9, 9, 'Marcatextos', 'Zebra'),
(39, 'Pilot Frixion Light', 5.5, 25, 'Marcatextos', 'Pilot'),
(40, 'BIC Brite Liner', 5.5, 16, 'Marcatextos', 'BIC'),
(41, 'Set de 12 colores Winsor & Newton Cotman Watercolo', 10, 5, 'Pinturas', 'Winsor & Newton'),
(42, 'Set de 24 colores Sennelier Oil Pastels', 15.5, 6, 'Pinturas', 'Sennelier'),
(50, 'Set de 15 colores Rembrandt Soft Pastels', 8.5, 6, 'Pinturas', 'Rembrandt'),
(51, 'Faber-Castell ', 9, 5, 'Pinturas', 'Faber-Castell'),
(52, 'Set de 12 colores Prismacolor Premier', 9.5, 5, 'Pinturas', 'Prismacolor'),
(53, 'Set de 24 colores Schmincke Horadam Aquarell', 25, 5, 'Acuarelas', 'Schmincke'),
(54, 'Set de 12 colores Mijello Mission Gold Watercolors', 20, 6, 'Acuarelas', 'Mijello'),
(55, 'Paleta con 12 colores Prima Marketing Watercolor C', 15, 9, 'Acuarelas', 'Prima Marketing'),
(56, 'Set de 36 colores Kuretake Gansai Tambi Watercolor', 30, 5, 'Acuarelas', 'Kuretake'),
(57, 'Set de 12 colores Winsor & Newton Cotman Watercolo', 18.5, 6, 'Acuarelas', 'Winsor & Newton'),
(58, 'Whiteboard Chalk', 15, 6, 'Gises', 'Expo'),
(59, 'Soft Pastel Chalk', 18, 12, 'Gises', 'Faber-Castell'),
(60, 'Dustless Chalk', 7.5, 15, 'Gises', 'Quartet'),
(61, 'Liquid Chalk Markers', 14.5, 8, 'Gises', 'Chalkola'),
(62, 'Sargent Art Colored Chalk', 12, 6, 'Gises', 'Sargent Art'),
(63, 'Crayola Anti-Dust White Chalk', 16.5, 12, 'Crayolas', 'Crayola'),
(64, 'Crayola Sidewalk Chalk', 11, 15, 'Crayolas', 'Crayola'),
(65, 'Crayola Super Tips Washable Markers', 7, 15, 'Crayolas', 'Crayola '),
(66, 'Crayola Colored Pencils', 9, 13, 'Crayolas', 'Crayola '),
(67, 'Crayola Ultra-Clean Washable Crayons', 8, 6, 'Crayolas', 'Crayola'),
(68, 'Hojas Blancas', 1, 500, 'Papel', 'Hojas Blanca'),
(69, 'Hojas de Color', 1.5, 500, 'Papel', 'Hoja de Color'),
(70, 'Impresiones', 1.5, 500, 'Papel', 'Impresion'),
(71, 'Impresiones a color', 5, 500, 'Papel', 'Impresion'),
(72, 'Papel Bon', 6, 15, 'Papel', 'Papel Bon'),
(73, 'Profesional', 35, 20, 'Libretas', 'Scribe'),
(74, 'Norma', 30, 6, 'Libretas', 'Norma');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sale`
--

CREATE TABLE `sale` (
  `ticket` int(10) NOT NULL,
  `id_user` smallint(3) UNSIGNED NOT NULL,
  `id_product` smallint(3) UNSIGNED NOT NULL,
  `amount` int(5) NOT NULL,
  `total` double NOT NULL,
  `date` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `sale`
--

INSERT INTO `sale` (`ticket`, `id_user`, `id_product`, `amount`, `total`, `date`) VALUES
(21, 2, 16, 1, 5.5, '27/07/2023'),
(22, 2, 17, 2, 15, '27/07/2023'),
(23, 2, 21, 1, 6.5, '27/07/2023'),
(24, 2, 22, 2, 7, '27/07/2023'),
(25, 2, 26, 3, 10.5, '27/07/2023'),
(26, 2, 27, 3, 8, '27/07/2023'),
(27, 2, 31, 3, 12, '27/07/2023'),
(28, 2, 32, 1, 5.5, '27/07/2023'),
(29, 2, 36, 2, 15, '27/07/2023'),
(30, 2, 37, 1, 4, '27/07/2023'),
(33, 2, 41, 1, 10, '27/07/2023'),
(34, 2, 42, 1, 15.5, '27/07/2023'),
(35, 2, 53, 1, 25, '27/07/2023'),
(36, 2, 54, 2, 40, '27/07/2023'),
(37, 2, 58, 1, 15, '27/07/2023'),
(38, 2, 60, 2, 15, '27/07/2023'),
(39, 2, 63, 1, 16.5, '27/07/2023'),
(40, 2, 65, 3, 21, '27/07/2023'),
(41, 2, 68, 5, 5, '27/07/2023'),
(42, 2, 70, 4, 6, '27/07/2023'),
(43, 2, 74, 1, 30, '27/07/2023'),
(46, 9, 18, 2, 6.25, '28/07/2023'),
(47, 9, 19, 4, 20, '28/07/2023'),
(48, 9, 28, 1, 4, '28/07/2023'),
(49, 9, 30, 2, 9, '28/07/2023'),
(52, 9, 33, 2, 7, '28/07/2023'),
(53, 9, 35, 1, 3, '28/07/2023'),
(54, 9, 69, 9, 13.5, '28/07/2023'),
(55, 9, 37, 1, 4, '28/07/2023'),
(56, 9, 52, 1, 9.5, '28/07/2023'),
(57, 9, 64, 1, 11, '28/07/2023'),
(58, 9, 59, 1, 18, '28/07/2023'),
(59, 9, 67, 2, 16, '28/07/2023'),
(60, 9, 65, 1, 7, '28/07/2023'),
(61, 9, 71, 11, 55, '28/07/2023'),
(64, 9, 63, 1, 16.5, '28/07/2023'),
(65, 9, 62, 1, 12, '28/07/2023');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id` smallint(3) UNSIGNED NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` char(102) NOT NULL,
  `roll` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the user''s data.';

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `roll`) VALUES
(2, 'Admin', 'pbkdf2:sha256:600000$0k78DPen5B2r2W20$6be3ccc831e45b5c12af9e5c6830b09803c9407ed9a361c15ad6dee5613d83d4', 'adm'),
(6, 'Gustavo', 'pbkdf2:sha256:600000$XMb8WaxwXhdzm5N4$340e1d59431bed01c126b0bc707f0a99b621d4e6b652019f966a8776962580e3', 'emp'),
(9, 'Empleado', 'pbkdf2:sha256:600000$eEaqnksRv5N7knHw$675829de64db4a44ca830d6666572627546246b9f7a0c649a373c919cdcd75a9', 'emp');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id_product`),
  ADD KEY `category` (`category`),
  ADD KEY `brand` (`brand`);

--
-- Indices de la tabla `sale`
--
ALTER TABLE `sale`
  ADD PRIMARY KEY (`ticket`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_product` (`id_product`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id_product` smallint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT de la tabla `sale`
--
ALTER TABLE `sale`
  MODIFY `ticket` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id` smallint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `sale`
--
ALTER TABLE `sale`
  ADD CONSTRAINT `sale_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sale_ibfk_2` FOREIGN KEY (`id_product`) REFERENCES `products` (`id_product`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
