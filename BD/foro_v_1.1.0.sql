-- phpMyAdmin SQL Dump
-- version 4.0.10.18
-- https://www.phpmyadmin.net
--
-- Servidor: localhost:3306
-- Tiempo de generación: 10-04-2017 a las 08:12:13
-- Versión del servidor: 5.6.28-76.1-log
-- Versión de PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `himala18_foro`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `areas`
--

CREATE TABLE IF NOT EXISTS `areas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `extencion_tel` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `horas_consumidas` decimal(15,2) NOT NULL DEFAULT '0.00',
  `estado` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `areas`
--

INSERT INTO `areas` (`id`, `nombre`, `extencion_tel`, `horas_consumidas`, `estado`, `created_at`, `updated_at`) VALUES
(1, 'Creatividad', '300', '26.00', 1, '2017-03-31 22:32:19', '2017-04-07 23:33:27'),
(2, 'Diseño', '300', '73.50', 1, '2017-03-31 22:32:19', '2017-04-10 13:08:58'),
(3, 'Desarrollo', '202', '20.30', 1, '2017-03-31 22:32:19', '2017-04-07 19:47:24'),
(4, 'Contenidos', '100', '5.00', 1, '2017-03-31 22:32:19', '2017-04-10 12:13:18'),
(5, 'Digital Performance', '100', '28.00', 1, '2017-03-31 22:32:19', '2017-04-03 18:00:19'),
(6, 'Servicio al Cliente', '100', '0.00', 1, '2017-03-31 22:32:19', '2017-04-03 19:40:37');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE IF NOT EXISTS `clientes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(115) COLLATE utf8_unicode_ci NOT NULL,
  `nit` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(115) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telefono` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nombre_contacto` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `estado` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `razon_social` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=25 ;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `nombre`, `nit`, `email`, `telefono`, `nombre_contacto`, `estado`, `created_at`, `updated_at`, `razon_social`) VALUES
(1, 'Electrojaponesa', '12345678', NULL, NULL, 'Victoria', 0, '2017-03-31 22:32:19', '2017-04-03 19:44:54', NULL),
(2, 'Adeinco', '12345678', NULL, NULL, 'Pablo', 1, '2017-03-31 22:32:19', '2017-03-31 22:32:19', NULL),
(3, 'Calzatodo', '12345678', NULL, NULL, 'Santiago', 0, '2017-03-31 22:32:19', '2017-04-03 19:45:04', NULL),
(4, 'Himalaya', '87654321', NULL, NULL, 'M. Isabel', 1, '2017-03-31 22:32:19', '2017-03-31 22:32:19', NULL),
(5, 'Comfandi - Corporativo', '37469569567', '', '', 'Lyda Prado', 1, '2017-04-01 00:33:12', '2017-04-01 01:13:01', NULL),
(6, 'Harinera del Valle - Pastas La Muñeca', '891.300.382', 'mp.mejia@hv.com.co', '', 'Paola Mejia', 1, '2017-04-01 00:40:54', '2017-04-01 00:40:54', NULL),
(7, 'Polylon', '817000960-3', 'victor.guerrero@polylon.com', '4854848', 'Victor Guerrero', 1, '2017-04-03 20:49:59', '2017-04-03 20:49:59', NULL),
(8, 'Kassis', '8050201613', 'neiver-castaneda@kassis.com.co', '8893967', 'Neiver Castaneda', 1, '2017-04-03 21:22:46', '2017-04-03 21:22:46', NULL),
(9, 'Constructora Meléndez', '890302629-8', 'jdcorrea@constructoramelendez.com', '', 'Juan David Correa ', 1, '2017-04-03 21:57:28', '2017-04-03 21:57:28', NULL),
(10, 'Comfandi - Vallempresa365', '890303208-5', 'lydaprado@comfandi.com.co', '3185483292', 'Lyda Prado', 1, '2017-04-03 18:50:52', '2017-04-03 18:50:52', NULL),
(11, 'Comfandi - Centro de Empleo', '89030303208-5', 'lydaprado@comfandi.com.co', '3185483292', 'Lyda prado', 1, '2017-04-03 18:51:48', '2017-04-03 18:51:48', NULL),
(12, 'Harinera del Valle - Corporativo', '891300382​-9', 'kj.londono@hv.com.co', 'kj.londono@hv.com.co', 'Kelly Johanna ', 1, '2017-04-03 19:06:37', '2017-04-03 19:44:45', NULL),
(13, 'Siderúrgica de Occidente - SIDOC', '8903330231', 'redes@sidocsa.com', '', 'Jaime Munoz', 1, '2017-04-04 13:36:14', '2017-04-04 13:36:14', NULL),
(14, 'Ladrillera San Benito ', '800133691-2', 'gerencia@ladrillerasanbenito.com', '', 'Maria del Rosario Arias', 1, '2017-04-04 17:35:10', '2017-04-04 17:35:10', NULL),
(15, 'Simark ', '900407971-1', '', '', 'Adriana Echeverry', 1, '2017-04-04 23:15:07', '2017-04-04 23:15:07', NULL),
(16, 'Harinera del Valle - Haz de Oros Industrial', '891300382​-9​​', '', '', 'Manuel Garcia', 1, '2017-04-05 21:39:18', '2017-04-05 21:39:18', NULL),
(17, 'Harinera del Valle - Haz Oros - Familiar', '891300382​-9​​', '', '', 'Angie Llanos', 1, '2017-04-05 22:04:26', '2017-04-05 22:04:26', NULL),
(18, 'Juancho Correlón', '8050210558-7', 'direccion@juanchocorrelon.com', '31555962', 'Gilberto Parra', 1, '2017-04-06 16:14:47', '2017-04-06 16:14:47', NULL),
(19, 'Unicentro Cali', '890321156-7', '', '', 'Vicky Arroyabe', 1, '2017-04-06 16:22:54', '2017-04-06 16:22:54', NULL),
(20, 'Textiles Caffe Swimwear', '9001028451', 'saavedra_paula@yahoo.com', '', 'Paula Saavedra', 1, '2017-04-06 16:22:57', '2017-04-06 16:22:57', NULL),
(21, 'GEV ', '890306162 - 9', '', '', 'Alfonso ', 1, '2017-04-06 16:29:37', '2017-04-06 16:29:37', NULL),
(22, 'Pulpa Borojó El Pionero', '900.135.805-7', '', '', 'Yenny Casella ', 1, '2017-04-06 23:30:55', '2017-04-06 23:30:55', NULL),
(23, 'Manuelita corporativo ', '900275441-1', '', '', 'Antonio Echavarria', 1, '2017-04-07 22:46:24', '2017-04-07 22:46:24', NULL),
(24, 'Districintas', '8000293475', '', '', 'Victor Castano', 1, '2017-04-07 23:38:45', '2017-04-07 23:38:45', 'Districintas LTDA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios`
--

CREATE TABLE IF NOT EXISTS `comentarios` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `comentarios` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `usuarios_comentario_id` int(10) unsigned NOT NULL,
  `tareas_id` int(10) unsigned NOT NULL,
  `estados_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comentarios_estados_id_foreign` (`estados_id`),
  KEY `comentarios_usuarios_comentario_id_foreign` (`usuarios_comentario_id`),
  KEY `comentarios_tareas_id_foreign` (`tareas_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=278 ;

--
-- Volcado de datos para la tabla `comentarios`
--

INSERT INTO `comentarios` (`id`, `comentarios`, `usuarios_comentario_id`, `tareas_id`, `estados_id`, `created_at`, `updated_at`) VALUES
(1, 'Inverisión Neta: $35.000 el 1 de abril. dejar programada esta publicación para pauta solo para ese día', 10, 6, NULL, '2017-04-01 02:21:59', '2017-04-01 02:21:59'),
(2, 'En la solicitud de la tarea dice: " Pauta Descuento Droguerías - Gif que Anuncie descuento este 15 de abril)"  ¿sí en el Gif habla de un descuento del 15 de abril, por qué se pauta 5 días después? \n\nQuedo atento a tus comentarios.', 5, 11, 4, '2017-04-03 20:08:38', '2017-04-03 20:08:38'),
(3, 'Se pasa a programado.', 5, 25, 3, '2017-04-03 20:52:58', '2017-04-03 20:52:58'),
(4, 'Se realizo la capacitación!', 5, 25, 2, '2017-04-03 20:56:46', '2017-04-03 20:56:46'),
(5, 'Ajustar presentación', 5, 25, 3, '2017-04-03 20:57:51', '2017-04-03 20:57:51'),
(6, 'Se realizo el ajuste de la presentación', 5, 25, 2, '2017-04-03 20:58:37', '2017-04-03 20:58:37'),
(7, 'Revisado y entregado. ', 5, 25, 1, '2017-04-03 21:00:16', '2017-04-03 21:00:16'),
(8, '', 7, 30, 3, '2017-04-03 20:38:39', '2017-04-03 20:38:39'),
(9, '', 7, 31, 3, '2017-04-03 20:42:25', '2017-04-03 20:42:25'),
(10, '', 4, 36, 3, '2017-04-03 21:18:09', '2017-04-03 21:18:09'),
(11, '', 4, 43, 3, '2017-04-03 21:50:50', '2017-04-03 21:50:50'),
(12, '', 9, 37, 3, '2017-04-03 21:58:15', '2017-04-03 21:58:15'),
(13, 'También se debe ajustar el formulario que se hizo sobre esta campaña,este formulario es tamaño clic to web ', 11, 42, NULL, '2017-04-03 22:04:18', '2017-04-03 22:04:18'),
(14, '', 9, 42, 3, '2017-04-03 22:08:08', '2017-04-03 22:08:08'),
(15, '', 4, 43, 2, '2017-04-03 22:09:35', '2017-04-03 22:09:35'),
(16, '', 4, 43, 20, '2017-04-03 22:09:58', '2017-04-03 22:09:58'),
(17, '', 6, 38, 3, '2017-04-03 22:23:08', '2017-04-03 22:23:08'),
(18, 'Se pasa a programado', 6, 39, 3, '2017-04-03 22:24:59', '2017-04-03 22:24:59'),
(19, 'El día 6 vamos a pasar lo pensando con juan pablo murillo, sobre este video.', 9, 45, 3, '2017-04-03 22:25:09', '2017-04-03 22:25:09'),
(20, 'Se pasa a programado, Brian por favor tener en cuenta para este reporte un ajuste que hizo david a principio de marzo de una optimización sobre un wordpress que hay en el servidor de Harinera', 6, 40, 3, '2017-04-03 22:27:27', '2017-04-03 22:27:27'),
(21, 'Se pasa a programado', 6, 41, 3, '2017-04-03 22:28:32', '2017-04-03 22:28:32'),
(22, '', 4, 43, 1, '2017-04-03 22:45:15', '2017-04-03 22:45:15'),
(23, 'TAREA REALIZADA piezas en el link https://docs.google.com/presentation/d/1Jg5kHK183PWqY-CrdJYB0puK7Qmv73UBXxj3MQ83xx4/edit#slide=id.g21516418d5_0_106', 23, 37, 2, '2017-04-03 22:57:11', '2017-04-03 22:57:11'),
(24, '', 9, 37, 20, '2017-04-03 22:58:23', '2017-04-03 22:58:23'),
(25, 'Se cambio a target blanc el link de proveedores para los dos idiomas del sitio Harinera del Valle, tarea realizada.', 21, 38, 2, '2017-04-04 13:31:11', '2017-04-04 13:31:11'),
(26, 'Se cambia el estilo de la tipografía a Bold. Tarea Realizada', 21, 39, 2, '2017-04-04 13:59:11', '2017-04-04 13:59:11'),
(27, 'Se hizo una revisión en la linea de tiempo y se evidencio que carga la imagen correctamente; el problema puede haber sido causado por el cache de la página, por lo tanto no se visualizaba el cambio de la imagen inmediatamente. ', 21, 41, 2, '2017-04-04 14:47:37', '2017-04-04 14:47:37'),
(28, 'Realizado', 24, 42, 2, '2017-04-04 15:16:09', '2017-04-04 15:16:09'),
(29, 'Esta pieza se acaba de entregar por email para revisión interna', 23, 35, NULL, '2017-04-04 15:44:10', '2017-04-04 15:44:10'),
(30, '', 9, 35, 3, '2017-04-04 15:48:05', '2017-04-04 15:48:05'),
(31, '', 7, 34, 3, '2017-04-04 16:02:57', '2017-04-04 16:02:57'),
(32, '', 23, 35, 2, '2017-04-04 16:02:59', '2017-04-04 16:02:59'),
(33, '', 7, 34, 2, '2017-04-04 16:03:05', '2017-04-04 16:03:05'),
(34, 'Se pasa a programar.', 9, 33, 3, '2017-04-04 16:11:42', '2017-04-04 16:11:42'),
(35, '', 9, 35, 20, '2017-04-04 16:18:50', '2017-04-04 16:18:50'),
(36, 'Se pasa a programar', 9, 53, 3, '2017-04-04 16:22:28', '2017-04-04 16:22:28'),
(37, 'Ya quedo realizado y revisado, en espera para dar el OK.', 9, 42, NULL, '2017-04-04 16:27:47', '2017-04-04 16:27:47'),
(38, '', 9, 42, 20, '2017-04-04 16:27:55', '2017-04-04 16:27:55'),
(39, 'Se pasa a programar esta tarea.', 9, 50, 3, '2017-04-04 16:31:00', '2017-04-04 16:31:00'),
(40, 'Se pasa a programar', 9, 56, 3, '2017-04-04 16:42:36', '2017-04-04 16:42:36'),
(41, '', 23, 56, 2, '2017-04-04 16:57:00', '2017-04-04 16:57:00'),
(42, '', 4, 60, 3, '2017-04-04 18:30:17', '2017-04-04 18:30:17'),
(43, '', 4, 60, 1, '2017-04-04 18:30:55', '2017-04-04 18:30:55'),
(44, '', 4, 61, 1, '2017-04-04 18:33:06', '2017-04-04 18:33:06'),
(45, '', 7, 44, 3, '2017-04-04 19:33:29', '2017-04-04 19:33:29'),
(46, 'Nosotros no colocamos el chat en  línea y tampoco lo administramos. Sobre este chat no damos soporte, sin embargo si nos pasan los accesos podemos mirar que aparezca.', 6, 55, 4, '2017-04-04 19:36:46', '2017-04-04 19:36:46'),
(47, '', 7, 49, 3, '2017-04-04 19:37:51', '2017-04-04 19:37:51'),
(48, '', 7, 49, 3, '2017-04-04 19:38:10', '2017-04-04 19:38:10'),
(49, 'Hace falta que nos entreguen las piezas, para que se puedan publicar las noticias en la intranet y en la Web.', 16, 44, 5, '2017-04-04 19:56:16', '2017-04-04 19:56:16'),
(50, 'Ya quedaron publicadas las noticias en la intranet y en la web de ProgreSER.', 7, 44, 3, '2017-04-04 20:32:06', '2017-04-04 20:32:06'),
(51, '', 16, 44, 2, '2017-04-04 20:32:37', '2017-04-04 20:32:37'),
(52, '4-mar-17 MB: De acuerdo la publicación del gil de descuento es del 22, se pauta el 20 y 21 de Abril.\nSe ajusto la inversión neta de esta pauta a $84.000 debido a que otro post de pauta del 13 de abril que se tenia no va a salir. ', 2, 11, 5, '2017-04-04 21:25:12', '2017-04-04 21:25:12'),
(53, 'Se realizó la tarea, por correo se envía la información correspondiente al informe de Harinera del Valle', 21, 40, 2, '2017-04-04 21:49:22', '2017-04-04 21:49:22'),
(54, 'MB: Se ajusto la inversión a $70.000 ya que la publicación de pauta del 15 de abril no se realizara. Gracias', 2, 15, NULL, '2017-04-04 21:56:14', '2017-04-04 21:56:14'),
(55, 'Esta amplificación de post queda cancelada. El ppto se le sumo a otro post y se indico en la solicitud respectiva. ', 2, 9, NULL, '2017-04-04 22:01:59', '2017-04-04 22:01:59'),
(56, 'Esta amplificación de post queda cancelada. El ppto se le sumo a otro post y se indico en la solicitud respectiva. ', 2, 10, NULL, '2017-04-04 22:02:55', '2017-04-04 22:02:55'),
(57, '', 7, 29, 3, '2017-04-04 22:37:55', '2017-04-04 22:37:55'),
(58, '', 7, 29, 2, '2017-04-04 22:38:04', '2017-04-04 22:38:04'),
(59, '', 6, 41, 20, '2017-04-04 22:40:30', '2017-04-04 22:40:30'),
(60, '', 6, 39, 20, '2017-04-04 22:40:59', '2017-04-04 22:40:59'),
(61, '', 6, 38, 20, '2017-04-04 22:41:18', '2017-04-04 22:41:18'),
(62, 'Este tarea fue realizada el día de hoy', 9, 45, 20, '2017-04-04 22:59:18', '2017-04-04 22:59:18'),
(63, 'Esta solicitud ya quedo revisada. dejo aquí el link\n\nhttps://docs.google.com/spreadsheets/d/1thiGbA7Do6KPfJH-a9t20GakpvfTz8oSFyM_fSPyrRg/edit#gid=0', 9, 56, 20, '2017-04-04 23:03:47', '2017-04-04 23:03:47'),
(64, 'Se realizó y revisó el sitio, queda el informe en el siguiente link:\nhttps://docs.google.com/a/emarketing.com.co/document/d/10dz0JbjHw57JhiTf06NX1v0OeseOR30kUSe4bFQ4tF0/edit?usp=sharing', 6, 40, 20, '2017-04-04 23:04:53', '2017-04-04 23:04:53'),
(65, 'Esta tarea ya fue realizada.', 25, 50, 2, '2017-04-04 23:11:11', '2017-04-04 23:11:11'),
(66, 'Esta tarea ya fue realizada, y ya esta en el correo de la ejecutiva.', 9, 50, 20, '2017-04-04 23:12:22', '2017-04-04 23:12:22'),
(67, 'Marce, ¿ellos ya aprobaron lo del streaming, el pase VIP y demás? Porque de eso depende mucho del flow. Igual lo programo pero valídame la información. ', 4, 66, 3, '2017-04-05 11:43:51', '2017-04-05 11:43:51'),
(68, '', 4, 66, 3, '2017-04-05 11:43:54', '2017-04-05 11:43:54'),
(69, 'Marce, ¿ellos ya aprobaron lo del streaming, el pase VIP y demás? Porque de eso depende mucho del flow. Igual lo programo pero valídame la información. ', 4, 66, 4, '2017-04-05 11:49:14', '2017-04-05 11:49:14'),
(70, '', 7, 34, 1, '2017-04-05 12:47:07', '2017-04-05 12:47:07'),
(71, 'Esta tarea se pasa a programar.', 9, 65, 3, '2017-04-05 12:47:23', '2017-04-05 12:47:23'),
(72, '', 7, 29, 1, '2017-04-05 12:47:25', '2017-04-05 12:47:25'),
(73, '', 7, 44, 1, '2017-04-05 12:47:44', '2017-04-05 12:47:44'),
(74, 'Esta tarea se pasa a programar.', 9, 64, 3, '2017-04-05 13:10:41', '2017-04-05 13:10:41'),
(75, 'Tarea realizada', 25, 53, 2, '2017-04-05 15:36:59', '2017-04-05 15:36:59'),
(76, 'Esta tarea ya la tiene la ejecutiva en su correo.', 9, 53, 20, '2017-04-05 15:41:39', '2017-04-05 15:41:39'),
(77, 'Esta reunión ya fue realizada el día 5 de marzo.', 9, 70, 3, '2017-04-05 15:46:04', '2017-04-05 15:46:04'),
(78, 'Esta reunión ya fue realizada el día 5 de marzo.', 9, 70, 2, '2017-04-05 15:46:43', '2017-04-05 15:46:43'),
(79, 'Esta reunión ya fue realizada el día 5 de marzo.', 9, 70, 20, '2017-04-05 15:46:55', '2017-04-05 15:46:55'),
(80, 'Se pasa a programado', 6, 68, 3, '2017-04-05 16:57:50', '2017-04-05 16:57:50'),
(81, '', 4, 71, 1, '2017-04-05 19:48:53', '2017-04-05 19:48:53'),
(82, 'Esto se pasa a programar.', 9, 73, 3, '2017-04-05 20:33:34', '2017-04-05 20:33:34'),
(83, 'Se pasa a programar.', 9, 72, 3, '2017-04-05 20:34:49', '2017-04-05 20:34:49'),
(84, 'Al momento de carga el contenido 360 para los proyectos de apartamentos: Celeste y Magenta del sitio web Constructora Melendez se encontró que los archivos están dañados, por lo tanto no se visualizan correctamente en la página web. Se pasa a atención Área', 21, 68, 5, '2017-04-05 20:44:26', '2017-04-05 20:44:26'),
(85, 'Tarea Realizada', 25, 72, 2, '2017-04-05 21:08:01', '2017-04-05 21:08:01'),
(86, 'Tarea realizada', 25, 73, 2, '2017-04-05 21:09:24', '2017-04-05 21:09:24'),
(87, 'Esta solicitud ya la tiene la ejecutiva en su correo.', 9, 73, 20, '2017-04-05 21:15:11', '2017-04-05 21:15:11'),
(88, 'Esta solicitud, ya esta en el correo de la ejecutiva.', 9, 72, 20, '2017-04-05 21:26:46', '2017-04-05 21:26:46'),
(89, 'Se pasa a programar.', 9, 75, 3, '2017-04-05 21:27:39', '2017-04-05 21:27:39'),
(90, 'Se pasa a programar.', 9, 74, 3, '2017-04-05 21:35:56', '2017-04-05 21:35:56'),
(91, 'Esta tarea a que cliente pertenece, ya que la solicitud es de harinera pero dejan en el server una Url de ProgreSER.', 9, 77, 4, '2017-04-05 21:39:02', '2017-04-05 21:39:02'),
(92, 'ok. Es de ProgreSER ya lo pongo correctamente. ', 11, 77, 5, '2017-04-05 21:41:23', '2017-04-05 21:41:23'),
(93, 'Se pasa a programar.', 9, 78, 3, '2017-04-05 21:59:20', '2017-04-05 21:59:20'),
(94, 'Esta solicitud ya la tiene la ejecutiva en su correo.', 9, 75, 2, '2017-04-05 22:39:23', '2017-04-05 22:39:23'),
(95, 'Esta solicitud ya la tiene la ejecutiva en su correo.', 9, 75, 20, '2017-04-05 22:39:38', '2017-04-05 22:39:38'),
(96, 'Piezas enviadas a  ejecutiva por e mail  e incrustadas en éste documento  https://docs.google.com/presentation/d/1kRE3E4Zb0tPCwQ6_Wxc3tIzp7HCoVrRuSJ1kSh3OH6U/edit#slide=id.g2155b4badd_1_66', 23, 78, 2, '2017-04-05 22:54:58', '2017-04-05 22:54:58'),
(97, '', 9, 79, 3, '2017-04-05 22:58:39', '2017-04-05 22:58:39'),
(98, 'Esta tarea fue realizada', 9, 79, 2, '2017-04-05 22:59:43', '2017-04-05 22:59:43'),
(99, 'Esta solicitud, ya se encuentra en el correo de la ejecutiva.', 9, 79, 20, '2017-04-05 23:00:35', '2017-04-05 23:00:35'),
(100, 'Se pasa a programar.', 9, 77, 3, '2017-04-05 23:01:39', '2017-04-05 23:01:39'),
(101, '', 7, 83, 3, '2017-04-06 12:44:19', '2017-04-06 12:44:19'),
(102, '', 7, 83, 2, '2017-04-06 12:44:28', '2017-04-06 12:44:28'),
(103, '', 7, 83, 1, '2017-04-06 12:44:34', '2017-04-06 12:44:34'),
(104, '', 7, 86, 3, '2017-04-06 12:45:20', '2017-04-06 12:45:20'),
(105, '', 7, 86, 2, '2017-04-06 12:45:49', '2017-04-06 12:45:49'),
(106, 'Esta tarea se realizo el día de ayer, y se hizo la entrega formal el mismo día.', 9, 78, 20, '2017-04-06 13:11:51', '2017-04-06 13:11:51'),
(107, '', 7, 86, 2, '2017-04-06 13:12:17', '2017-04-06 13:12:17'),
(108, 'Se adjunta presentación en el server: \\\\SERVER\\Elementos_Compartidos2\\ProgreSER\\Feria de crédito Honda- Dream Neo abril. ', 11, 90, NULL, '2017-04-06 13:19:44', '2017-04-06 13:19:44'),
(109, 'Estos son las circulares de venta que se deben subir a la intrante, son dos bonos: \\\\SERVER\\Elementos_Compartidos2\\ProgreSER\\Feria de crédito Honda- Dream Neo abril', 11, 91, NULL, '2017-04-06 13:25:26', '2017-04-06 13:25:26'),
(110, 'Se pasa a programado', 6, 76, 3, '2017-04-06 13:27:23', '2017-04-06 13:27:23'),
(111, 'Esta tarea se realizó en la reunión del 5 de abril', 6, 76, 2, '2017-04-06 13:28:06', '2017-04-06 13:28:06'),
(112, '', 6, 76, 20, '2017-04-06 13:28:28', '2017-04-06 13:28:28'),
(113, 'Tarea realizada', 25, 74, 2, '2017-04-06 13:45:48', '2017-04-06 13:45:48'),
(114, 'Esta tarea ya la tiene la ejecutiva en su correo.', 9, 74, 20, '2017-04-06 13:46:21', '2017-04-06 13:46:21'),
(115, 'Se revisaron los archivos que envío el cliente, pero las galerías no funcionan.\nPor favor que el cliente revise los archivos generados para ver si el html le funciona.', 6, 68, 4, '2017-04-06 13:53:41', '2017-04-06 13:53:41'),
(116, 'Se pasa a programar, se entrega el 7 de abril al finalizar el día', 9, 90, 3, '2017-04-06 13:57:52', '2017-04-06 13:57:52'),
(117, '', 16, 31, 2, '2017-04-06 14:14:35', '2017-04-06 14:14:35'),
(118, 'Me tarde más tiempo de lo  establecido, porque hacia falta información para realizar el articulo. ', 16, 31, NULL, '2017-04-06 14:18:03', '2017-04-06 14:18:03'),
(119, 'Se pasa a programar.', 9, 84, 3, '2017-04-06 14:18:30', '2017-04-06 14:18:30'),
(120, 'Se pasa a programado, envío en email el diseño', 6, 94, 3, '2017-04-06 15:58:32', '2017-04-06 15:58:32'),
(121, 'Se pasa a programado', 6, 93, 3, '2017-04-06 15:59:27', '2017-04-06 15:59:27'),
(122, '', 6, 67, 3, '2017-04-06 16:03:00', '2017-04-06 16:03:00'),
(123, 'Se realizó la renovación del servidor. Este solo es de 2 GB de correos (Está dentro de himalayemarketing.com)', 6, 67, 2, '2017-04-06 16:17:15', '2017-04-06 16:17:15'),
(124, '', 6, 67, 20, '2017-04-06 16:17:27', '2017-04-06 16:17:27'),
(125, '', 6, 67, 1, '2017-04-06 16:17:35', '2017-04-06 16:17:35'),
(126, '', 6, 51, 3, '2017-04-06 16:28:29', '2017-04-06 16:28:29'),
(127, '', 6, 51, 2, '2017-04-06 16:37:50', '2017-04-06 16:37:50'),
(128, 'Se renovó por un año, fecha de quedó:\nServidor  Apr 10, 2018\nDominio Apr 10, 2018', 6, 51, 20, '2017-04-06 16:39:40', '2017-04-06 16:39:40'),
(129, '', 6, 51, 1, '2017-04-06 16:39:54', '2017-04-06 16:39:54'),
(130, '', 16, 49, 2, '2017-04-06 17:06:56', '2017-04-06 17:06:56'),
(131, 'Se pasa a programado, es para publicar el lunes', 6, 98, 3, '2017-04-06 17:10:27', '2017-04-06 17:10:27'),
(132, '', 7, 88, 3, '2017-04-06 19:10:21', '2017-04-06 19:10:21'),
(133, 'Jos no, que un poco complicado. Basemonos en el plan de pauta realizado que es el pautar 3 videos, el de (Pipe bueno, felipe Burbano y Pool party), clic to web al sitio, carrusel con las imágenes de todos los eventos de las regionales y uno que invite al de cali que es el principal. ', 2, 66, 5, '2017-04-06 19:18:05', '2017-04-06 19:18:05'),
(134, 'Muchas gracias Lu!', 3, 51, NULL, '2017-04-06 19:24:22', '2017-04-06 19:24:22'),
(135, 'Me tarde  debido a que el proceso de investigación fue un poco lento ya que la información encontrada era un poco limitada.', 16, 30, 2, '2017-04-06 19:31:46', '2017-04-06 19:31:46'),
(136, 'Lu el cliente ya envió los archivos buenos, me dice que solo los abramos en Mozilla Firefox.  La ruta donde se encuentran en el server es la siguiente: \n\n\\\\SERVER\\Elementos_Compartidos2\\SOPORTE\\Constructora Meléndez/tour celeste.rar\n\n\\\\SERVER\\Elementos_Compartidos2\\SOPORTE\\Constructora Meléndez/tour magenta.rar', 3, 68, 5, '2017-04-06 19:35:19', '2017-04-06 19:35:19'),
(137, 'Esta tarea sigue en espera de que la ejecutiva de el aprobado por el cliente', 9, 90, NULL, '2017-04-06 19:38:21', '2017-04-06 19:38:21'),
(138, 'Listo ya el cliente lo resolvió. ', 3, 55, 5, '2017-04-06 19:49:11', '2017-04-06 19:49:11'),
(139, 'La pieza se envia a A Mabesoy y L Rodríguez por correo', 23, 84, 2, '2017-04-06 21:14:47', '2017-04-06 21:14:47'),
(140, 'Mailings maquetados en inkbrush, correo enviado', 13, 93, 2, '2017-04-06 21:21:08', '2017-04-06 21:21:08'),
(141, 'Mailings maquetados en inkbrush, correo enviado', 13, 94, 2, '2017-04-06 21:21:56', '2017-04-06 21:21:56'),
(142, 'Se envío el correo de entrega', 6, 94, 20, '2017-04-06 22:07:37', '2017-04-06 22:07:37'),
(143, 'Se envió el correo de entrega', 6, 93, 20, '2017-04-06 22:08:02', '2017-04-06 22:08:02'),
(144, '', 6, 55, 3, '2017-04-06 22:11:33', '2017-04-06 22:11:33'),
(145, '', 6, 55, 2, '2017-04-06 22:11:44', '2017-04-06 22:11:44'),
(146, 'Se revisaron las nuevas rutas y funcionan, se pasa a programado', 6, 68, 3, '2017-04-06 22:26:02', '2017-04-06 22:26:02'),
(147, '', 6, 55, 1, '2017-04-06 22:36:33', '2017-04-06 22:36:33'),
(148, '', 16, 88, 2, '2017-04-06 22:43:48', '2017-04-06 22:43:48'),
(149, '', 6, 39, 1, '2017-04-06 22:44:37', '2017-04-06 22:44:37'),
(150, '', 6, 41, 1, '2017-04-06 22:56:51', '2017-04-06 22:56:51'),
(151, '', 6, 76, 1, '2017-04-06 22:57:22', '2017-04-06 22:57:22'),
(152, '', 6, 38, 1, '2017-04-06 22:57:38', '2017-04-06 22:57:38'),
(153, '', 6, 40, 1, '2017-04-06 22:57:56', '2017-04-06 22:57:56'),
(154, 'Realizado', 24, 64, 2, '2017-04-06 22:59:07', '2017-04-06 22:59:07'),
(155, 'Tarea realizada, las piezas y el editable en .psd se envian a A Mabesoy por correo', 23, 65, 2, '2017-04-06 23:05:26', '2017-04-06 23:05:26'),
(156, 'Ok, perfecto. Lo programo. Tengamos en cuenta que  me llevó un tiempo planear las ideas y quedaron muy interesantes, para que salgamos con los mismos medios. Luego conversamos del tema.', 4, 66, 3, '2017-04-07 11:20:08', '2017-04-07 11:20:08'),
(157, '', 4, 97, 3, '2017-04-07 11:23:44', '2017-04-07 11:23:44'),
(158, '', 4, 104, 3, '2017-04-07 11:27:02', '2017-04-07 11:27:02'),
(159, '', 4, 104, 1, '2017-04-07 11:27:12', '2017-04-07 11:27:12'),
(160, '', 4, 105, 1, '2017-04-07 11:29:05', '2017-04-07 11:29:05'),
(161, '', 4, 107, 1, '2017-04-07 11:30:51', '2017-04-07 11:30:51'),
(162, '', 4, 108, 1, '2017-04-07 11:32:16', '2017-04-07 11:32:16'),
(163, '', 4, 109, 1, '2017-04-07 11:33:43', '2017-04-07 11:33:43'),
(164, '', 4, 110, 1, '2017-04-07 11:36:01', '2017-04-07 11:36:01'),
(165, '', 4, 66, 1, '2017-04-07 12:58:12', '2017-04-07 12:58:12'),
(166, '', 7, 103, 3, '2017-04-07 13:21:43', '2017-04-07 13:21:43'),
(167, 'Se cargaron las vistas interactivas 360 correspondientes a celeste y Magenta en la web de Constructora Melendez. Se pasa a Realizado', 21, 68, 2, '2017-04-07 13:35:05', '2017-04-07 13:35:05'),
(168, 'Se pasa a programado', 6, 101, 3, '2017-04-07 13:37:02', '2017-04-07 13:37:02'),
(169, 'Tarea realizada', 25, 90, 2, '2017-04-07 14:15:19', '2017-04-07 14:15:19'),
(170, 'Esta solicitud, ya las ejecutivas lo tienen en su correo', 9, 65, 20, '2017-04-07 14:28:32', '2017-04-07 14:28:32'),
(171, 'Esta tarea ya la tiene la ejecutiva en su correo,  aunque se entregan con una sola moto de la promoción ya que no se tiene la foto de la otra moto.', 9, 90, 20, '2017-04-07 14:32:13', '2017-04-07 14:32:13'),
(172, 'Esta pieza ajustada ya la tiene la ejecutiva en su correo.', 9, 84, 20, '2017-04-07 14:38:48', '2017-04-07 14:38:48'),
(173, 'Esta parrilla ya tiene el link la ejecutiva en su correo', 9, 64, 20, '2017-04-07 14:56:59', '2017-04-07 14:56:59'),
(174, '', 6, 102, 3, '2017-04-07 17:36:29', '2017-04-07 17:36:29'),
(175, 'Se crearon los siguientes correos:\n\ngerentenacional@borojoelpioneroltda.com ( Carlos Cuero)  Gnac1onal123!\nsales@borojoelpioneroltda.com (Yenny Casella) Sal3s123!\ncontabilidad@borojoelpioneroltda.com Cont4bilidad!\nfabrica@borojoelpioneroltda.com ( Lily de Ossa) F4brica123!', 6, 102, 2, '2017-04-07 17:36:42', '2017-04-07 17:36:42'),
(176, '', 6, 102, 20, '2017-04-07 17:36:54', '2017-04-07 17:36:54'),
(177, 'Se carga el certificado 10K Semana Santa, se pasa a realizado', 21, 101, 2, '2017-04-07 18:54:48', '2017-04-07 18:54:48'),
(178, '', 6, 68, 20, '2017-04-07 18:56:41', '2017-04-07 18:56:41'),
(179, '', 9, 75, 1, '2017-04-07 19:17:49', '2017-04-07 19:17:49'),
(180, '', 9, 78, 1, '2017-04-07 19:18:04', '2017-04-07 19:18:04'),
(181, '', 9, 90, 1, '2017-04-07 19:18:21', '2017-04-07 19:18:21'),
(182, '', 9, 74, 1, '2017-04-07 19:18:37', '2017-04-07 19:18:37'),
(183, '', 9, 64, 1, '2017-04-07 19:18:52', '2017-04-07 19:18:52'),
(184, '', 9, 42, 1, '2017-04-07 19:19:17', '2017-04-07 19:19:17'),
(185, '', 9, 73, 1, '2017-04-07 19:19:40', '2017-04-07 19:19:40'),
(186, '', 9, 50, 1, '2017-04-07 19:19:59', '2017-04-07 19:19:59'),
(187, '', 4, 119, 1, '2017-04-07 19:23:29', '2017-04-07 19:23:29'),
(188, '', 6, 124, 1, '2017-04-07 19:33:24', '2017-04-07 19:33:24'),
(189, 'Se pasa a programar, pero en este tiempo no se cuenta la aprobación de cliente.', 9, 117, 3, '2017-04-07 19:35:22', '2017-04-07 19:35:22'),
(190, '', 9, 72, 1, '2017-04-07 19:35:38', '2017-04-07 19:35:38'),
(191, '', 9, 53, 1, '2017-04-07 19:35:57', '2017-04-07 19:35:57'),
(192, '', 6, 127, 1, '2017-04-07 19:37:23', '2017-04-07 19:37:23'),
(193, '', 6, 130, 1, '2017-04-07 19:45:14', '2017-04-07 19:45:14'),
(194, '', 6, 131, 1, '2017-04-07 19:47:24', '2017-04-07 19:47:24'),
(195, '', 9, 84, 1, '2017-04-07 20:05:27', '2017-04-07 20:05:27'),
(196, '', 9, 65, 1, '2017-04-07 20:06:00', '2017-04-07 20:06:00'),
(197, '', 9, 56, 1, '2017-04-07 20:06:34', '2017-04-07 20:06:34'),
(198, '', 9, 35, 1, '2017-04-07 20:08:26', '2017-04-07 20:08:26'),
(199, 'Solicitud repetida. Queda en espera', 2, 137, NULL, '2017-04-07 20:08:51', '2017-04-07 20:08:51'),
(200, '', 9, 79, 1, '2017-04-07 20:08:55', '2017-04-07 20:08:55'),
(201, '', 9, 70, 1, '2017-04-07 20:09:12', '2017-04-07 20:09:12'),
(202, 'Solicitud repetida. Queda en espera', 2, 138, NULL, '2017-04-07 20:09:19', '2017-04-07 20:09:19'),
(203, '', 9, 37, 1, '2017-04-07 20:09:27', '2017-04-07 20:09:27'),
(204, 'Se pasa a espera.', 1, 138, NULL, '2017-04-07 20:13:53', '2017-04-07 20:13:53'),
(205, '', 7, 88, 20, '2017-04-07 20:14:22', '2017-04-07 20:14:22'),
(206, '', 7, 30, 20, '2017-04-07 20:14:35', '2017-04-07 20:14:35'),
(207, '', 7, 49, 20, '2017-04-07 20:14:59', '2017-04-07 20:14:59'),
(208, '', 7, 86, 20, '2017-04-07 20:15:17', '2017-04-07 20:15:17'),
(209, '', 7, 31, 20, '2017-04-07 20:15:28', '2017-04-07 20:15:28'),
(210, 'Para personas de Cali', 2, 141, NULL, '2017-04-07 20:27:18', '2017-04-07 20:27:18'),
(211, 'AJUSTE! Fecha de pauta: 10 al 12 y del 17 al 21 ', 2, 141, NULL, '2017-04-07 20:28:06', '2017-04-07 20:28:06'),
(212, '', 16, 103, 2, '2017-04-07 20:33:01', '2017-04-07 20:33:01'),
(213, 'Publico objetivo: mujeres y hombres mayores de 18 años , familias con niños que buscan un lugar para hospedarse en cali, silvia y Coconuco  en Cali. \n\nhttps://www.facebook.com/comfandi/posts/1191127414331975\n\n', 2, 144, NULL, '2017-04-07 20:39:55', '2017-04-07 20:39:55'),
(214, '', 7, 89, 3, '2017-04-07 20:40:18', '2017-04-07 20:40:18'),
(215, 'Cree los dos artículos para la feria  uno con el bono de $200.000 y otro con el bono de $400.000 ', 16, 89, 2, '2017-04-07 20:50:04', '2017-04-07 20:50:04'),
(216, 'Ajuste inversión neta a $17.500', 2, 156, NULL, '2017-04-07 21:29:12', '2017-04-07 21:29:12'),
(217, 'Ajuste inversión neta a $17.500', 2, 156, NULL, '2017-04-07 21:29:14', '2017-04-07 21:29:14'),
(218, 'Ajuste inversión neta a $17.500', 2, 156, NULL, '2017-04-07 21:29:18', '2017-04-07 21:29:18'),
(219, 'Ajuste inversión neta a $17.500', 2, 156, NULL, '2017-04-07 21:29:21', '2017-04-07 21:29:21'),
(220, 'Ajuste inversión neta a $17.500', 2, 156, NULL, '2017-04-07 21:29:25', '2017-04-07 21:29:25'),
(221, 'Ajuste inversión neta a $17.500', 2, 156, NULL, '2017-04-07 21:29:29', '2017-04-07 21:29:29'),
(222, 'Ajuste inversión neta a $17.500', 2, 156, NULL, '2017-04-07 21:29:29', '2017-04-07 21:29:29'),
(223, 'Ajuste inversión neta a $17.500', 2, 156, NULL, '2017-04-07 21:29:30', '2017-04-07 21:29:30'),
(224, 'Ajuste inversión neta a $17.500', 2, 156, NULL, '2017-04-07 21:31:08', '2017-04-07 21:31:08'),
(225, 'Ajuste inversión neta a $17.500', 2, 156, NULL, '2017-04-07 21:31:23', '2017-04-07 21:31:23'),
(226, 'Ajuste inversión neta a $17.500', 2, 156, NULL, '2017-04-07 21:31:53', '2017-04-07 21:31:53'),
(227, 'Ajuste inversión neta a $17.500', 2, 155, NULL, '2017-04-07 21:33:26', '2017-04-07 21:33:26'),
(228, 'Ajuste inversión neta a $17.500', 2, 155, NULL, '2017-04-07 21:33:36', '2017-04-07 21:33:36'),
(229, 'Ajuste inversión neta a $17.500', 2, 155, NULL, '2017-04-07 21:33:37', '2017-04-07 21:33:37'),
(230, 'Ajuste inversión neta a $17.500', 2, 155, NULL, '2017-04-07 21:34:14', '2017-04-07 21:34:14'),
(231, 'Ajuste inversión neta a $17.500', 2, 155, NULL, '2017-04-07 21:34:25', '2017-04-07 21:34:25'),
(232, 'Se pasa a programar.', 9, 134, 3, '2017-04-07 21:34:39', '2017-04-07 21:34:39'),
(233, 'Ajuste inversión neta a $17.500', 2, 155, NULL, '2017-04-07 21:35:16', '2017-04-07 21:35:16'),
(234, 'Se hace la entrega de las piezas solicitadas, más un video de simulación del slide con video.', 9, 33, 2, '2017-04-07 22:35:58', '2017-04-07 22:35:58'),
(235, 'Esta tarea ya la tiene la ejecutiva en su correo.', 9, 33, 20, '2017-04-07 22:36:27', '2017-04-07 22:36:27'),
(236, '', 9, 45, 2, '2017-04-07 22:40:40', '2017-04-07 22:40:40'),
(237, '', 9, 45, 20, '2017-04-07 22:40:52', '2017-04-07 22:40:52'),
(238, '', 9, 45, 1, '2017-04-07 22:40:59', '2017-04-07 22:40:59'),
(239, '', 4, 106, 1, '2017-04-07 23:33:27', '2017-04-07 23:33:27'),
(240, '', 5, 180, 3, '2017-04-10 01:08:31', '2017-04-10 01:08:31'),
(241, '', 5, 190, 3, '2017-04-10 01:10:09', '2017-04-10 01:10:09'),
(242, 'Cómo la pauta sólo va a estar activa el 17 de abril, se debe de contar con el link de la amplificación el día 12 de abril o el 17 pero a primera hora es decir 7:30 am.', 5, 189, 3, '2017-04-10 01:16:06', '2017-04-10 01:16:06'),
(243, '', 5, 28, 3, '2017-04-10 01:22:45', '2017-04-10 01:22:45'),
(244, 'Esta tarea se divide en dos, la primera es la implementación SEO que se realiza el día 28 de Abril y la segunda es la realización del informe del mes de abril que se entrega el 2 de mayo. (La implementación que se realice el 28 de abril se incluye en el informe para hacer una sola entrega al cliente)', 5, 28, NULL, '2017-04-10 01:24:43', '2017-04-10 01:24:43'),
(245, '', 5, 133, 3, '2017-04-10 01:26:29', '2017-04-10 01:26:29'),
(246, 'Marce es necesario que este post ya que va sólo un día quede programado un día anterior, es decir que se necesita el link de esta pauta el día 26 de abril.', 5, 132, 3, '2017-04-10 01:30:13', '2017-04-10 01:30:13'),
(247, 'Marce es necesario que este post ya que va sólo un día quede programado un día anterior, es decir que se necesita el link de esta pauta el día 26 de abril.', 5, 132, 3, '2017-04-10 01:30:15', '2017-04-10 01:30:15'),
(248, 'Si es posible este post hay que dejarlo programado desde el día 21 de abril para que arranque desde el 24 a primera hr.', 5, 128, 3, '2017-04-10 01:34:34', '2017-04-10 01:34:34'),
(249, '', 5, 129, 3, '2017-04-10 01:36:15', '2017-04-10 01:36:15'),
(250, '', 5, 135, 3, '2017-04-10 01:37:29', '2017-04-10 01:37:29'),
(251, 'Programado - tarea repetida', 5, 136, 3, '2017-04-10 01:39:28', '2017-04-10 01:39:28'),
(252, 'Ya que esta repetida esta tarea se programó en la otra tarea que corresponde a esta.', 5, 138, 4, '2017-04-10 01:40:24', '2017-04-10 01:40:24'),
(253, 'ok, Juan Pablo por favor tener en cuenta que el presupuesto se divide en dos etapas, una que va del 10 al 12 $105.000 y los otros $105.000 restantes para el 17 al 21.', 5, 141, 3, '2017-04-10 01:43:15', '2017-04-10 01:43:15'),
(254, 'Marcela, no es posible tenerlo para el 17, confirmar con el cliente, este informe iría para el 21.', 5, 140, 3, '2017-04-10 01:46:30', '2017-04-10 01:46:30'),
(255, '', 5, 139, 3, '2017-04-10 01:47:51', '2017-04-10 01:47:51'),
(256, 'Programado en la otra tarea que corresponde a esta misma.', 5, 137, 4, '2017-04-10 01:49:20', '2017-04-10 01:49:20'),
(257, '', 5, 126, 3, '2017-04-10 01:50:58', '2017-04-10 01:50:58'),
(258, '', 5, 121, 3, '2017-04-10 01:52:33', '2017-04-10 01:52:33'),
(259, '', 5, 125, 3, '2017-04-10 01:54:05', '2017-04-10 01:54:05'),
(260, '¿Es un reporte parcial o final?', 5, 111, 4, '2017-04-10 01:55:00', '2017-04-10 01:55:00'),
(261, 'Esto se entrego realmente el 6 de abril.', 5, 99, 3, '2017-04-10 01:56:29', '2017-04-10 01:56:29'),
(262, '', 5, 96, 3, '2017-04-10 01:57:26', '2017-04-10 01:57:26'),
(263, 'Juan Pablo cuándo vayas a realizar este Keyword Planner, ten en cuenta que la segmentación es sólo Cali, para tener en cuenta esto en el filtro y ver volúmenes de búsqueda sólo de la ciudad, usar palabras long tail cómo por ejemplo: Servicio de droguerías a domicilio en Cali.', 5, 96, NULL, '2017-04-10 01:59:50', '2017-04-10 01:59:50'),
(264, '¿Se realizará en la agencia o en Comfandi?', 5, 69, 3, '2017-04-10 02:01:32', '2017-04-10 02:01:32'),
(265, '', 5, 112, 3, '2017-04-10 02:05:00', '2017-04-10 02:05:00'),
(266, '', 5, 113, 3, '2017-04-10 02:09:01', '2017-04-10 02:09:01'),
(267, '', 5, 123, 3, '2017-04-10 02:10:36', '2017-04-10 02:10:36'),
(268, '', 5, 120, 3, '2017-04-10 02:12:25', '2017-04-10 02:12:25'),
(269, '', 5, 116, 3, '2017-04-10 02:14:22', '2017-04-10 02:14:22'),
(270, 'Es un reporte parcial o final?', 5, 114, 3, '2017-04-10 02:16:13', '2017-04-10 02:16:13'),
(271, 'Andre, no entiendo muy bien la descripción de la tarea. Se dice que Digital Performance debe generar la estructura, pero luego que se pone al área de contenidos ¿Corrígeme si me equivoco pero tenemos que esperar a que digital pase la plantilla y luego hacer informe?', 7, 184, 4, '2017-04-10 11:56:08', '2017-04-10 11:56:08'),
(272, '', 7, 82, 1, '2017-04-10 11:59:47', '2017-04-10 11:59:47'),
(273, '', 7, 85, 3, '2017-04-10 12:11:33', '2017-04-10 12:11:33'),
(274, '', 7, 86, 1, '2017-04-10 12:13:18', '2017-04-10 12:13:18'),
(275, 'Se programa. Alexandra, no olvides poner el link sobre este comentario y enviarlo por correo.', 7, 164, 3, '2017-04-10 12:19:59', '2017-04-10 12:19:59'),
(276, 'Por favor compartir el link de la parrilla, para poder ver los ajustes.', 9, 174, 4, '2017-04-10 12:52:37', '2017-04-10 12:52:37'),
(277, '', 9, 33, 1, '2017-04-10 13:08:58', '2017-04-10 13:08:58');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras_ots`
--

CREATE TABLE IF NOT EXISTS `compras_ots` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(110) COLLATE utf8_unicode_ci DEFAULT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `provedor` varchar(110) COLLATE utf8_unicode_ci NOT NULL,
  `valor` varchar(110) COLLATE utf8_unicode_ci NOT NULL,
  `ots_id` int(10) unsigned NOT NULL,
  `areas_id` int(10) unsigned NOT NULL,
  `tipos_compras_id` int(10) unsigned NOT NULL,
  `divisas_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `transaccion` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fecha_transaccion` datetime DEFAULT NULL,
  `estados_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `compras_ots_ots_id_foreign` (`ots_id`),
  KEY `compras_ots_areas_id_foreign` (`areas_id`),
  KEY `compras_ots_tipos_compras_id_foreign` (`tipos_compras_id`),
  KEY `compras_ots_divisas_id_foreign` (`divisas_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=36 ;

--
-- Volcado de datos para la tabla `compras_ots`
--

INSERT INTO `compras_ots` (`id`, `nombre`, `descripcion`, `provedor`, `valor`, `ots_id`, `areas_id`, `tipos_compras_id`, `divisas_id`, `created_at`, `updated_at`, `transaccion`, `fecha_transaccion`, `estados_id`) VALUES
(1, NULL, 'Amplificar post de Facebook', 'Facebook', '357000', 1, 5, 1, 1, '2017-04-01 00:46:54', '2017-04-01 00:46:54', NULL, NULL, NULL),
(2, NULL, 'Amplificar 1 post', 'Facebook', '280000', 2, 5, 1, 1, '2017-04-01 01:39:29', '2017-04-01 01:39:29', NULL, NULL, NULL),
(3, NULL, 'Pauta Post Cali, Buga, Tuluá, Cartago y Buenaventura', 'Facebook', '350000', 3, 5, 1, 1, '2017-04-01 02:01:04', '2017-04-01 02:01:04', NULL, NULL, NULL),
(4, NULL, '7 Amplificaciones de Post ', 'Facebook', '1295000', 4, 5, 1, 1, '2017-04-01 03:01:41', '2017-04-01 03:01:41', NULL, NULL, NULL),
(5, NULL, 'Compra de Certificado de Seguridad SSL para sitio web de Constructora Meléndez. ', 'Siteground ', '358400', 10, 3, 5, 1, '2017-04-03 19:15:51', '2017-04-03 19:15:51', NULL, NULL, NULL),
(6, NULL, 'Renovación de espacio en Hosting por un año para sitio web de Constructora Meléndez', 'Siteground', '1150080', 10, 3, 2, 1, '2017-04-03 19:15:51', '2017-04-03 19:15:51', NULL, NULL, NULL),
(7, NULL, 'Pauta en Facebook - Fans, Clic to Web, Engagement, Formulario.\n', 'Facebook', '2450000', 9, 1, 1, 1, '2017-04-03 19:32:16', '2017-04-03 19:32:16', NULL, NULL, NULL),
(8, NULL, 'Pauta Google - Search y Display', 'Google', '1050000', 9, 1, 1, 1, '2017-04-03 19:32:16', '2017-04-03 19:32:16', NULL, NULL, NULL),
(9, NULL, 'Creación de hasta 5 cuentas de correo, vinculación de un dominio, 10000 visitas mensuales, espacio web de 10 gb. ', 'Siteground', '382080', 27, 3, 2, 1, '2017-04-04 13:40:24', '2017-04-04 13:40:24', NULL, NULL, NULL),
(10, NULL, 'Renovación de Dominio sidocsa.com por un año con Godaddy. ', 'Godaddy', '93000', 27, 3, 7, 1, '2017-04-04 13:40:24', '2017-04-04 13:40:24', NULL, NULL, NULL),
(11, NULL, 'Compra de espacio hosting de hasta 2 GB de disco duro para la creación de 5 cuentas de correo. Se aprobó por Juan.I esta renovación y la revisión en 2018 de la conveniencia de seguir. ', 'Siteground', '180000', 29, 3, 2, 1, '2017-04-04 23:21:52', '2017-04-04 23:21:52', NULL, NULL, NULL),
(12, NULL, 'Pauta Facebook : post - carrusel - canvas', 'facebook', '500000', 34, 5, 1, 1, '2017-04-06 15:23:03', '2017-04-06 15:23:03', NULL, NULL, NULL),
(13, NULL, 'Pauta Google - Search', 'Google', '400000', 34, 5, 1, 1, '2017-04-06 15:23:03', '2017-04-06 15:23:03', NULL, NULL, NULL),
(14, NULL, 'Implementar la ubicación en waze de 4 puntos de Droguerías en el sur de cali. ', 'Waze - Google Inc', '500000', 34, 5, 1, 1, '2017-04-06 15:23:03', '2017-04-06 15:23:03', NULL, NULL, NULL),
(15, NULL, 'Pauta post', 'facebook', '245000', 35, 5, 1, 1, '2017-04-06 16:00:06', '2017-04-06 16:00:06', NULL, NULL, NULL),
(16, NULL, 'Pauta post', 'facebook', '350000', 36, 5, 1, 1, '2017-04-06 16:21:50', '2017-04-06 16:21:50', NULL, NULL, NULL),
(17, NULL, 'Pauta post', 'facebook', '560000', 41, 5, 1, 1, '2017-04-06 19:20:35', '2017-04-06 19:20:35', NULL, NULL, NULL),
(18, NULL, 'Pauta post', 'Facebook', '350000', 44, 5, 1, 1, '2017-04-07 12:50:50', '2017-04-07 12:50:50', NULL, NULL, NULL),
(19, NULL, 'Post - gif - canvas  -carruseles', 'Facebook', '1600000', 46, 5, 1, 1, '2017-04-07 19:20:48', '2017-04-07 19:20:48', NULL, NULL, NULL),
(20, NULL, 'Pauta Google', 'Google', '500000', 46, 5, 1, 1, '2017-04-07 19:20:48', '2017-04-07 19:20:48', NULL, NULL, NULL),
(21, NULL, 'Pauta post', 'facebook', '280000', 47, 5, 1, 1, '2017-04-07 19:26:20', '2017-04-07 19:26:20', NULL, NULL, NULL),
(22, NULL, 'Pautar 4 carruseles', 'facebook', '400000', 48, 5, 1, 1, '2017-04-07 19:32:55', '2017-04-07 19:32:55', NULL, NULL, NULL),
(23, NULL, 'Pauta post', 'facebook', '70000', 49, 5, 1, 1, '2017-04-07 19:45:57', '2017-04-07 19:45:57', NULL, NULL, NULL),
(24, NULL, 'Pautar 3 carruseles. inversión neta para cada uno de $116.000', 'facebook', '350000', 50, 5, 1, 1, '2017-04-07 19:59:50', '2017-04-07 19:59:50', NULL, NULL, NULL),
(25, NULL, 'amplificar post', 'facebook', '210000', 51, 5, 1, 1, '2017-04-07 20:22:09', '2017-04-07 20:22:09', NULL, NULL, NULL),
(26, NULL, 'amplificar post', 'facebook', '210000', 52, 5, 1, 1, '2017-04-07 20:35:48', '2017-04-07 20:35:48', NULL, NULL, NULL),
(27, NULL, 'Pautar 6 post', 'facebook', '350000', 53, 5, 1, 1, '2017-04-07 20:55:17', '2017-04-07 20:55:17', NULL, NULL, NULL),
(28, NULL, 'Amplificar 3 post', 'facebook', '420000', 54, 5, 1, 1, '2017-04-07 21:15:11', '2017-04-07 21:15:11', NULL, NULL, NULL),
(29, NULL, 'amplificar post', 'facebook', '140000', 56, 5, 1, 1, '2017-04-07 21:38:00', '2017-04-07 21:38:00', NULL, NULL, NULL),
(30, NULL, 'Pauta post', 'facebook', '180000', 57, 5, 1, 1, '2017-04-07 21:49:21', '2017-04-07 21:49:21', NULL, NULL, NULL),
(31, NULL, 'Compra de banco de imágenes del mes de abril. Se deben comprar 150 imágenes al mes. El valor  es $180.000. Este banco de imágenes es compartido por diferentes clientes de Himalaya. ', 'Shutterstock', '180000', 59, 4, 4, 1, '2017-04-07 22:13:53', '2017-04-07 22:13:53', NULL, NULL, NULL),
(32, NULL, 'Herramienta  sproutsocial para la gestión de redes sociales. ', 'Sproutsocial ', '99', 59, 4, 8, 2, '2017-04-07 22:13:53', '2017-04-07 22:13:53', NULL, NULL, NULL),
(33, NULL, 'Pauta post - videos - clic to web', 'facebook', '1000000', 61, 5, 1, 1, '2017-04-07 22:23:44', '2017-04-07 22:23:44', NULL, NULL, NULL),
(34, NULL, 'Pauta post - videos - clic to web', 'Instagram', '750000', 61, 5, 1, 1, '2017-04-07 22:23:44', '2017-04-07 22:23:44', NULL, NULL, NULL),
(35, NULL, 'amplifica 3 post', 'facebook ', '280000', 65, 5, 1, 1, '2017-04-08 00:09:58', '2017-04-08 00:09:58', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `divisas`
--

CREATE TABLE IF NOT EXISTS `divisas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `tasa_conversion` decimal(15,2) DEFAULT NULL,
  `estado` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `divisas`
--

INSERT INTO `divisas` (`id`, `nombre`, `tasa_conversion`, `estado`, `created_at`, `updated_at`) VALUES
(1, 'Pesos', NULL, 0, '2017-03-31 22:32:19', '2017-03-31 22:32:19'),
(2, 'Dolares', NULL, 0, '2017-03-31 22:32:19', '2017-03-31 22:32:19'),
(3, 'Euros', NULL, 0, '2017-03-31 22:32:19', '2017-03-31 22:32:19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados`
--

CREATE TABLE IF NOT EXISTS `estados` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `tipos_estados_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `estados_tipos_estados_id_foreign` (`tipos_estados_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=23 ;

--
-- Volcado de datos para la tabla `estados`
--

INSERT INTO `estados` (`id`, `nombre`, `tipos_estados_id`, `created_at`, `updated_at`) VALUES
(1, 'OK', 1, '2017-03-31 22:32:19', '2017-03-31 22:32:19'),
(2, 'Realizado', 1, '2017-03-31 22:32:19', '2017-03-31 22:32:19'),
(3, 'Programado', 1, '2017-03-31 22:32:19', '2017-03-31 22:32:19'),
(4, 'Atención Cuentas', 1, '2017-03-31 22:32:19', '2017-03-31 22:32:19'),
(5, 'Atención Área', 1, '2017-03-31 22:32:19', '2017-03-31 22:32:19'),
(6, 'Espera', 1, '2017-03-31 22:32:19', '2017-03-31 22:32:19'),
(7, 'Pendiente', 1, '2017-03-31 22:32:19', '2017-03-31 22:32:19'),
(8, 'On Going', 2, '2017-03-31 22:32:19', '2017-03-31 22:32:19'),
(9, 'En espera', 2, '2017-03-31 22:32:19', '2017-03-31 22:32:19'),
(10, 'Terminado', 2, '2017-03-31 22:32:19', '2017-03-31 22:32:19'),
(11, 'Alta', 3, '2017-03-31 22:32:19', '2017-03-31 22:32:19'),
(12, 'Media', 3, '2017-03-31 22:32:19', '2017-03-31 22:32:19'),
(13, 'Normal', 3, '2017-03-31 22:32:19', '2017-04-03 20:08:06'),
(14, 'Programado', 4, '2017-03-31 22:32:19', '2017-03-31 22:32:19'),
(15, 'Revisar', 4, '2017-03-31 22:32:19', '2017-03-31 22:32:19'),
(16, 'Entregado', 4, '2017-03-31 22:32:19', '2017-03-31 22:32:19'),
(17, 'Incumplimiento', 4, '2017-03-31 22:32:19', '2017-03-31 22:32:19'),
(18, 'Pendiente de Entrega', 4, '2017-03-31 22:32:19', '2017-03-31 22:32:19'),
(19, 'Programar', 4, '2017-03-31 22:32:19', '2017-03-31 22:32:19'),
(20, 'Entregado', 1, '2017-03-31 22:32:19', '2017-03-31 22:32:19'),
(21, 'Pendiente', 5, '2017-04-06 22:43:14', '2017-04-06 22:43:14'),
(22, 'Ok', 5, '2017-04-06 22:43:14', '2017-04-06 22:43:14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados_x_roles`
--

CREATE TABLE IF NOT EXISTS `estados_x_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `estados_id` int(10) unsigned NOT NULL,
  `roles_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `estados_x_roles_estados_id_foreign` (`estados_id`),
  KEY `estados_x_roles_roles_id_foreign` (`roles_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=29 ;

--
-- Volcado de datos para la tabla `estados_x_roles`
--

INSERT INTO `estados_x_roles` (`id`, `estados_id`, `roles_id`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(5, 5, 1),
(6, 6, 1),
(7, 7, 1),
(8, 20, 1),
(9, 1, 2),
(10, 2, 2),
(11, 3, 2),
(12, 4, 2),
(13, 5, 2),
(14, 6, 2),
(15, 7, 2),
(16, 20, 2),
(17, 5, 3),
(18, 6, 3),
(19, 7, 3),
(20, 1, 4),
(21, 2, 4),
(22, 3, 4),
(23, 4, 4),
(24, 20, 4),
(25, 2, 5),
(26, 5, 5),
(27, 7, 4),
(28, 7, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historicos_ots`
--

CREATE TABLE IF NOT EXISTS `historicos_ots` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ots_id` int(10) unsigned NOT NULL,
  `nombre` varchar(115) COLLATE utf8_unicode_ci NOT NULL,
  `referencia` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `valor` varchar(85) COLLATE utf8_unicode_ci NOT NULL,
  `fee` tinyint(4) NOT NULL,
  `horas_totales` decimal(15,2) NOT NULL,
  `horas_disponibles` decimal(15,2) NOT NULL,
  `total_horas_extra` decimal(15,2) DEFAULT NULL,
  `observaciones` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `requerimientos_ot` varchar(2050) COLLATE utf8_unicode_ci NOT NULL,
  `compras_ot` varchar(2050) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_inicio` datetime NOT NULL,
  `fecha_final` datetime NOT NULL,
  `clientes_id` int(10) unsigned NOT NULL,
  `usuarios_id` int(10) unsigned NOT NULL,
  `estados_id` int(10) unsigned NOT NULL,
  `editor_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=19 ;

--
-- Volcado de datos para la tabla `historicos_ots`
--

INSERT INTO `historicos_ots` (`id`, `ots_id`, `nombre`, `referencia`, `valor`, `fee`, `horas_totales`, `horas_disponibles`, `total_horas_extra`, `observaciones`, `requerimientos_ot`, `compras_ot`, `fecha_inicio`, `fecha_final`, `clientes_id`, `usuarios_id`, `estados_id`, `editor_id`, `created_at`, `updated_at`) VALUES
(1, 2, 'Pauta Escuelas Deportiva Tennis deCampo', '1096', '400000', 0, '4.00', '0.00', '0.00', 'Amplificación de 1 post de Facebook', '[{"area":1,"horas":4,"tiempo_extra":"0.00","requerimientos":[{"model_nom":"Amplificar post","model_horas":4}]},{"area":5,"horas":4,"tiempo_extra":"0.00","requerimientos":[{"model_nom":"Amplificar post","model_horas":4}]}]', '[]', '2017-04-03 00:00:00', '2017-04-17 00:00:00', 5, 2, 8, 1, '2017-04-01 02:19:06', '2017-04-01 02:19:06'),
(2, 9, 'Fee Mensual Abril', '1126', '10060848', 1, '111.00', '0.00', '0.00', 'Este mes la repartición del Fee es diferente a lo contratado pero dentro de las horas totales, ya que el cliente aun no tiene la persona para en análisis de los canales digitales', '[{"area":1,"horas":4,"tiempo_extra":"0.00","requerimientos":[{"model_nom":"Acompa\\u00f1amiento Estrat\\u00e9gico","model_horas":4}]},{"area":2,"horas":32,"tiempo_extra":"0.00","requerimientos":[{"model_nom":"Dise\\u00f1o de piezas y de parrilla","model_horas":28},{"model_nom":"Dise\\u00f1o para activos digitales","model_horas":4}]},{"area":3,"horas":8,"tiempo_extra":"0.00","requerimientos":[{"model_nom":"Desarrollo en activos digitales","model_horas":8}]},{"area":4,"horas":50,"tiempo_extra":"0.00","requerimientos":[{"model_nom":"Community & Content Manager","model_horas":50}]},{"area":5,"horas":17,"tiempo_extra":"0.00","requerimientos":[{"model_nom":"Analista Digital","model_horas":17}]}]', '[]', '2017-04-03 00:00:00', '2017-04-29 00:00:00', 2, 11, 8, 1, '2017-04-03 18:29:42', '2017-04-03 18:29:42'),
(3, 9, 'Fee Mensual Abril', '1126', '10060848', 1, '111.00', '0.00', '0.00', 'Este mes la repartición del Fee es diferente a lo contratado pero dentro de las horas totales, ya que el cliente aun no tiene la persona para en análisis de los canales digitales', '[{"area":1,"horas":17,"tiempo_extra":"0.00","requerimientos":[{"model_nom":"Analista Digital","model_horas":17}]},{"area":2,"horas":32,"tiempo_extra":"0.00","requerimientos":[{"model_nom":"Dise\\u00f1o de piezas y de parrilla","model_horas":28},{"model_nom":"Dise\\u00f1o para activos digitales","model_horas":4}]},{"area":3,"horas":8,"tiempo_extra":"0.00","requerimientos":[{"model_nom":"Desarrollo en activos digitales","model_horas":8}]},{"area":4,"horas":50,"tiempo_extra":"0.00","requerimientos":[{"model_nom":"Community & Content Manager","model_horas":50}]},{"area":5,"horas":17,"tiempo_extra":"0.00","requerimientos":[{"model_nom":"Analista Digital","model_horas":17}]}]', '[{"areas_id":1,"tipos_compras_id":1,"divisas_id":1,"descripcion":"Pauta en Facebook - Fans, Clic to Web, Engagement, Formulario.\\n","provedor":"Facebook","valor":2450000},{"areas_id":1,"tipos_compras_id":1,"divisas_id":1,"descripcion":"Pauta Google - Search y Display","provedor":"Google","valor":1050000}]', '2017-04-03 00:00:00', '2017-04-29 00:00:00', 2, 11, 8, 1, '2017-04-03 19:32:16', '2017-04-03 19:32:16'),
(4, 25, 'Soporte Sitio Web', '1108-4', '300000', 1, '4.00', '0.00', '0.00', '', '[{"area":3,"horas":4,"tiempo_extra":"0.00","requerimientos":[{"model_nom":"Soporte Sitio Web","model_horas":4}]}]', '[]', '2017-04-03 00:00:00', '2017-05-05 00:00:00', 12, 22, 8, 1, '2017-04-03 20:59:12', '2017-04-03 20:59:12'),
(5, 15, 'Fee Vallempresa365', '1102-2', '9,450,000', 1, '160.00', '0.00', '0.00', '', '[{"area":2,"horas":"80","tiempo_extra":0,"requerimientos":[{"model_nom":"Dise\\u00f1ador Medio Tiempo","model_horas":"80"}]},{"area":4,"horas":80,"tiempo_extra":"0.00","requerimientos":[{"model_nom":"Community Manager Vallempresa","model_horas":40},{"model_nom":"Content Manager Vallempresa","model_horas":40}]}]', '[]', '2017-04-03 00:00:00', '2017-04-29 00:00:00', 10, 2, 8, 1, '2017-04-03 21:30:49', '2017-04-03 21:30:49'),
(6, 20, 'Implementación nuevo sitio web', '970', '17,950,000', 0, '268.50', '62.00', '0.00', 'Este proyecto arrancó el 23 de Enero de 2017 con esa fecha está relacionada la OT física con el mismo identificador. ', '[{"area":2,"horas":55.5,"tiempo_extra":"0.00","requerimientos":[{"model_nom":"Dise\\u00f1o de Sitio Web PLM","model_horas":55}]},{"area":3,"horas":55.5,"tiempo_extra":"0.00","requerimientos":[{"model_nom":"Dise\\u00f1o de Sitio Web PLM","model_horas":55}]},{"area":4,"horas":55.5,"tiempo_extra":"0.00","requerimientos":[{"model_nom":"Dise\\u00f1o de Sitio Web PLM","model_horas":55}]},{"area":5,"horas":"40","tiempo_extra":"0.00","requerimientos":[{"model_nom":"Dise\\u00f1o de Sitio Web PLM","model_horas":"40"}]}]', '[]', '2017-04-03 00:00:00', '2017-06-13 00:00:00', 6, 3, 8, 8, '2017-04-04 21:46:28', '2017-04-04 21:46:28'),
(7, 28, 'Implementación nuevo sitio web', '1011', '14960000', 0, '241.00', '0.00', '0.00', '', '[{"area":2,"horas":"56","tiempo_extra":"0.00","requerimientos":[{"model_nom":"Dise\\u00f1o de sitio web y edici\\u00f3n de 100 im\\u00e1genes","model_horas":"56"}]},{"area":3,"horas":118,"tiempo_extra":"0.00","requerimientos":[{"model_nom":"Desarrollo de sitio web","model_horas":118}]},{"area":4,"horas":33,"tiempo_extra":"0.00","requerimientos":[{"model_nom":"Carga de contenidos sitio web ","model_horas":33}]},{"area":5,"horas":"34","tiempo_extra":"0.00","requerimientos":[{"model_nom":"SEO inicial est\\u00e1ndar","model_horas":"34"}]}]', '[]', '2017-04-04 00:00:00', '2017-06-15 00:00:00', 14, 3, 8, 1, '2017-04-05 19:39:35', '2017-04-05 19:39:35'),
(8, 28, 'Implementación nuevo sitio web', '1011', '14960000', 0, '241.00', '0.00', '0.00', '', '[{"area":2,"horas":"56","tiempo_extra":"0.00","requerimientos":[{"model_nom":"Dise\\u00f1o de sitio web y edici\\u00f3n de 100 im\\u00e1genes","model_horas":"56"}]},{"area":3,"horas":118,"tiempo_extra":"0.00","requerimientos":[{"model_nom":"Desarrollo de sitio web","model_horas":118}]},{"area":4,"horas":33,"tiempo_extra":"0.00","requerimientos":[{"model_nom":"Carga de contenidos sitio web ","model_horas":33}]},{"area":5,"horas":"34","tiempo_extra":"0.00","requerimientos":[{"model_nom":"SEO inicial est\\u00e1ndar","model_horas":"34"}]}]', '[]', '2017-04-04 00:00:00', '2017-06-15 00:00:00', 14, 3, 8, 1, '2017-04-05 19:40:36', '2017-04-05 19:40:36'),
(9, 20, 'Implementación nuevo sitio web', '970', '17950000', 0, '263.50', '9.00', '0.00', 'Este proyecto arrancó el 23 de Enero de 2017 con esa fecha está relacionada la OT física con el mismo identificador. ', '[{"area":2,"horas":"31","tiempo_extra":"0.00","requerimientos":[{"model_nom":"Dise\\u00f1o de Sitio Web PLM","model_horas":"31"}]},{"area":3,"horas":"31","tiempo_extra":"0.00","requerimientos":[{"model_nom":"Dise\\u00f1o de Sitio Web PLM","model_horas":"31"}]},{"area":4,"horas":"31","tiempo_extra":"0.00","requerimientos":[{"model_nom":"Dise\\u00f1o de Sitio Web PLM","model_horas":"31"}]},{"area":5,"horas":"31","tiempo_extra":"0.00","requerimientos":[{"model_nom":"Dise\\u00f1o de Sitio Web PLM","model_horas":"31"}]}]', '[]', '2017-04-03 00:00:00', '2017-06-13 00:00:00', 6, 3, 8, 1, '2017-04-05 19:49:55', '2017-04-05 19:49:55'),
(10, 20, 'Implementación nuevo sitio web', '970', '17,950,000', 0, '263.50', '0.00', '0.00', 'Este proyecto arrancó el 23 de Enero de 2017 con esa fecha está relacionada la OT física con el mismo identificador. ', '[{"area":2,"horas":"49.5","tiempo_extra":"0.00","requerimientos":[{"model_nom":"Dise\\u00f1o de Sitio Web PLM","model_horas":"49.5"}]},{"area":3,"horas":"143","tiempo_extra":"0.00","requerimientos":[{"model_nom":"Desarrollo de Sitio Web PLM","model_horas":"143"}]},{"area":4,"horas":31,"tiempo_extra":"0.00","requerimientos":[{"model_nom":"Carga de contenido de Sitio Web PLM","model_horas":31}]},{"area":5,"horas":"40","tiempo_extra":"0.00","requerimientos":[{"model_nom":"SEO inicial del Sitio Web PLM","model_horas":"40"}]}]', '[]', '2017-04-03 00:00:00', '2017-06-13 00:00:00', 6, 3, 8, 8, '2017-04-05 19:54:52', '2017-04-05 19:54:52'),
(11, 31, 'Fee Soporte Sitio Web - Marzo', '1033-4', '75000', 1, '1.00', '0.00', '0.00', 'Informe de Marzo', '[{"area":3,"horas":1,"tiempo_extra":"0.00","requerimientos":[{"model_nom":"Informe Marzo - Soporte Sitio Web","model_horas":1}]}]', '[]', '2017-04-06 00:00:00', '2017-04-06 00:00:00', 12, 22, 8, 1, '2017-04-05 21:33:37', '2017-04-05 21:33:37'),
(12, 33, 'Diseño y desarrollo del Sitio Web', '925', '10755000', 0, '169.00', '0.00', '0.00', 'Diseño: Se está descontando el tiempo de Look and Feel, Mapa de Navegación y Wireframes (Tiempo descontado 23H)\n', '[{"area":2,"horas":56,"tiempo_extra":"0.00","requerimientos":[{"model_nom":"Dise\\u00f1o de Sitio Web","model_horas":56}]},{"area":3,"horas":99,"tiempo_extra":"0.00","requerimientos":[{"model_nom":"Desarrollo Sitio Web","model_horas":99}]},{"area":4,"horas":14,"tiempo_extra":"0.00","requerimientos":[{"model_nom":"Carga de Contenidos","model_horas":14}]}]', '[]', '2017-04-05 00:00:00', '2017-07-06 00:00:00', 17, 22, 8, 1, '2017-04-05 22:17:23', '2017-04-05 22:17:23'),
(13, 30, 'Catálogo ProgreSER', '0139', '8496000', 0, '12.00', '4.00', '0.00', '', '[{"area":2,"horas":4,"tiempo_extra":"0.00","requerimientos":[{"model_nom":"Realizaci\\u00f3n de Flujo","model_horas":4}]},{"area":3,"horas":4,"tiempo_extra":"0.00","requerimientos":[{"model_nom":"Realizaci\\u00f3n de Flujo","model_horas":4}]}]', '[]', '2017-04-05 00:00:00', '2017-05-05 00:00:00', 2, 11, 8, 1, '2017-04-06 14:50:55', '2017-04-06 14:50:55'),
(14, 38, 'Ajustes y actualización de Formulario Inscripciones Media Maratón Cali', '1112', '270000', 0, '3.00', '0.00', '0.00', 'Actualizar el formulario de inscripciones para Media Maratón y realizar prueba del botón de pago.', '[{"area":3,"horas":3,"tiempo_extra":"0.00","requerimientos":[{"model_nom":"Actualizar el formulario de inscripciones para Media Marat\\u00f3n Cali","model_horas":3}]}]', '[]', '2017-04-06 00:00:00', '2017-04-10 00:00:00', 18, 22, 8, 1, '2017-04-06 16:50:36', '2017-04-06 16:50:36'),
(15, 14, 'Fee Acompañamiento de Agencia', '1102', '14750000', 1, '680.00', '0.00', '0.00', '', '[{"area":1,"horas":12,"tiempo_extra":"0.00","requerimientos":[{"model_nom":"Acompa\\u00f1amiento Estrat\\u00e9gico","model_horas":12}]},{"area":2,"horas":240,"tiempo_extra":"0.00","requerimientos":[{"model_nom":"Dise\\u00f1ador Gr\\u00e1fico Full time -In house","model_horas":160},{"model_nom":"Dise\\u00f1ador Gr\\u00e1fico Medio Tiempo - In house","model_horas":80}]},{"area":3,"horas":48,"tiempo_extra":"0.00","requerimientos":[{"model_nom":"Desarrollo Activos Digitales","model_horas":48}]},{"area":4,"horas":320,"tiempo_extra":"0.00","requerimientos":[{"model_nom":"Content Manager Full Time In house","model_horas":160},{"model_nom":"Community Manager Full time In house","model_horas":160}]},{"area":5,"horas":44,"tiempo_extra":"0.00","requerimientos":[{"model_nom":"Analista Campa\\u00f1as ","model_horas":44}]},{"area":6,"horas":16,"tiempo_extra":"0.00","requerimientos":[{"model_nom":"Acompa\\u00f1amiento al cliente Ejecutiva","model_horas":16}]}]', '[]', '2017-04-03 00:00:00', '2017-04-29 00:00:00', 5, 2, 8, 1, '2017-04-06 16:53:37', '2017-04-06 16:53:37'),
(16, 39, 'Sitio web desarrollo', '0961', '11180344', 0, '126.00', '116.00', '0.00', '', '[{"area":1,"horas":"2","tiempo_extra":"0.00","requerimientos":[{"model_nom":"carga de contenidos ","model_horas":"2"}]},{"area":2,"horas":"2","tiempo_extra":"0.00","requerimientos":[{"model_nom":"carga de contenidos ","model_horas":"2"}]},{"area":3,"horas":"2","tiempo_extra":"0.00","requerimientos":[{"model_nom":"carga de contenidos ","model_horas":"2"}]},{"area":4,"horas":"2","tiempo_extra":"0.00","requerimientos":[{"model_nom":"carga de contenidos ","model_horas":"2"}]},{"area":5,"horas":"2","tiempo_extra":"0.00","requerimientos":[{"model_nom":"carga de contenidos ","model_horas":"2"}]}]', '[]', '2017-04-06 00:00:00', '2017-05-29 00:00:00', 21, 11, 8, 1, '2017-04-06 17:15:56', '2017-04-06 17:15:56'),
(17, 39, 'Sitio web desarrollo', '0961', '11,180,344', 0, '126.00', '116.00', '0.00', '', '[{"area":1,"horas":2,"tiempo_extra":"0.00","requerimientos":[{"model_nom":"carga de contenidos ","model_horas":2}]},{"area":2,"horas":2,"tiempo_extra":"0.00","requerimientos":[{"model_nom":"carga de contenidos ","model_horas":2}]},{"area":3,"horas":2,"tiempo_extra":"0.00","requerimientos":[{"model_nom":"carga de contenidos ","model_horas":2}]},{"area":4,"horas":2,"tiempo_extra":"0.00","requerimientos":[{"model_nom":"carga de contenidos ","model_horas":2}]},{"area":5,"horas":2,"tiempo_extra":"0.00","requerimientos":[{"model_nom":"carga de contenidos ","model_horas":2}]}]', '[]', '2017-04-06 00:00:00', '2017-05-29 00:00:00', 21, 11, 8, 8, '2017-04-06 19:35:34', '2017-04-06 19:35:34'),
(18, 50, 'Pauta carruseles cincuentazo 12 abril', '1116', '500000', 0, '5.00', '0.00', '0.00', '', '[{"area":5,"horas":5,"tiempo_extra":0,"requerimientos":[{"model_nom":"Pautar 3 carruseles","model_horas":3},{"model_nom":"Informe","model_horas":"2"}]}]', '[]', '2017-04-10 00:00:00', '2017-04-12 00:00:00', 5, 2, 8, 1, '2017-04-07 20:24:07', '2017-04-07 20:24:07');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historico_equipos`
--

CREATE TABLE IF NOT EXISTS `historico_equipos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entidad_id` int(10) unsigned NOT NULL,
  `horas_disponibles` decimal(15,2) DEFAULT NULL,
  `horas_gastadas` decimal(15,2) DEFAULT NULL,
  `tipo_de_entidad` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historico_tareas`
--

CREATE TABLE IF NOT EXISTS `historico_tareas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tiempo_estimado` decimal(15,2) DEFAULT NULL,
  `tiempo_real` decimal(15,2) DEFAULT NULL,
  `comentarios_id` int(11) NOT NULL,
  `encargado_id` int(11) DEFAULT NULL,
  `estados_id` int(11) DEFAULT NULL,
  `usuarios_id` int(10) unsigned NOT NULL,
  `tareas_id` int(10) unsigned NOT NULL,
  `editor_id` int(10) unsigned NOT NULL,
  `fecha_entrega_area` datetime DEFAULT NULL,
  `fecha_entrega_cuentas` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=261 ;

--
-- Volcado de datos para la tabla `historico_tareas`
--

INSERT INTO `historico_tareas` (`id`, `tiempo_estimado`, `tiempo_real`, `comentarios_id`, `encargado_id`, `estados_id`, `usuarios_id`, `tareas_id`, `editor_id`, `fecha_entrega_area`, `fecha_entrega_cuentas`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, 1, 5, 7, 10, 6, 10, NULL, NULL, '2017-04-01 02:21:59', '2017-04-01 02:21:59'),
(2, NULL, NULL, 2, 10, 4, 10, 11, 5, NULL, NULL, '2017-04-03 20:08:39', '2017-04-03 20:08:39'),
(3, '4.00', NULL, 3, 5, 3, 5, 25, 5, NULL, NULL, '2017-04-03 20:52:58', '2017-04-03 20:52:58'),
(4, '4.00', '4.00', 4, 5, 2, 5, 25, 5, NULL, NULL, '2017-04-03 20:56:46', '2017-04-03 20:56:46'),
(5, '4.00', '4.00', 5, 5, 3, 5, 25, 5, NULL, NULL, '2017-04-03 20:57:51', '2017-04-03 20:57:51'),
(6, '4.00', '28.00', 6, 5, 2, 5, 25, 5, NULL, NULL, '2017-04-03 20:58:37', '2017-04-03 20:58:37'),
(7, '4.00', '28.00', 7, 5, 1, 5, 25, 5, NULL, NULL, '2017-04-03 21:00:16', '2017-04-03 21:00:16'),
(8, '4.00', NULL, 8, 16, 3, 11, 30, 7, NULL, NULL, '2017-04-03 20:38:39', '2017-04-03 20:38:39'),
(9, '2.00', NULL, 9, 16, 3, 11, 31, 7, NULL, NULL, '2017-04-03 20:42:25', '2017-04-03 20:42:25'),
(10, '16.00', NULL, 10, 4, 3, 3, 36, 4, NULL, NULL, '2017-04-03 21:18:09', '2017-04-03 21:18:09'),
(11, '1.00', NULL, 11, 4, 3, 4, 43, 4, NULL, NULL, '2017-04-03 21:50:50', '2017-04-03 21:50:50'),
(12, '2.00', NULL, 12, 23, 3, 2, 37, 9, NULL, NULL, '2017-04-03 21:58:15', '2017-04-03 21:58:15'),
(13, NULL, NULL, 13, 9, 7, 11, 42, 11, NULL, NULL, '2017-04-03 22:04:19', '2017-04-03 22:04:19'),
(14, '3.00', NULL, 14, 24, 3, 11, 42, 9, NULL, NULL, '2017-04-03 22:08:08', '2017-04-03 22:08:08'),
(15, '1.00', '0.50', 15, 4, 2, 4, 43, 4, NULL, NULL, '2017-04-03 22:09:35', '2017-04-03 22:09:35'),
(16, '1.00', '0.50', 16, 4, 20, 4, 43, 4, NULL, NULL, '2017-04-03 22:09:58', '2017-04-03 22:09:58'),
(17, '0.50', NULL, 17, 21, 3, 22, 38, 6, NULL, NULL, '2017-04-03 22:23:08', '2017-04-03 22:23:08'),
(18, '1.00', NULL, 18, 21, 3, 22, 39, 6, NULL, NULL, '2017-04-03 22:24:59', '2017-04-03 22:24:59'),
(19, '2.00', NULL, 19, 9, 3, 22, 45, 9, NULL, NULL, '2017-04-03 22:25:09', '2017-04-03 22:25:09'),
(20, '4.00', NULL, 20, 21, 3, 22, 40, 6, NULL, NULL, '2017-04-03 22:27:27', '2017-04-03 22:27:27'),
(21, '0.50', NULL, 21, 21, 3, 22, 41, 6, NULL, NULL, '2017-04-03 22:28:32', '2017-04-03 22:28:32'),
(22, '1.00', '0.50', 22, 4, 1, 4, 43, 4, NULL, NULL, '2017-04-03 22:45:15', '2017-04-03 22:45:15'),
(23, '2.00', '1.00', 23, 23, 2, 2, 37, 23, NULL, NULL, '2017-04-03 22:57:11', '2017-04-03 22:57:11'),
(24, '2.00', '1.00', 24, 23, 20, 2, 37, 9, NULL, NULL, '2017-04-03 22:58:23', '2017-04-03 22:58:23'),
(25, '0.50', '0.40', 25, 21, 2, 22, 38, 21, NULL, NULL, '2017-04-04 13:31:11', '2017-04-04 13:31:11'),
(26, '1.00', '0.50', 26, 21, 2, 22, 39, 21, NULL, NULL, '2017-04-04 13:59:11', '2017-04-04 13:59:11'),
(27, '0.50', '0.40', 27, 21, 2, 22, 41, 21, NULL, NULL, '2017-04-04 14:47:37', '2017-04-04 14:47:37'),
(28, '3.00', '1.00', 28, 24, 2, 11, 42, 24, NULL, NULL, '2017-04-04 15:16:09', '2017-04-04 15:16:09'),
(29, NULL, NULL, 29, 9, 6, 22, 35, 23, NULL, NULL, '2017-04-04 15:44:10', '2017-04-04 15:44:10'),
(30, '1.00', NULL, 30, 23, 3, 22, 35, 9, NULL, NULL, '2017-04-04 15:48:05', '2017-04-04 15:48:05'),
(31, '0.50', '0.50', 31, 7, 3, 22, 34, 7, NULL, NULL, '2017-04-04 16:02:57', '2017-04-04 16:02:57'),
(32, '1.00', '1.00', 32, 23, 2, 22, 35, 23, NULL, NULL, '2017-04-04 16:02:59', '2017-04-04 16:02:59'),
(33, '0.50', '0.50', 33, 7, 2, 22, 34, 7, NULL, NULL, '2017-04-04 16:03:05', '2017-04-04 16:03:05'),
(34, '12.00', NULL, 34, 9, 3, 3, 33, 9, NULL, NULL, '2017-04-04 16:11:42', '2017-04-04 16:11:42'),
(35, '1.00', '1.00', 35, 23, 20, 22, 35, 9, NULL, NULL, '2017-04-04 16:18:50', '2017-04-04 16:18:50'),
(36, '8.00', NULL, 36, 25, 3, 2, 53, 9, NULL, NULL, '2017-04-04 16:22:28', '2017-04-04 16:22:28'),
(37, '3.00', '1.00', 37, 24, 2, 11, 42, 9, NULL, NULL, '2017-04-04 16:27:47', '2017-04-04 16:27:47'),
(38, '3.00', '1.00', 38, 24, 20, 11, 42, 9, NULL, NULL, '2017-04-04 16:27:55', '2017-04-04 16:27:55'),
(39, '1.00', NULL, 39, 25, 3, 2, 50, 9, NULL, NULL, '2017-04-04 16:31:00', '2017-04-04 16:31:00'),
(40, '1.00', NULL, 40, 23, 3, 11, 56, 9, NULL, NULL, '2017-04-04 16:42:36', '2017-04-04 16:42:36'),
(41, '1.00', '0.50', 41, 23, 2, 11, 56, 23, NULL, NULL, '2017-04-04 16:57:00', '2017-04-04 16:57:00'),
(42, '0.50', '0.50', 42, 4, 3, 4, 60, 4, NULL, NULL, '2017-04-04 18:30:17', '2017-04-04 18:30:17'),
(43, '0.50', '0.50', 43, 4, 1, 4, 60, 4, NULL, NULL, '2017-04-04 18:30:55', '2017-04-04 18:30:55'),
(44, '3.00', '3.00', 44, 4, 1, 4, 61, 4, NULL, NULL, '2017-04-04 18:33:06', '2017-04-04 18:33:06'),
(45, '1.00', NULL, 45, 16, 3, 11, 44, 7, NULL, NULL, '2017-04-04 19:33:30', '2017-04-04 19:33:30'),
(46, NULL, NULL, 46, 3, 4, 3, 55, 6, NULL, NULL, '2017-04-04 19:36:46', '2017-04-04 19:36:46'),
(47, '0.50', NULL, 47, 7, 3, 11, 49, 7, NULL, NULL, '2017-04-04 19:37:51', '2017-04-04 19:37:51'),
(48, '0.50', NULL, 48, 16, 3, 11, 49, 7, NULL, NULL, '2017-04-04 19:38:11', '2017-04-04 19:38:11'),
(49, '1.00', '0.50', 49, 7, 5, 11, 44, 16, NULL, NULL, '2017-04-04 19:56:16', '2017-04-04 19:56:16'),
(50, '1.00', '1.00', 50, 16, 3, 11, 44, 7, NULL, NULL, '2017-04-04 20:32:06', '2017-04-04 20:32:06'),
(51, '1.00', '1.00', 51, 16, 2, 11, 44, 16, NULL, NULL, '2017-04-04 20:32:37', '2017-04-04 20:32:37'),
(52, NULL, NULL, 52, 5, 5, 2, 11, 2, NULL, NULL, '2017-04-04 21:25:12', '2017-04-04 21:25:12'),
(53, '4.00', '5.00', 53, 21, 2, 22, 40, 21, NULL, NULL, '2017-04-04 21:49:22', '2017-04-04 21:49:22'),
(54, NULL, NULL, 54, 5, 7, 2, 15, 2, NULL, NULL, '2017-04-04 21:56:14', '2017-04-04 21:56:14'),
(55, NULL, NULL, 55, 5, 7, 2, 9, 2, NULL, NULL, '2017-04-04 22:01:59', '2017-04-04 22:01:59'),
(56, NULL, NULL, 56, 5, 7, 2, 10, 2, NULL, NULL, '2017-04-04 22:02:55', '2017-04-04 22:02:55'),
(57, '0.25', '0.25', 57, 7, 3, 11, 29, 7, NULL, NULL, '2017-04-04 22:37:56', '2017-04-04 22:37:56'),
(58, '0.25', '0.25', 58, 7, 2, 11, 29, 7, NULL, NULL, '2017-04-04 22:38:04', '2017-04-04 22:38:04'),
(59, '0.50', '0.40', 59, 21, 20, 22, 41, 6, NULL, NULL, '2017-04-04 22:40:30', '2017-04-04 22:40:30'),
(60, '1.00', '0.50', 60, 21, 20, 22, 39, 6, NULL, NULL, '2017-04-04 22:40:59', '2017-04-04 22:40:59'),
(61, '0.50', '0.40', 61, 21, 20, 22, 38, 6, NULL, NULL, '2017-04-04 22:41:18', '2017-04-04 22:41:18'),
(62, '2.00', NULL, 62, 9, 20, 22, 45, 9, NULL, NULL, '2017-04-04 22:59:18', '2017-04-04 22:59:18'),
(63, '1.00', '0.50', 63, 23, 20, 11, 56, 9, NULL, NULL, '2017-04-04 23:03:47', '2017-04-04 23:03:47'),
(64, '4.00', '5.00', 64, 21, 20, 22, 40, 6, NULL, NULL, '2017-04-04 23:04:53', '2017-04-04 23:04:53'),
(65, '1.00', '0.50', 65, 25, 2, 2, 50, 25, NULL, NULL, '2017-04-04 23:11:12', '2017-04-04 23:11:12'),
(66, '1.00', '0.50', 66, 25, 20, 2, 50, 9, NULL, NULL, '2017-04-04 23:12:22', '2017-04-04 23:12:22'),
(67, '2.00', NULL, 67, 4, 3, 2, 66, 4, NULL, NULL, '2017-04-05 11:43:54', '2017-04-05 11:43:54'),
(68, '2.00', NULL, 68, 4, 3, 2, 66, 4, NULL, NULL, '2017-04-05 11:43:54', '2017-04-05 11:43:54'),
(69, '2.00', NULL, 69, 2, 4, 2, 66, 4, NULL, NULL, '2017-04-05 11:49:14', '2017-04-05 11:49:14'),
(70, '0.50', '0.50', 70, 7, 1, 22, 34, 7, NULL, NULL, '2017-04-05 12:47:07', '2017-04-05 12:47:07'),
(71, '6.00', NULL, 71, 23, 3, 11, 65, 9, NULL, NULL, '2017-04-05 12:47:23', '2017-04-05 12:47:23'),
(72, '0.25', '0.25', 72, 7, 1, 11, 29, 7, NULL, NULL, '2017-04-05 12:47:25', '2017-04-05 12:47:25'),
(73, '1.00', '1.00', 73, 16, 1, 11, 44, 7, NULL, NULL, '2017-04-05 12:47:44', '2017-04-05 12:47:44'),
(74, '15.00', NULL, 74, 24, 3, 11, 64, 9, NULL, NULL, '2017-04-05 13:10:41', '2017-04-05 13:10:41'),
(75, '8.00', '7.00', 75, 25, 2, 2, 53, 25, NULL, NULL, '2017-04-05 15:37:00', '2017-04-05 15:37:00'),
(76, '8.00', '7.00', 76, 25, 20, 2, 53, 9, NULL, NULL, '2017-04-05 15:41:40', '2017-04-05 15:41:40'),
(77, '4.00', NULL, 77, 9, 3, 9, 70, 9, NULL, NULL, '2017-04-05 15:46:04', '2017-04-05 15:46:04'),
(78, '4.00', '3.50', 78, 9, 2, 9, 70, 9, NULL, NULL, '2017-04-05 15:46:43', '2017-04-05 15:46:43'),
(79, '4.00', '3.50', 79, 9, 20, 9, 70, 9, NULL, NULL, '2017-04-05 15:46:55', '2017-04-05 15:46:55'),
(80, '1.00', NULL, 80, 21, 3, 3, 68, 6, NULL, NULL, '2017-04-05 16:57:50', '2017-04-05 16:57:50'),
(81, '1.50', '1.50', 81, 4, 1, 4, 71, 4, NULL, NULL, '2017-04-05 19:48:53', '2017-04-05 19:48:53'),
(82, '2.00', NULL, 82, 25, 3, 2, 73, 9, NULL, NULL, '2017-04-05 20:33:34', '2017-04-05 20:33:34'),
(83, '1.00', NULL, 83, 25, 3, 2, 72, 9, NULL, NULL, '2017-04-05 20:34:49', '2017-04-05 20:34:49'),
(84, '1.00', NULL, 84, 6, 5, 3, 68, 21, NULL, NULL, '2017-04-05 20:44:26', '2017-04-05 20:44:26'),
(85, '1.00', '0.50', 85, 25, 2, 2, 72, 25, NULL, NULL, '2017-04-05 21:08:01', '2017-04-05 21:08:01'),
(86, '2.00', '1.00', 86, 25, 2, 2, 73, 25, NULL, NULL, '2017-04-05 21:09:24', '2017-04-05 21:09:24'),
(87, '2.00', '1.00', 87, 25, 20, 2, 73, 9, NULL, NULL, '2017-04-05 21:15:11', '2017-04-05 21:15:11'),
(88, '1.00', '0.50', 88, 25, 20, 2, 72, 9, NULL, NULL, '2017-04-05 21:26:46', '2017-04-05 21:26:46'),
(89, '4.00', NULL, 89, 9, 3, 11, 75, 9, NULL, NULL, '2017-04-05 21:27:39', '2017-04-05 21:27:39'),
(90, '0.50', NULL, 90, 25, 3, 11, 74, 9, NULL, NULL, '2017-04-05 21:35:56', '2017-04-05 21:35:56'),
(91, NULL, NULL, 91, 11, 4, 11, 77, 9, NULL, NULL, '2017-04-05 21:39:02', '2017-04-05 21:39:02'),
(92, NULL, NULL, 92, 9, 5, 11, 77, 11, NULL, NULL, '2017-04-05 21:41:23', '2017-04-05 21:41:23'),
(93, '2.00', NULL, 93, 23, 3, 11, 78, 9, NULL, NULL, '2017-04-05 21:59:20', '2017-04-05 21:59:20'),
(94, '4.00', '3.50', 94, 9, 2, 11, 75, 9, NULL, NULL, '2017-04-05 22:39:23', '2017-04-05 22:39:23'),
(95, '4.00', '3.50', 95, 9, 20, 11, 75, 9, NULL, NULL, '2017-04-05 22:39:39', '2017-04-05 22:39:39'),
(96, '2.00', '1.00', 96, 23, 2, 11, 78, 23, NULL, NULL, '2017-04-05 22:54:58', '2017-04-05 22:54:58'),
(97, '1.00', NULL, 97, 9, 3, 22, 79, 9, NULL, NULL, '2017-04-05 22:58:39', '2017-04-05 22:58:39'),
(98, '1.00', '0.50', 98, 9, 2, 22, 79, 9, NULL, NULL, '2017-04-05 22:59:43', '2017-04-05 22:59:43'),
(99, '1.00', '0.50', 99, 9, 20, 22, 79, 9, NULL, NULL, '2017-04-05 23:00:36', '2017-04-05 23:00:36'),
(100, '1.00', NULL, 100, 23, 3, 11, 77, 9, NULL, NULL, '2017-04-05 23:01:39', '2017-04-05 23:01:39'),
(101, '0.25', NULL, 101, 7, 3, 22, 83, 7, NULL, NULL, '2017-04-06 12:44:20', '2017-04-06 12:44:20'),
(102, '0.25', '0.25', 102, 7, 2, 22, 83, 7, NULL, NULL, '2017-04-06 12:44:28', '2017-04-06 12:44:28'),
(103, '0.25', '0.25', 103, 7, 1, 22, 83, 7, NULL, NULL, '2017-04-06 12:44:34', '2017-04-06 12:44:34'),
(104, '1.00', NULL, 104, 7, 3, 11, 86, 7, NULL, NULL, '2017-04-06 12:45:20', '2017-04-06 12:45:20'),
(105, '1.00', '1.00', 105, 7, 2, 11, 86, 7, NULL, NULL, '2017-04-06 12:45:49', '2017-04-06 12:45:49'),
(106, '2.00', '1.00', 106, 23, 20, 11, 78, 9, NULL, NULL, '2017-04-06 13:11:51', '2017-04-06 13:11:51'),
(107, '1.00', '1.00', 107, 7, 2, 11, 86, 7, NULL, NULL, '2017-04-06 13:12:17', '2017-04-06 13:12:17'),
(108, NULL, NULL, 108, 9, 7, 11, 90, 11, NULL, NULL, '2017-04-06 13:19:44', '2017-04-06 13:19:44'),
(109, NULL, NULL, 109, 7, 6, 11, 91, 11, NULL, NULL, '2017-04-06 13:25:26', '2017-04-06 13:25:26'),
(110, '2.00', NULL, 110, 6, 3, 11, 76, 6, NULL, NULL, '2017-04-06 13:27:23', '2017-04-06 13:27:23'),
(111, '2.00', '2.00', 111, 6, 2, 11, 76, 6, NULL, NULL, '2017-04-06 13:28:06', '2017-04-06 13:28:06'),
(112, '2.00', '2.00', 112, 6, 20, 11, 76, 6, NULL, NULL, '2017-04-06 13:28:29', '2017-04-06 13:28:29'),
(113, '0.50', '0.50', 113, 25, 2, 11, 74, 25, NULL, NULL, '2017-04-06 13:45:48', '2017-04-06 13:45:48'),
(114, '0.50', '0.50', 114, 25, 20, 11, 74, 9, NULL, NULL, '2017-04-06 13:46:21', '2017-04-06 13:46:21'),
(115, '1.00', NULL, 115, 3, 4, 3, 68, 6, NULL, NULL, '2017-04-06 13:53:41', '2017-04-06 13:53:41'),
(116, '8.00', NULL, 116, 25, 3, 11, 90, 9, NULL, NULL, '2017-04-06 13:57:52', '2017-04-06 13:57:52'),
(117, '2.00', '4.00', 117, 16, 2, 11, 31, 16, NULL, NULL, '2017-04-06 14:14:36', '2017-04-06 14:14:36'),
(118, '2.00', '4.00', 118, 16, 2, 11, 31, 16, NULL, NULL, '2017-04-06 14:18:03', '2017-04-06 14:18:03'),
(119, '2.00', NULL, 119, 23, 3, 22, 84, 9, NULL, NULL, '2017-04-06 14:18:31', '2017-04-06 14:18:31'),
(120, '1.00', NULL, 120, 13, 3, 11, 94, 6, NULL, NULL, '2017-04-06 15:58:33', '2017-04-06 15:58:33'),
(121, '1.00', NULL, 121, 13, 3, 11, 93, 6, NULL, NULL, '2017-04-06 15:59:27', '2017-04-06 15:59:27'),
(122, '1.00', NULL, 122, 6, 3, 11, 67, 6, NULL, NULL, '2017-04-06 16:03:00', '2017-04-06 16:03:00'),
(123, '1.00', '1.00', 123, 6, 2, 11, 67, 6, NULL, NULL, '2017-04-06 16:17:15', '2017-04-06 16:17:15'),
(124, '1.00', '1.00', 124, 6, 20, 11, 67, 6, NULL, NULL, '2017-04-06 16:17:27', '2017-04-06 16:17:27'),
(125, '1.00', '1.00', 125, 6, 1, 11, 67, 6, NULL, NULL, '2017-04-06 16:17:35', '2017-04-06 16:17:35'),
(126, '1.00', NULL, 126, 6, 3, 3, 51, 6, NULL, NULL, '2017-04-06 16:28:29', '2017-04-06 16:28:29'),
(127, '1.00', '1.00', 127, 6, 2, 3, 51, 6, NULL, NULL, '2017-04-06 16:37:50', '2017-04-06 16:37:50'),
(128, '1.00', '1.00', 128, 6, 20, 3, 51, 6, NULL, NULL, '2017-04-06 16:39:40', '2017-04-06 16:39:40'),
(129, '1.00', '1.00', 129, 6, 1, 3, 51, 6, NULL, NULL, '2017-04-06 16:39:54', '2017-04-06 16:39:54'),
(130, '0.50', '30.00', 130, 16, 2, 11, 49, 16, NULL, NULL, '2017-04-06 17:06:57', '2017-04-06 17:06:57'),
(131, '3.00', NULL, 131, 20, 3, 22, 98, 6, NULL, NULL, '2017-04-06 17:10:28', '2017-04-06 17:10:28'),
(132, '1.00', NULL, 132, 16, 3, 11, 88, 7, NULL, NULL, '2017-04-06 19:10:24', '2017-04-06 19:10:24'),
(133, '2.00', NULL, 133, 4, 5, 2, 66, 2, NULL, NULL, '2017-04-06 19:18:05', '2017-04-06 19:18:05'),
(134, '1.00', '1.00', 134, 6, 1, 3, 51, 3, NULL, NULL, '2017-04-06 19:24:22', '2017-04-06 19:24:22'),
(135, '4.00', '8.00', 135, 16, 2, 11, 30, 16, NULL, NULL, '2017-04-06 19:31:46', '2017-04-06 19:31:46'),
(136, '1.00', NULL, 136, 6, 5, 3, 68, 3, NULL, NULL, '2017-04-06 19:35:19', '2017-04-06 19:35:19'),
(137, '8.00', NULL, 137, 25, 3, 11, 90, 9, NULL, NULL, '2017-04-06 19:38:21', '2017-04-06 19:38:21'),
(138, NULL, NULL, 138, 6, 5, 3, 55, 3, NULL, NULL, '2017-04-06 19:49:11', '2017-04-06 19:49:11'),
(139, '2.00', '2.00', 139, 23, 2, 22, 84, 23, NULL, NULL, '2017-04-06 21:14:47', '2017-04-06 21:14:47'),
(140, '1.00', '0.50', 140, 13, 2, 11, 93, 13, NULL, NULL, '2017-04-06 21:21:09', '2017-04-06 21:21:09'),
(141, '1.00', '0.50', 141, 13, 2, 11, 94, 13, NULL, NULL, '2017-04-06 21:21:56', '2017-04-06 21:21:56'),
(142, '1.00', '0.50', 142, 13, 20, 11, 94, 6, NULL, NULL, '2017-04-06 22:07:37', '2017-04-06 22:07:37'),
(143, '1.00', '0.50', 143, 13, 20, 11, 93, 6, NULL, NULL, '2017-04-06 22:08:02', '2017-04-06 22:08:02'),
(144, '0.00', '0.00', 144, 6, 3, 3, 55, 6, NULL, NULL, '2017-04-06 22:11:33', '2017-04-06 22:11:33'),
(145, '0.00', '0.00', 145, 6, 2, 3, 55, 6, NULL, NULL, '2017-04-06 22:11:44', '2017-04-06 22:11:44'),
(146, '1.50', NULL, 146, 21, 3, 3, 68, 6, NULL, NULL, '2017-04-06 22:26:02', '2017-04-06 22:26:02'),
(147, '0.00', '0.00', 147, 6, 1, 3, 55, 6, NULL, NULL, '2017-04-06 22:36:33', '2017-04-06 22:36:33'),
(148, '1.00', '1.00', 148, 16, 2, 11, 88, 16, NULL, NULL, '2017-04-06 22:43:48', '2017-04-06 22:43:48'),
(149, '1.00', '0.50', 149, 21, 1, 22, 39, 6, NULL, NULL, '2017-04-06 22:44:37', '2017-04-06 22:44:37'),
(150, '0.50', '0.40', 150, 21, 1, 22, 41, 6, NULL, NULL, '2017-04-06 22:56:51', '2017-04-06 22:56:51'),
(151, '2.00', '2.00', 151, 6, 1, 11, 76, 6, NULL, NULL, '2017-04-06 22:57:22', '2017-04-06 22:57:22'),
(152, '0.50', '0.40', 152, 21, 1, 22, 38, 6, NULL, NULL, '2017-04-06 22:57:38', '2017-04-06 22:57:38'),
(153, '4.00', '5.00', 153, 21, 1, 22, 40, 6, NULL, NULL, '2017-04-06 22:57:56', '2017-04-06 22:57:56'),
(154, '15.00', '8.00', 154, 24, 2, 11, 64, 24, NULL, NULL, '2017-04-06 22:59:07', '2017-04-06 22:59:07'),
(155, '6.00', '6.00', 155, 23, 2, 11, 65, 23, NULL, NULL, '2017-04-06 23:05:26', '2017-04-06 23:05:26'),
(156, '2.00', NULL, 156, 4, 3, 2, 66, 4, NULL, NULL, '2017-04-07 11:20:08', '2017-04-07 11:20:08'),
(157, '2.50', NULL, 157, 4, 3, 2, 97, 4, NULL, NULL, '2017-04-07 11:23:45', '2017-04-07 11:23:45'),
(158, '3.00', '3.00', 158, 4, 3, 4, 104, 4, NULL, NULL, '2017-04-07 11:27:02', '2017-04-07 11:27:02'),
(159, '3.00', '3.00', 159, 4, 1, 4, 104, 4, NULL, NULL, '2017-04-07 11:27:12', '2017-04-07 11:27:12'),
(160, '3.00', '3.00', 160, 4, 1, 4, 105, 4, NULL, NULL, '2017-04-07 11:29:05', '2017-04-07 11:29:05'),
(161, '2.00', '2.00', 161, 4, 1, 4, 107, 4, NULL, NULL, '2017-04-07 11:30:51', '2017-04-07 11:30:51'),
(162, '2.00', '2.00', 162, 4, 1, 4, 108, 4, NULL, NULL, '2017-04-07 11:32:16', '2017-04-07 11:32:16'),
(163, '0.50', '0.50', 163, 4, 1, 4, 109, 4, NULL, NULL, '2017-04-07 11:33:43', '2017-04-07 11:33:43'),
(164, '1.50', '1.50', 164, 4, 1, 4, 110, 4, NULL, NULL, '2017-04-07 11:36:01', '2017-04-07 11:36:01'),
(165, '2.00', '1.50', 165, 4, 1, 2, 66, 4, NULL, NULL, '2017-04-07 12:58:12', '2017-04-07 12:58:12'),
(166, '2.00', NULL, 166, 16, 3, 11, 103, 7, NULL, NULL, '2017-04-07 13:21:44', '2017-04-07 13:21:44'),
(167, '1.50', '1.00', 167, 21, 2, 3, 68, 21, NULL, NULL, '2017-04-07 13:35:05', '2017-04-07 13:35:05'),
(168, '2.00', NULL, 168, 21, 3, 22, 101, 6, NULL, NULL, '2017-04-07 13:37:02', '2017-04-07 13:37:02'),
(169, '8.00', '6.00', 169, 25, 2, 11, 90, 25, NULL, NULL, '2017-04-07 14:15:19', '2017-04-07 14:15:19'),
(170, '6.00', '6.00', 170, 23, 20, 11, 65, 9, NULL, NULL, '2017-04-07 14:28:32', '2017-04-07 14:28:32'),
(171, '8.00', '6.00', 171, 25, 20, 11, 90, 9, NULL, NULL, '2017-04-07 14:32:13', '2017-04-07 14:32:13'),
(172, '2.00', '2.00', 172, 23, 20, 22, 84, 9, NULL, NULL, '2017-04-07 14:38:48', '2017-04-07 14:38:48'),
(173, '15.00', '8.00', 173, 24, 20, 11, 64, 9, NULL, NULL, '2017-04-07 14:56:59', '2017-04-07 14:56:59'),
(174, '1.00', '1.00', 174, 6, 3, 11, 102, 6, NULL, NULL, '2017-04-07 17:36:30', '2017-04-07 17:36:30'),
(175, '1.00', '1.00', 175, 6, 2, 11, 102, 6, NULL, NULL, '2017-04-07 17:36:42', '2017-04-07 17:36:42'),
(176, '1.00', '1.00', 176, 6, 20, 11, 102, 6, NULL, NULL, '2017-04-07 17:36:54', '2017-04-07 17:36:54'),
(177, '2.00', '3.00', 177, 21, 2, 22, 101, 21, NULL, NULL, '2017-04-07 18:54:49', '2017-04-07 18:54:49'),
(178, '1.50', '1.00', 178, 21, 20, 3, 68, 6, NULL, NULL, '2017-04-07 18:56:41', '2017-04-07 18:56:41'),
(179, '4.00', '3.50', 179, 9, 1, 11, 75, 9, NULL, NULL, '2017-04-07 19:17:49', '2017-04-07 19:17:49'),
(180, '2.00', '1.00', 180, 23, 1, 11, 78, 9, NULL, NULL, '2017-04-07 19:18:04', '2017-04-07 19:18:04'),
(181, '8.00', '6.00', 181, 25, 1, 11, 90, 9, NULL, NULL, '2017-04-07 19:18:21', '2017-04-07 19:18:21'),
(182, '0.50', '0.50', 182, 25, 1, 11, 74, 9, NULL, NULL, '2017-04-07 19:18:37', '2017-04-07 19:18:37'),
(183, '15.00', '8.00', 183, 24, 1, 11, 64, 9, NULL, NULL, '2017-04-07 19:18:52', '2017-04-07 19:18:52'),
(184, '3.00', '1.00', 184, 24, 1, 11, 42, 9, NULL, NULL, '2017-04-07 19:19:17', '2017-04-07 19:19:17'),
(185, '2.00', '1.00', 185, 25, 1, 2, 73, 9, NULL, NULL, '2017-04-07 19:19:40', '2017-04-07 19:19:40'),
(186, '1.00', '0.50', 186, 25, 1, 2, 50, 9, NULL, NULL, '2017-04-07 19:19:59', '2017-04-07 19:19:59'),
(187, '1.00', '1.00', 187, 4, 1, 4, 119, 4, NULL, NULL, '2017-04-07 19:23:29', '2017-04-07 19:23:29'),
(188, '3.00', '3.00', 188, 6, 1, 6, 124, 6, NULL, NULL, '2017-04-07 19:33:24', '2017-04-07 19:33:24'),
(189, '10.00', NULL, 189, 25, 3, 2, 117, 9, NULL, NULL, '2017-04-07 19:35:22', '2017-04-07 19:35:22'),
(190, '1.00', '0.50', 190, 25, 1, 2, 72, 9, NULL, NULL, '2017-04-07 19:35:38', '2017-04-07 19:35:38'),
(191, '8.00', '7.00', 191, 25, 1, 2, 53, 9, NULL, NULL, '2017-04-07 19:35:57', '2017-04-07 19:35:57'),
(192, '4.00', '4.00', 192, 6, 1, 6, 127, 6, NULL, NULL, '2017-04-07 19:37:23', '2017-04-07 19:37:23'),
(193, '2.00', '2.00', 193, 6, 1, 6, 130, 6, NULL, NULL, '2017-04-07 19:45:14', '2017-04-07 19:45:14'),
(194, '1.00', '1.00', 194, 6, 1, 6, 131, 6, NULL, NULL, '2017-04-07 19:47:24', '2017-04-07 19:47:24'),
(195, '2.00', '2.00', 195, 23, 1, 22, 84, 9, NULL, NULL, '2017-04-07 20:05:27', '2017-04-07 20:05:27'),
(196, '6.00', '6.00', 196, 23, 1, 11, 65, 9, NULL, NULL, '2017-04-07 20:06:00', '2017-04-07 20:06:00'),
(197, '1.00', '0.50', 197, 23, 1, 11, 56, 9, NULL, NULL, '2017-04-07 20:06:34', '2017-04-07 20:06:34'),
(198, '1.00', '1.00', 198, 23, 1, 22, 35, 9, NULL, NULL, '2017-04-07 20:08:26', '2017-04-07 20:08:26'),
(199, NULL, NULL, 199, 5, 7, 2, 137, 2, NULL, NULL, '2017-04-07 20:08:51', '2017-04-07 20:08:51'),
(200, '1.00', '0.50', 200, 9, 1, 22, 79, 9, NULL, NULL, '2017-04-07 20:08:55', '2017-04-07 20:08:55'),
(201, '4.00', '3.50', 201, 9, 1, 9, 70, 9, NULL, NULL, '2017-04-07 20:09:12', '2017-04-07 20:09:12'),
(202, NULL, NULL, 202, 5, 7, 2, 138, 2, NULL, NULL, '2017-04-07 20:09:19', '2017-04-07 20:09:19'),
(203, '2.00', '1.00', 203, 23, 1, 2, 37, 9, NULL, NULL, '2017-04-07 20:09:27', '2017-04-07 20:09:27'),
(204, NULL, NULL, 204, 5, 7, 2, 138, 1, NULL, NULL, '2017-04-07 20:13:53', '2017-04-07 20:13:53'),
(205, '1.00', '1.00', 205, 16, 20, 11, 88, 7, NULL, NULL, '2017-04-07 20:14:22', '2017-04-07 20:14:22'),
(206, '4.00', '8.00', 206, 16, 20, 11, 30, 7, NULL, NULL, '2017-04-07 20:14:35', '2017-04-07 20:14:35'),
(207, '0.50', '30.00', 207, 16, 20, 11, 49, 7, NULL, NULL, '2017-04-07 20:14:59', '2017-04-07 20:14:59'),
(208, '1.00', '1.00', 208, 7, 20, 11, 86, 7, NULL, NULL, '2017-04-07 20:15:17', '2017-04-07 20:15:17'),
(209, '2.00', '4.00', 209, 16, 20, 11, 31, 7, NULL, NULL, '2017-04-07 20:15:28', '2017-04-07 20:15:28'),
(210, NULL, NULL, 210, 5, 7, 2, 141, 2, NULL, NULL, '2017-04-07 20:27:18', '2017-04-07 20:27:18'),
(211, NULL, NULL, 211, 5, 7, 2, 141, 2, NULL, NULL, '2017-04-07 20:28:06', '2017-04-07 20:28:06'),
(212, '2.00', '1.00', 212, 16, 2, 11, 103, 16, NULL, NULL, '2017-04-07 20:33:01', '2017-04-07 20:33:01'),
(213, NULL, NULL, 213, 5, 7, 2, 144, 2, NULL, NULL, '2017-04-07 20:39:55', '2017-04-07 20:39:55'),
(214, '0.50', NULL, 214, 16, 3, 11, 89, 7, NULL, NULL, '2017-04-07 20:40:18', '2017-04-07 20:40:18'),
(215, '0.50', '1.00', 215, 16, 2, 11, 89, 16, NULL, NULL, '2017-04-07 20:50:04', '2017-04-07 20:50:04'),
(216, '20.00', NULL, 232, 24, 3, 11, 134, 9, NULL, NULL, '2017-04-07 21:34:40', '2017-04-07 21:34:40'),
(217, '12.00', '28.00', 234, 9, 2, 3, 33, 9, NULL, NULL, '2017-04-07 22:35:58', '2017-04-07 22:35:58'),
(218, '12.00', '28.00', 235, 9, 20, 3, 33, 9, NULL, NULL, '2017-04-07 22:36:27', '2017-04-07 22:36:27'),
(219, '2.00', '2.00', 236, 9, 2, 22, 45, 9, NULL, NULL, '2017-04-07 22:40:41', '2017-04-07 22:40:41'),
(220, '2.00', '2.00', 237, 9, 20, 22, 45, 9, NULL, NULL, '2017-04-07 22:40:53', '2017-04-07 22:40:53'),
(221, '2.00', '2.00', 238, 9, 1, 22, 45, 9, NULL, NULL, '2017-04-07 22:40:59', '2017-04-07 22:40:59'),
(222, '3.00', '3.00', 239, 4, 1, 4, 106, 4, NULL, NULL, '2017-04-07 23:33:27', '2017-04-07 23:33:27'),
(223, '1.25', NULL, 240, 5, 3, 2, 180, 5, '2017-04-11 00:00:00', '2017-04-12 00:00:00', '2017-04-10 01:08:31', '2017-04-10 01:08:31'),
(224, '1.00', NULL, 241, 5, 3, 2, 190, 5, '2017-04-10 00:00:00', '2017-04-11 00:00:00', '2017-04-10 01:10:09', '2017-04-10 01:10:09'),
(225, '1.00', NULL, 242, 14, 3, 2, 189, 5, '2017-04-17 00:00:00', '2017-04-17 00:00:00', '2017-04-10 01:16:06', '2017-04-10 01:16:06'),
(226, '18.00', NULL, 243, 15, 3, 3, 28, 5, '2017-04-28 00:00:00', '2017-05-02 00:00:00', '2017-04-10 01:22:45', '2017-04-10 01:22:45'),
(227, '18.00', NULL, 244, 15, 3, 3, 28, 5, '2017-04-28 00:00:00', '2017-05-02 00:00:00', '2017-04-10 01:24:43', '2017-04-10 01:24:43'),
(228, '2.00', NULL, 245, 15, 3, 2, 133, 5, '2017-04-27 00:00:00', '2017-04-28 00:00:00', '2017-04-10 01:26:29', '2017-04-10 01:26:29'),
(229, '1.00', NULL, 246, 14, 3, 2, 132, 5, '2017-04-26 00:00:00', '2017-04-27 00:00:00', '2017-04-10 01:30:13', '2017-04-10 01:30:13'),
(230, '1.00', NULL, 247, 14, 3, 2, 132, 5, '2017-04-26 00:00:00', '2017-04-27 00:00:00', '2017-04-10 01:30:15', '2017-04-10 01:30:15'),
(231, '1.00', NULL, 248, 14, 3, 2, 128, 5, '2017-04-24 00:00:00', '2017-04-24 00:00:00', '2017-04-10 01:34:34', '2017-04-10 01:34:34'),
(232, '3.00', NULL, 249, 15, 3, 2, 129, 5, '2017-04-24 00:00:00', '2017-04-25 00:00:00', '2017-04-10 01:36:15', '2017-04-10 01:36:15'),
(233, '1.00', NULL, 250, 14, 3, 2, 135, 5, '2017-04-10 00:00:00', '2017-04-10 00:00:00', '2017-04-10 01:37:29', '2017-04-10 01:37:29'),
(234, '1.00', NULL, 251, 14, 3, 2, 136, 5, '2017-04-10 00:00:00', '2017-04-10 00:00:00', '2017-04-10 01:39:28', '2017-04-10 01:39:28'),
(235, NULL, NULL, 252, 2, 4, 2, 138, 5, NULL, NULL, '2017-04-10 01:40:24', '2017-04-10 01:40:24'),
(236, '1.00', NULL, 253, 14, 3, 2, 141, 5, '2017-04-10 00:00:00', '2017-04-10 00:00:00', '2017-04-10 01:43:15', '2017-04-10 01:43:15'),
(237, '3.00', NULL, 254, 15, 3, 2, 140, 5, '2017-04-21 00:00:00', '2017-04-21 00:00:00', '2017-04-10 01:46:30', '2017-04-10 01:46:30'),
(238, '1.00', NULL, 255, 14, 3, 2, 139, 5, '2017-04-11 00:00:00', '2017-04-11 00:00:00', '2017-04-10 01:47:51', '2017-04-10 01:47:51'),
(239, NULL, NULL, 256, 2, 4, 2, 137, 5, NULL, NULL, '2017-04-10 01:49:20', '2017-04-10 01:49:20'),
(240, '1.00', NULL, 257, 14, 3, 2, 126, 5, '2017-04-17 00:00:00', '2017-04-17 00:00:00', '2017-04-10 01:50:58', '2017-04-10 01:50:58'),
(241, '3.00', NULL, 258, 15, 3, 2, 121, 5, '2017-04-28 00:00:00', '2017-04-28 00:00:00', '2017-04-10 01:52:33', '2017-04-10 01:52:33'),
(242, '1.00', NULL, 259, 14, 3, 2, 125, 5, '2017-04-10 00:00:00', '2017-04-10 00:00:00', '2017-04-10 01:54:05', '2017-04-10 01:54:05'),
(243, NULL, NULL, 260, 2, 4, 2, 111, 5, NULL, NULL, '2017-04-10 01:55:00', '2017-04-10 01:55:00'),
(244, '1.00', NULL, 261, 15, 3, 2, 99, 5, '2017-04-10 00:00:00', '2017-04-10 00:00:00', '2017-04-10 01:56:29', '2017-04-10 01:56:29'),
(245, '2.00', NULL, 262, 14, 3, 2, 96, 5, '2017-04-11 00:00:00', '2017-04-11 00:00:00', '2017-04-10 01:57:26', '2017-04-10 01:57:26'),
(246, '2.00', NULL, 263, 14, 3, 2, 96, 5, '2017-04-11 00:00:00', '2017-04-11 00:00:00', '2017-04-10 01:59:50', '2017-04-10 01:59:50'),
(247, '3.00', NULL, 264, 5, 3, 2, 69, 5, '2017-04-12 00:00:00', '2017-04-12 00:00:00', '2017-04-10 02:01:32', '2017-04-10 02:01:32'),
(248, '4.00', NULL, 265, 15, 3, 2, 112, 5, '2017-05-08 00:00:00', '2017-05-09 00:00:00', '2017-04-10 02:05:00', '2017-04-10 02:05:00'),
(249, '4.00', NULL, 266, 15, 3, 2, 113, 5, '2017-05-04 00:00:00', '2017-05-04 00:00:00', '2017-04-10 02:09:01', '2017-04-10 02:09:01'),
(250, '2.00', NULL, 267, 15, 3, 2, 123, 5, '2017-04-24 00:00:00', '2017-04-24 00:00:00', '2017-04-10 02:10:36', '2017-04-10 02:10:36'),
(251, '1.00', NULL, 268, 14, 3, 2, 120, 5, '2017-04-11 00:00:00', '2017-04-11 00:00:00', '2017-04-10 02:12:25', '2017-04-10 02:12:25'),
(252, '2.00', NULL, 269, 14, 3, 2, 116, 5, '2017-04-12 00:00:00', '2017-04-12 00:00:00', '2017-04-10 02:14:22', '2017-04-10 02:14:22'),
(253, '1.20', NULL, 270, 14, 3, 2, 114, 5, '2017-04-18 00:00:00', '2017-04-18 00:00:00', '2017-04-10 02:16:13', '2017-04-10 02:16:13'),
(254, NULL, NULL, 271, 11, 4, 11, 184, 7, NULL, NULL, '2017-04-10 11:56:08', '2017-04-10 11:56:08'),
(255, '0.50', '0.50', 272, 7, 1, 11, 82, 7, NULL, NULL, '2017-04-10 11:59:47', '2017-04-10 11:59:47'),
(256, '0.50', NULL, 273, 7, 3, 11, 85, 7, '2017-04-10 00:00:00', '2017-04-11 00:00:00', '2017-04-10 12:11:33', '2017-04-10 12:11:33'),
(257, '1.00', '1.00', 274, 7, 1, 11, 86, 7, NULL, NULL, '2017-04-10 12:13:18', '2017-04-10 12:13:18'),
(258, '0.50', NULL, 275, 16, 3, 11, 164, 7, '2017-04-10 00:00:00', '2017-04-11 00:00:00', '2017-04-10 12:19:59', '2017-04-10 12:19:59'),
(259, NULL, NULL, 276, 2, 4, 2, 174, 9, NULL, NULL, '2017-04-10 12:52:37', '2017-04-10 12:52:37'),
(260, '12.00', '28.00', 277, 9, 1, 3, 33, 9, NULL, NULL, '2017-04-10 13:08:58', '2017-04-10 13:08:58');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=358 ;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(328, '2017_01_20_185313_create_tipos_estados_table', 1),
(329, '2017_01_20_185353_create_estados_table', 1),
(330, '2017_01_20_185403_create_clientes_table', 1),
(331, '2017_01_20_185416_create_areas_table', 1),
(332, '2017_01_20_185417_create_users_table', 1),
(333, '2017_01_20_185418_entrust_setup_tables', 1),
(334, '2017_01_20_185419_create_ots_table', 1),
(335, '2017_01_20_185547_create_tiempos_x_area_table', 1),
(336, '2017_01_20_185548_tipos_planeacion', 1),
(337, '2017_01_20_185549_fases_planeacion', 1),
(338, '2017_01_20_185556_create_tareas_table', 1),
(339, '2017_01_20_185609_create_comentarios_table', 1),
(340, '2017_01_20_185630_create_historico_tareas_table', 1),
(341, '2017_01_20_185655_create_historico_ots_table', 1),
(342, '2017_01_20_185728_create_tipos_compras_table', 1),
(343, '2017_01_20_185739_create_divisas_table', 1),
(344, '2017_01_22_185548_create_compras_ots_table', 1),
(345, '2017_02_02_223414_create_requerimientos_ots', 1),
(346, '2017_02_03_100000_create_password_resets_table', 1),
(347, '2017_02_03_185339_create_trafico_tareas_table', 1),
(348, '2017_02_15_032207_create_notifications_table', 1),
(349, '2017_02_21_170755_estados_x_roles_table', 1),
(350, '2017_02_24_131719_historial_equipo', 1),
(351, '2017_03_10_171400_create_sessions_table', 1),
(352, '2017_04_03_150631_update_requerimientos_ots_v1_0_0', 2),
(353, '2017_04_03_163109_update_tareas_v1_0_0', 2),
(354, '2017_04_05_102600_update_compras_ots_v_1_0_0', 3),
(355, '2017_04_05_171240_update_planeacion_tipos_areas_id', 3),
(356, '2017_04_06_092000_update_clientes_razon_social', 3),
(357, '2017_04_07_151927_update_tarea_soft_delete', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notifications`
--

CREATE TABLE IF NOT EXISTS `notifications` (
  `id` char(36) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `notifiable_id` int(10) unsigned NOT NULL,
  `notifiable_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_id_notifiable_type_index` (`notifiable_id`,`notifiable_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_id`, `notifiable_type`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('018cc206-48d4-424d-870d-9f2eeaf2ef7b', 'App\\Notifications\\TareaProgramada', 14, 'App\\User', '{"id_tarea":132,"nombre":"Juan Pablo","cargo":"Campaign Manager","descripcion":"Juan Pablo ha programado la Tarea: Amplificar post Descuento Jhonson\\"s","created_at":"2017-04-09 20:30:15","img_perfil":null,"link":"\\/ver_tarea\\/132"}', NULL, '2017-04-10 01:30:15', '2017-04-10 01:30:15'),
('01ac8bd1-317f-4004-8067-57f44c886d7e', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":2,"nombre":"Silvia","cargo":"Ejecutiva de cuentas","descripcion":"Silvia cre\\u00f3 la Tarea: Pauta Tennis de campo","created_at":"2017-03-31 20:51:06","img_perfil":null,"link":"\\/ver_tarea\\/2"}', '2017-04-03 19:13:25', '2017-04-01 01:51:06', '2017-04-03 19:13:25'),
('0267b5bc-7ff9-4b97-bea3-131da4b5f792', 'App\\Notifications\\TareaRealizada', 7, 'App\\User', '{"id_tarea":29,"nombre":"Leonardo","cargo":"Lider de Contenido Escrito","descripcion":"Leonardo ha realizado la Tarea: \\"Cambiar nombre del seguro de ProgreSER\\" en 0.25 Hrs","created_at":"2017-04-04 17:38:04","img_perfil":"\\/images\\/avatars\\/Leonardo_7.png","link":"\\/ver_tarea\\/29"}', '2017-04-06 12:44:59', '2017-04-04 22:38:04', '2017-04-06 12:44:59'),
('02f9c539-d362-4ee4-a94e-e40bd99483de', 'App\\Notifications\\TareaCreada', 4, 'App\\User', '{"id_tarea":119,"nombre":"Jose","cargo":"Director Creativo","descripcion":"Jose cre\\u00f3 la Tarea: Cotizaci\\u00f3n Christus Sinergia Salud","created_at":"2017-04-07 14:22:31","img_perfil":"\\/images\\/avatars\\/Jose_4.png","link":"\\/ver_tarea\\/119"}', '2017-04-07 19:22:37', '2017-04-07 19:22:31', '2017-04-07 19:22:37'),
('02fe4eee-2d7c-4c97-8af1-1f865c80fd07', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":154,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  cre\\u00f3 la Tarea: Amplificar video pauta Rocksito Palmira","created_at":"2017-04-07 16:04:28","img_perfil":null,"link":"\\/ver_tarea\\/154"}', NULL, '2017-04-07 21:04:28', '2017-04-07 21:04:28'),
('033b37cf-1f51-4d3e-b63f-8b802580c0b1', 'App\\Notifications\\OtCreada', 1, 'App\\User', '{"id_tarea":7,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  ha creado una OT con referencia: 1103, nombre : Fee Posicionamiento SEO  y valor: $780,000","created_at":"2017-04-03 16:38:39","img_perfil":null,"link":"\\/ots\\/visualizar\\/7"}', '2017-04-03 21:56:36', '2017-04-03 21:38:39', '2017-04-03 21:56:36'),
('036e9749-3bbf-46ee-a50d-12a9f1c7a7af', 'App\\Notifications\\OtCreada', 1, 'App\\User', '{"id_tarea":11,"nombre":" Maria Andrea","cargo":"New Bussines","descripcion":" Maria Andrea ha creado una OT con referencia: 1109, nombre : Fee de Soporte en Desarrollo para sitio web y valor: $288,000","created_at":"2017-04-03 14:49:14","img_perfil":null,"link":"\\/ots\\/visualizar\\/11"}', '2017-04-03 22:38:13', '2017-04-03 19:49:14', '2017-04-03 22:38:13'),
('03cf898e-3bc0-4607-8cd9-7732c1b8c708', 'App\\Notifications\\TareaProgramada', 4, 'App\\User', '{"id_tarea":66,"nombre":"Jose","cargo":"Director Creativo","descripcion":"Jose ha programado la Tarea: Realizar Flow Pauta Primero de Mayo","created_at":"2017-04-05 06:43:54","img_perfil":"\\/images\\/avatars\\/Jose_4.png","link":"\\/ver_tarea\\/66"}', '2017-04-05 11:44:11', '2017-04-05 11:43:54', '2017-04-05 11:44:11'),
('04fdb0fc-da7b-47ac-a16b-f9f2abb346ad', 'App\\Notifications\\TareaCreada', 4, 'App\\User', '{"id_tarea":48,"nombre":" Maria Andrea","cargo":"New Bussines","descripcion":" Maria Andrea cre\\u00f3 la Tarea: Creaci\\u00f3n de Art\\u00edculos para Secci\\u00f3n Blog Momentos","created_at":"2017-04-03 17:43:19","img_perfil":null,"link":"\\/ver_tarea\\/48"}', '2017-04-03 22:44:00', '2017-04-03 22:43:19', '2017-04-03 22:44:00'),
('0503d069-a990-4a9f-9631-886bb353cd32', 'App\\Notifications\\OtTiempoExtraAprobado', 11, 'App\\User', '{"id_tarea":9,"nombre":"Maria Isabel","cargo":"Proyect Owner","descripcion":"Maria Isabel ha editado su Orden de trabajo con la referencia #1126 con el nombre Fee Mensual Abril ","created_at":"2017-04-03 14:32:16","img_perfil":null,"link":"\\/ots\\/visualizar\\/9"}', '2017-04-03 20:31:03', '2017-04-03 19:32:16', '2017-04-03 20:31:03'),
('05a13f70-35e3-4731-a71c-5c6091d25326', 'App\\Notifications\\TareaCreada', 7, 'App\\User', '{"id_tarea":164,"nombre":"Andrea","cargo":"Ejecutiva de Cuentas","descripcion":"Andrea cre\\u00f3 la Tarea: Pieza concurso bater\\u00edas ProgreSER","created_at":"2017-04-07 16:33:31","img_perfil":null,"link":"\\/ver_tarea\\/164"}', '2017-04-10 11:52:21', '2017-04-07 21:33:31', '2017-04-10 11:52:21'),
('0666b210-8ad5-4f6b-91fb-602593ee75e5', 'App\\Notifications\\OtCreada', 1, 'App\\User', '{"id_tarea":6,"nombre":" Maria Andrea","cargo":"New Bussines","descripcion":" Maria Andrea ha creado una OT con referencia: 1104, nombre : Fee de Mantenimiento al E-Commerce y valor: $580,000","created_at":"2017-04-03 16:34:24","img_perfil":null,"link":"\\/ots\\/visualizar\\/6"}', '2017-04-03 21:56:36', '2017-04-03 21:34:24', '2017-04-03 21:56:36'),
('06eb1685-a7c6-4e83-89cd-590b513b000b', 'App\\Notifications\\TareaCreada', 4, 'App\\User', '{"id_tarea":109,"nombre":"Jose","cargo":"Director Creativo","descripcion":"Jose cre\\u00f3 la Tarea: Cotizaci\\u00f3n Diamante","created_at":"2017-04-07 06:33:16","img_perfil":"\\/images\\/avatars\\/Jose_4.png","link":"\\/ver_tarea\\/109"}', '2017-04-07 11:33:21', '2017-04-07 11:33:16', '2017-04-07 11:33:21'),
('0730dca5-4f02-4efb-a04e-a5e3bb01b192', 'App\\Notifications\\TareaEntregada', 11, 'App\\User', '{"id_tarea":102,"nombre":"Luisa Fernanda","cargo":"Development  Leader","descripcion":"Luisa Fernanda entreg\\u00f3 la Tarea: Creaci\\u00f3n de cuentas de correo  y actualiz\\u00f3 el estado a Entregado","created_at":"2017-04-07 12:36:54","img_perfil":"\\/images\\/avatars\\/LuisaFernanda_6.png","link":"\\/ver_tarea\\/102"}', NULL, '2017-04-07 17:36:54', '2017-04-07 17:36:54'),
('0769bb56-eb7e-4dfb-aa05-5cf9201a56c1', 'App\\Notifications\\TareaProgramada', 16, 'App\\User', '{"id_tarea":164,"nombre":"Leonardo","cargo":"Lider de Contenido Escrito","descripcion":"Leonardo ha programado la Tarea: Pieza concurso bater\\u00edas ProgreSER","created_at":"2017-04-10 07:19:59","img_perfil":"\\/images\\/avatars\\/Leonardo_7.png","link":"\\/ver_tarea\\/164"}', NULL, '2017-04-10 12:19:59', '2017-04-10 12:19:59'),
('08407758-e902-4ffe-810e-5daaab259658', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":139,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  cre\\u00f3 la Tarea: Amplificar carrusel 3 cincuentazo - trasnoch\\u00f3n","created_at":"2017-04-07 15:05:22","img_perfil":null,"link":"\\/ver_tarea\\/139"}', NULL, '2017-04-07 20:05:22', '2017-04-07 20:05:22'),
('08808b65-8730-4ae7-94be-35a92e1183cc', 'App\\Notifications\\TareaProgramada', 5, 'App\\User', '{"id_tarea":180,"nombre":"Nestor","cargo":"SEM Performance Manager","descripcion":"Nestor ha programado la Tarea: Ajustar planes de pauta cursos regionales","created_at":"2017-04-09 20:08:31","img_perfil":"\\/images\\/avatars\\/Nestor_5.png","link":"\\/ver_tarea\\/180"}', NULL, '2017-04-10 01:08:31', '2017-04-10 01:08:31'),
('08981723-1d78-44d7-a3c8-197937299562', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":113,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  cre\\u00f3 la Tarea: Informe Pauta Concierto de la Cuna a la Jungla","created_at":"2017-04-07 08:41:20","img_perfil":null,"link":"\\/ver_tarea\\/113"}', NULL, '2017-04-07 13:41:20', '2017-04-07 13:41:20'),
('092553ae-9418-4d35-a7e8-38847f4e0c83', 'App\\Notifications\\TareaEntregada', 11, 'App\\User', '{"id_tarea":78,"nombre":"Andres Fabian","cargo":"Encargado de Dise\\u00f1o","descripcion":"Andres Fabian entreg\\u00f3 la Tarea: Adaptaci\\u00f3n piezas web e intranet  App  y actualiz\\u00f3 el estado a Entregado","created_at":"2017-04-06 08:11:51","img_perfil":"\\/images\\/avatars\\/AndresFabian_9.png","link":"\\/ver_tarea\\/78"}', '2017-04-06 16:35:03', '2017-04-06 13:11:51', '2017-04-06 16:35:03'),
('0b05f1c4-0bf1-441c-9aac-0d860f47c101', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":47,"nombre":"Andrea","cargo":"Ejecutiva de Cuentas","descripcion":"Andrea cre\\u00f3 la Tarea: Activar pauta formulario Hero ProgreSER","created_at":"2017-04-03 17:15:13","img_perfil":null,"link":"\\/ver_tarea\\/47"}', NULL, '2017-04-03 22:15:13', '2017-04-03 22:15:13'),
('0bdbc868-c4c3-4a3d-a538-9193dd66c798', 'App\\Notifications\\TareaCreada', 9, 'App\\User', '{"id_tarea":177,"nombre":"Andrea","cargo":"Ejecutiva de Cuentas","descripcion":"Andrea cre\\u00f3 la Tarea: Dise\\u00f1o responsive","created_at":"2017-04-07 18:41:41","img_perfil":null,"link":"\\/ver_tarea\\/177"}', NULL, '2017-04-07 23:41:41', '2017-04-07 23:41:41'),
('0ca1cb0b-942c-40a5-bdb0-ce632f491a74', 'App\\Notifications\\TareaRealizada', 9, 'App\\User', '{"id_tarea":37,"nombre":"Zuly","cargo":"Dise\\u00f1adora Gr\\u00e1fica","descripcion":"Zuly ha realizado la Tarea: \\"Graficar Vacantes y convocatorias Agencias Empleo\\" en 1 Hrs","created_at":"2017-04-03 17:57:11","img_perfil":"\\/images\\/avatars\\/Zuly_23.png","link":"\\/ver_tarea\\/37"}', '2017-04-04 16:07:06', '2017-04-03 22:57:11', '2017-04-04 16:07:06'),
('0d7adaa4-14b1-45ee-ad26-e9182dfbe4ed', 'App\\Notifications\\TareaCreada', 9, 'App\\User', '{"id_tarea":78,"nombre":"Andrea","cargo":"Ejecutiva de Cuentas","descripcion":"Andrea cre\\u00f3 la Tarea: Adaptaci\\u00f3n piezas web e intranet  App ","created_at":"2017-04-05 16:44:01","img_perfil":null,"link":"\\/ver_tarea\\/78"}', '2017-04-06 13:19:58', '2017-04-05 21:44:01', '2017-04-06 13:19:58'),
('0e3f6477-e2cc-4218-860b-a01356e45744', 'App\\Notifications\\TareaCreada', 4, 'App\\User', '{"id_tarea":71,"nombre":"Jose","cargo":"Director Creativo","descripcion":"Jose cre\\u00f3 la Tarea: Revisi\\u00f3n de copies parrilla manitoba","created_at":"2017-04-05 14:47:42","img_perfil":"\\/images\\/avatars\\/Jose_4.png","link":"\\/ver_tarea\\/71"}', '2017-04-05 19:47:46', '2017-04-05 19:47:42', '2017-04-05 19:47:46'),
('0e4cebad-8b70-4578-9f80-c1b114320471', 'App\\Notifications\\TareaProgramada', 7, 'App\\User', '{"id_tarea":49,"nombre":"Leonardo","cargo":"Lider de Contenido Escrito","descripcion":"Leonardo ha programado la Tarea: Ajuste de noticia Wapp","created_at":"2017-04-04 14:37:51","img_perfil":"\\/images\\/avatars\\/Leonardo_7.png","link":"\\/ver_tarea\\/49"}', '2017-04-04 19:59:15', '2017-04-04 19:37:51', '2017-04-04 19:59:15'),
('0e5b670a-044b-4181-9dea-1ea282e6cad0', 'App\\Notifications\\OtCreada', 1, 'App\\User', '{"id_tarea":42,"nombre":"Nathalia","cargo":"Account Executive","descripcion":"Nathalia ha creado una OT con referencia: 1114, nombre : Carga de Certificados 10K Semana Santa y valor: $150,000","created_at":"2017-04-06 18:02:59","img_perfil":null,"link":"\\/ots\\/visualizar\\/42"}', '2017-04-09 02:12:45', '2017-04-06 23:02:59', '2017-04-09 02:12:45'),
('0ea69ddf-a991-4490-8e39-11f61ef860fc', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":121,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  cre\\u00f3 la Tarea: Informe pauta hacienda tablones","created_at":"2017-04-07 14:27:27","img_perfil":null,"link":"\\/ver_tarea\\/121"}', NULL, '2017-04-07 19:27:27', '2017-04-07 19:27:27'),
('0f4a4073-cb1b-41c5-b255-3ad1b63f8774', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":173,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  cre\\u00f3 la Tarea: Amplificar post evento primero de mayo","created_at":"2017-04-07 17:26:01","img_perfil":null,"link":"\\/ver_tarea\\/173"}', NULL, '2017-04-07 22:26:01', '2017-04-07 22:26:01'),
('0f627f71-518a-4365-9f36-086467fbfc51', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":26,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  cre\\u00f3 la Tarea: Implementar y optimizar seo Polylon","created_at":"2017-04-03 16:53:10","img_perfil":null,"link":"\\/ver_tarea\\/26"}', NULL, '2017-04-03 21:53:10', '2017-04-03 21:53:10'),
('0ff7a637-55ef-496f-8a1e-3ef504e46eaf', 'App\\Notifications\\TareaCreada', 6, 'App\\User', '{"id_tarea":162,"nombre":"Andrea","cargo":"Ejecutiva de Cuentas","descripcion":"Andrea cre\\u00f3 la Tarea: Renovaci\\u00f3n hosting Unicentro - compra","created_at":"2017-04-07 16:25:16","img_perfil":null,"link":"\\/ver_tarea\\/162"}', NULL, '2017-04-07 21:25:16', '2017-04-07 21:25:16'),
('10545963-154c-429c-b806-9ccf567bafe3', 'App\\Notifications\\TareaCreada', 9, 'App\\User', '{"id_tarea":174,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  cre\\u00f3 la Tarea: Ajustes Parrilla Abril Centro de empleo","created_at":"2017-04-07 17:37:14","img_perfil":null,"link":"\\/ver_tarea\\/174"}', '2017-04-07 22:43:25', '2017-04-07 22:37:14', '2017-04-07 22:43:25'),
('11c9843e-dd50-456c-903c-b5ca5eafa72e', 'App\\Notifications\\TareaRealizada', 6, 'App\\User', '{"id_tarea":76,"nombre":"Luisa Fernanda","cargo":"Development  Leader","descripcion":"Luisa Fernanda ha realizado la Tarea: \\"Realizaci\\u00f3n de Flujos cat\\u00e1logo \\" en 2 Hrs","created_at":"2017-04-06 08:28:06","img_perfil":"\\/images\\/avatars\\/LuisaFernanda_6.png","link":"\\/ver_tarea\\/76"}', '2017-04-06 16:00:14', '2017-04-06 13:28:06', '2017-04-06 16:00:14'),
('1252450d-aaf3-41e4-9c8a-12724e02e4cc', 'App\\Notifications\\TareaProgramada', 15, 'App\\User', '{"id_tarea":113,"nombre":"Nestor","cargo":"SEM Performance Manager","descripcion":"Nestor ha programado la Tarea: Informe Pauta Concierto de la Cuna a la Jungla","created_at":"2017-04-09 21:09:01","img_perfil":"\\/images\\/avatars\\/Nestor_5.png","link":"\\/ver_tarea\\/113"}', NULL, '2017-04-10 02:09:01', '2017-04-10 02:09:01'),
('1264aba2-35e2-4b5d-95d9-b4aefeefead2', 'App\\Notifications\\TareaRealizada', 5, 'App\\User', '{"id_tarea":25,"nombre":"Nestor","cargo":"SEM Performance Manager","descripcion":"Nestor ha realizado la Tarea: \\"Capacitaci\\u00f3n Directivos de Comfandi\\" en 4 Hrs","created_at":"2017-04-03 15:56:46","img_perfil":null,"link":"\\/ver_tarea\\/25"}', '2017-04-03 21:06:13', '2017-04-03 20:56:46', '2017-04-03 21:06:13'),
('12e69f4e-bf18-404d-9b64-688084803ef0', 'App\\Notifications\\TareaRealizada', 9, 'App\\User', '{"id_tarea":33,"nombre":"Andres Fabian","cargo":"Encargado de Dise\\u00f1o","descripcion":"Andres Fabian ha realizado la Tarea: \\"Dise\\u00f1o de Home para tres l\\u00edneas de producto\\" en 28 Hrs","created_at":"2017-04-07 17:35:58","img_perfil":"\\/images\\/avatars\\/AndresFabian_9.png","link":"\\/ver_tarea\\/33"}', '2017-04-07 22:43:25', '2017-04-07 22:35:58', '2017-04-07 22:43:25'),
('12f9ec17-15a9-4660-a8cc-499e8ef1eab0', 'App\\Notifications\\TareaCreada', 6, 'App\\User', '{"id_tarea":87,"nombre":"Andrea","cargo":"Ejecutiva de Cuentas","descripcion":"Andrea cre\\u00f3 la Tarea: Ajuste interna sostenibilidad HV","created_at":"2017-04-05 19:15:55","img_perfil":null,"link":"\\/ver_tarea\\/87"}', '2017-04-06 16:00:14', '2017-04-06 00:15:55', '2017-04-06 16:00:14'),
('139de03a-d84c-4ddc-b837-9fed53081f3e', 'App\\Notifications\\TareaRealizada', 9, 'App\\User', '{"id_tarea":70,"nombre":"Andres Fabian","cargo":"Encargado de Dise\\u00f1o","descripcion":"Andres Fabian ha realizado la Tarea: \\"Reunion ProgreSER\\" en 3.5 Hrs","created_at":"2017-04-05 10:46:43","img_perfil":"\\/images\\/avatars\\/AndresFabian_9.png","link":"\\/ver_tarea\\/70"}', '2017-04-05 19:53:35', '2017-04-05 15:46:43', '2017-04-05 19:53:35'),
('1403fd12-04cb-4e8b-91e4-3bfeeef44700', 'App\\Notifications\\TareaCreada', 4, 'App\\User', '{"id_tarea":107,"nombre":"Jose","cargo":"Director Creativo","descripcion":"Jose cre\\u00f3 la Tarea: Comit\\u00e9 de producci\\u00f3n","created_at":"2017-04-07 06:30:23","img_perfil":"\\/images\\/avatars\\/Jose_4.png","link":"\\/ver_tarea\\/107"}', '2017-04-07 11:30:26', '2017-04-07 11:30:23', '2017-04-07 11:30:26'),
('15f28fa8-3a0d-4e53-a6ad-eea4f069e063', 'App\\Notifications\\TareaEntregada', 9, 'App\\User', '{"id_tarea":70,"nombre":"Andres Fabian","cargo":"Encargado de Dise\\u00f1o","descripcion":"Andres Fabian entreg\\u00f3 la Tarea: Reunion ProgreSER y actualiz\\u00f3 el estado a Entregado","created_at":"2017-04-05 10:46:55","img_perfil":"\\/images\\/avatars\\/AndresFabian_9.png","link":"\\/ver_tarea\\/70"}', '2017-04-05 19:53:35', '2017-04-05 15:46:55', '2017-04-05 19:53:35'),
('16ae2157-9e9f-437e-a6bf-7def97b99479', 'App\\Notifications\\OtCreada', 1, 'App\\User', '{"id_tarea":63,"nombre":"Andrea","cargo":"Ejecutiva de Cuentas","descripcion":"Andrea ha creado una OT con referencia: 1105 -1, nombre : Fee  creaci\\u00f3n de contenidos sitio web e intranet y valor: $3,400,000","created_at":"2017-04-07 18:19:10","img_perfil":null,"link":"\\/ots\\/visualizar\\/63"}', '2017-04-09 02:12:45', '2017-04-07 23:19:10', '2017-04-09 02:12:45'),
('18d9ee8a-90b1-4617-be7a-f25862ab35b4', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":21,"nombre":"Silvia","cargo":"Ejecutiva de cuentas","descripcion":"Silvia cre\\u00f3 la Tarea: Pauta cursos Cali Abril Decoraci\\u00f3n de fiestas tem\\u00e1ticas","created_at":"2017-03-31 22:26:18","img_perfil":null,"link":"\\/ver_tarea\\/21"}', '2017-04-03 19:13:25', '2017-04-01 03:26:18', '2017-04-03 19:13:25'),
('19819066-2fc8-423a-ac81-75c63da22f49', 'App\\Notifications\\OtCreada', 1, 'App\\User', '{"id_tarea":55,"nombre":"Andrea","cargo":"Ejecutiva de Cuentas","descripcion":"Andrea ha creado una OT con referencia: 1121, nombre : Renovaci\\u00f3n Hosting y soporte  y valor: $2,650,000","created_at":"2017-04-07 16:23:02","img_perfil":null,"link":"\\/ots\\/visualizar\\/55"}', '2017-04-09 02:12:45', '2017-04-07 21:23:02', '2017-04-09 02:12:45'),
('19ad7ec1-fe52-4f46-94e0-f5004edb752d', 'App\\Notifications\\TareaProgramada', 5, 'App\\User', '{"id_tarea":69,"nombre":"Nestor","cargo":"SEM Performance Manager","descripcion":"Nestor ha programado la Tarea: Capacitaci\\u00f3n Digital Lyda Comfandi","created_at":"2017-04-09 21:01:32","img_perfil":"\\/images\\/avatars\\/Nestor_5.png","link":"\\/ver_tarea\\/69"}', NULL, '2017-04-10 02:01:32', '2017-04-10 02:01:32'),
('1a4260e3-4a20-4edf-90ef-f2e1c5abcca2', 'App\\Notifications\\TareaProgramada', 7, 'App\\User', '{"id_tarea":34,"nombre":"Leonardo","cargo":"Lider de Contenido Escrito","descripcion":"Leonardo ha programado la Tarea: Pieza Mocoa - Harinera","created_at":"2017-04-04 11:02:57","img_perfil":"\\/images\\/avatars\\/Leonardo_7.png","link":"\\/ver_tarea\\/34"}', '2017-04-04 19:59:15', '2017-04-04 16:02:57', '2017-04-04 19:59:15'),
('1a9c21b6-85e8-4853-acb3-246b8349aa8a', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":133,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  cre\\u00f3 la Tarea: Informe pauta descuento Jhonson\\"s","created_at":"2017-04-07 14:48:03","img_perfil":null,"link":"\\/ver_tarea\\/133"}', NULL, '2017-04-07 19:48:03', '2017-04-07 19:48:03'),
('1abaa621-a253-4c16-9f34-75f08bf8bc4f', 'App\\Notifications\\TareaProgramada', 4, 'App\\User', '{"id_tarea":36,"nombre":"Jose","cargo":"Director Creativo","descripcion":"Jose ha programado la Tarea: Creaci\\u00f3n Contenidos Productos, Tips y Recetas","created_at":"2017-04-03 16:18:09","img_perfil":"\\/images\\/avatars\\/Jose_4.png","link":"\\/ver_tarea\\/36"}', '2017-04-03 21:18:40', '2017-04-03 21:18:09', '2017-04-03 21:18:40'),
('1af37ec2-e810-4716-8c78-a73327a7fdc5', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":20,"nombre":"Silvia","cargo":"Ejecutiva de cuentas","descripcion":"Silvia cre\\u00f3 la Tarea: Pauta cursos Cali Abril Decoraci\\u00f3n y extensi\\u00f3n de u\\u00f1as","created_at":"2017-03-31 22:25:34","img_perfil":null,"link":"\\/ver_tarea\\/20"}', '2017-04-03 19:13:25', '2017-04-01 03:25:34', '2017-04-03 19:13:25'),
('1b9545e7-d763-4405-ae7f-97af4a597401', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":157,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  cre\\u00f3 la Tarea: Informe Paura Rocksito Regionales","created_at":"2017-04-07 16:08:32","img_perfil":null,"link":"\\/ver_tarea\\/157"}', NULL, '2017-04-07 21:08:32', '2017-04-07 21:08:32'),
('1c1c8e8a-504f-440c-8d2c-8c790fffa155', 'App\\Notifications\\OtCreada', 1, 'App\\User', '{"id_tarea":48,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  ha creado una OT con referencia: 1101, nombre : Paura carruseles revistas droguer\\u00edas y valor: $400,000","created_at":"2017-04-07 14:32:55","img_perfil":null,"link":"\\/ots\\/visualizar\\/48"}', '2017-04-09 02:12:45', '2017-04-07 19:32:55', '2017-04-09 02:12:45'),
('1c2996bd-4997-4320-b1c7-4e352cb07cbf', 'App\\Notifications\\TareaCreada', 9, 'App\\User', '{"id_tarea":74,"nombre":"Andrea","cargo":"Ejecutiva de Cuentas","descripcion":"Andrea cre\\u00f3 la Tarea: Icono de play store para el sitio web","created_at":"2017-04-05 16:15:55","img_perfil":null,"link":"\\/ver_tarea\\/74"}', '2017-04-05 21:27:57', '2017-04-05 21:15:55', '2017-04-05 21:27:57'),
('1d132eb1-682e-4f52-9871-271095f487c1', 'App\\Notifications\\TareaProgramada', 16, 'App\\User', '{"id_tarea":30,"nombre":"Leonardo","cargo":"Lider de Contenido Escrito","descripcion":"Leonardo ha programado la Tarea: Art\\u00edculo blog ProgreSER Semana Santa ","created_at":"2017-04-03 15:38:39","img_perfil":"\\/images\\/avatars\\/Leonardo_7.png","link":"\\/ver_tarea\\/30"}', '2017-04-04 20:46:09', '2017-04-03 20:38:39', '2017-04-04 20:46:09'),
('1d6cb9d2-6ee5-4316-873d-a31060114ff4', 'App\\Notifications\\TareaProgramada', 23, 'App\\User', '{"id_tarea":65,"nombre":"Andres Fabian","cargo":"Encargado de Dise\\u00f1o","descripcion":"Andres Fabian ha programado la Tarea: Gr\\u00e1ficos 3 HV","created_at":"2017-04-05 07:47:23","img_perfil":"\\/images\\/avatars\\/AndresFabian_9.png","link":"\\/ver_tarea\\/65"}', '2017-04-05 22:55:10', '2017-04-05 12:47:23', '2017-04-05 22:55:10'),
('1e5e252a-0226-4101-bd94-79fbd68f7c60', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":128,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  cre\\u00f3 la Tarea: amplificar carrusel 4 revista droguer\\u00edas","created_at":"2017-04-07 14:37:33","img_perfil":null,"link":"\\/ver_tarea\\/128"}', NULL, '2017-04-07 19:37:33', '2017-04-07 19:37:33'),
('2078993b-6f26-447c-aa13-6a3ae6559c8f', 'App\\Notifications\\TareaCreada', 7, 'App\\User', '{"id_tarea":29,"nombre":"Andrea","cargo":"Ejecutiva de Cuentas","descripcion":"Andrea cre\\u00f3 la Tarea: Cambiar nombre del seguro de ProgreSER","created_at":"2017-04-03 13:36:26","img_perfil":null,"link":"\\/ver_tarea\\/29"}', '2017-04-03 19:04:20', '2017-04-03 18:36:26', '2017-04-03 19:04:20'),
('20892a18-446f-4e71-855b-095dc96cf4b7', 'App\\Notifications\\TareaProgramada', 15, 'App\\User', '{"id_tarea":133,"nombre":"Nestor","cargo":"SEM Performance Manager","descripcion":"Nestor ha programado la Tarea: Informe pauta descuento Jhonson\\"s","created_at":"2017-04-09 20:26:29","img_perfil":"\\/images\\/avatars\\/Nestor_5.png","link":"\\/ver_tarea\\/133"}', NULL, '2017-04-10 01:26:29', '2017-04-10 01:26:29'),
('208e2c80-b1a7-4fb9-b7e5-043bbc971b8b', 'App\\Notifications\\TareaCreada', 6, 'App\\User', '{"id_tarea":93,"nombre":"Andrea","cargo":"Ejecutiva de Cuentas","descripcion":"Andrea cre\\u00f3 la Tarea: Maquetado mails p\\u00fablico  externo app ProgreSER","created_at":"2017-04-05 23:53:35","img_perfil":null,"link":"\\/ver_tarea\\/93"}', '2017-04-06 16:00:14', '2017-04-06 04:53:35', '2017-04-06 16:00:14'),
('20eed518-85f5-4bc4-8a51-6fbc94f744a4', 'App\\Notifications\\TareaCreada', 7, 'App\\User', '{"id_tarea":103,"nombre":"Andrea","cargo":"Ejecutiva de Cuentas","descripcion":"Andrea cre\\u00f3 la Tarea: Subir contenido sitio web ProgreSER","created_at":"2017-04-06 19:01:38","img_perfil":null,"link":"\\/ver_tarea\\/103"}', '2017-04-10 11:52:21', '2017-04-07 00:01:38', '2017-04-10 11:52:21'),
('218ee028-df20-4e4f-a2a3-003fe424fd44', 'App\\Notifications\\TareaProgramada', 4, 'App\\User', '{"id_tarea":60,"nombre":"Jose","cargo":"Director Creativo","descripcion":"Jose ha programado la Tarea: Cotizaci\\u00f3n AHL Asesores de Seguros","created_at":"2017-04-04 13:30:17","img_perfil":"\\/images\\/avatars\\/Jose_4.png","link":"\\/ver_tarea\\/60"}', '2017-04-04 18:30:24', '2017-04-04 18:30:17', '2017-04-04 18:30:24'),
('21aae625-82e4-4465-aab8-f4d06236d2aa', 'App\\Notifications\\TareaProgramada', 14, 'App\\User', '{"id_tarea":120,"nombre":"Nestor","cargo":"SEM Performance Manager","descripcion":"Nestor ha programado la Tarea: Amplificar Post Lego","created_at":"2017-04-09 21:12:25","img_perfil":"\\/images\\/avatars\\/Nestor_5.png","link":"\\/ver_tarea\\/120"}', NULL, '2017-04-10 02:12:25', '2017-04-10 02:12:25'),
('21f26ff3-41cf-4aed-bf30-4499075693c0', 'App\\Notifications\\TareaProgramada', 25, 'App\\User', '{"id_tarea":53,"nombre":"Andres Fabian","cargo":"Encargado de Dise\\u00f1o","descripcion":"Andres Fabian ha programado la Tarea: Dise\\u00f1o Mailing Abril conferencia empresarial regionales","created_at":"2017-04-04 11:22:28","img_perfil":"\\/images\\/avatars\\/AndresFabian_9.png","link":"\\/ver_tarea\\/53"}', '2017-04-06 13:56:50', '2017-04-04 16:22:28', '2017-04-06 13:56:50'),
('220c08e5-8cd7-46f7-a143-d7d13197ce98', 'App\\Notifications\\ComentarioNuevoTarea', 5, 'App\\User', '{"id_tarea":137,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  ha comentado en la Tarea: Amplificar carrusel 2 cincuentazo -trasnoch\\u00f3n \\"Solicitud repet...\\"","created_at":"2017-04-07 15:08:51","img_perfil":null,"link":"\\/ver_tarea\\/137"}', NULL, '2017-04-07 20:08:51', '2017-04-07 20:08:51'),
('22d69ae3-9c82-42f7-b290-6342043dd009', 'App\\Notifications\\TareaCreada', 6, 'App\\User', '{"id_tarea":179,"nombre":"Andrea","cargo":"Ejecutiva de Cuentas","descripcion":"Andrea cre\\u00f3 la Tarea: Creaci\\u00f3n de contenido administrable ","created_at":"2017-04-07 18:54:40","img_perfil":null,"link":"\\/ver_tarea\\/179"}', NULL, '2017-04-07 23:54:40', '2017-04-07 23:54:40'),
('232f00f6-d18a-4de7-8d8b-8e82af85a348', 'App\\Notifications\\ComentarioNuevoTarea', 5, 'App\\User', '{"id_tarea":138,"nombre":"Maria Isabel","cargo":"Proyect Owner","descripcion":"Maria Isabel ha comentado en la Tarea: Amplificar carrusel 2 cincuentazo -trasnoch\\u00f3n \\"Se pasa a esper...\\"","created_at":"2017-04-07 15:13:53","img_perfil":null,"link":"\\/ver_tarea\\/138"}', NULL, '2017-04-07 20:13:53', '2017-04-07 20:13:53'),
('236c54c2-eeb3-4763-b277-2afccaa5a972', 'App\\Notifications\\OtCreada', 1, 'App\\User', '{"id_tarea":5,"nombre":"Maria Isabel","cargo":"Proyect Owner","descripcion":"Maria Isabel ha creado una OT con referencia: HDA-0417, nombre : Himalaya - Coordinaci\\u00f3n y valor: $100,000","created_at":"2017-04-03 14:50:03","img_perfil":null,"link":"\\/ots\\/visualizar\\/5"}', '2017-04-03 20:23:57', '2017-04-03 19:50:03', '2017-04-03 20:23:57'),
('23f21668-6d62-4afa-bcd3-700e4086c177', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":141,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  cre\\u00f3 la Tarea: Amplificar video parque acu\\u00e1tico","created_at":"2017-04-07 15:25:30","img_perfil":null,"link":"\\/ver_tarea\\/141"}', NULL, '2017-04-07 20:25:30', '2017-04-07 20:25:30'),
('2485ec8f-5a24-41c2-957e-d45cc580b350', 'App\\Notifications\\TareaProgramada', 24, 'App\\User', '{"id_tarea":64,"nombre":"Andres Fabian","cargo":"Encargado de Dise\\u00f1o","descripcion":"Andres Fabian ha programado la Tarea: Dise\\u00f1o de la parrilla ProgreSER ","created_at":"2017-04-05 08:10:41","img_perfil":"\\/images\\/avatars\\/AndresFabian_9.png","link":"\\/ver_tarea\\/64"}', '2017-04-06 12:53:13', '2017-04-05 13:10:41', '2017-04-06 12:53:13'),
('24a2d761-d2e1-4c22-96a3-8d90869ff030', 'App\\Notifications\\TareaCreada', 6, 'App\\User', '{"id_tarea":40,"nombre":"Nathalia","cargo":"Account Executive","descripcion":"Nathalia cre\\u00f3 la Tarea: Informe de soporte mes de marzo de sitio web","created_at":"2017-04-03 16:44:18","img_perfil":null,"link":"\\/ver_tarea\\/40"}', '2017-04-03 22:23:23', '2017-04-03 21:44:18', '2017-04-03 22:23:23'),
('24fbb8ce-2aed-4ed7-b1c1-8082a8315eae', 'App\\Notifications\\TareaCreada', 4, 'App\\User', '{"id_tarea":105,"nombre":"Jose","cargo":"Director Creativo","descripcion":"Jose cre\\u00f3 la Tarea: Reuni\\u00f3n interna equipo Comfandi","created_at":"2017-04-07 06:28:19","img_perfil":"\\/images\\/avatars\\/Jose_4.png","link":"\\/ver_tarea\\/105"}', '2017-04-07 11:28:28', '2017-04-07 11:28:19', '2017-04-07 11:28:28'),
('254ab19b-892d-481d-af98-57f62839e882', 'App\\Notifications\\TareaRealizada', 9, 'App\\User', '{"id_tarea":74,"nombre":"Alejandro","cargo":"Practicante en Dise\\u00f1o Gr\\u00e1fico","descripcion":"Alejandro ha realizado la Tarea: \\"Icono de play store para el sitio web\\" en 0.5 Hrs","created_at":"2017-04-06 08:45:48","img_perfil":null,"link":"\\/ver_tarea\\/74"}', '2017-04-06 14:20:26', '2017-04-06 13:45:48', '2017-04-06 14:20:26'),
('25e6d99d-d00c-4303-b9b2-d6f93ea2228e', 'App\\Notifications\\TareaAtencionCuentas', 2, 'App\\User', '{"id_tarea":111,"nombre":"Nestor","cargo":"SEM Performance Manager","descripcion":"Nestor ha devuelto la Tarea: \\"Resultados Pauta Descuento Pescader\\u00eda\\" a Atenci\\u00f3n Cuentas","created_at":"2017-04-09 20:55:00","img_perfil":"\\/images\\/avatars\\/Nestor_5.png","link":"\\/ver_tarea\\/111"}', NULL, '2017-04-10 01:55:00', '2017-04-10 01:55:00'),
('266cdb1e-a4df-4e27-8d37-f58c2629d0ca', 'App\\Notifications\\TareaProgramada', 4, 'App\\User', '{"id_tarea":66,"nombre":"Jose","cargo":"Director Creativo","descripcion":"Jose ha programado la Tarea: Realizar Flow Pauta Primero de Mayo","created_at":"2017-04-05 06:43:54","img_perfil":"\\/images\\/avatars\\/Jose_4.png","link":"\\/ver_tarea\\/66"}', '2017-04-05 11:44:11', '2017-04-05 11:43:54', '2017-04-05 11:44:11'),
('26e32024-13af-4f8c-928c-aa5c7e6e8d0a', 'App\\Notifications\\TareaCreada', 9, 'App\\User', '{"id_tarea":163,"nombre":"Andrea","cargo":"Ejecutiva de Cuentas","descripcion":"Andrea cre\\u00f3 la Tarea: Dise\\u00f1o pieza blog ProgreSER semana santa ","created_at":"2017-04-07 16:29:51","img_perfil":null,"link":"\\/ver_tarea\\/163"}', '2017-04-07 21:36:07', '2017-04-07 21:29:51', '2017-04-07 21:36:07'),
('2737c5a8-69dc-49e2-a9fa-85d924bd5c4a', 'App\\Notifications\\TareaAtencionArea', 5, 'App\\User', '{"id_tarea":11,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  ha devuelto la Tarea: \\"Pauta Descuento Droguer\\u00edas - Gif que Anuncie descuento este 15 de abril)\\" a Atenci\\u00f3n \\u00c1rea","created_at":"2017-04-04 16:25:12","img_perfil":null,"link":"\\/ver_tarea\\/11"}', NULL, '2017-04-04 21:25:12', '2017-04-04 21:25:12'),
('277c3417-72c2-4677-9632-c5785f6c0665', 'App\\Notifications\\ComentarioNuevoTarea', 5, 'App\\User', '{"id_tarea":15,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  ha comentado en la Tarea: Pauta Descuento Droguer\\u00edas - Pieza HOY 10% de descuento \\"MB: Se ajusto l...\\"","created_at":"2017-04-04 16:56:14","img_perfil":null,"link":"\\/ver_tarea\\/15"}', NULL, '2017-04-04 21:56:14', '2017-04-04 21:56:14'),
('27f68926-2b7c-4068-adec-978b4930616c', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":149,"nombre":"Andrea","cargo":"Ejecutiva de Cuentas","descripcion":"Andrea cre\\u00f3 la Tarea: Env\\u00edo de segundo mail p\\u00fablico interno App ProgreSER","created_at":"2017-04-07 15:47:29","img_perfil":null,"link":"\\/ver_tarea\\/149"}', NULL, '2017-04-07 20:47:29', '2017-04-07 20:47:29'),
('28220903-449e-45e4-a0ea-c7803e3a240a', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":186,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  cre\\u00f3 la Tarea: Amplificar post descuento droguer\\u00eda 20% afiliados","created_at":"2017-04-07 19:13:53","img_perfil":null,"link":"\\/ver_tarea\\/186"}', NULL, '2017-04-08 00:13:53', '2017-04-08 00:13:53'),
('28f0ce3b-656f-4cef-924c-2b8a66e59ca8', 'App\\Notifications\\TareaProgramada', 20, 'App\\User', '{"id_tarea":98,"nombre":"Luisa Fernanda","cargo":"Development  Leader","descripcion":"Luisa Fernanda ha programado la Tarea: Actualizar el formulario de inscripciones para Media Marat\\u00f3n","created_at":"2017-04-06 12:10:28","img_perfil":"\\/images\\/avatars\\/LuisaFernanda_6.png","link":"\\/ver_tarea\\/98"}', '2017-04-06 21:22:27', '2017-04-06 17:10:28', '2017-04-06 21:22:27'),
('296e225c-b168-4d7f-8b90-0e7f1e7b83ec', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":140,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  cre\\u00f3 la Tarea: Informe carruseles cincuentazo","created_at":"2017-04-07 15:11:02","img_perfil":null,"link":"\\/ver_tarea\\/140"}', NULL, '2017-04-07 20:11:02', '2017-04-07 20:11:02'),
('2a5bb855-a40a-42c6-b68a-9748e8494da0', 'App\\Notifications\\OtTiempoExtraAprobado', 22, 'App\\User', '{"id_tarea":25,"nombre":"Maria Isabel","cargo":"Proyect Owner","descripcion":"Maria Isabel ha editado su Orden de trabajo con la referencia #1108-4 con el nombre Soporte Sitio Web ","created_at":"2017-04-03 15:59:12","img_perfil":null,"link":"\\/ots\\/visualizar\\/25"}', '2017-04-03 21:11:49', '2017-04-03 20:59:12', '2017-04-03 21:11:49'),
('2b0fd0e4-1ce3-49f0-b87e-7f4b2ba0febd', 'App\\Notifications\\OtTiempoExtraAprobado', 11, 'App\\User', '{"id_tarea":30,"nombre":"Maria Isabel","cargo":"Proyect Owner","descripcion":"Maria Isabel ha editado su Orden de trabajo con la referencia #0139 con el nombre Cat\\u00e1logo ProgreSER ","created_at":"2017-04-06 09:50:55","img_perfil":null,"link":"\\/ots\\/visualizar\\/30"}', '2017-04-06 16:35:03', '2017-04-06 14:50:55', '2017-04-06 16:35:03'),
('2c7b3fd3-32b0-47b0-a43c-8160959dc36d', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":23,"nombre":"Silvia","cargo":"Ejecutiva de cuentas","descripcion":"Silvia cre\\u00f3 la Tarea: Pauta cursos Cali Abril - Secretariado sistematizado contable","created_at":"2017-03-31 22:30:01","img_perfil":null,"link":"\\/ver_tarea\\/23"}', '2017-04-03 19:13:25', '2017-04-01 03:30:01', '2017-04-03 19:13:25'),
('2c8b33f9-ae6e-405a-a757-8758a3c27195', 'App\\Notifications\\ComentarioNuevoTarea', 15, 'App\\User', '{"id_tarea":28,"nombre":"Nestor","cargo":"SEM Performance Manager","descripcion":"Nestor ha comentado en la Tarea: Implementaci\\u00f3n e  informe de SEO  \\"Esta tarea se d...\\"","created_at":"2017-04-09 20:24:43","img_perfil":"\\/images\\/avatars\\/Nestor_5.png","link":"\\/ver_tarea\\/28"}', NULL, '2017-04-10 01:24:43', '2017-04-10 01:24:43'),
('2c96f74a-a067-468f-a85d-66cae583cacf', 'App\\Notifications\\TareaEntregada', 11, 'App\\User', '{"id_tarea":30,"nombre":"Leonardo","cargo":"Lider de Contenido Escrito","descripcion":"Leonardo entreg\\u00f3 la Tarea: Art\\u00edculo blog ProgreSER Semana Santa  y actualiz\\u00f3 el estado a Entregado","created_at":"2017-04-07 15:14:35","img_perfil":"\\/images\\/avatars\\/Leonardo_7.png","link":"\\/ver_tarea\\/30"}', NULL, '2017-04-07 20:14:35', '2017-04-07 20:14:35'),
('2cffecec-abc8-4213-826a-814b2d4ae420', 'App\\Notifications\\TareaCreada', 9, 'App\\User', '{"id_tarea":72,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  cre\\u00f3 la Tarea: Ajuste Ent\\u00e9rate nueva sede Jamund\\u00ed","created_at":"2017-04-05 15:29:17","img_perfil":null,"link":"\\/ver_tarea\\/72"}', '2017-04-05 20:32:10', '2017-04-05 20:29:17', '2017-04-05 20:32:10'),
('2e2d791d-a3e2-4e2d-8c82-9845a4c056fb', 'App\\Notifications\\TareaAtencionArea', 9, 'App\\User', '{"id_tarea":77,"nombre":"Andrea","cargo":"Ejecutiva de Cuentas","descripcion":"Andrea ha devuelto la Tarea: \\"Adaptaci\\u00f3n de dise\\u00f1o a web e intranet\\" a Atenci\\u00f3n \\u00c1rea","created_at":"2017-04-05 16:41:23","img_perfil":null,"link":"\\/ver_tarea\\/77"}', '2017-04-05 21:41:47', '2017-04-05 21:41:23', '2017-04-05 21:41:47'),
('2e921f39-929d-4818-b6ff-8ee55f607733', 'App\\Notifications\\OtCreada', 1, 'App\\User', '{"id_tarea":33,"nombre":"Nathalia","cargo":"Account Executive","descripcion":"Nathalia ha creado una OT con referencia: 925, nombre : Dise\\u00f1o y desarrollo del Sitio Web y valor: $10,755,000","created_at":"2017-04-05 17:15:40","img_perfil":null,"link":"\\/ots\\/visualizar\\/33"}', '2017-04-05 22:15:54', '2017-04-05 22:15:40', '2017-04-05 22:15:54'),
('30ee4a86-886a-45e6-83a9-bb1b124097c0', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":132,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  cre\\u00f3 la Tarea: Amplificar post Descuento Jhonson\\"s","created_at":"2017-04-07 14:47:04","img_perfil":null,"link":"\\/ver_tarea\\/132"}', NULL, '2017-04-07 19:47:04', '2017-04-07 19:47:04'),
('310e5051-0331-4dcb-85b9-98887f6827eb', 'App\\Notifications\\OtCreada', 1, 'App\\User', '{"id_tarea":20,"nombre":" Maria Andrea","cargo":"New Bussines","descripcion":" Maria Andrea ha creado una OT con referencia: 970, nombre : Implementaci\\u00f3n nuevo sitio web y valor: $17,950,000","created_at":"2017-04-03 15:16:26","img_perfil":null,"link":"\\/ots\\/visualizar\\/20"}', '2017-04-03 22:38:13', '2017-04-03 20:16:26', '2017-04-03 22:38:13'),
('314040fe-b832-4eca-9cbf-52871662940f', 'App\\Notifications\\ComentarioNuevoTarea', 5, 'App\\User', '{"id_tarea":10,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  ha comentado en la Tarea: Pauta Descuento Droguer\\u00edas - Pieza HOY 10% de descuento \\"Esta amplificac...\\"","created_at":"2017-04-04 17:02:55","img_perfil":null,"link":"\\/ver_tarea\\/10"}', NULL, '2017-04-04 22:02:55', '2017-04-04 22:02:55'),
('322c5fbb-bef8-4f84-bde5-492839bb4380', 'App\\Notifications\\TareaEntregada', 11, 'App\\User', '{"id_tarea":74,"nombre":"Andres Fabian","cargo":"Encargado de Dise\\u00f1o","descripcion":"Andres Fabian entreg\\u00f3 la Tarea: Icono de play store para el sitio web y actualiz\\u00f3 el estado a Entregado","created_at":"2017-04-06 08:46:21","img_perfil":"\\/images\\/avatars\\/AndresFabian_9.png","link":"\\/ver_tarea\\/74"}', '2017-04-06 16:35:03', '2017-04-06 13:46:21', '2017-04-06 16:35:03'),
('32472894-736a-457f-b617-f416cfddce06', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":18,"nombre":"Silvia","cargo":"Ejecutiva de cuentas","descripcion":"Silvia cre\\u00f3 la Tarea: Pauta cursos Cali Abril - Preparaci\\u00f3n a base de cafe","created_at":"2017-03-31 22:22:20","img_perfil":null,"link":"\\/ver_tarea\\/18"}', '2017-04-03 19:13:25', '2017-04-01 03:22:20', '2017-04-03 19:13:25'),
('3322af1e-2a38-425d-826c-6d4c2708041d', 'App\\Notifications\\OtCreada', 1, 'App\\User', '{"id_tarea":65,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  ha creado una OT con referencia: 1129, nombre : Pauta Descuento Droguer\\u00edas 20% Afiliados y valor: $400,000","created_at":"2017-04-07 19:09:58","img_perfil":null,"link":"\\/ots\\/visualizar\\/65"}', '2017-04-09 02:12:45', '2017-04-08 00:09:58', '2017-04-09 02:12:45'),
('33bfee6c-6a38-4253-9da1-80e4d5407db0', 'App\\Notifications\\TareaCreada', 6, 'App\\User', '{"id_tarea":51,"nombre":" Maria Andrea","cargo":"New Bussines","descripcion":" Maria Andrea cre\\u00f3 la Tarea: Renovaci\\u00f3n de Hosting y Dominio 2017","created_at":"2017-04-04 09:21:10","img_perfil":null,"link":"\\/ver_tarea\\/51"}', '2017-04-04 16:00:09', '2017-04-04 14:21:10', '2017-04-04 16:00:09'),
('340fd658-07b6-466e-a771-44a5b001ac50', 'App\\Notifications\\TareaCreada', 6, 'App\\User', '{"id_tarea":92,"nombre":"Andrea","cargo":"Ejecutiva de Cuentas","descripcion":"Andrea cre\\u00f3 la Tarea: Medidas App ProgreSER","created_at":"2017-04-05 23:19:01","img_perfil":null,"link":"\\/ver_tarea\\/92"}', '2017-04-06 16:00:14', '2017-04-06 04:19:01', '2017-04-06 16:00:14'),
('342cd439-4b7f-4e41-9d6c-5d90af4dd2a8', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":1,"nombre":"Maria Isabel","cargo":"Proyect Owner","descripcion":"Maria Isabel cre\\u00f3 la Tarea: Pauta Descuento Droguer\\u00edas - Gif d\\u00edas de descuento por iniciar mes ","created_at":"2017-03-31 19:52:50","img_perfil":null,"link":"\\/ver_tarea\\/1"}', '2017-04-03 19:13:25', '2017-04-01 00:52:50', '2017-04-03 19:13:25'),
('344f75c0-7830-47d3-bd8b-6df0006fefb1', 'App\\Notifications\\TareaEntregada', 4, 'App\\User', '{"id_tarea":43,"nombre":"Jose","cargo":"Director Creativo","descripcion":"Jose entreg\\u00f3 la Tarea: Creaci\\u00f3n temas art\\u00edculos Manitoba y actualiz\\u00f3 el estado a Entregado","created_at":"2017-04-03 17:09:58","img_perfil":"\\/images\\/avatars\\/Jose_4.png","link":"\\/ver_tarea\\/43"}', '2017-04-03 22:10:29', '2017-04-03 22:09:58', '2017-04-03 22:10:29'),
('34b85a99-0ad2-4835-aced-2bb3d02d064e', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":11,"nombre":"Silvia","cargo":"Ejecutiva de cuentas","descripcion":"Silvia cre\\u00f3 la Tarea: Pauta Descuento Droguer\\u00edas - Gif que Anuncie descuento este 15 de abril)","created_at":"2017-03-31 21:32:19","img_perfil":null,"link":"\\/ver_tarea\\/11"}', '2017-04-03 19:13:25', '2017-04-01 02:32:19', '2017-04-03 19:13:25'),
('34fa5f47-650e-4e19-aeb9-424d771a6436', 'App\\Notifications\\TareaRealizada', 9, 'App\\User', '{"id_tarea":84,"nombre":"Zuly","cargo":"Dise\\u00f1adora Gr\\u00e1fica","descripcion":"Zuly ha realizado la Tarea: \\"Ajustes infograf\\u00eda Metabolismo activo\\" en 2 Hrs","created_at":"2017-04-06 16:14:47","img_perfil":"\\/images\\/avatars\\/Zuly_23.png","link":"\\/ver_tarea\\/84"}', '2017-04-06 23:53:39', '2017-04-06 21:14:47', '2017-04-06 23:53:39'),
('35444482-187c-475c-9f11-3fee55bc2355', 'App\\Notifications\\ComentarioNuevoTarea', 5, 'App\\User', '{"id_tarea":9,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  ha comentado en la Tarea: Pauta Descuento Droguer\\u00edas - Gif que Anuncie descuento 15 de abril \\"Esta amplificac...\\"","created_at":"2017-04-04 17:01:59","img_perfil":null,"link":"\\/ver_tarea\\/9"}', NULL, '2017-04-04 22:01:59', '2017-04-04 22:01:59'),
('35c490b3-e12d-4d7f-a066-d4ba2bbd7f57', 'App\\Notifications\\TareaProgramada', 25, 'App\\User', '{"id_tarea":72,"nombre":"Andres Fabian","cargo":"Encargado de Dise\\u00f1o","descripcion":"Andres Fabian ha programado la Tarea: Ajuste Ent\\u00e9rate nueva sede Jamund\\u00ed","created_at":"2017-04-05 15:34:49","img_perfil":"\\/images\\/avatars\\/AndresFabian_9.png","link":"\\/ver_tarea\\/72"}', '2017-04-06 13:56:50', '2017-04-05 20:34:49', '2017-04-06 13:56:50'),
('35e3cbc2-1c0b-4f2b-ae9d-ceffd6fb5a0f', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":114,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  cre\\u00f3 la Tarea: Reporte pauta post tennis de campo","created_at":"2017-04-07 08:47:31","img_perfil":null,"link":"\\/ver_tarea\\/114"}', NULL, '2017-04-07 13:47:31', '2017-04-07 13:47:31'),
('363a59c4-3b77-4334-8fe1-c58be50008fc', 'App\\Notifications\\OtCreada', 1, 'App\\User', '{"id_tarea":24,"nombre":"Nathalia","cargo":"Account Executive","descripcion":"Nathalia ha creado una OT con referencia: 1108-3, nombre : Fee SEO Sitio Web y valor: $788,377","created_at":"2017-04-03 15:44:32","img_perfil":null,"link":"\\/ots\\/visualizar\\/24"}', '2017-04-03 22:38:13', '2017-04-03 20:44:32', '2017-04-03 22:38:13'),
('37559a10-391f-4cfd-b9c9-25f45d7021dd', 'App\\Notifications\\OtCreada', 1, 'App\\User', '{"id_tarea":49,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  ha creado una OT con referencia: 1117, nombre : Pauta Descuento Jhonson\\u00a8s y valor: $100,000","created_at":"2017-04-07 14:45:57","img_perfil":null,"link":"\\/ots\\/visualizar\\/49"}', '2017-04-09 02:12:45', '2017-04-07 19:45:57', '2017-04-09 02:12:45'),
('37fbe9fc-c30f-420e-ae47-960c13e101f5', 'App\\Notifications\\TareaAtencionCuentas', 3, 'App\\User', '{"id_tarea":68,"nombre":"Luisa Fernanda","cargo":"Development  Leader","descripcion":"Luisa Fernanda ha devuelto la Tarea: \\"Carga de interactivo 360\\" a Atenci\\u00f3n Cuentas","created_at":"2017-04-06 08:53:41","img_perfil":"\\/images\\/avatars\\/LuisaFernanda_6.png","link":"\\/ver_tarea\\/68"}', '2017-04-06 19:19:45', '2017-04-06 13:53:41', '2017-04-06 19:19:45'),
('387e29ff-b49a-47b4-aa33-28db5444c213', 'App\\Notifications\\OtTiempoExtraAprobado', 2, 'App\\User', '{"id_tarea":15,"nombre":"Maria Isabel","cargo":"Proyect Owner","descripcion":"Maria Isabel ha editado su Orden de trabajo con la referencia #1102-2 con el nombre Fee Vallempresa365 ","created_at":"2017-04-03 16:30:49","img_perfil":null,"link":"\\/ots\\/visualizar\\/15"}', '2017-04-04 16:03:04', '2017-04-03 21:30:49', '2017-04-04 16:03:04'),
('390787b3-36fa-40b0-ac18-15735b350273', 'App\\Notifications\\ComentarioNuevoTarea', 5, 'App\\User', '{"id_tarea":141,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  ha comentado en la Tarea: Amplificar video parque acu\\u00e1tico \\"AJUSTE! Fecha d...\\"","created_at":"2017-04-07 15:28:06","img_perfil":null,"link":"\\/ver_tarea\\/141"}', NULL, '2017-04-07 20:28:06', '2017-04-07 20:28:06'),
('396cf269-a8f5-4f06-83d3-2282c400dbfb', 'App\\Notifications\\TareaProgramada', 25, 'App\\User', '{"id_tarea":90,"nombre":"Andres Fabian","cargo":"Encargado de Dise\\u00f1o","descripcion":"Andres Fabian ha programado la Tarea: Dise\\u00f1o piezas feria de cr\\u00e9dito Honda Dream Neo abril","created_at":"2017-04-06 08:57:52","img_perfil":"\\/images\\/avatars\\/AndresFabian_9.png","link":"\\/ver_tarea\\/90"}', '2017-04-07 14:15:51', '2017-04-06 13:57:52', '2017-04-07 14:15:51'),
('39a15385-fb4b-4bad-8f26-2fd648e76d07', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":136,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  cre\\u00f3 la Tarea: Amplificar carrusel 2 cincuentazo -trasnoch\\u00f3n","created_at":"2017-04-07 15:03:42","img_perfil":null,"link":"\\/ver_tarea\\/136"}', NULL, '2017-04-07 20:03:42', '2017-04-07 20:03:42'),
('39f90862-45e5-4716-b109-6b79d47e3480', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":137,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  cre\\u00f3 la Tarea: Amplificar carrusel 2 cincuentazo -trasnoch\\u00f3n","created_at":"2017-04-07 15:03:43","img_perfil":null,"link":"\\/ver_tarea\\/137"}', NULL, '2017-04-07 20:03:43', '2017-04-07 20:03:43'),
('3a359cd8-f28d-4440-9b0a-c43599a87b13', 'App\\Notifications\\TareaEntregada', 22, 'App\\User', '{"id_tarea":79,"nombre":"Andres Fabian","cargo":"Encargado de Dise\\u00f1o","descripcion":"Andres Fabian entreg\\u00f3 la Tarea: Ajustes en Wireframes y actualiz\\u00f3 el estado a Entregado","created_at":"2017-04-05 18:00:36","img_perfil":"\\/images\\/avatars\\/AndresFabian_9.png","link":"\\/ver_tarea\\/79"}', '2017-04-06 16:55:33', '2017-04-05 23:00:36', '2017-04-06 16:55:33'),
('3a598850-8520-44fe-b2d3-b26c32b9c8df', 'App\\Notifications\\TareaCreada', 6, 'App\\User', '{"id_tarea":67,"nombre":"Andrea","cargo":"Ejecutiva de Cuentas","descripcion":"Andrea cre\\u00f3 la Tarea: Compra espacio Hosting","created_at":"2017-04-04 18:24:43","img_perfil":null,"link":"\\/ver_tarea\\/67"}', '2017-04-05 16:50:17', '2017-04-04 23:24:43', '2017-04-05 16:50:17'),
('3a66bf58-0a44-4b2e-82fc-971abdc2f399', 'App\\Notifications\\TareaCreada', 9, 'App\\User', '{"id_tarea":175,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  cre\\u00f3 la Tarea: Ajuste Parrilla Vallempresa Abril","created_at":"2017-04-07 17:37:50","img_perfil":null,"link":"\\/ver_tarea\\/175"}', '2017-04-07 22:43:25', '2017-04-07 22:37:50', '2017-04-07 22:43:25'),
('3a7d7534-3a7b-4420-b25f-92d8bcb95e5b', 'App\\Notifications\\TareaCreada', 9, 'App\\User', '{"id_tarea":53,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  cre\\u00f3 la Tarea: Dise\\u00f1o Mailing Abril conferencia empresarial regionales","created_at":"2017-04-04 11:10:10","img_perfil":null,"link":"\\/ver_tarea\\/53"}', '2017-04-04 16:10:34', '2017-04-04 16:10:10', '2017-04-04 16:10:34'),
('3a8d692c-0dc4-472e-aebe-f6d3abaad781', 'App\\Notifications\\OtCreada', 1, 'App\\User', '{"id_tarea":51,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  ha creado una OT con referencia: 1118, nombre : Pauta Parque Acu\\u00e1tico y valor: $300,000","created_at":"2017-04-07 15:22:09","img_perfil":null,"link":"\\/ots\\/visualizar\\/51"}', '2017-04-09 02:12:45', '2017-04-07 20:22:09', '2017-04-09 02:12:45'),
('3a92ce0b-347e-43fb-8e8a-4290e0aae717', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":155,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  cre\\u00f3 la Tarea: Amplificar video Rocksito Cartago","created_at":"2017-04-07 16:05:18","img_perfil":null,"link":"\\/ver_tarea\\/155"}', NULL, '2017-04-07 21:05:18', '2017-04-07 21:05:18'),
('3b6f7045-4f1a-4796-8311-206231cae842', 'App\\Notifications\\TareaProgramada', 14, 'App\\User', '{"id_tarea":114,"nombre":"Nestor","cargo":"SEM Performance Manager","descripcion":"Nestor ha programado la Tarea: Reporte pauta post tennis de campo","created_at":"2017-04-09 21:16:13","img_perfil":"\\/images\\/avatars\\/Nestor_5.png","link":"\\/ver_tarea\\/114"}', NULL, '2017-04-10 02:16:13', '2017-04-10 02:16:13'),
('3bc51f34-d26d-40c0-b62d-aefbedddc7cd', 'App\\Notifications\\TareaEntregada', 11, 'App\\User', '{"id_tarea":64,"nombre":"Andres Fabian","cargo":"Encargado de Dise\\u00f1o","descripcion":"Andres Fabian entreg\\u00f3 la Tarea: Dise\\u00f1o de la parrilla ProgreSER  y actualiz\\u00f3 el estado a Entregado","created_at":"2017-04-07 09:56:59","img_perfil":"\\/images\\/avatars\\/AndresFabian_9.png","link":"\\/ver_tarea\\/64"}', NULL, '2017-04-07 14:56:59', '2017-04-07 14:56:59');
INSERT INTO `notifications` (`id`, `type`, `notifiable_id`, `notifiable_type`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('3d2b93d9-29b8-40c6-bae2-6c0128ca7bbe', 'App\\Notifications\\TareaRealizada', 9, 'App\\User', '{"id_tarea":35,"nombre":"Zuly","cargo":"Dise\\u00f1adora Gr\\u00e1fica","descripcion":"Zuly ha realizado la Tarea: \\"Dise\\u00f1o pieza mocoa Harinera del Valle \\" en 1 Hrs","created_at":"2017-04-04 11:02:59","img_perfil":"\\/images\\/avatars\\/Zuly_23.png","link":"\\/ver_tarea\\/35"}', '2017-04-04 16:07:06', '2017-04-04 16:02:59', '2017-04-04 16:07:06'),
('3d492a3c-a92b-4ff0-ae3f-710c196aeafd', 'App\\Notifications\\OtTiempoExtraAprobado', 11, 'App\\User', '{"id_tarea":39,"nombre":"Maria Isabel","cargo":"Proyect Owner","descripcion":"Maria Isabel ha editado su Orden de trabajo con la referencia #0961 con el nombre Sitio web desarrollo ","created_at":"2017-04-06 12:15:56","img_perfil":null,"link":"\\/ots\\/visualizar\\/39"}', '2017-04-06 23:33:05', '2017-04-06 17:15:56', '2017-04-06 23:33:05'),
('3d8c6c98-dba0-4918-ac5a-df5bd0f80b3f', 'App\\Notifications\\OtCreada', 1, 'App\\User', '{"id_tarea":39,"nombre":"Andrea","cargo":"Ejecutiva de Cuentas","descripcion":"Andrea ha creado una OT con referencia: 0961, nombre : Sitio web desarrollo y valor: $11,180,344","created_at":"2017-04-06 12:02:54","img_perfil":null,"link":"\\/ots\\/visualizar\\/39"}', '2017-04-09 02:12:45', '2017-04-06 17:02:54', '2017-04-09 02:12:45'),
('3e1f46a7-116c-41de-a3b3-8fd185d91d6c', 'App\\Notifications\\TareaAtencionArea', 4, 'App\\User', '{"id_tarea":66,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  ha devuelto la Tarea: \\"Realizar Flow Pauta Primero de Mayo\\" a Atenci\\u00f3n \\u00c1rea","created_at":"2017-04-06 14:18:05","img_perfil":null,"link":"\\/ver_tarea\\/66"}', '2017-04-07 11:17:42', '2017-04-06 19:18:05', '2017-04-07 11:17:42'),
('3f3c90fa-072d-4f65-9092-16f7955c3f4a', 'App\\Notifications\\TareaCreada', 6, 'App\\User', '{"id_tarea":41,"nombre":"Nathalia","cargo":"Account Executive","descripcion":"Nathalia cre\\u00f3 la Tarea: Revisi\\u00f3n imagen historia","created_at":"2017-04-03 16:46:18","img_perfil":null,"link":"\\/ver_tarea\\/41"}', '2017-04-03 22:23:23', '2017-04-03 21:46:18', '2017-04-03 22:23:23'),
('3ff5232c-860d-4b79-a38c-8df2a1a7d471', 'App\\Notifications\\OtCreada', 1, 'App\\User', '{"id_tarea":10,"nombre":" Maria Andrea","cargo":"New Bussines","descripcion":" Maria Andrea ha creado una OT con referencia: 1107, nombre : Renovaci\\u00f3n Host, Soporte al Host y SSL 2017 y valor: $2,820,000","created_at":"2017-04-03 14:15:51","img_perfil":null,"link":"\\/ots\\/visualizar\\/10"}', '2017-04-03 22:38:13', '2017-04-03 19:15:51', '2017-04-03 22:38:13'),
('4062d34f-872f-4015-b4e3-7e14eec1d9d8', 'App\\Notifications\\TareaRealizada', 9, 'App\\User', '{"id_tarea":78,"nombre":"Zuly","cargo":"Dise\\u00f1adora Gr\\u00e1fica","descripcion":"Zuly ha realizado la Tarea: \\"Adaptaci\\u00f3n piezas web e intranet  App \\" en 1 Hrs","created_at":"2017-04-05 17:54:58","img_perfil":"\\/images\\/avatars\\/Zuly_23.png","link":"\\/ver_tarea\\/78"}', '2017-04-06 13:19:58', '2017-04-05 22:54:58', '2017-04-06 13:19:58'),
('40826d2b-02c8-4cb9-a836-40a340c4c88b', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":111,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  cre\\u00f3 la Tarea: Resultados Pauta Descuento Pescader\\u00eda","created_at":"2017-04-07 07:53:33","img_perfil":null,"link":"\\/ver_tarea\\/111"}', NULL, '2017-04-07 12:53:33', '2017-04-07 12:53:33'),
('40e9b62a-4511-4dea-99f9-84cdf0b42878', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":99,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  cre\\u00f3 la Tarea: Informe Pauta invierte en tus sue\\u00f1os","created_at":"2017-04-06 14:22:25","img_perfil":null,"link":"\\/ver_tarea\\/99"}', NULL, '2017-04-06 19:22:25', '2017-04-06 19:22:25'),
('41058bab-4204-4750-8cfd-2396772ca70e', 'App\\Notifications\\TareaCreada', 9, 'App\\User', '{"id_tarea":54,"nombre":" Maria Andrea","cargo":"New Bussines","descripcion":" Maria Andrea cre\\u00f3 la Tarea: Adaptaci\\u00f3n del dise\\u00f1o del Home para 2 l\\u00edneas de producto","created_at":"2017-04-04 11:29:31","img_perfil":null,"link":"\\/ver_tarea\\/54"}', '2017-04-04 16:29:39', '2017-04-04 16:29:31', '2017-04-04 16:29:39'),
('411d1fab-0065-4db8-8c7d-98eb8fdb0663', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":152,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  cre\\u00f3 la Tarea: Amplificar video Buga - Rocksito","created_at":"2017-04-07 15:59:11","img_perfil":null,"link":"\\/ver_tarea\\/152"}', NULL, '2017-04-07 20:59:11', '2017-04-07 20:59:11'),
('41665ec2-b4f9-446c-b7f1-0d8ce3eb10b2', 'App\\Notifications\\TareaCreada', 7, 'App\\User', '{"id_tarea":34,"nombre":"Nathalia","cargo":"Account Executive","descripcion":"Nathalia cre\\u00f3 la Tarea: Pieza Mocoa - Harinera","created_at":"2017-04-03 15:55:01","img_perfil":null,"link":"\\/ver_tarea\\/34"}', '2017-04-03 21:33:32', '2017-04-03 20:55:01', '2017-04-03 21:33:32'),
('41c77d23-e91f-4423-b4a9-fe7b4916b666', 'App\\Notifications\\TareaCreada', 9, 'App\\User', '{"id_tarea":134,"nombre":"Andrea","cargo":"Ejecutiva de Cuentas","descripcion":"Andrea cre\\u00f3 la Tarea: Dise\\u00f1o de piezas pauta","created_at":"2017-04-07 15:01:56","img_perfil":null,"link":"\\/ver_tarea\\/134"}', '2017-04-07 20:35:52', '2017-04-07 20:01:56', '2017-04-07 20:35:52'),
('440bffea-6f36-40c4-83b8-8f55c57bf66d', 'App\\Notifications\\TareaCreada', 7, 'App\\User', '{"id_tarea":91,"nombre":"Andrea","cargo":"Ejecutiva de Cuentas","descripcion":"Andrea cre\\u00f3 la Tarea: Subir circular de ventas Feria promoci\\u00f3n Honda Dream Neo","created_at":"2017-04-05 23:15:49","img_perfil":null,"link":"\\/ver_tarea\\/91"}', '2017-04-06 12:44:59', '2017-04-06 04:15:49', '2017-04-06 12:44:59'),
('4493b0a4-436c-46ab-bb93-2c0a9d71a3ec', 'App\\Notifications\\TareaRealizada', 7, 'App\\User', '{"id_tarea":103,"nombre":"Alexandra","cargo":"Practicante en Contenidos - CM","descripcion":"Alexandra ha realizado la Tarea: \\"Subir contenido sitio web ProgreSER\\" en 1 Hrs","created_at":"2017-04-07 15:33:01","img_perfil":null,"link":"\\/ver_tarea\\/103"}', '2017-04-10 11:52:21', '2017-04-07 20:33:01', '2017-04-10 11:52:21'),
('452fe3f8-812c-492d-8a0f-8e1133cc1502', 'App\\Notifications\\TareaRealizada', 7, 'App\\User', '{"id_tarea":88,"nombre":"Alexandra","cargo":"Practicante en Contenidos - CM","descripcion":"Alexandra ha realizado la Tarea: \\"T\\u00e9rminos y condiciones actividad app ProgreSER redes\\" en 1.00 Hrs","created_at":"2017-04-06 17:43:48","img_perfil":null,"link":"\\/ver_tarea\\/88"}', '2017-04-10 11:52:21', '2017-04-06 22:43:48', '2017-04-10 11:52:21'),
('467a73f2-7552-493d-b3d7-6d96aeeb5ef4', 'App\\Notifications\\TareaCreada', 9, 'App\\User', '{"id_tarea":70,"nombre":"Andres Fabian","cargo":"Encargado de Dise\\u00f1o","descripcion":"Andres Fabian cre\\u00f3 la Tarea: Reunion ProgreSER","created_at":"2017-04-05 10:33:17","img_perfil":"\\/images\\/avatars\\/AndresFabian_9.png","link":"\\/ver_tarea\\/70"}', '2017-04-05 19:53:35', '2017-04-05 15:33:17', '2017-04-05 19:53:35'),
('47b9e339-2c95-41c7-a8e5-f8e19be94f81', 'App\\Notifications\\TareaCreada', 6, 'App\\User', '{"id_tarea":59,"nombre":" Maria Andrea","cargo":"New Bussines","descripcion":" Maria Andrea cre\\u00f3 la Tarea: Desarrollo y maquetado del 50% del sitio en WordPress","created_at":"2017-04-04 11:52:59","img_perfil":null,"link":"\\/ver_tarea\\/59"}', '2017-04-04 19:35:06', '2017-04-04 16:52:59', '2017-04-04 19:35:06'),
('49134c72-466b-4cac-b2f3-cd34c4e8c69b', 'App\\Notifications\\ComentarioNuevoTarea', 7, 'App\\User', '{"id_tarea":91,"nombre":"Andrea","cargo":"Ejecutiva de Cuentas","descripcion":"Andrea ha comentado en la Tarea: Subir circular de ventas Feria promoci\\u00f3n Honda Dream Neo \\"Estos son las c...\\"","created_at":"2017-04-06 08:25:26","img_perfil":null,"link":"\\/ver_tarea\\/91"}', '2017-04-06 14:51:08', '2017-04-06 13:25:26', '2017-04-06 14:51:08'),
('4950f62b-7cf6-447e-bee6-f63f3edac8f9', 'App\\Notifications\\TareaCreada', 9, 'App\\User', '{"id_tarea":37,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  cre\\u00f3 la Tarea: Graficar Vacantes y convocatorias Agencias Empleo","created_at":"2017-04-03 16:31:04","img_perfil":null,"link":"\\/ver_tarea\\/37"}', '2017-04-03 22:25:36', '2017-04-03 21:31:04', '2017-04-03 22:25:36'),
('4a215c10-ea86-4b60-ba92-dcc1f4b20fe0', 'App\\Notifications\\OtCreada', 1, 'App\\User', '{"id_tarea":59,"nombre":"Andrea","cargo":"Ejecutiva de Cuentas","descripcion":"Andrea ha creado una OT con referencia: 1115-1, nombre : Fee Administraci\\u00f3n redes sociales abril  y valor: $10,990,000","created_at":"2017-04-07 17:13:53","img_perfil":null,"link":"\\/ots\\/visualizar\\/59"}', '2017-04-09 02:12:45', '2017-04-07 22:13:53', '2017-04-09 02:12:45'),
('4aabcb14-af4c-4e4b-8dc1-478309f2a44f', 'App\\Notifications\\TareaRealizada', 7, 'App\\User', '{"id_tarea":31,"nombre":"Alexandra","cargo":"Practicante en Contenidos - CM","descripcion":"Alexandra ha realizado la Tarea: \\"Notas app ProgreSER\\" en 4 Hrs","created_at":"2017-04-06 09:14:36","img_perfil":null,"link":"\\/ver_tarea\\/31"}', '2017-04-06 14:51:08', '2017-04-06 14:14:36', '2017-04-06 14:51:08'),
('4b39bab9-a18a-4703-a538-b60adc44af33', 'App\\Notifications\\OtCreada', 1, 'App\\User', '{"id_tarea":61,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  ha creado una OT con referencia: 1125, nombre : Pauta Primero de Mayo y valor: $2,500,000","created_at":"2017-04-07 17:23:44","img_perfil":null,"link":"\\/ots\\/visualizar\\/61"}', '2017-04-09 02:12:45', '2017-04-07 22:23:44', '2017-04-09 02:12:45'),
('4bca30cf-dab1-4752-8bd3-db4c6c82439f', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":167,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  cre\\u00f3 la Tarea: Pauta 2 mes del ni\\u00f1o ","created_at":"2017-04-07 16:39:51","img_perfil":null,"link":"\\/ver_tarea\\/167"}', NULL, '2017-04-07 21:39:51', '2017-04-07 21:39:51'),
('4d3f7dd5-06bd-450b-bc6f-717ea4111160', 'App\\Notifications\\TareaCreada', 4, 'App\\User', '{"id_tarea":108,"nombre":"Jose","cargo":"Director Creativo","descripcion":"Jose cre\\u00f3 la Tarea: Presentaci\\u00f3n estrategia Christus Health","created_at":"2017-04-07 06:31:46","img_perfil":"\\/images\\/avatars\\/Jose_4.png","link":"\\/ver_tarea\\/108"}', '2017-04-07 11:31:50', '2017-04-07 11:31:46', '2017-04-07 11:31:50'),
('4ef50c18-ab7c-4cee-a440-fa85216c137f', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":24,"nombre":"Silvia","cargo":"Ejecutiva de cuentas","descripcion":"Silvia cre\\u00f3 la Tarea: Pauta cursos Cali Abril - Cocina mexicana","created_at":"2017-03-31 22:30:48","img_perfil":null,"link":"\\/ver_tarea\\/24"}', '2017-04-03 19:13:25', '2017-04-01 03:30:48', '2017-04-03 19:13:25'),
('4ef9dcd5-db2f-4923-a2bd-ecff7372959e', 'App\\Notifications\\OtCreada', 1, 'App\\User', '{"id_tarea":27,"nombre":" Maria Andrea","cargo":"New Bussines","descripcion":" Maria Andrea ha creado una OT con referencia: 1110, nombre : Renovaci\\u00f3n Hosting, Dominio y Soporte  y valor: $1,420,000","created_at":"2017-04-04 08:40:25","img_perfil":null,"link":"\\/ots\\/visualizar\\/27"}', '2017-04-04 13:40:42', '2017-04-04 13:40:25', '2017-04-04 13:40:42'),
('4efa1763-2b17-4e73-9478-a761b6c4b085', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":120,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  cre\\u00f3 la Tarea: Amplificar Post Lego","created_at":"2017-04-07 14:24:07","img_perfil":null,"link":"\\/ver_tarea\\/120"}', NULL, '2017-04-07 19:24:07', '2017-04-07 19:24:07'),
('4fb3c1c3-97b3-4d51-b90a-9df34d2c130a', 'App\\Notifications\\TareaProgramada', 14, 'App\\User', '{"id_tarea":189,"nombre":"Nestor","cargo":"SEM Performance Manager","descripcion":"Nestor ha programado la Tarea: Amplificar post hoy descuento 20% afiliados","created_at":"2017-04-09 20:16:06","img_perfil":"\\/images\\/avatars\\/Nestor_5.png","link":"\\/ver_tarea\\/189"}', NULL, '2017-04-10 01:16:06', '2017-04-10 01:16:06'),
('502343da-6e0f-4d59-ba49-c1942355fac5', 'App\\Notifications\\ComentarioNuevoTarea', 25, 'App\\User', '{"id_tarea":90,"nombre":"Andres Fabian","cargo":"Encargado de Dise\\u00f1o","descripcion":"Andres Fabian ha comentado en la Tarea: Dise\\u00f1o piezas feria de cr\\u00e9dito Honda Dream Neo abril \\"Esta tarea sigu...\\"","created_at":"2017-04-06 14:38:21","img_perfil":"\\/images\\/avatars\\/AndresFabian_9.png","link":"\\/ver_tarea\\/90"}', '2017-04-07 14:15:51', '2017-04-06 19:38:21', '2017-04-07 14:15:51'),
('502ae11f-fb28-437f-97be-449a7996e9f5', 'App\\Notifications\\TareaCreada', 4, 'App\\User', '{"id_tarea":60,"nombre":"Jose","cargo":"Director Creativo","descripcion":"Jose cre\\u00f3 la Tarea: Cotizaci\\u00f3n AHL Asesores de Seguros","created_at":"2017-04-04 13:29:00","img_perfil":"\\/images\\/avatars\\/Jose_4.png","link":"\\/ver_tarea\\/60"}', '2017-04-04 18:30:24', '2017-04-04 18:29:00', '2017-04-04 18:30:24'),
('516bfc44-6e69-4049-b69e-06477ab507d7', 'App\\Notifications\\TareaProgramada', 7, 'App\\User', '{"id_tarea":83,"nombre":"Leonardo","cargo":"Lider de Contenido Escrito","descripcion":"Leonardo ha programado la Tarea: Cargar t\\u00e9rminos y condiciones del concurso","created_at":"2017-04-06 07:44:20","img_perfil":"\\/images\\/avatars\\/Leonardo_7.png","link":"\\/ver_tarea\\/83"}', '2017-04-06 12:44:59', '2017-04-06 12:44:20', '2017-04-06 12:44:59'),
('5268b1e2-e735-44ab-bc31-4d7740207acd', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":135,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  cre\\u00f3 la Tarea: Amplificar carrusel 1 cincuentazo","created_at":"2017-04-07 15:02:09","img_perfil":null,"link":"\\/ver_tarea\\/135"}', NULL, '2017-04-07 20:02:09', '2017-04-07 20:02:09'),
('52d19393-0ebd-458f-a0bc-3cdcf401557d', 'App\\Notifications\\TareaRealizada', 5, 'App\\User', '{"id_tarea":25,"nombre":"Nestor","cargo":"SEM Performance Manager","descripcion":"Nestor ha realizado la Tarea: \\"Capacitaci\\u00f3n Directivos de Comfandi\\" en 28 Hrs","created_at":"2017-04-03 15:58:37","img_perfil":null,"link":"\\/ver_tarea\\/25"}', '2017-04-03 21:06:13', '2017-04-03 20:58:37', '2017-04-03 21:06:13'),
('53d3e5de-41a5-4bb5-846b-50588363debe', 'App\\Notifications\\TareaProgramada', 16, 'App\\User', '{"id_tarea":89,"nombre":"Leonardo","cargo":"Lider de Contenido Escrito","descripcion":"Leonardo ha programado la Tarea: Noticia sobre Feria cr\\u00e9dito Dream Neo web e intranet","created_at":"2017-04-07 15:40:18","img_perfil":"\\/images\\/avatars\\/Leonardo_7.png","link":"\\/ver_tarea\\/89"}', NULL, '2017-04-07 20:40:18', '2017-04-07 20:40:18'),
('540af1c8-6bc7-4667-8f95-d31e47271de9', 'App\\Notifications\\TareaCreada', 6, 'App\\User', '{"id_tarea":118,"nombre":" Maria Andrea","cargo":"New Bussines","descripcion":" Maria Andrea cre\\u00f3 la Tarea: Revisi\\u00f3n de correo","created_at":"2017-04-07 14:12:05","img_perfil":null,"link":"\\/ver_tarea\\/118"}', '2017-04-07 19:15:14', '2017-04-07 19:12:05', '2017-04-07 19:15:14'),
('54edbcf9-7150-4f9f-a375-9e2314271f6b', 'App\\Notifications\\TareaProgramada', 14, 'App\\User', '{"id_tarea":128,"nombre":"Nestor","cargo":"SEM Performance Manager","descripcion":"Nestor ha programado la Tarea: amplificar carrusel 4 revista droguer\\u00edas","created_at":"2017-04-09 20:34:34","img_perfil":"\\/images\\/avatars\\/Nestor_5.png","link":"\\/ver_tarea\\/128"}', NULL, '2017-04-10 01:34:34', '2017-04-10 01:34:34'),
('55171a4b-fe33-4b82-9f3d-f077fc2c0d20', 'App\\Notifications\\TareaAtencionCuentas', 2, 'App\\User', '{"id_tarea":137,"nombre":"Nestor","cargo":"SEM Performance Manager","descripcion":"Nestor ha devuelto la Tarea: \\"Amplificar carrusel 2 cincuentazo -trasnoch\\u00f3n\\" a Atenci\\u00f3n Cuentas","created_at":"2017-04-09 20:49:20","img_perfil":"\\/images\\/avatars\\/Nestor_5.png","link":"\\/ver_tarea\\/137"}', NULL, '2017-04-10 01:49:20', '2017-04-10 01:49:20'),
('5517a816-b01b-4c16-9715-8c1d10a2c7d0', 'App\\Notifications\\TareaEntregada', 22, 'App\\User', '{"id_tarea":45,"nombre":"Andres Fabian","cargo":"Encargado de Dise\\u00f1o","descripcion":"Andres Fabian entreg\\u00f3 la Tarea: Revisi\\u00f3n video 3 HV off line y actualiz\\u00f3 el estado a Entregado","created_at":"2017-04-07 17:40:52","img_perfil":"\\/images\\/avatars\\/AndresFabian_9.png","link":"\\/ver_tarea\\/45"}', NULL, '2017-04-07 22:40:52', '2017-04-07 22:40:52'),
('56021b7a-ff58-4794-b3f8-37f0db2b1c57', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":69,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  cre\\u00f3 la Tarea: Capacitaci\\u00f3n Digital Lyda Comfandi","created_at":"2017-04-05 08:56:52","img_perfil":null,"link":"\\/ver_tarea\\/69"}', NULL, '2017-04-05 13:56:52', '2017-04-05 13:56:52'),
('565e320e-8e2c-4e8d-8ffe-9ef227abfbf6', 'App\\Notifications\\TareaProgramada', 14, 'App\\User', '{"id_tarea":126,"nombre":"Nestor","cargo":"SEM Performance Manager","descripcion":"Nestor ha programado la Tarea: amplificar carrusel 3 revista droguer\\u00edas","created_at":"2017-04-09 20:50:58","img_perfil":"\\/images\\/avatars\\/Nestor_5.png","link":"\\/ver_tarea\\/126"}', NULL, '2017-04-10 01:50:58', '2017-04-10 01:50:58'),
('56850f17-e750-4b55-a36c-1e1f4348efff', 'App\\Notifications\\TareaCreada', 9, 'App\\User', '{"id_tarea":117,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  cre\\u00f3 la Tarea: Piezas emailing conferencias mayo","created_at":"2017-04-07 14:04:54","img_perfil":null,"link":"\\/ver_tarea\\/117"}', '2017-04-07 20:35:52', '2017-04-07 19:04:54', '2017-04-07 20:35:52'),
('56f58e2e-3d99-4b75-8f7d-c7b72d396b07', 'App\\Notifications\\TareaCreada', 9, 'App\\User', '{"id_tarea":183,"nombre":"Andrea","cargo":"Ejecutiva de Cuentas","descripcion":"Andrea cre\\u00f3 la Tarea: Ajuste dise\\u00f1o interfaces GEV","created_at":"2017-04-07 19:07:43","img_perfil":null,"link":"\\/ver_tarea\\/183"}', NULL, '2017-04-08 00:07:43', '2017-04-08 00:07:43'),
('5813c201-215e-414f-8a1f-e2c312020314', 'App\\Notifications\\TareaCreada', 6, 'App\\User', '{"id_tarea":181,"nombre":"Andrea","cargo":"Ejecutiva de Cuentas","descripcion":"Andrea cre\\u00f3 la Tarea: Maquetado de internas ","created_at":"2017-04-07 18:58:36","img_perfil":null,"link":"\\/ver_tarea\\/181"}', NULL, '2017-04-07 23:58:36', '2017-04-07 23:58:36'),
('586d0129-6e64-4a8e-b29b-9f13cd850cd0', 'App\\Notifications\\OtCreada', 1, 'App\\User', '{"id_tarea":4,"nombre":"Silvia","cargo":"Ejecutiva de cuentas","descripcion":"Silvia ha creado una OT con referencia: 1094, nombre : Pauta Cursos Abril y valor: $1,850,000","created_at":"2017-03-31 22:01:41","img_perfil":null,"link":"\\/ots\\/visualizar\\/4"}', '2017-04-02 08:08:00', '2017-04-01 03:01:41', '2017-04-02 08:08:00'),
('5876f891-f9c2-4c81-a57e-20053706e4ac', 'App\\Notifications\\OtCreada', 1, 'App\\User', '{"id_tarea":43,"nombre":"Andrea","cargo":"Ejecutiva de Cuentas","descripcion":"Andrea ha creado una OT con referencia: 1092, nombre : Creaci\\u00f3n cuentas  de correo y valor: $690,000","created_at":"2017-04-06 18:36:17","img_perfil":null,"link":"\\/ots\\/visualizar\\/43"}', '2017-04-09 02:12:45', '2017-04-06 23:36:17', '2017-04-09 02:12:45'),
('59f2278c-2186-425a-b6b6-4f21b2562a13', 'App\\Notifications\\TareaEntregada', 3, 'App\\User', '{"id_tarea":33,"nombre":"Andres Fabian","cargo":"Encargado de Dise\\u00f1o","descripcion":"Andres Fabian entreg\\u00f3 la Tarea: Dise\\u00f1o de Home para tres l\\u00edneas de producto y actualiz\\u00f3 el estado a Entregado","created_at":"2017-04-07 17:36:27","img_perfil":"\\/images\\/avatars\\/AndresFabian_9.png","link":"\\/ver_tarea\\/33"}', NULL, '2017-04-07 22:36:27', '2017-04-07 22:36:27'),
('5a213d39-66e0-43c7-9046-5ec975cbb812', 'App\\Notifications\\TareaRealizada', 7, 'App\\User', '{"id_tarea":44,"nombre":"Alexandra","cargo":"Practicante en Contenidos - CM","descripcion":"Alexandra ha realizado la Tarea: \\"Cambio en la promoci\\u00f3n de ProgreSER y Hero \\" en 1.00 Hrs","created_at":"2017-04-04 15:32:37","img_perfil":null,"link":"\\/ver_tarea\\/44"}', '2017-04-04 20:33:02', '2017-04-04 20:32:37', '2017-04-04 20:33:02'),
('5a3a80f8-e520-4c15-a15b-687ccafd7532', 'App\\Notifications\\TareaProgramada', 15, 'App\\User', '{"id_tarea":99,"nombre":"Nestor","cargo":"SEM Performance Manager","descripcion":"Nestor ha programado la Tarea: Informe Pauta invierte en tus sue\\u00f1os","created_at":"2017-04-09 20:56:29","img_perfil":"\\/images\\/avatars\\/Nestor_5.png","link":"\\/ver_tarea\\/99"}', NULL, '2017-04-10 01:56:29', '2017-04-10 01:56:29'),
('5a6c62a2-88eb-4b34-b690-251819b4e85a', 'App\\Notifications\\TareaAtencionCuentas', 2, 'App\\User', '{"id_tarea":66,"nombre":"Jose","cargo":"Director Creativo","descripcion":"Jose ha devuelto la Tarea: \\"Realizar Flow Pauta Primero de Mayo\\" a Atenci\\u00f3n Cuentas","created_at":"2017-04-05 06:49:14","img_perfil":"\\/images\\/avatars\\/Jose_4.png","link":"\\/ver_tarea\\/66"}', '2017-04-06 19:15:10', '2017-04-05 11:49:14', '2017-04-06 19:15:10'),
('5a7900ad-634b-4fd2-9a35-b685682c100f', 'App\\Notifications\\TareaProgramada', 14, 'App\\User', '{"id_tarea":136,"nombre":"Nestor","cargo":"SEM Performance Manager","descripcion":"Nestor ha programado la Tarea: Amplificar carrusel 2 cincuentazo -trasnoch\\u00f3n","created_at":"2017-04-09 20:39:28","img_perfil":"\\/images\\/avatars\\/Nestor_5.png","link":"\\/ver_tarea\\/136"}', NULL, '2017-04-10 01:39:28', '2017-04-10 01:39:28'),
('5b333d32-0f78-4609-b6fe-4ba3556c402d', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":142,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  cre\\u00f3 la Tarea: Informe Pauta Parque Acu\\u00e1tico","created_at":"2017-04-07 15:29:36","img_perfil":null,"link":"\\/ver_tarea\\/142"}', NULL, '2017-04-07 20:29:36', '2017-04-07 20:29:36'),
('5c6e8aa3-0864-40ac-ae19-d8bf517165a4', 'App\\Notifications\\TareaProgramada', 23, 'App\\User', '{"id_tarea":37,"nombre":"Andres Fabian","cargo":"Encargado de Dise\\u00f1o","descripcion":"Andres Fabian ha programado la Tarea: Graficar Vacantes y convocatorias Agencias Empleo","created_at":"2017-04-03 16:58:15","img_perfil":null,"link":"\\/ver_tarea\\/37"}', '2017-04-03 21:58:53', '2017-04-03 21:58:15', '2017-04-03 21:58:53'),
('5dd254a5-0fe1-4581-9af2-ff609f969b80', 'App\\Notifications\\TareaCreada', 9, 'App\\User', '{"id_tarea":63,"nombre":" Maria Andrea","cargo":"New Bussines","descripcion":" Maria Andrea cre\\u00f3 la Tarea: Dise\\u00f1o Responsive de Interfaces","created_at":"2017-04-04 14:04:56","img_perfil":null,"link":"\\/ver_tarea\\/63"}', '2017-04-04 19:05:01', '2017-04-04 19:04:56', '2017-04-04 19:05:01'),
('5de0db65-76e8-4571-9b27-dd417ac8933c', 'App\\Notifications\\TareaProgramada', 23, 'App\\User', '{"id_tarea":78,"nombre":"Andres Fabian","cargo":"Encargado de Dise\\u00f1o","descripcion":"Andres Fabian ha programado la Tarea: Adaptaci\\u00f3n piezas web e intranet  App ","created_at":"2017-04-05 16:59:20","img_perfil":"\\/images\\/avatars\\/AndresFabian_9.png","link":"\\/ver_tarea\\/78"}', '2017-04-05 22:55:10', '2017-04-05 21:59:20', '2017-04-05 22:55:10'),
('5eed42b8-154e-4cc7-8a7d-fd1240b5221d', 'App\\Notifications\\TareaEntregada', 22, 'App\\User', '{"id_tarea":38,"nombre":"Luisa Fernanda","cargo":"Development  Leader","descripcion":"Luisa Fernanda entreg\\u00f3 la Tarea: Ajuste bot\\u00f3n de Proveedores y actualiz\\u00f3 el estado a Entregado","created_at":"2017-04-04 17:41:18","img_perfil":"\\/images\\/avatars\\/LuisaFernanda_6.png","link":"\\/ver_tarea\\/38"}', '2017-04-05 22:38:24', '2017-04-04 22:41:18', '2017-04-05 22:38:24'),
('60137a1c-931c-42ce-a468-a5f5065457cb', 'App\\Notifications\\TareaAtencionCuentas', 11, 'App\\User', '{"id_tarea":77,"nombre":"Andres Fabian","cargo":"Encargado de Dise\\u00f1o","descripcion":"Andres Fabian ha devuelto la Tarea: \\"Adaptaci\\u00f3n de dise\\u00f1o a web e intranet\\" a Atenci\\u00f3n Cuentas","created_at":"2017-04-05 16:39:02","img_perfil":"\\/images\\/avatars\\/AndresFabian_9.png","link":"\\/ver_tarea\\/77"}', '2017-04-05 21:39:11', '2017-04-05 21:39:02', '2017-04-05 21:39:11'),
('603d21eb-7a46-4455-ab89-dff1afdadc44', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":168,"nombre":"Andrea","cargo":"Ejecutiva de Cuentas","descripcion":"Andrea cre\\u00f3 la Tarea: Implementaci\\u00f3n pauta con objetivo descarga FB","created_at":"2017-04-07 16:40:06","img_perfil":null,"link":"\\/ver_tarea\\/168"}', NULL, '2017-04-07 21:40:06', '2017-04-07 21:40:06'),
('60c2ef3e-c598-4d08-a7be-03ad3dd9c4c5', 'App\\Notifications\\TareaEntregada', 22, 'App\\User', '{"id_tarea":84,"nombre":"Andres Fabian","cargo":"Encargado de Dise\\u00f1o","descripcion":"Andres Fabian entreg\\u00f3 la Tarea: Ajustes infograf\\u00eda Metabolismo activo y actualiz\\u00f3 el estado a Entregado","created_at":"2017-04-07 09:38:48","img_perfil":"\\/images\\/avatars\\/AndresFabian_9.png","link":"\\/ver_tarea\\/84"}', NULL, '2017-04-07 14:38:48', '2017-04-07 14:38:48'),
('613a1504-bd4b-42ac-8790-f324454f9069', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":9,"nombre":"Silvia","cargo":"Ejecutiva de cuentas","descripcion":"Silvia cre\\u00f3 la Tarea: Pauta Descuento Droguer\\u00edas - Gif que Anuncie descuento 15 de abril","created_at":"2017-03-31 21:30:14","img_perfil":null,"link":"\\/ver_tarea\\/9"}', '2017-04-03 19:13:25', '2017-04-01 02:30:14', '2017-04-03 19:13:25'),
('6203204f-23c3-44f0-b27d-ac571c75d612', 'App\\Notifications\\TareaCreada', 6, 'App\\User', '{"id_tarea":165,"nombre":" Maria Andrea","cargo":"New Bussines","descripcion":" Maria Andrea cre\\u00f3 la Tarea: Ampliaci\\u00f3n de Capacidad de Correo","created_at":"2017-04-07 16:35:50","img_perfil":null,"link":"\\/ver_tarea\\/165"}', NULL, '2017-04-07 21:35:50', '2017-04-07 21:35:50'),
('623303da-e9ac-44c7-9fba-b97b7cd73e8b', 'App\\Notifications\\TareaEntregada', 11, 'App\\User', '{"id_tarea":49,"nombre":"Leonardo","cargo":"Lider de Contenido Escrito","descripcion":"Leonardo entreg\\u00f3 la Tarea: Ajuste de noticia Wapp y actualiz\\u00f3 el estado a Entregado","created_at":"2017-04-07 15:14:59","img_perfil":"\\/images\\/avatars\\/Leonardo_7.png","link":"\\/ver_tarea\\/49"}', NULL, '2017-04-07 20:14:59', '2017-04-07 20:14:59'),
('62b9e597-43f0-451d-8aed-5c1b79cdbb2d', 'App\\Notifications\\OtCreada', 1, 'App\\User', '{"id_tarea":58,"nombre":"Andrea","cargo":"Ejecutiva de Cuentas","descripcion":"Andrea ha creado una OT con referencia: 1115, nombre : Direccionamiento estrat\\u00e9gico abril  y valor: $10,990,000","created_at":"2017-04-07 16:57:17","img_perfil":null,"link":"\\/ots\\/visualizar\\/58"}', '2017-04-09 02:12:45', '2017-04-07 21:57:17', '2017-04-09 02:12:45'),
('62c9dd2c-2ce8-4704-95b9-8c3f4cd72f70', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":28,"nombre":" Maria Andrea","cargo":"New Bussines","descripcion":" Maria Andrea cre\\u00f3 la Tarea: Implementaci\\u00f3n e  informe de SEO ","created_at":"2017-04-03 12:19:21","img_perfil":null,"link":"\\/ver_tarea\\/28"}', NULL, '2017-04-03 17:19:21', '2017-04-03 17:19:21'),
('62f487e2-ec9f-417e-9505-6b8a5874b89d', 'App\\Notifications\\TareaRealizada', 7, 'App\\User', '{"id_tarea":30,"nombre":"Alexandra","cargo":"Practicante en Contenidos - CM","descripcion":"Alexandra ha realizado la Tarea: \\"Art\\u00edculo blog ProgreSER Semana Santa \\" en 8 Hrs","created_at":"2017-04-06 14:31:46","img_perfil":null,"link":"\\/ver_tarea\\/30"}', '2017-04-10 11:52:21', '2017-04-06 19:31:46', '2017-04-10 11:52:21'),
('6370dc91-d16d-4391-b202-33b3ef4a2777', 'App\\Notifications\\TareaEntregada', 11, 'App\\User', '{"id_tarea":31,"nombre":"Leonardo","cargo":"Lider de Contenido Escrito","descripcion":"Leonardo entreg\\u00f3 la Tarea: Notas app ProgreSER y actualiz\\u00f3 el estado a Entregado","created_at":"2017-04-07 15:15:28","img_perfil":"\\/images\\/avatars\\/Leonardo_7.png","link":"\\/ver_tarea\\/31"}', NULL, '2017-04-07 20:15:28', '2017-04-07 20:15:28'),
('6397fdf6-198d-4f22-a4c2-0681b0b498ac', 'App\\Notifications\\TareaRealizada', 6, 'App\\User', '{"id_tarea":41,"nombre":"Brian","cargo":"Desarrollador","descripcion":"Brian ha realizado la Tarea: \\"Revisi\\u00f3n imagen historia\\" en 0.4 Hrs","created_at":"2017-04-04 09:47:37","img_perfil":"\\/images\\/avatars\\/Brian_21.png","link":"\\/ver_tarea\\/41"}', '2017-04-04 16:00:09', '2017-04-04 14:47:37', '2017-04-04 16:00:09'),
('6461cfb5-d6a4-44c6-8833-0ffaefc3845f', 'App\\Notifications\\TareaCreada', 6, 'App\\User', '{"id_tarea":76,"nombre":"Andrea","cargo":"Ejecutiva de Cuentas","descripcion":"Andrea cre\\u00f3 la Tarea: Realizaci\\u00f3n de Flujos cat\\u00e1logo ","created_at":"2017-04-05 16:27:10","img_perfil":null,"link":"\\/ver_tarea\\/76"}', '2017-04-06 16:00:14', '2017-04-05 21:27:10', '2017-04-06 16:00:14'),
('6526001e-5b6d-4d71-9b80-30305979dfd5', 'App\\Notifications\\TareaProgramada', 14, 'App\\User', '{"id_tarea":96,"nombre":"Nestor","cargo":"SEM Performance Manager","descripcion":"Nestor ha programado la Tarea: Construcci\\u00f3n de Keyword Planner Droguer\\u00edas Sur Cali","created_at":"2017-04-09 20:57:26","img_perfil":"\\/images\\/avatars\\/Nestor_5.png","link":"\\/ver_tarea\\/96"}', NULL, '2017-04-10 01:57:26', '2017-04-10 01:57:26'),
('65976516-41db-4bc0-95da-e78ed8f78751', 'App\\Notifications\\TareaCreada', 6, 'App\\User', '{"id_tarea":178,"nombre":"Andrea","cargo":"Ejecutiva de Cuentas","descripcion":"Andrea cre\\u00f3 la Tarea: Instalaci\\u00f3n y configuraci\\u00f3n del CMS","created_at":"2017-04-07 18:52:01","img_perfil":null,"link":"\\/ver_tarea\\/178"}', NULL, '2017-04-07 23:52:01', '2017-04-07 23:52:01'),
('65f9d707-af70-4ac2-b90f-25fd44badc2d', 'App\\Notifications\\TareaCreada', 6, 'App\\User', '{"id_tarea":182,"nombre":"Andrea","cargo":"Ejecutiva de Cuentas","descripcion":"Andrea cre\\u00f3 la Tarea: Calidad del 50% del sitio web ","created_at":"2017-04-07 19:02:00","img_perfil":null,"link":"\\/ver_tarea\\/182"}', NULL, '2017-04-08 00:02:00', '2017-04-08 00:02:00'),
('6668ff16-5a95-40a3-bacd-3193a6f72866', 'App\\Notifications\\TareaEntregada', 11, 'App\\User', '{"id_tarea":86,"nombre":"Leonardo","cargo":"Lider de Contenido Escrito","descripcion":"Leonardo entreg\\u00f3 la Tarea: Programaci\\u00f3n redes sociales HV y actualiz\\u00f3 el estado a Entregado","created_at":"2017-04-07 15:15:17","img_perfil":"\\/images\\/avatars\\/Leonardo_7.png","link":"\\/ver_tarea\\/86"}', NULL, '2017-04-07 20:15:17', '2017-04-07 20:15:17'),
('66f2afb6-8b42-4326-9122-c45451258c2a', 'App\\Notifications\\OtTiempoExtraAprobado', 22, 'App\\User', '{"id_tarea":33,"nombre":"Maria Isabel","cargo":"Proyect Owner","descripcion":"Maria Isabel ha editado su Orden de trabajo con la referencia #925 con el nombre Dise\\u00f1o y desarrollo del Sitio Web ","created_at":"2017-04-05 17:17:23","img_perfil":null,"link":"\\/ots\\/visualizar\\/33"}', '2017-04-05 22:38:24', '2017-04-05 22:17:23', '2017-04-05 22:38:24'),
('6769d136-7a25-4fcf-bad5-057e69ac360a', 'App\\Notifications\\OtTiempoExtraAprobado', 2, 'App\\User', '{"id_tarea":14,"nombre":"Maria Isabel","cargo":"Proyect Owner","descripcion":"Maria Isabel ha editado su Orden de trabajo con la referencia #1102 con el nombre Fee Acompa\\u00f1amiento de Agencia ","created_at":"2017-04-06 11:53:37","img_perfil":null,"link":"\\/ots\\/visualizar\\/14"}', '2017-04-06 19:15:10', '2017-04-06 16:53:37', '2017-04-06 19:15:10'),
('6831dbfd-e005-4a65-aced-d8ef7650cbe3', 'App\\Notifications\\TareaProgramada', 16, 'App\\User', '{"id_tarea":103,"nombre":"Leonardo","cargo":"Lider de Contenido Escrito","descripcion":"Leonardo ha programado la Tarea: Subir contenido sitio web ProgreSER","created_at":"2017-04-07 08:21:44","img_perfil":"\\/images\\/avatars\\/Leonardo_7.png","link":"\\/ver_tarea\\/103"}', NULL, '2017-04-07 13:21:44', '2017-04-07 13:21:44'),
('689651e4-b182-4e01-8aa0-63f22029f836', 'App\\Notifications\\TareaProgramada', 15, 'App\\User', '{"id_tarea":121,"nombre":"Nestor","cargo":"SEM Performance Manager","descripcion":"Nestor ha programado la Tarea: Informe pauta hacienda tablones","created_at":"2017-04-09 20:52:33","img_perfil":"\\/images\\/avatars\\/Nestor_5.png","link":"\\/ver_tarea\\/121"}', NULL, '2017-04-10 01:52:33', '2017-04-10 01:52:33'),
('697bcf5d-576e-480c-bd08-c9c1fcc65765', 'App\\Notifications\\OtCreada', 1, 'App\\User', '{"id_tarea":52,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  ha creado una OT con referencia: 1119, nombre : Pauta Nuevo Punto de la 14 y valor: $300,000","created_at":"2017-04-07 15:35:48","img_perfil":null,"link":"\\/ots\\/visualizar\\/52"}', '2017-04-09 02:12:45', '2017-04-07 20:35:48', '2017-04-09 02:12:45'),
('69ee78e9-ca24-423a-9713-be3e7c70d3ff', 'App\\Notifications\\TareaEntregada', 11, 'App\\User', '{"id_tarea":75,"nombre":"Andres Fabian","cargo":"Encargado de Dise\\u00f1o","descripcion":"Andres Fabian entreg\\u00f3 la Tarea: Realizaci\\u00f3n wireframes y actualiz\\u00f3 el estado a Entregado","created_at":"2017-04-05 17:39:39","img_perfil":"\\/images\\/avatars\\/AndresFabian_9.png","link":"\\/ver_tarea\\/75"}', '2017-04-06 04:15:53', '2017-04-05 22:39:39', '2017-04-06 04:15:53'),
('6a277994-3605-41a8-a8cc-4f36346a7007', 'App\\Notifications\\TareaCreada', 4, 'App\\User', '{"id_tarea":106,"nombre":"Jose","cargo":"Director Creativo","descripcion":"Jose cre\\u00f3 la Tarea: Reuni\\u00f3n interna equipo Comfandi","created_at":"2017-04-07 06:28:19","img_perfil":"\\/images\\/avatars\\/Jose_4.png","link":"\\/ver_tarea\\/106"}', '2017-04-07 11:28:28', '2017-04-07 11:28:19', '2017-04-07 11:28:28'),
('6a28a610-7ca6-48b3-90d5-28a73e9cc125', 'App\\Notifications\\TareaAtencionCuentas', 2, 'App\\User', '{"id_tarea":174,"nombre":"Andres Fabian","cargo":"Encargado de Dise\\u00f1o","descripcion":"Andres Fabian ha devuelto la Tarea: \\"Ajustes Parrilla Abril Centro de empleo\\" a Atenci\\u00f3n Cuentas","created_at":"2017-04-10 07:52:37","img_perfil":"\\/images\\/avatars\\/AndresFabian_9.png","link":"\\/ver_tarea\\/174"}', NULL, '2017-04-10 12:52:37', '2017-04-10 12:52:37'),
('6a382045-f736-4b8a-870e-a81ebb6c7931', 'App\\Notifications\\TareaProgramada', 9, 'App\\User', '{"id_tarea":75,"nombre":"Andres Fabian","cargo":"Encargado de Dise\\u00f1o","descripcion":"Andres Fabian ha programado la Tarea: Realizaci\\u00f3n wireframes","created_at":"2017-04-05 16:27:39","img_perfil":"\\/images\\/avatars\\/AndresFabian_9.png","link":"\\/ver_tarea\\/75"}', '2017-04-05 21:27:57', '2017-04-05 21:27:39', '2017-04-05 21:27:57'),
('6a84e3cc-0c8a-4aa5-b55e-9c066960b350', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":116,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  cre\\u00f3 la Tarea: Ubicar puntos droguer\\u00edas Sur en Waze","created_at":"2017-04-07 11:16:29","img_perfil":null,"link":"\\/ver_tarea\\/116"}', NULL, '2017-04-07 16:16:29', '2017-04-07 16:16:29'),
('6a8f4e6b-e993-4329-ba64-afc648e547bc', 'App\\Notifications\\TareaProgramada', 13, 'App\\User', '{"id_tarea":93,"nombre":"Luisa Fernanda","cargo":"Development  Leader","descripcion":"Luisa Fernanda ha programado la Tarea: Maquetado mails p\\u00fablico  externo app ProgreSER","created_at":"2017-04-06 10:59:27","img_perfil":"\\/images\\/avatars\\/LuisaFernanda_6.png","link":"\\/ver_tarea\\/93"}', '2017-04-06 21:21:15', '2017-04-06 15:59:27', '2017-04-06 21:21:15'),
('6ca99981-06df-41f2-81da-f992149b82f0', 'App\\Notifications\\TareaProgramada', 21, 'App\\User', '{"id_tarea":39,"nombre":"Luisa Fernanda","cargo":"Encargada de Desarrollo","descripcion":"Luisa Fernanda ha programado la Tarea: Ajuste de tipografia en el banner","created_at":"2017-04-03 17:24:59","img_perfil":"\\/images\\/avatars\\/LuisaFernanda_6.png","link":"\\/ver_tarea\\/39"}', '2017-04-03 22:25:27', '2017-04-03 22:24:59', '2017-04-03 22:25:27'),
('6cb6016e-ee30-466d-9235-7c4aba8696f0', 'App\\Notifications\\ComentarioNuevoTarea', 16, 'App\\User', '{"id_tarea":31,"nombre":"Alexandra","cargo":"Practicante en Contenidos - CM","descripcion":"Alexandra ha comentado en la Tarea: Notas app ProgreSER \\"Me tarde m\\u00e1s t...\\"","created_at":"2017-04-06 09:18:03","img_perfil":null,"link":"\\/ver_tarea\\/31"}', NULL, '2017-04-06 14:18:03', '2017-04-06 14:18:03'),
('6cb9102b-839a-49e5-abfc-c6b35287f453', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":58,"nombre":" Maria Andrea","cargo":"New Bussines","descripcion":" Maria Andrea cre\\u00f3 la Tarea: An\\u00e1lisis y Definici\\u00f3n de Key Words","created_at":"2017-04-04 11:45:47","img_perfil":null,"link":"\\/ver_tarea\\/58"}', NULL, '2017-04-04 16:45:47', '2017-04-04 16:45:47'),
('6cd7fd75-9202-4a40-8237-eef63a2a06fe', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":160,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  cre\\u00f3 la Tarea: Amplificar post Tulu\\u00e1 Orlando Duque","created_at":"2017-04-07 16:19:23","img_perfil":null,"link":"\\/ver_tarea\\/160"}', NULL, '2017-04-07 21:19:23', '2017-04-07 21:19:23'),
('6de58dc9-974a-416d-a5c2-bed12202bf9f', 'App\\Notifications\\OtCreada', 1, 'App\\User', '{"id_tarea":14,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  ha creado una OT con referencia: 1102-1, nombre : Fee Acompa\\u00f1amiento de Agencia y valor: $14,750,000","created_at":"2017-04-03 15:08:17","img_perfil":null,"link":"\\/ots\\/visualizar\\/14"}', '2017-04-03 22:38:13', '2017-04-03 20:08:17', '2017-04-03 22:38:13'),
('6f3f9a4c-54ef-4fa6-962e-0f874ae6a1e5', 'App\\Notifications\\TareaProgramada', 5, 'App\\User', '{"id_tarea":25,"nombre":"Nestor","cargo":"SEM Performance Manager","descripcion":"Nestor ha programado la Tarea: Capacitaci\\u00f3n Directivos de Comfandi","created_at":"2017-04-03 15:57:51","img_perfil":null,"link":"\\/ver_tarea\\/25"}', '2017-04-03 21:06:13', '2017-04-03 20:57:51', '2017-04-03 21:06:13'),
('6f7de084-20f3-4532-9e72-a3d3a272466c', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":159,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  cre\\u00f3 la Tarea: Amplificar post Buenaventura Orlando Duque","created_at":"2017-04-07 16:17:50","img_perfil":null,"link":"\\/ver_tarea\\/159"}', NULL, '2017-04-07 21:17:50', '2017-04-07 21:17:50'),
('70243de9-452e-4567-b19d-e15f3ea2158b', 'App\\Notifications\\TareaRealizada', 7, 'App\\User', '{"id_tarea":89,"nombre":"Alexandra","cargo":"Practicante en Contenidos - CM","descripcion":"Alexandra ha realizado la Tarea: \\"Noticia sobre Feria cr\\u00e9dito Dream Neo web e intranet\\" en 1.00 Hrs","created_at":"2017-04-07 15:50:04","img_perfil":null,"link":"\\/ver_tarea\\/89"}', '2017-04-10 11:52:21', '2017-04-07 20:50:04', '2017-04-10 11:52:21'),
('712db193-0318-4edf-9a33-1b55ec943c7e', 'App\\Notifications\\TareaCreada', 7, 'App\\User', '{"id_tarea":89,"nombre":"Andrea","cargo":"Ejecutiva de Cuentas","descripcion":"Andrea cre\\u00f3 la Tarea: Noticia sobre Feria cr\\u00e9dito Dream Neo web e intranet","created_at":"2017-04-05 22:35:34","img_perfil":null,"link":"\\/ver_tarea\\/89"}', '2017-04-06 12:44:59', '2017-04-06 03:35:34', '2017-04-06 12:44:59'),
('71705a28-4eda-4798-8734-4e3d8fa77d6e', 'App\\Notifications\\TareaRealizada', 9, 'App\\User', '{"id_tarea":73,"nombre":"Alejandro","cargo":"Practicante en Dise\\u00f1o Gr\\u00e1fico","descripcion":"Alejandro ha realizado la Tarea: \\"Ajustes emailing Conferencia regionales Abril\\" en 1.00 Hrs","created_at":"2017-04-05 16:09:24","img_perfil":null,"link":"\\/ver_tarea\\/73"}', '2017-04-05 21:27:57', '2017-04-05 21:09:24', '2017-04-05 21:27:57'),
('73244c81-9500-4f52-89f9-b7030dd64488', 'App\\Notifications\\TareaRealizada', 9, 'App\\User', '{"id_tarea":50,"nombre":"Alejandro","cargo":"Practicante en Dise\\u00f1o Gr\\u00e1fico","descripcion":"Alejandro ha realizado la Tarea: \\"Ent\\u00e9rate Nueva ubicaci\\u00f3n Agencia Empleo\\" en 0.5 Hrs","created_at":"2017-04-04 18:11:12","img_perfil":null,"link":"\\/ver_tarea\\/50"}', '2017-04-05 12:38:33', '2017-04-04 23:11:12', '2017-04-05 12:38:33'),
('734ab0df-00d8-4825-a7e3-afee5f1d9266', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":190,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  cre\\u00f3 la Tarea: Realizar plan de pauta Semana del afiliado","created_at":"2017-04-07 19:18:56","img_perfil":null,"link":"\\/ver_tarea\\/190"}', NULL, '2017-04-08 00:18:56', '2017-04-08 00:18:56'),
('744b2e9c-6725-41d2-a69f-bdd467e1e7bc', 'App\\Notifications\\TareaRealizada', 7, 'App\\User', '{"id_tarea":86,"nombre":"Leonardo","cargo":"Lider de Contenido Escrito","descripcion":"Leonardo ha realizado la Tarea: \\"Programaci\\u00f3n redes sociales HV\\" en 1.00 Hrs","created_at":"2017-04-06 08:12:17","img_perfil":"\\/images\\/avatars\\/Leonardo_7.png","link":"\\/ver_tarea\\/86"}', '2017-04-06 14:51:08', '2017-04-06 13:12:17', '2017-04-06 14:51:08'),
('755f0c94-0579-40cf-8ce8-047a1c56e873', 'App\\Notifications\\OtTiempoExtraAprobado', 2, 'App\\User', '{"id_tarea":50,"nombre":"Maria Isabel","cargo":"Proyect Owner","descripcion":"Maria Isabel ha editado su Orden de trabajo con la referencia #1116 con el nombre Pauta carruseles cincuentazo 12 abril ","created_at":"2017-04-07 15:24:07","img_perfil":null,"link":"\\/ots\\/visualizar\\/50"}', NULL, '2017-04-07 20:24:07', '2017-04-07 20:24:07'),
('75fac132-30c4-4e1e-9f22-a41d5cdd5ac4', 'App\\Notifications\\TareaRealizada', 7, 'App\\User', '{"id_tarea":34,"nombre":"Leonardo","cargo":"Lider de Contenido Escrito","descripcion":"Leonardo ha realizado la Tarea: \\"Pieza Mocoa - Harinera\\" en 0.50 Hrs","created_at":"2017-04-04 11:03:05","img_perfil":"\\/images\\/avatars\\/Leonardo_7.png","link":"\\/ver_tarea\\/34"}', '2017-04-04 19:59:15', '2017-04-04 16:03:05', '2017-04-04 19:59:15'),
('75fba6e1-5072-4ebd-b0de-dd2a8594222f', 'App\\Notifications\\TareaProgramada', 7, 'App\\User', '{"id_tarea":86,"nombre":"Leonardo","cargo":"Lider de Contenido Escrito","descripcion":"Leonardo ha programado la Tarea: Programaci\\u00f3n redes sociales HV","created_at":"2017-04-06 07:45:20","img_perfil":"\\/images\\/avatars\\/Leonardo_7.png","link":"\\/ver_tarea\\/86"}', '2017-04-06 14:51:08', '2017-04-06 12:45:20', '2017-04-06 14:51:08'),
('762e3f16-368a-4ad5-b39b-be2bda03f809', 'App\\Notifications\\TareaEntregada', 11, 'App\\User', '{"id_tarea":88,"nombre":"Leonardo","cargo":"Lider de Contenido Escrito","descripcion":"Leonardo entreg\\u00f3 la Tarea: T\\u00e9rminos y condiciones actividad app ProgreSER redes y actualiz\\u00f3 el estado a Entregado","created_at":"2017-04-07 15:14:22","img_perfil":"\\/images\\/avatars\\/Leonardo_7.png","link":"\\/ver_tarea\\/88"}', NULL, '2017-04-07 20:14:22', '2017-04-07 20:14:22'),
('76c26d2b-75ca-4ca3-97a9-453ad2921894', 'App\\Notifications\\TareaRealizada', 6, 'App\\User', '{"id_tarea":51,"nombre":"Luisa Fernanda","cargo":"Development  Leader","descripcion":"Luisa Fernanda ha realizado la Tarea: \\"Renovaci\\u00f3n de Hosting y Dominio 2017\\" en 1 Hrs","created_at":"2017-04-06 11:37:50","img_perfil":"\\/images\\/avatars\\/LuisaFernanda_6.png","link":"\\/ver_tarea\\/51"}', '2017-04-06 16:40:08', '2017-04-06 16:37:50', '2017-04-06 16:40:08'),
('77eecbb7-52a2-4995-80f9-5263e72f680d', 'App\\Notifications\\OtCreada', 1, 'App\\User', '{"id_tarea":37,"nombre":" Maria Andrea","cargo":"New Bussines","descripcion":" Maria Andrea ha creado una OT con referencia: 767, nombre : Soporte T\\u00e9cnico al Hosting y valor: $1,685,000","created_at":"2017-04-06 11:26:17","img_perfil":null,"link":"\\/ots\\/visualizar\\/37"}', '2017-04-06 16:49:54', '2017-04-06 16:26:17', '2017-04-06 16:49:54'),
('784bd719-b25c-4e6f-b674-12aa0be4db80', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":46,"nombre":"Andrea","cargo":"Ejecutiva de Cuentas","descripcion":"Andrea cre\\u00f3 la Tarea: Detener pauta Formulario Hero bono $700.000","created_at":"2017-04-03 17:12:21","img_perfil":null,"link":"\\/ver_tarea\\/46"}', NULL, '2017-04-03 22:12:21', '2017-04-03 22:12:21'),
('7879a8ed-3125-4ef1-bc67-5788cf1d9dd5', 'App\\Notifications\\TareaProgramada', 14, 'App\\User', '{"id_tarea":135,"nombre":"Nestor","cargo":"SEM Performance Manager","descripcion":"Nestor ha programado la Tarea: Amplificar carrusel 1 cincuentazo","created_at":"2017-04-09 20:37:29","img_perfil":"\\/images\\/avatars\\/Nestor_5.png","link":"\\/ver_tarea\\/135"}', NULL, '2017-04-10 01:37:29', '2017-04-10 01:37:29'),
('78ad69e0-c2f5-4187-ad1c-28efd3d2fd2c', 'App\\Notifications\\ComentarioNuevoTarea', 5, 'App\\User', '{"id_tarea":6,"nombre":"Silvia","cargo":"Ejecutiva de cuentas","descripcion":"Silvia ha comentado en la Tarea: Pauta Descuento Droguer\\u00edas - Pieza HOY 10% de descuento \\"Inverisi\\u00f3n Net...\\"","created_at":"2017-03-31 21:21:59","img_perfil":null,"link":"\\/ver_tarea\\/6"}', '2017-04-03 19:13:25', '2017-04-01 02:21:59', '2017-04-03 19:13:25'),
('78b10b6a-c6b4-44e0-9ce1-2424d301ad61', 'App\\Notifications\\OtCreada', 1, 'App\\User', '{"id_tarea":15,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  ha creado una OT con referencia: 1102-2, nombre : Fee Vallempresa365 y valor: $9,450,000","created_at":"2017-04-03 15:12:14","img_perfil":null,"link":"\\/ots\\/visualizar\\/15"}', '2017-04-03 22:38:13', '2017-04-03 20:12:14', '2017-04-03 22:38:13'),
('7a11e259-1590-47c3-8942-3f600ef5b3b4', 'App\\Notifications\\OtTiempoExtraAprobado', 11, 'App\\User', '{"id_tarea":9,"nombre":"Maria Isabel","cargo":"Proyect Owner","descripcion":"Maria Isabel ha editado su Orden de trabajo con la referencia #1126 con el nombre Fee Mensual Abril ","created_at":"2017-04-03 13:29:42","img_perfil":null,"link":"\\/ots\\/visualizar\\/9"}', '2017-04-03 19:03:12', '2017-04-03 18:29:42', '2017-04-03 19:03:12'),
('7b022790-435c-4354-8070-7452e617007b', 'App\\Notifications\\TareaCreada', 7, 'App\\User', '{"id_tarea":83,"nombre":"Nathalia","cargo":"Account Executive","descripcion":"Nathalia cre\\u00f3 la Tarea: Cargar t\\u00e9rminos y condiciones del concurso","created_at":"2017-04-05 17:55:35","img_perfil":null,"link":"\\/ver_tarea\\/83"}', '2017-04-06 12:44:59', '2017-04-05 22:55:35', '2017-04-06 12:44:59'),
('7bc5a733-e99e-400e-95f9-cb76a34b6a86', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":15,"nombre":"Silvia","cargo":"Ejecutiva de cuentas","descripcion":"Silvia cre\\u00f3 la Tarea: Pauta Descuento Droguer\\u00edas - Pieza HOY 10% de descuento","created_at":"2017-03-31 21:49:54","img_perfil":null,"link":"\\/ver_tarea\\/15"}', '2017-04-03 19:13:25', '2017-04-01 02:49:54', '2017-04-03 19:13:25'),
('7bd1b5c4-cc8a-4803-9340-20dd3f554f4d', 'App\\Notifications\\OtCreada', 1, 'App\\User', '{"id_tarea":8,"nombre":" Maria Andrea","cargo":"New Bussines","descripcion":" Maria Andrea ha creado una OT con referencia: 1106, nombre : Fee de SEO mes de Abril y valor: $1,290,000","created_at":"2017-04-03 12:09:52","img_perfil":null,"link":"\\/ots\\/visualizar\\/8"}', '2017-04-03 18:17:03', '2017-04-03 17:09:52', '2017-04-03 18:17:03'),
('7c18551c-33c3-4e92-a520-2cb43791878a', 'App\\Notifications\\TareaProgramada', 16, 'App\\User', '{"id_tarea":88,"nombre":"Leonardo","cargo":"Lider de Contenido Escrito","descripcion":"Leonardo ha programado la Tarea: T\\u00e9rminos y condiciones actividad app ProgreSER redes","created_at":"2017-04-06 14:10:24","img_perfil":"\\/images\\/avatars\\/Leonardo_7.png","link":"\\/ver_tarea\\/88"}', NULL, '2017-04-06 19:10:24', '2017-04-06 19:10:24'),
('7c75705b-7cb6-48b8-b109-c066abba8c51', 'App\\Notifications\\ComentarioNuevoTarea', 9, 'App\\User', '{"id_tarea":35,"nombre":"Zuly","cargo":"Dise\\u00f1adora Gr\\u00e1fica","descripcion":"Zuly ha comentado en la Tarea: Dise\\u00f1o pieza mocoa Harinera del Valle  \\"Esta pieza se a...\\"","created_at":"2017-04-04 10:44:10","img_perfil":"\\/images\\/avatars\\/Zuly_23.png","link":"\\/ver_tarea\\/35"}', '2017-04-04 16:07:06', '2017-04-04 15:44:10', '2017-04-04 16:07:06'),
('7ce18d06-a883-45fb-b5ac-bc7c67161eb1', 'App\\Notifications\\OtCreada', 1, 'App\\User', '{"id_tarea":64,"nombre":"Andrea","cargo":"Ejecutiva de Cuentas","descripcion":"Andrea ha creado una OT con referencia: 1105-2, nombre : Fee creaci\\u00f3n Key visual  y valor: $3,400,000","created_at":"2017-04-07 18:21:09","img_perfil":null,"link":"\\/ots\\/visualizar\\/64"}', '2017-04-09 02:12:45', '2017-04-07 23:21:09', '2017-04-09 02:12:45'),
('7cff8217-cfe4-4883-b7d8-5b270ef67271', 'App\\Notifications\\TareaEntregada', 2, 'App\\User', '{"id_tarea":73,"nombre":"Andres Fabian","cargo":"Encargado de Dise\\u00f1o","descripcion":"Andres Fabian entreg\\u00f3 la Tarea: Ajustes emailing Conferencia regionales Abril y actualiz\\u00f3 el estado a Entregado","created_at":"2017-04-05 16:15:11","img_perfil":"\\/images\\/avatars\\/AndresFabian_9.png","link":"\\/ver_tarea\\/73"}', '2017-04-06 19:15:10', '2017-04-05 21:15:11', '2017-04-06 19:15:10'),
('7d353d95-f9d2-4f8e-9b2b-430e9a1e136d', 'App\\Notifications\\OtCreada', 1, 'App\\User', '{"id_tarea":38,"nombre":"Nathalia","cargo":"Account Executive","descripcion":"Nathalia ha creado una OT con referencia: 1102, nombre : Ajustes y actualizaci\\u00f3n de Formulario Inscripciones Media Marat\\u00f3n Cali y valor: $270,000","created_at":"2017-04-06 11:38:11","img_perfil":null,"link":"\\/ots\\/visualizar\\/38"}', '2017-04-06 16:49:54', '2017-04-06 16:38:11', '2017-04-06 16:49:54'),
('7dcc889f-8da2-4f4f-aa4e-f41c3573ba60', 'App\\Notifications\\TareaRealizada', 7, 'App\\User', '{"id_tarea":83,"nombre":"Leonardo","cargo":"Lider de Contenido Escrito","descripcion":"Leonardo ha realizado la Tarea: \\"Cargar t\\u00e9rminos y condiciones del concurso\\" en 0.25 Hrs","created_at":"2017-04-06 07:44:28","img_perfil":"\\/images\\/avatars\\/Leonardo_7.png","link":"\\/ver_tarea\\/83"}', '2017-04-06 12:44:59', '2017-04-06 12:44:28', '2017-04-06 12:44:59');
INSERT INTO `notifications` (`id`, `type`, `notifiable_id`, `notifiable_type`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('7dde3f88-c207-464b-b05b-bcda15fccd48', 'App\\Notifications\\TareaRealizada', 6, 'App\\User', '{"id_tarea":94,"nombre":"Alvaro Jose","cargo":" Ingeniero de desarrollo","descripcion":"Alvaro Jose ha realizado la Tarea: \\"Maquetado mail ProgreSER P\\u00fablico interno\\" en 0.5 Hrs","created_at":"2017-04-06 16:21:56","img_perfil":"\\/images\\/avatars\\/AlvaroJose_13.png","link":"\\/ver_tarea\\/94"}', '2017-04-06 22:07:12', '2017-04-06 21:21:56', '2017-04-06 22:07:12'),
('7de753fc-8d2b-4fa2-ab57-9b3e14498363', 'App\\Notifications\\OtCreada', 1, 'App\\User', '{"id_tarea":31,"nombre":"Nathalia","cargo":"Account Executive","descripcion":"Nathalia ha creado una OT con referencia: 1033-4, nombre : Fee Soporte Sitio Web - Abril y valor: $75,000","created_at":"2017-04-05 16:29:48","img_perfil":null,"link":"\\/ots\\/visualizar\\/31"}', '2017-04-05 21:33:56', '2017-04-05 21:29:48', '2017-04-05 21:33:56'),
('7e6566cf-457e-422c-961d-be4ae5a0e737', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":147,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  cre\\u00f3 la Tarea: Informe resultados pauta punto de venta la 14","created_at":"2017-04-07 15:42:33","img_perfil":null,"link":"\\/ver_tarea\\/147"}', NULL, '2017-04-07 20:42:33', '2017-04-07 20:42:33'),
('7e7f967b-3df2-4663-ae4e-c93daf400b73', 'App\\Notifications\\TareaCreada', 6, 'App\\User', '{"id_tarea":122,"nombre":"Luisa Fernanda","cargo":"Development  Leader","descripcion":"Luisa Fernanda cre\\u00f3 la Tarea: Tr\\u00e1fico","created_at":"2017-04-07 14:27:29","img_perfil":"\\/images\\/avatars\\/LuisaFernanda_6.png","link":"\\/ver_tarea\\/122"}', '2017-04-07 19:27:37', '2017-04-07 19:27:29', '2017-04-07 19:27:37'),
('7fe46970-9c61-4330-b0e7-cd0b6e897588', 'App\\Notifications\\TareaAtencionCuentas', 2, 'App\\User', '{"id_tarea":138,"nombre":"Nestor","cargo":"SEM Performance Manager","descripcion":"Nestor ha devuelto la Tarea: \\"Amplificar carrusel 2 cincuentazo -trasnoch\\u00f3n\\" a Atenci\\u00f3n Cuentas","created_at":"2017-04-09 20:40:24","img_perfil":"\\/images\\/avatars\\/Nestor_5.png","link":"\\/ver_tarea\\/138"}', NULL, '2017-04-10 01:40:24', '2017-04-10 01:40:24'),
('7ff969a2-5d17-4c53-8e35-51bda88b3b60', 'App\\Notifications\\OtCreada', 1, 'App\\User', '{"id_tarea":2,"nombre":"Silvia","cargo":"Ejecutiva de cuentas","descripcion":"Silvia ha creado una OT con referencia: 1096, nombre : Pauta Escuelas Deportiva Tennis deCampo y valor: $400,000","created_at":"2017-03-31 20:39:29","img_perfil":null,"link":"\\/ots\\/visualizar\\/2"}', '2017-04-02 08:08:00', '2017-04-01 01:39:29', '2017-04-02 08:08:00'),
('81e9c2f8-633f-471e-a5cc-71eb4e37c37b', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":171,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  cre\\u00f3 la Tarea: Amplificar post celebraci\\u00f3n d\\u00eda de las madres","created_at":"2017-04-07 17:01:17","img_perfil":null,"link":"\\/ver_tarea\\/171"}', NULL, '2017-04-07 22:01:17', '2017-04-07 22:01:17'),
('823696c6-bd74-4e26-9913-ba509429346c', 'App\\Notifications\\TareaCreada', 6, 'App\\User', '{"id_tarea":55,"nombre":" Maria Andrea","cargo":"New Bussines","descripcion":" Maria Andrea cre\\u00f3 la Tarea: Revisi\\u00f3n de chat en l\\u00ednea","created_at":"2017-04-04 11:33:35","img_perfil":null,"link":"\\/ver_tarea\\/55"}', '2017-04-04 19:35:06', '2017-04-04 16:33:35', '2017-04-04 19:35:06'),
('82459760-b00e-4726-8ef4-be96ae18b9cb', 'App\\Notifications\\TareaRealizada', 9, 'App\\User', '{"id_tarea":79,"nombre":"Andres Fabian","cargo":"Encargado de Dise\\u00f1o","descripcion":"Andres Fabian ha realizado la Tarea: \\"Ajustes en Wireframes\\" en 0.5 Hrs","created_at":"2017-04-05 17:59:43","img_perfil":"\\/images\\/avatars\\/AndresFabian_9.png","link":"\\/ver_tarea\\/79"}', '2017-04-06 13:19:58', '2017-04-05 22:59:43', '2017-04-06 13:19:58'),
('82e09000-24e2-4b12-a19d-ae044ba9e59f', 'App\\Notifications\\TareaCreada', 9, 'App\\User', '{"id_tarea":80,"nombre":"Nathalia","cargo":"Account Executive","descripcion":"Nathalia cre\\u00f3 la Tarea: Dise\\u00f1o Home","created_at":"2017-04-05 17:27:32","img_perfil":null,"link":"\\/ver_tarea\\/80"}', '2017-04-06 13:19:58', '2017-04-05 22:27:32', '2017-04-06 13:19:58'),
('82e5d1ed-7f4e-4e96-a2a1-9ad733aca04b', 'App\\Notifications\\TareaCreada', 9, 'App\\User', '{"id_tarea":35,"nombre":"Nathalia","cargo":"Account Executive","descripcion":"Nathalia cre\\u00f3 la Tarea: Dise\\u00f1o pieza mocoa Harinera del Valle ","created_at":"2017-04-03 16:00:52","img_perfil":null,"link":"\\/ver_tarea\\/35"}', '2017-04-03 21:13:42', '2017-04-03 21:00:52', '2017-04-03 21:13:42'),
('83bfc7cc-119f-45bf-8c4c-c5479ae6ca95', 'App\\Notifications\\OtCreada', 1, 'App\\User', '{"id_tarea":45,"nombre":"Silvia","cargo":"Ejecutiva de cuentas","descripcion":"Silvia ha creado una OT con referencia: 1113, nombre : Piezas Pauta Uni2Kids y valor: $1,540,000","created_at":"2017-04-07 12:07:14","img_perfil":null,"link":"\\/ots\\/visualizar\\/45"}', '2017-04-09 02:12:45', '2017-04-07 17:07:14', '2017-04-09 02:12:45'),
('848d757b-18b5-455b-adc9-1a9ca5e7e674', 'App\\Notifications\\ComentarioNuevoTarea', 14, 'App\\User', '{"id_tarea":96,"nombre":"Nestor","cargo":"SEM Performance Manager","descripcion":"Nestor ha comentado en la Tarea: Construcci\\u00f3n de Keyword Planner Droguer\\u00edas Sur Cali \\"Juan Pablo cu\\u00e1...\\"","created_at":"2017-04-09 20:59:50","img_perfil":"\\/images\\/avatars\\/Nestor_5.png","link":"\\/ver_tarea\\/96"}', NULL, '2017-04-10 01:59:50', '2017-04-10 01:59:50'),
('85115d29-d107-4e86-8c95-24a436a18694', 'App\\Notifications\\TareaRealizada', 6, 'App\\User', '{"id_tarea":39,"nombre":"Brian","cargo":"Desarrollador","descripcion":"Brian ha realizado la Tarea: \\"Ajuste de tipografia en el banner\\" en 0.5 Hrs","created_at":"2017-04-04 08:59:11","img_perfil":"\\/images\\/avatars\\/Brian_21.png","link":"\\/ver_tarea\\/39"}', '2017-04-04 16:00:09', '2017-04-04 13:59:11', '2017-04-04 16:00:09'),
('859294f9-51aa-4d73-875a-5cd62f5da0ce', 'App\\Notifications\\TareaAtencionArea', 6, 'App\\User', '{"id_tarea":68,"nombre":" Maria Andrea","cargo":"New Bussines","descripcion":" Maria Andrea ha devuelto la Tarea: \\"Carga de interactivo 360\\" a Atenci\\u00f3n \\u00c1rea","created_at":"2017-04-06 14:35:19","img_perfil":null,"link":"\\/ver_tarea\\/68"}', '2017-04-06 22:07:12', '2017-04-06 19:35:19', '2017-04-06 22:07:12'),
('87d334a3-0e2d-4473-9e63-4f1f6c43474a', 'App\\Notifications\\TareaProgramada', 14, 'App\\User', '{"id_tarea":139,"nombre":"Nestor","cargo":"SEM Performance Manager","descripcion":"Nestor ha programado la Tarea: Amplificar carrusel 3 cincuentazo - trasnoch\\u00f3n","created_at":"2017-04-09 20:47:51","img_perfil":"\\/images\\/avatars\\/Nestor_5.png","link":"\\/ver_tarea\\/139"}', NULL, '2017-04-10 01:47:51', '2017-04-10 01:47:51'),
('888ab55e-a7e8-4d0f-98f3-030147e91911', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":180,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  cre\\u00f3 la Tarea: Ajustar planes de pauta cursos regionales","created_at":"2017-04-07 18:54:50","img_perfil":null,"link":"\\/ver_tarea\\/180"}', NULL, '2017-04-07 23:54:50', '2017-04-07 23:54:50'),
('8a3a405a-c94e-4790-b48e-b1e2cf5b1ade', 'App\\Notifications\\OtCreada', 1, 'App\\User', '{"id_tarea":1,"nombre":"Maria Isabel","cargo":"Proyect Owner","descripcion":"Maria Isabel ha creado una OT con referencia: 1093, nombre : Pauta Descuentos Droguerias y valor: $510,000","created_at":"2017-03-31 19:46:54","img_perfil":null,"link":"\\/ots\\/visualizar\\/1"}', '2017-04-02 08:08:00', '2017-04-01 00:46:54', '2017-04-02 08:08:00'),
('8b9b14ad-97b3-48fc-b625-dcbee286e63f', 'App\\Notifications\\TareaCreada', 6, 'App\\User', '{"id_tarea":98,"nombre":"Nathalia","cargo":"Account Executive","descripcion":"Nathalia cre\\u00f3 la Tarea: Actualizar el formulario de inscripciones para Media Marat\\u00f3n","created_at":"2017-04-06 11:54:38","img_perfil":null,"link":"\\/ver_tarea\\/98"}', '2017-04-06 16:56:51', '2017-04-06 16:54:38', '2017-04-06 16:56:51'),
('8ba91300-9896-47ee-b2c0-d010d95a0d02', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":125,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  cre\\u00f3 la Tarea: Amplificar carrusel 2 droguer\\u00edas","created_at":"2017-04-07 14:35:01","img_perfil":null,"link":"\\/ver_tarea\\/125"}', NULL, '2017-04-07 19:35:01', '2017-04-07 19:35:01'),
('8bf0e261-90ab-4866-baf7-6c7c86e168e6', 'App\\Notifications\\TareaProgramada', 15, 'App\\User', '{"id_tarea":140,"nombre":"Nestor","cargo":"SEM Performance Manager","descripcion":"Nestor ha programado la Tarea: Informe carruseles cincuentazo","created_at":"2017-04-09 20:46:30","img_perfil":"\\/images\\/avatars\\/Nestor_5.png","link":"\\/ver_tarea\\/140"}', NULL, '2017-04-10 01:46:30', '2017-04-10 01:46:30'),
('8c451023-7287-4166-9879-b9c0d6f33772', 'App\\Notifications\\TareaEntregada', 11, 'App\\User', '{"id_tarea":94,"nombre":"Luisa Fernanda","cargo":"Development  Leader","descripcion":"Luisa Fernanda entreg\\u00f3 la Tarea: Maquetado mail ProgreSER P\\u00fablico interno y actualiz\\u00f3 el estado a Entregado","created_at":"2017-04-06 17:07:37","img_perfil":"\\/images\\/avatars\\/LuisaFernanda_6.png","link":"\\/ver_tarea\\/94"}', '2017-04-06 23:33:05', '2017-04-06 22:07:37', '2017-04-06 23:33:05'),
('8cb3cce8-e7be-437d-a42f-7753e924e057', 'App\\Notifications\\TareaProgramada', 9, 'App\\User', '{"id_tarea":33,"nombre":"Andres Fabian","cargo":"Encargado de Dise\\u00f1o","descripcion":"Andres Fabian ha programado la Tarea: Dise\\u00f1o de Home para tres l\\u00edneas de producto","created_at":"2017-04-04 11:11:42","img_perfil":"\\/images\\/avatars\\/AndresFabian_9.png","link":"\\/ver_tarea\\/33"}', '2017-04-04 16:29:39', '2017-04-04 16:11:42', '2017-04-04 16:29:39'),
('8d01c6aa-3200-4e6b-89c5-6ef2f4b51133', 'App\\Notifications\\TareaCreada', 4, 'App\\User', '{"id_tarea":43,"nombre":"Jose","cargo":"Director Creativo","descripcion":"Jose cre\\u00f3 la Tarea: Creaci\\u00f3n temas art\\u00edculos Manitoba","created_at":"2017-04-03 16:49:21","img_perfil":"\\/images\\/avatars\\/Jose_4.png","link":"\\/ver_tarea\\/43"}', '2017-04-03 22:10:29', '2017-04-03 21:49:21', '2017-04-03 22:10:29'),
('8e1bb5e1-18ef-49c1-9691-efff8b21bf5e', 'App\\Notifications\\TareaCreada', 7, 'App\\User', '{"id_tarea":184,"nombre":"Andrea","cargo":"Ejecutiva de Cuentas","descripcion":"Andrea cre\\u00f3 la Tarea: Generar estructura excel y powerpoint informe Manuelita","created_at":"2017-04-07 19:12:57","img_perfil":null,"link":"\\/ver_tarea\\/184"}', '2017-04-10 11:52:21', '2017-04-08 00:12:57', '2017-04-10 11:52:21'),
('8eddeec3-bd7c-4b43-b112-403b3ce20bde', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":143,"nombre":"Andrea","cargo":"Ejecutiva de Cuentas","descripcion":"Andrea cre\\u00f3 la Tarea: Env\\u00edo de mail externo 1 billetera ","created_at":"2017-04-07 15:32:20","img_perfil":null,"link":"\\/ver_tarea\\/143"}', NULL, '2017-04-07 20:32:20', '2017-04-07 20:32:20'),
('8f58d92a-4810-4915-a1a6-64cf87060396', 'App\\Notifications\\TareaEntregada', 11, 'App\\User', '{"id_tarea":67,"nombre":"Luisa Fernanda","cargo":"Development  Leader","descripcion":"Luisa Fernanda entreg\\u00f3 la Tarea: Compra espacio Hosting y actualiz\\u00f3 el estado a Entregado","created_at":"2017-04-06 11:17:27","img_perfil":"\\/images\\/avatars\\/LuisaFernanda_6.png","link":"\\/ver_tarea\\/67"}', '2017-04-06 16:35:03', '2017-04-06 16:17:27', '2017-04-06 16:35:03'),
('8fe4e46b-6919-429c-816a-9b4b428af78b', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":156,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  cre\\u00f3 la Tarea: Amplificar video Rocksito Buenaventura","created_at":"2017-04-07 16:06:11","img_perfil":null,"link":"\\/ver_tarea\\/156"}', NULL, '2017-04-07 21:06:11', '2017-04-07 21:06:11'),
('939c88f8-8a39-43fa-9bb1-df2552ec4dd6', 'App\\Notifications\\TareaProgramada', 6, 'App\\User', '{"id_tarea":51,"nombre":"Luisa Fernanda","cargo":"Development  Leader","descripcion":"Luisa Fernanda ha programado la Tarea: Renovaci\\u00f3n de Hosting y Dominio 2017","created_at":"2017-04-06 11:28:29","img_perfil":"\\/images\\/avatars\\/LuisaFernanda_6.png","link":"\\/ver_tarea\\/51"}', '2017-04-06 16:40:08', '2017-04-06 16:28:29', '2017-04-06 16:40:08'),
('93a697fa-0c20-4138-b38f-ca7841be721b', 'App\\Notifications\\OtCreada', 1, 'App\\User', '{"id_tarea":44,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  ha creado una OT con referencia: 1097, nombre : Pauta Descuento Pescader\\u00eda y valor: $500,000","created_at":"2017-04-07 07:50:51","img_perfil":null,"link":"\\/ots\\/visualizar\\/44"}', '2017-04-09 02:12:45', '2017-04-07 12:50:51', '2017-04-09 02:12:45'),
('940adc12-9eb8-4255-a491-19cb13d640cf', 'App\\Notifications\\TareaCreada', 7, 'App\\User', '{"id_tarea":30,"nombre":"Andrea","cargo":"Ejecutiva de Cuentas","descripcion":"Andrea cre\\u00f3 la Tarea: Art\\u00edculo blog ProgreSER Semana Santa ","created_at":"2017-04-03 13:39:54","img_perfil":null,"link":"\\/ver_tarea\\/30"}', '2017-04-03 19:04:20', '2017-04-03 18:39:54', '2017-04-03 19:04:20'),
('942bdde2-f071-4645-aeea-2cc9abea2253', 'App\\Notifications\\TareaCreada', 9, 'App\\User', '{"id_tarea":57,"nombre":" Maria Andrea","cargo":"New Bussines","descripcion":" Maria Andrea cre\\u00f3 la Tarea: Dise\\u00f1o Responsive","created_at":"2017-04-04 11:41:31","img_perfil":null,"link":"\\/ver_tarea\\/57"}', '2017-04-04 16:42:42', '2017-04-04 16:41:31', '2017-04-04 16:42:42'),
('9438763d-39b0-4660-a289-936d4bbd5f55', 'App\\Notifications\\TareaProgramada', 21, 'App\\User', '{"id_tarea":38,"nombre":"Luisa Fernanda","cargo":"Encargada de Desarrollo","descripcion":"Luisa Fernanda ha programado la Tarea: Ajuste bot\\u00f3n de Proveedores","created_at":"2017-04-03 17:23:08","img_perfil":"\\/images\\/avatars\\/LuisaFernanda_6.png","link":"\\/ver_tarea\\/38"}', '2017-04-03 22:23:18', '2017-04-03 22:23:08', '2017-04-03 22:23:18'),
('94cc3a81-5b34-443a-917a-d7f7becbb39b', 'App\\Notifications\\TareaProgramada', 14, 'App\\User', '{"id_tarea":116,"nombre":"Nestor","cargo":"SEM Performance Manager","descripcion":"Nestor ha programado la Tarea: Ubicar puntos droguer\\u00edas Sur en Waze","created_at":"2017-04-09 21:14:22","img_perfil":"\\/images\\/avatars\\/Nestor_5.png","link":"\\/ver_tarea\\/116"}', NULL, '2017-04-10 02:14:22', '2017-04-10 02:14:22'),
('952212ef-9bb6-4062-982a-8ff4c4171d51', 'App\\Notifications\\TareaProgramada', 4, 'App\\User', '{"id_tarea":104,"nombre":"Jose","cargo":"Director Creativo","descripcion":"Jose ha programado la Tarea: Organizaci\\u00f3n equipo redes sociales","created_at":"2017-04-07 06:27:02","img_perfil":"\\/images\\/avatars\\/Jose_4.png","link":"\\/ver_tarea\\/104"}', '2017-04-07 11:27:26', '2017-04-07 11:27:02', '2017-04-07 11:27:26'),
('956bec7f-fee4-4dec-b654-428dd4c77dca', 'App\\Notifications\\TareaRealizada', 9, 'App\\User', '{"id_tarea":90,"nombre":"Alejandro","cargo":"Practicante en Dise\\u00f1o Gr\\u00e1fico","descripcion":"Alejandro ha realizado la Tarea: \\"Dise\\u00f1o piezas feria de cr\\u00e9dito Honda Dream Neo abril\\" en 6.00 Hrs","created_at":"2017-04-07 09:15:19","img_perfil":null,"link":"\\/ver_tarea\\/90"}', '2017-04-07 14:25:32', '2017-04-07 14:15:19', '2017-04-07 14:25:32'),
('9634bcdf-7c8f-4313-af22-6e58df8d0f78', 'App\\Notifications\\OtTiempoExtraAprobado', 3, 'App\\User', '{"id_tarea":20,"nombre":"Desarrollo","cargo":"Tester","descripcion":"Desarrollo ha editado su Orden de trabajo con la referencia #970 con el nombre Implementaci\\u00f3n nuevo sitio web ","created_at":"2017-04-04 16:46:28","img_perfil":null,"link":"\\/ots\\/visualizar\\/20"}', '2017-04-06 19:19:45', '2017-04-04 21:46:28', '2017-04-06 19:19:45'),
('96892fef-1499-4477-8753-34b2c1fe03e9', 'App\\Notifications\\TareaEntregada', 3, 'App\\User', '{"id_tarea":51,"nombre":"Luisa Fernanda","cargo":"Development  Leader","descripcion":"Luisa Fernanda entreg\\u00f3 la Tarea: Renovaci\\u00f3n de Hosting y Dominio 2017 y actualiz\\u00f3 el estado a Entregado","created_at":"2017-04-06 11:39:40","img_perfil":"\\/images\\/avatars\\/LuisaFernanda_6.png","link":"\\/ver_tarea\\/51"}', '2017-04-06 19:19:45', '2017-04-06 16:39:40', '2017-04-06 19:19:45'),
('968e6ad6-4960-41d6-9fdc-8308f6dcd7e8', 'App\\Notifications\\OtCreada', 1, 'App\\User', '{"id_tarea":30,"nombre":"Andrea","cargo":"Ejecutiva de Cuentas","descripcion":"Andrea ha creado una OT con referencia: 0139, nombre : Cat\\u00e1logo ProgreSER y valor: $8,496,000","created_at":"2017-04-05 16:23:26","img_perfil":null,"link":"\\/ots\\/visualizar\\/30"}', '2017-04-05 21:33:56', '2017-04-05 21:23:26', '2017-04-05 21:33:56'),
('976018ba-88d6-425e-99ef-9639b3bfb17f', 'App\\Notifications\\TareaCreada', 9, 'App\\User', '{"id_tarea":62,"nombre":" Maria Andrea","cargo":"New Bussines","descripcion":" Maria Andrea cre\\u00f3 la Tarea: Dise\\u00f1o de P\\u00e1ginas Internas","created_at":"2017-04-04 14:02:24","img_perfil":null,"link":"\\/ver_tarea\\/62"}', '2017-04-04 19:03:56', '2017-04-04 19:02:24', '2017-04-04 19:03:56'),
('9813c3fc-e00a-4547-a983-c7c22e7562d8', 'App\\Notifications\\TareaRealizada', 9, 'App\\User', '{"id_tarea":64,"nombre":"Christian","cargo":"Dise\\u00f1ador Gr\\u00e1fico","descripcion":"Christian ha realizado la Tarea: \\"Dise\\u00f1o de la parrilla ProgreSER \\" en 8 Hrs","created_at":"2017-04-06 17:59:07","img_perfil":"\\/images\\/avatars\\/Christian_24.png","link":"\\/ver_tarea\\/64"}', '2017-04-06 23:53:39', '2017-04-06 22:59:07', '2017-04-06 23:53:39'),
('98436eeb-ed6e-4172-a1f0-61d25a6b3112', 'App\\Notifications\\TareaProgramada', 23, 'App\\User', '{"id_tarea":56,"nombre":"Andres Fabian","cargo":"Encargado de Dise\\u00f1o","descripcion":"Andres Fabian ha programado la Tarea: Cambio de fotos Harinera del Valle parrilla ","created_at":"2017-04-04 11:42:36","img_perfil":"\\/images\\/avatars\\/AndresFabian_9.png","link":"\\/ver_tarea\\/56"}', '2017-04-04 16:42:41', '2017-04-04 16:42:36', '2017-04-04 16:42:41'),
('9868d64b-ad3f-4790-b352-13df09b1ff30', 'App\\Notifications\\TareaCreada', 7, 'App\\User', '{"id_tarea":31,"nombre":"Andrea","cargo":"Ejecutiva de Cuentas","descripcion":"Andrea cre\\u00f3 la Tarea: Notas app ProgreSER","created_at":"2017-04-03 13:41:51","img_perfil":null,"link":"\\/ver_tarea\\/31"}', '2017-04-03 19:04:20', '2017-04-03 18:41:51', '2017-04-03 19:04:20'),
('99b68fee-01ca-4e0f-ac39-91978e1b3df3', 'App\\Notifications\\TareaProgramada', 4, 'App\\User', '{"id_tarea":97,"nombre":"Jose","cargo":"Director Creativo","descripcion":"Jose ha programado la Tarea: Realizar Copies Search Pauta Droguer\\u00edas Sur Cali","created_at":"2017-04-07 06:23:44","img_perfil":"\\/images\\/avatars\\/Jose_4.png","link":"\\/ver_tarea\\/97"}', '2017-04-07 11:23:53', '2017-04-07 11:23:44', '2017-04-07 11:23:53'),
('9a193d58-e078-4b2f-bc04-360bb818004b', 'App\\Notifications\\TareaProgramada', 15, 'App\\User', '{"id_tarea":28,"nombre":"Nestor","cargo":"SEM Performance Manager","descripcion":"Nestor ha programado la Tarea: Implementaci\\u00f3n e  informe de SEO ","created_at":"2017-04-09 20:22:45","img_perfil":"\\/images\\/avatars\\/Nestor_5.png","link":"\\/ver_tarea\\/28"}', NULL, '2017-04-10 01:22:45', '2017-04-10 01:22:45'),
('9a844b05-cf92-45de-8a90-6fec25049280', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":17,"nombre":"Maria Isabel","cargo":"Proyect Owner","descripcion":"Maria Isabel cre\\u00f3 la Tarea: Pauta concierto de la cuna a la jungla - Buenaventura","created_at":"2017-03-31 21:51:06","img_perfil":null,"link":"\\/ver_tarea\\/17"}', '2017-04-03 19:13:25', '2017-04-01 02:51:06', '2017-04-03 19:13:25'),
('9af26b40-c45f-4e41-bb69-532e6391bf25', 'App\\Notifications\\TareaAtencionArea', 7, 'App\\User', '{"id_tarea":44,"nombre":"Alexandra","cargo":"Practicante en Contenidos - CM","descripcion":"Alexandra ha devuelto la Tarea: \\"Cambio en la promoci\\u00f3n de ProgreSER y Hero \\" a Atenci\\u00f3n \\u00c1rea","created_at":"2017-04-04 14:56:16","img_perfil":null,"link":"\\/ver_tarea\\/44"}', '2017-04-04 19:59:15', '2017-04-04 19:56:16', '2017-04-04 19:59:15'),
('9b8ae20d-1246-4c9e-a03b-d767e82bfa55', 'App\\Notifications\\OtTiempoExtraAprobado', 3, 'App\\User', '{"id_tarea":28,"nombre":"Maria Isabel","cargo":"Proyect Owner","descripcion":"Maria Isabel ha editado su Orden de trabajo con la referencia #1011 con el nombre Implementaci\\u00f3n nuevo sitio web ","created_at":"2017-04-05 14:39:36","img_perfil":null,"link":"\\/ots\\/visualizar\\/28"}', '2017-04-06 19:19:45', '2017-04-05 19:39:36', '2017-04-06 19:19:45'),
('9be5ab57-42a5-4f3c-a968-47eb80f25f30', 'App\\Notifications\\OtCreada', 1, 'App\\User', '{"id_tarea":23,"nombre":"Nathalia","cargo":"Account Executive","descripcion":"Nathalia ha creado una OT con referencia: 1108-2, nombre : Fee de Administraci\\u00f3n Sitio Web y valor: $704,000","created_at":"2017-04-03 15:41:24","img_perfil":null,"link":"\\/ots\\/visualizar\\/23"}', '2017-04-03 22:38:13', '2017-04-03 20:41:24', '2017-04-03 22:38:13'),
('9bf1b403-7ad8-4093-9b17-c93048f2bb1a', 'App\\Notifications\\OtCreada', 1, 'App\\User', '{"id_tarea":40,"nombre":"Andrea","cargo":"Ejecutiva de Cuentas","descripcion":"Andrea ha creado una OT con referencia: 0961 -2, nombre : Sitio web espejo y valor: $1,427,944","created_at":"2017-04-06 12:10:01","img_perfil":null,"link":"\\/ots\\/visualizar\\/40"}', '2017-04-09 02:12:45', '2017-04-06 17:10:01', '2017-04-09 02:12:45'),
('9c073b24-385a-469c-8f7b-fbf5d42e8b95', 'App\\Notifications\\TareaEntregada', 11, 'App\\User', '{"id_tarea":76,"nombre":"Luisa Fernanda","cargo":"Development  Leader","descripcion":"Luisa Fernanda entreg\\u00f3 la Tarea: Realizaci\\u00f3n de Flujos cat\\u00e1logo  y actualiz\\u00f3 el estado a Entregado","created_at":"2017-04-06 08:28:29","img_perfil":"\\/images\\/avatars\\/LuisaFernanda_6.png","link":"\\/ver_tarea\\/76"}', '2017-04-06 16:35:03', '2017-04-06 13:28:29', '2017-04-06 16:35:03'),
('9c60c8d7-cc3b-4fe1-8058-c7814714a533', 'App\\Notifications\\TareaProgramada', 23, 'App\\User', '{"id_tarea":84,"nombre":"Andres Fabian","cargo":"Encargado de Dise\\u00f1o","descripcion":"Andres Fabian ha programado la Tarea: Ajustes infograf\\u00eda Metabolismo activo","created_at":"2017-04-06 09:18:31","img_perfil":"\\/images\\/avatars\\/AndresFabian_9.png","link":"\\/ver_tarea\\/84"}', '2017-04-06 23:03:29', '2017-04-06 14:18:31', '2017-04-06 23:03:29'),
('9c8c0ffa-8e00-4b3c-82f3-6f798ba74786', 'App\\Notifications\\TareaEntregada', 2, 'App\\User', '{"id_tarea":72,"nombre":"Andres Fabian","cargo":"Encargado de Dise\\u00f1o","descripcion":"Andres Fabian entreg\\u00f3 la Tarea: Ajuste Ent\\u00e9rate nueva sede Jamund\\u00ed y actualiz\\u00f3 el estado a Entregado","created_at":"2017-04-05 16:26:46","img_perfil":"\\/images\\/avatars\\/AndresFabian_9.png","link":"\\/ver_tarea\\/72"}', '2017-04-06 19:15:10', '2017-04-05 21:26:46', '2017-04-06 19:15:10'),
('9cae2e19-9ae5-4227-b75f-ef7239afe04d', 'App\\Notifications\\TareaCreada', 9, 'App\\User', '{"id_tarea":75,"nombre":"Andrea","cargo":"Ejecutiva de Cuentas","descripcion":"Andrea cre\\u00f3 la Tarea: Realizaci\\u00f3n wireframes","created_at":"2017-04-05 16:25:33","img_perfil":null,"link":"\\/ver_tarea\\/75"}', '2017-04-05 21:27:57', '2017-04-05 21:25:33', '2017-04-05 21:27:57'),
('9d673eeb-2140-40fa-a080-d8b9eff87c35', 'App\\Notifications\\TareaCreada', 4, 'App\\User', '{"id_tarea":97,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  cre\\u00f3 la Tarea: Realizar Copies Search Pauta Droguer\\u00edas Sur Cali","created_at":"2017-04-06 11:37:38","img_perfil":null,"link":"\\/ver_tarea\\/97"}', '2017-04-06 16:39:32', '2017-04-06 16:37:38', '2017-04-06 16:39:32'),
('9dfca04b-4ec3-46ab-b65e-1b6f1c56d151', 'App\\Notifications\\TareaCreada', 9, 'App\\User', '{"id_tarea":185,"nombre":"Silvia","cargo":"Ejecutiva de cuentas","descripcion":"Silvia cre\\u00f3 la Tarea: Dise\\u00f1o de Home del Sitio Web - Industrial","created_at":"2017-04-07 19:13:00","img_perfil":null,"link":"\\/ver_tarea\\/185"}', NULL, '2017-04-08 00:13:00', '2017-04-08 00:13:00'),
('9dfecd65-ce0f-4e32-b205-87e8504b2039', 'App\\Notifications\\TareaProgramada', 24, 'App\\User', '{"id_tarea":42,"nombre":"Andres Fabian","cargo":"Encargado de Dise\\u00f1o","descripcion":"Andres Fabian ha programado la Tarea: Ajuste en copy piezas promoci\\u00f3n Hero ","created_at":"2017-04-03 17:08:08","img_perfil":null,"link":"\\/ver_tarea\\/42"}', '2017-04-03 22:31:36', '2017-04-03 22:08:08', '2017-04-03 22:31:36'),
('9e484f7d-5b16-451f-90f2-be2768db87c0', 'App\\Notifications\\TareaEntregada', 22, 'App\\User', '{"id_tarea":35,"nombre":"Andres Fabian","cargo":"Encargado de Dise\\u00f1o","descripcion":"Andres Fabian entreg\\u00f3 la Tarea: Dise\\u00f1o pieza mocoa Harinera del Valle  y actualiz\\u00f3 el estado a Entregado","created_at":"2017-04-04 11:18:50","img_perfil":"\\/images\\/avatars\\/AndresFabian_9.png","link":"\\/ver_tarea\\/35"}', '2017-04-05 22:38:24', '2017-04-04 16:18:50', '2017-04-05 22:38:24'),
('9e8c3569-0929-41dd-86a9-7dabf0c6a293', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":169,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  cre\\u00f3 la Tarea: Informe Pauta post mes del ni\\u00f1a","created_at":"2017-04-07 16:41:01","img_perfil":null,"link":"\\/ver_tarea\\/169"}', NULL, '2017-04-07 21:41:01', '2017-04-07 21:41:01'),
('9eb9f1f1-35a6-48ce-852f-a4e07be61afa', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":13,"nombre":"Maria Isabel","cargo":"Proyect Owner","descripcion":"Maria Isabel cre\\u00f3 la Tarea: Pauta concierto de la cuna a la jungla - Tulu\\u00e1","created_at":"2017-03-31 21:46:28","img_perfil":null,"link":"\\/ver_tarea\\/13"}', '2017-04-03 19:13:25', '2017-04-01 02:46:28', '2017-04-03 19:13:25'),
('9edb254f-753e-48eb-8f29-c6d5ae7141cd', 'App\\Notifications\\ComentarioNuevoTarea', 9, 'App\\User', '{"id_tarea":42,"nombre":"Andrea","cargo":"Ejecutiva de Cuentas","descripcion":"Andrea ha comentado en la Tarea: Ajuste en copy piezas promoci\\u00f3n Hero  \\"Tambi\\u00e9n se deb...\\"","created_at":"2017-04-03 17:04:19","img_perfil":null,"link":"\\/ver_tarea\\/42"}', '2017-04-03 22:25:36', '2017-04-03 22:04:19', '2017-04-03 22:25:36'),
('a01f6534-77d7-41b9-9270-01dcc23ce4e9', 'App\\Notifications\\OtCreada', 1, 'App\\User', '{"id_tarea":57,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  ha creado una OT con referencia: 1124, nombre : Pauta Celebraci\\u00f3n d\\u00eda de la madres y valor: $400,000","created_at":"2017-04-07 16:49:21","img_perfil":null,"link":"\\/ots\\/visualizar\\/57"}', '2017-04-09 02:12:45', '2017-04-07 21:49:21', '2017-04-09 02:12:45'),
('a06265a5-a6ac-48c5-8613-d66fc61d231f', 'App\\Notifications\\TareaCreada', 6, 'App\\User', '{"id_tarea":38,"nombre":"Nathalia","cargo":"Account Executive","descripcion":"Nathalia cre\\u00f3 la Tarea: Ajuste bot\\u00f3n de Proveedores","created_at":"2017-04-03 16:38:00","img_perfil":null,"link":"\\/ver_tarea\\/38"}', '2017-04-03 22:23:23', '2017-04-03 21:38:00', '2017-04-03 22:23:23'),
('a0b70e11-79ad-42b2-9b57-6e57d06f2d62', 'App\\Notifications\\TareaCreada', 6, 'App\\User', '{"id_tarea":39,"nombre":"Nathalia","cargo":"Account Executive","descripcion":"Nathalia cre\\u00f3 la Tarea: Ajuste de tipografia en el banner","created_at":"2017-04-03 16:40:36","img_perfil":null,"link":"\\/ver_tarea\\/39"}', '2017-04-03 22:23:23', '2017-04-03 21:40:36', '2017-04-03 22:23:23'),
('a1389dfe-ca30-4b42-9763-e287ef5b6304', 'App\\Notifications\\TareaCreada', 6, 'App\\User', '{"id_tarea":130,"nombre":"Luisa Fernanda","cargo":"Development  Leader","descripcion":"Luisa Fernanda cre\\u00f3 la Tarea: Reuni\\u00f3n boroj\\u00f3","created_at":"2017-04-07 14:44:29","img_perfil":"\\/images\\/avatars\\/LuisaFernanda_6.png","link":"\\/ver_tarea\\/130"}', '2017-04-07 19:44:36', '2017-04-07 19:44:29', '2017-04-07 19:44:36'),
('a176d148-6bf2-4146-8cf7-649f0767963b', 'App\\Notifications\\TareaProgramada', 9, 'App\\User', '{"id_tarea":45,"nombre":"Andres Fabian","cargo":"Encargado de Dise\\u00f1o","descripcion":"Andres Fabian ha programado la Tarea: Revisi\\u00f3n video 3 HV off line","created_at":"2017-04-03 17:25:09","img_perfil":null,"link":"\\/ver_tarea\\/45"}', '2017-04-03 22:25:36', '2017-04-03 22:25:09', '2017-04-03 22:25:36'),
('a1d6046d-f643-4ed5-8949-80d538b5ba81', 'App\\Notifications\\TareaCreada', 9, 'App\\User', '{"id_tarea":56,"nombre":"Andrea","cargo":"Ejecutiva de Cuentas","descripcion":"Andrea cre\\u00f3 la Tarea: Cambio de fotos Harinera del Valle parrilla ","created_at":"2017-04-04 11:38:30","img_perfil":null,"link":"\\/ver_tarea\\/56"}', '2017-04-04 16:42:42', '2017-04-04 16:38:30', '2017-04-04 16:42:42'),
('a294ffa9-2d74-4da2-8ae4-4f08e7d9c2d6', 'App\\Notifications\\TareaRealizada', 9, 'App\\User', '{"id_tarea":65,"nombre":"Zuly","cargo":"Dise\\u00f1adora Gr\\u00e1fica","descripcion":"Zuly ha realizado la Tarea: \\"Gr\\u00e1ficos 3 HV\\" en 6 Hrs","created_at":"2017-04-06 18:05:26","img_perfil":"\\/images\\/avatars\\/Zuly_23.png","link":"\\/ver_tarea\\/65"}', '2017-04-06 23:53:39', '2017-04-06 23:05:26', '2017-04-06 23:53:39'),
('a2f66e3f-a1c2-489e-9efb-0c0b9431bb3c', 'App\\Notifications\\TareaProgramada', 6, 'App\\User', '{"id_tarea":55,"nombre":"Luisa Fernanda","cargo":"Development  Leader","descripcion":"Luisa Fernanda ha programado la Tarea: Revisi\\u00f3n de chat en l\\u00ednea","created_at":"2017-04-06 17:11:33","img_perfil":"\\/images\\/avatars\\/LuisaFernanda_6.png","link":"\\/ver_tarea\\/55"}', '2017-04-06 22:26:09', '2017-04-06 22:11:33', '2017-04-06 22:26:09'),
('a45880c1-536a-4c6d-85af-e66cc58895bc', 'App\\Notifications\\TareaCreada', 6, 'App\\User', '{"id_tarea":32,"nombre":" Maria Andrea","cargo":"New Bussines","descripcion":" Maria Andrea cre\\u00f3 la Tarea: Renovaci\\u00f3n Hosting, SSL y Soporte al Host","created_at":"2017-04-03 14:22:11","img_perfil":null,"link":"\\/ver_tarea\\/32"}', '2017-04-03 22:23:23', '2017-04-03 19:22:11', '2017-04-03 22:23:23'),
('a486862b-5ea8-4080-a79c-ec9393575f2c', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":126,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  cre\\u00f3 la Tarea: amplificar carrusel 3 revista droguer\\u00edas","created_at":"2017-04-07 14:36:25","img_perfil":null,"link":"\\/ver_tarea\\/126"}', NULL, '2017-04-07 19:36:25', '2017-04-07 19:36:25'),
('a537f788-9e36-48db-bb85-e40257c643b3', 'App\\Notifications\\TareaEntregada', 2, 'App\\User', '{"id_tarea":50,"nombre":"Andres Fabian","cargo":"Encargado de Dise\\u00f1o","descripcion":"Andres Fabian entreg\\u00f3 la Tarea: Ent\\u00e9rate Nueva ubicaci\\u00f3n Agencia Empleo y actualiz\\u00f3 el estado a Entregado","created_at":"2017-04-04 18:12:22","img_perfil":"\\/images\\/avatars\\/AndresFabian_9.png","link":"\\/ver_tarea\\/50"}', '2017-04-06 19:15:10', '2017-04-04 23:12:22', '2017-04-06 19:15:10'),
('a549f232-f16d-42b7-8316-6a06229af9af', 'App\\Notifications\\TareaCreada', 7, 'App\\User', '{"id_tarea":86,"nombre":"Andrea","cargo":"Ejecutiva de Cuentas","descripcion":"Andrea cre\\u00f3 la Tarea: Programaci\\u00f3n redes sociales HV","created_at":"2017-04-05 18:32:38","img_perfil":null,"link":"\\/ver_tarea\\/86"}', '2017-04-06 12:44:59', '2017-04-05 23:32:38', '2017-04-06 12:44:59'),
('a5812899-b3ac-43a7-b0b4-7e6ec108e742', 'App\\Notifications\\TareaAtencionCuentas', 10, 'App\\User', '{"id_tarea":11,"nombre":"Nestor","cargo":"SEM Performance Manager","descripcion":"Nestor ha devuelto la Tarea: \\"Pauta Descuento Droguer\\u00edas - Gif que Anuncie descuento este 15 de abril)\\" a Atenci\\u00f3n Cuentas","created_at":"2017-04-03 15:08:39","img_perfil":null,"link":"\\/ver_tarea\\/11"}', '2017-04-04 18:58:42', '2017-04-03 20:08:39', '2017-04-04 18:58:42'),
('a5a4c2a7-975b-4997-a154-ee289d3980fa', 'App\\Notifications\\TareaRealizada', 9, 'App\\User', '{"id_tarea":42,"nombre":"Christian","cargo":"Dise\\u00f1ador Gr\\u00e1fico","descripcion":"Christian ha realizado la Tarea: \\"Ajuste en copy piezas promoci\\u00f3n Hero \\" en 1 Hrs","created_at":"2017-04-04 10:16:09","img_perfil":"\\/images\\/avatars\\/Christian_24.png","link":"\\/ver_tarea\\/42"}', '2017-04-04 16:07:06', '2017-04-04 15:16:09', '2017-04-04 16:07:06'),
('a6b9fa56-a735-41ab-a438-069d61a01872', 'App\\Notifications\\TareaProgramada', 21, 'App\\User', '{"id_tarea":41,"nombre":"Luisa Fernanda","cargo":"Encargada de Desarrollo","descripcion":"Luisa Fernanda ha programado la Tarea: Revisi\\u00f3n imagen historia","created_at":"2017-04-03 17:28:32","img_perfil":"\\/images\\/avatars\\/LuisaFernanda_6.png","link":"\\/ver_tarea\\/41"}', '2017-04-03 22:28:41', '2017-04-03 22:28:32', '2017-04-03 22:28:41'),
('a7a07920-12fb-49d3-b211-2fa4be629c4b', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":14,"nombre":"Maria Isabel","cargo":"Proyect Owner","descripcion":"Maria Isabel cre\\u00f3 la Tarea: Pauta concierto de la cuna a la jungla - Cartago","created_at":"2017-03-31 21:48:12","img_perfil":null,"link":"\\/ver_tarea\\/14"}', '2017-04-03 19:13:25', '2017-04-01 02:48:12', '2017-04-03 19:13:25'),
('a7e245d6-5076-465e-b83f-419bb7269883', 'App\\Notifications\\ComentarioNuevoTarea', 5, 'App\\User', '{"id_tarea":141,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  ha comentado en la Tarea: Amplificar video parque acu\\u00e1tico \\"Para personas d...\\"","created_at":"2017-04-07 15:27:18","img_perfil":null,"link":"\\/ver_tarea\\/141"}', NULL, '2017-04-07 20:27:18', '2017-04-07 20:27:18'),
('a81d545f-dae0-4a18-ad30-0a2cfa4d76ce', 'App\\Notifications\\TareaCreada', 4, 'App\\User', '{"id_tarea":110,"nombre":"Jose","cargo":"Director Creativo","descripcion":"Jose cre\\u00f3 la Tarea: Conceptualizaci\\u00f3n y revisi\\u00f3n parrilla manitoba","created_at":"2017-04-07 06:35:30","img_perfil":"\\/images\\/avatars\\/Jose_4.png","link":"\\/ver_tarea\\/110"}', '2017-04-07 11:35:34', '2017-04-07 11:35:30', '2017-04-07 11:35:34'),
('a85d528c-b362-4e83-a1e4-067c84298cea', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":189,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  cre\\u00f3 la Tarea: Amplificar post hoy descuento 20% afiliados","created_at":"2017-04-07 19:16:12","img_perfil":null,"link":"\\/ver_tarea\\/189"}', NULL, '2017-04-08 00:16:12', '2017-04-08 00:16:12'),
('a92dc2e1-0d20-4d4c-9c42-134de87f6565', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":161,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  cre\\u00f3 la Tarea: Informe Pauta Orlando Duque","created_at":"2017-04-07 16:20:43","img_perfil":null,"link":"\\/ver_tarea\\/161"}', NULL, '2017-04-07 21:20:43', '2017-04-07 21:20:43'),
('a96f52cd-f0f0-4dc4-878f-0d3b99a0189d', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":138,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  cre\\u00f3 la Tarea: Amplificar carrusel 2 cincuentazo -trasnoch\\u00f3n","created_at":"2017-04-07 15:03:44","img_perfil":null,"link":"\\/ver_tarea\\/138"}', NULL, '2017-04-07 20:03:44', '2017-04-07 20:03:44'),
('ab02d368-5826-4319-a3be-c7521c8a8157', 'App\\Notifications\\OtCreada', 1, 'App\\User', '{"id_tarea":26,"nombre":" Maria Andrea","cargo":"New Bussines","descripcion":" Maria Andrea ha creado una OT con referencia: 1089, nombre : Creaci\\u00f3n de contenidos para sitio web y valor: $3,980,000","created_at":"2017-04-03 15:57:48","img_perfil":null,"link":"\\/ots\\/visualizar\\/26"}', '2017-04-03 22:38:13', '2017-04-03 20:57:48', '2017-04-03 22:38:13'),
('ab5e6bf0-ff5d-4571-83ce-d33fbcae0723', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":188,"nombre":"Andrea","cargo":"Ejecutiva de Cuentas","descripcion":"Andrea cre\\u00f3 la Tarea: Cambiar nombres Google Search","created_at":"2017-04-07 19:15:22","img_perfil":null,"link":"\\/ver_tarea\\/188"}', NULL, '2017-04-08 00:15:22', '2017-04-08 00:15:22'),
('abcad2c0-805b-416f-a222-846f7d00d35e', 'App\\Notifications\\ComentarioNuevoTarea', 5, 'App\\User', '{"id_tarea":138,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  ha comentado en la Tarea: Amplificar carrusel 2 cincuentazo -trasnoch\\u00f3n \\"Solicitud repet...\\"","created_at":"2017-04-07 15:09:19","img_perfil":null,"link":"\\/ver_tarea\\/138"}', NULL, '2017-04-07 20:09:19', '2017-04-07 20:09:19'),
('ac06393b-4d37-4f57-95f8-d78b0189730c', 'App\\Notifications\\TareaProgramada', 4, 'App\\User', '{"id_tarea":66,"nombre":"Jose","cargo":"Director Creativo","descripcion":"Jose ha programado la Tarea: Realizar Flow Pauta Primero de Mayo","created_at":"2017-04-07 06:20:08","img_perfil":"\\/images\\/avatars\\/Jose_4.png","link":"\\/ver_tarea\\/66"}', '2017-04-07 11:23:53', '2017-04-07 11:20:08', '2017-04-07 11:23:53'),
('aca9564f-c0d4-40bd-89cd-ccd1b411466e', 'App\\Notifications\\TareaCreada', 7, 'App\\User', '{"id_tarea":85,"nombre":"Andrea","cargo":"Ejecutiva de Cuentas","descripcion":"Andrea cre\\u00f3 la Tarea: Cambio de video en sitio web HV","created_at":"2017-04-05 18:27:55","img_perfil":null,"link":"\\/ver_tarea\\/85"}', '2017-04-06 12:44:59', '2017-04-05 23:27:55', '2017-04-06 12:44:59'),
('accdf527-9f2e-4401-b107-edbab9c497d2', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":96,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  cre\\u00f3 la Tarea: Construcci\\u00f3n de Keyword Planner Droguer\\u00edas Sur Cali","created_at":"2017-04-06 11:32:59","img_perfil":null,"link":"\\/ver_tarea\\/96"}', NULL, '2017-04-06 16:32:59', '2017-04-06 16:32:59'),
('adc1b7fe-90d2-4ef6-ba3e-fba679d04c54', 'App\\Notifications\\TareaProgramada', 7, 'App\\User', '{"id_tarea":29,"nombre":"Leonardo","cargo":"Lider de Contenido Escrito","descripcion":"Leonardo ha programado la Tarea: Cambiar nombre del seguro de ProgreSER","created_at":"2017-04-04 17:37:56","img_perfil":"\\/images\\/avatars\\/Leonardo_7.png","link":"\\/ver_tarea\\/29"}', '2017-04-06 12:44:59', '2017-04-04 22:37:56', '2017-04-06 12:44:59'),
('adf59821-c33b-4651-9cbb-c2bd59d539a4', 'App\\Notifications\\TareaProgramada', 5, 'App\\User', '{"id_tarea":190,"nombre":"Nestor","cargo":"SEM Performance Manager","descripcion":"Nestor ha programado la Tarea: Realizar plan de pauta Semana del afiliado","created_at":"2017-04-09 20:10:09","img_perfil":"\\/images\\/avatars\\/Nestor_5.png","link":"\\/ver_tarea\\/190"}', NULL, '2017-04-10 01:10:09', '2017-04-10 01:10:09'),
('ae9ed953-3baa-4172-b832-66b62757a57f', 'App\\Notifications\\TareaProgramada', 16, 'App\\User', '{"id_tarea":44,"nombre":"Leonardo","cargo":"Lider de Contenido Escrito","descripcion":"Leonardo ha programado la Tarea: Cambio en la promoci\\u00f3n de ProgreSER y Hero ","created_at":"2017-04-04 14:33:30","img_perfil":"\\/images\\/avatars\\/Leonardo_7.png","link":"\\/ver_tarea\\/44"}', '2017-04-04 20:46:09', '2017-04-04 19:33:30', '2017-04-04 20:46:09'),
('aea902f4-76f5-46b6-8b8e-19a96c377c51', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":129,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  cre\\u00f3 la Tarea: Informe resultados pauta carruseles revista droguer\\u00edas","created_at":"2017-04-07 14:38:43","img_perfil":null,"link":"\\/ver_tarea\\/129"}', NULL, '2017-04-07 19:38:43', '2017-04-07 19:38:43'),
('aff475ee-a718-48ef-ae34-a1ed719f6b15', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":115,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  cre\\u00f3 la Tarea: Informe Pauta Cincuentazo Abril 12","created_at":"2017-04-07 08:49:20","img_perfil":null,"link":"\\/ver_tarea\\/115"}', NULL, '2017-04-07 13:49:20', '2017-04-07 13:49:20'),
('aff4d42b-0283-4b9e-9f45-34f379711953', 'App\\Notifications\\OtCreada', 1, 'App\\User', '{"id_tarea":35,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  ha creado una OT con referencia: 1100, nombre : Pauta Mes del Ni\\u00f1o y valor: $350,000","created_at":"2017-04-06 11:00:06","img_perfil":null,"link":"\\/ots\\/visualizar\\/35"}', '2017-04-06 16:01:20', '2017-04-06 16:00:06', '2017-04-06 16:01:20'),
('b223ef6d-9f86-40f1-8849-8fe29989754f', 'App\\Notifications\\TareaCreada', 6, 'App\\User', '{"id_tarea":101,"nombre":"Nathalia","cargo":"Account Executive","descripcion":"Nathalia cre\\u00f3 la Tarea: Carga de certificados 10K Semana Santa","created_at":"2017-04-06 18:24:25","img_perfil":null,"link":"\\/ver_tarea\\/101"}', '2017-04-07 12:54:58', '2017-04-06 23:24:25', '2017-04-07 12:54:58'),
('b2542f25-690e-47b1-8cde-257867cbadc8', 'App\\Notifications\\TareaCreada', 9, 'App\\User', '{"id_tarea":81,"nombre":"Nathalia","cargo":"Account Executive","descripcion":"Nathalia cre\\u00f3 la Tarea: Dise\\u00f1o de Internas","created_at":"2017-04-05 17:37:44","img_perfil":null,"link":"\\/ver_tarea\\/81"}', '2017-04-06 13:19:58', '2017-04-05 22:37:44', '2017-04-06 13:19:58'),
('b2b5ccc5-85f1-46a7-b254-0bfbc0a042b6', 'App\\Notifications\\TareaCreada', 9, 'App\\User', '{"id_tarea":42,"nombre":"Andrea","cargo":"Ejecutiva de Cuentas","descripcion":"Andrea cre\\u00f3 la Tarea: Ajuste en copy piezas promoci\\u00f3n Hero ","created_at":"2017-04-03 16:48:19","img_perfil":null,"link":"\\/ver_tarea\\/42"}', '2017-04-03 22:25:36', '2017-04-03 21:48:19', '2017-04-03 22:25:36'),
('b34e553a-b57a-474d-bfb2-a2af340a85d1', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":22,"nombre":"Silvia","cargo":"Ejecutiva de cuentas","descripcion":"Silvia cre\\u00f3 la Tarea: Pauta cursos Cali Abril - Excel avanzado, oficce b\\u00e1sico, tablas din\\u00e1micas","created_at":"2017-03-31 22:28:58","img_perfil":null,"link":"\\/ver_tarea\\/22"}', '2017-04-03 19:13:25', '2017-04-01 03:28:58', '2017-04-03 19:13:25'),
('b43268e8-38be-4daf-bdcf-3c11f828657d', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":151,"nombre":"Andrea","cargo":"Ejecutiva de Cuentas","descripcion":"Andrea cre\\u00f3 la Tarea: Compra de Herramientas ProgreSER abril ","created_at":"2017-04-07 15:57:35","img_perfil":null,"link":"\\/ver_tarea\\/151"}', NULL, '2017-04-07 20:57:35', '2017-04-07 20:57:35'),
('b447d98e-0f67-43fb-ba2e-27a013cd3be6', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":172,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  cre\\u00f3 la Tarea: Informe Pauta celebraci\\u00f3n d\\u00eda de la madres","created_at":"2017-04-07 17:04:55","img_perfil":null,"link":"\\/ver_tarea\\/172"}', NULL, '2017-04-07 22:04:55', '2017-04-07 22:04:55'),
('b4c6e2d3-5176-45ff-884a-4cebb9aa58bb', 'App\\Notifications\\OtCreada', 1, 'App\\User', '{"id_tarea":36,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  ha creado una OT con referencia: 1075, nombre : Pauta Cincuentazo 12 de Abril y valor: $500,000","created_at":"2017-04-06 11:21:50","img_perfil":null,"link":"\\/ots\\/visualizar\\/36"}', '2017-04-06 16:49:54', '2017-04-06 16:21:50', '2017-04-06 16:49:54'),
('b4f8e757-23ab-4379-9728-450034b3e810', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":25,"nombre":"Nestor","cargo":"SEM Performance Manager","descripcion":"Nestor cre\\u00f3 la Tarea: Capacitaci\\u00f3n Directivos de Comfandi","created_at":"2017-04-03 15:37:49","img_perfil":null,"link":"\\/ver_tarea\\/25"}', '2017-04-03 20:38:05', '2017-04-03 20:37:49', '2017-04-03 20:38:05'),
('b53a3fda-39c0-4d0b-9a98-4b70329bc0af', 'App\\Notifications\\TareaEntregada', 3, 'App\\User', '{"id_tarea":68,"nombre":"Luisa Fernanda","cargo":"Development  Leader","descripcion":"Luisa Fernanda entreg\\u00f3 la Tarea: Carga de interactivo 360 y actualiz\\u00f3 el estado a Entregado","created_at":"2017-04-07 13:56:41","img_perfil":"\\/images\\/avatars\\/LuisaFernanda_6.png","link":"\\/ver_tarea\\/68"}', NULL, '2017-04-07 18:56:41', '2017-04-07 18:56:41'),
('b5e5c9de-8c41-42c3-aeb3-2e36bd55fe36', 'App\\Notifications\\OtTiempoExtraAprobado', 2, 'App\\User', '{"id_tarea":2,"nombre":"Maria Isabel","cargo":"Proyect Owner","descripcion":"Maria Isabel ha editado su Orden de trabajo con la referencia #1096 con el nombre Pauta Escuelas Deportiva Tennis deCampo ","created_at":"2017-03-31 21:19:06","img_perfil":null,"link":"\\/ots\\/visualizar\\/2"}', '2017-04-03 21:58:16', '2017-04-01 02:19:06', '2017-04-03 21:58:16'),
('b5e5ef32-0386-4892-87a1-2e5f9706729d', 'App\\Notifications\\TareaCreada', 6, 'App\\User', '{"id_tarea":94,"nombre":"Andrea","cargo":"Ejecutiva de Cuentas","descripcion":"Andrea cre\\u00f3 la Tarea: Maquetado mail ProgreSER P\\u00fablico interno","created_at":"2017-04-06 00:03:53","img_perfil":null,"link":"\\/ver_tarea\\/94"}', '2017-04-06 16:00:14', '2017-04-06 05:03:53', '2017-04-06 16:00:14'),
('b669db0d-fbeb-438e-a37d-0f82b2631a3f', 'App\\Notifications\\ComentarioNuevoTarea', 9, 'App\\User', '{"id_tarea":90,"nombre":"Andrea","cargo":"Ejecutiva de Cuentas","descripcion":"Andrea ha comentado en la Tarea: Dise\\u00f1o piezas feria de cr\\u00e9dito Honda Dream Neo abril \\"Se adjunta pres...\\"","created_at":"2017-04-06 08:19:44","img_perfil":null,"link":"\\/ver_tarea\\/90"}', '2017-04-06 13:19:58', '2017-04-06 13:19:44', '2017-04-06 13:19:58'),
('b6a05a7d-a1a3-4fd4-80ef-dfccf2ad2add', 'App\\Notifications\\TareaCreada', 9, 'App\\User', '{"id_tarea":176,"nombre":"Andrea","cargo":"Ejecutiva de Cuentas","descripcion":"Andrea cre\\u00f3 la Tarea: Despiece interfaces GEV","created_at":"2017-04-07 18:37:50","img_perfil":null,"link":"\\/ver_tarea\\/176"}', NULL, '2017-04-07 23:37:50', '2017-04-07 23:37:50'),
('b6efb95e-4fe5-40c8-baf4-71c1c1e141ae', 'App\\Notifications\\TareaCreada', 4, 'App\\User', '{"id_tarea":36,"nombre":" Maria Andrea","cargo":"New Bussines","descripcion":" Maria Andrea cre\\u00f3 la Tarea: Creaci\\u00f3n Contenidos Productos, Tips y Recetas","created_at":"2017-04-03 16:13:59","img_perfil":null,"link":"\\/ver_tarea\\/36"}', '2017-04-03 21:14:12', '2017-04-03 21:13:59', '2017-04-03 21:14:12'),
('b711d6fd-48c9-4792-8647-9206c718d9de', 'App\\Notifications\\TareaProgramada', 16, 'App\\User', '{"id_tarea":44,"nombre":"Leonardo","cargo":"Lider de Contenido Escrito","descripcion":"Leonardo ha programado la Tarea: Cambio en la promoci\\u00f3n de ProgreSER y Hero ","created_at":"2017-04-04 15:32:06","img_perfil":"\\/images\\/avatars\\/Leonardo_7.png","link":"\\/ver_tarea\\/44"}', '2017-04-04 20:46:09', '2017-04-04 20:32:06', '2017-04-04 20:46:09'),
('b7a75c73-1e22-4019-bf11-cc7f121b703c', 'App\\Notifications\\TareaProgramada', 7, 'App\\User', '{"id_tarea":85,"nombre":"Leonardo","cargo":"Lider de Contenido Escrito","descripcion":"Leonardo ha programado la Tarea: Cambio de video en sitio web HV","created_at":"2017-04-10 07:11:33","img_perfil":"\\/images\\/avatars\\/Leonardo_7.png","link":"\\/ver_tarea\\/85"}', '2017-04-10 12:11:45', '2017-04-10 12:11:33', '2017-04-10 12:11:45'),
('b8823fd5-4f3f-4c52-a5a8-862becbba11d', 'App\\Notifications\\TareaEntregada', 2, 'App\\User', '{"id_tarea":53,"nombre":"Andres Fabian","cargo":"Encargado de Dise\\u00f1o","descripcion":"Andres Fabian entreg\\u00f3 la Tarea: Dise\\u00f1o Mailing Abril conferencia empresarial regionales y actualiz\\u00f3 el estado a Entregado","created_at":"2017-04-05 10:41:40","img_perfil":"\\/images\\/avatars\\/AndresFabian_9.png","link":"\\/ver_tarea\\/53"}', '2017-04-06 19:15:10', '2017-04-05 15:41:40', '2017-04-06 19:15:10'),
('b88aa02c-6049-4935-a9e6-a597f09f9c6c', 'App\\Notifications\\TareaProgramada', 21, 'App\\User', '{"id_tarea":68,"nombre":"Luisa Fernanda","cargo":"Development  Leader","descripcion":"Luisa Fernanda ha programado la Tarea: Carga de interactivo 360","created_at":"2017-04-05 11:57:50","img_perfil":"\\/images\\/avatars\\/LuisaFernanda_6.png","link":"\\/ver_tarea\\/68"}', '2017-04-05 19:38:09', '2017-04-05 16:57:50', '2017-04-05 19:38:09'),
('b8905685-1587-46dd-b3ff-cbf7f21a33b9', 'App\\Notifications\\OtTiempoExtraAprobado', 22, 'App\\User', '{"id_tarea":31,"nombre":"Maria Isabel","cargo":"Proyect Owner","descripcion":"Maria Isabel ha editado su Orden de trabajo con la referencia #1033-4 con el nombre Fee Soporte Sitio Web - Marzo ","created_at":"2017-04-05 16:33:37","img_perfil":null,"link":"\\/ots\\/visualizar\\/31"}', '2017-04-05 22:38:24', '2017-04-05 21:33:37', '2017-04-05 22:38:24'),
('b8992539-80c1-4590-a8a8-8900a71b68b5', 'App\\Notifications\\TareaProgramada', 23, 'App\\User', '{"id_tarea":35,"nombre":"Andres Fabian","cargo":"Encargado de Dise\\u00f1o","descripcion":"Andres Fabian ha programado la Tarea: Dise\\u00f1o pieza mocoa Harinera del Valle ","created_at":"2017-04-04 10:48:05","img_perfil":null,"link":"\\/ver_tarea\\/35"}', '2017-04-04 16:03:35', '2017-04-04 15:48:05', '2017-04-04 16:03:35'),
('b9da44ea-39b7-42ae-ab1b-fcde6791b4c3', 'App\\Notifications\\TareaProgramada', 25, 'App\\User', '{"id_tarea":117,"nombre":"Andres Fabian","cargo":"Encargado de Dise\\u00f1o","descripcion":"Andres Fabian ha programado la Tarea: Piezas emailing conferencias mayo","created_at":"2017-04-07 14:35:22","img_perfil":"\\/images\\/avatars\\/AndresFabian_9.png","link":"\\/ver_tarea\\/117"}', NULL, '2017-04-07 19:35:22', '2017-04-07 19:35:22'),
('ba6093b6-f0d2-40b5-a12d-f30f04d34448', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":146,"nombre":"Andrea","cargo":"Ejecutiva de Cuentas","descripcion":"Andrea cre\\u00f3 la Tarea: Env\\u00edo de mail App ProgreSER interno tarjeta","created_at":"2017-04-07 15:39:31","img_perfil":null,"link":"\\/ver_tarea\\/146"}', NULL, '2017-04-07 20:39:31', '2017-04-07 20:39:31'),
('ba7caf10-c103-4cfb-8dd3-505b98e10934', 'App\\Notifications\\TareaRealizada', 6, 'App\\User', '{"id_tarea":40,"nombre":"Brian","cargo":"Desarrollador","descripcion":"Brian ha realizado la Tarea: \\"Informe de soporte mes de marzo de sitio web\\" en 5 Hrs","created_at":"2017-04-04 16:49:22","img_perfil":"\\/images\\/avatars\\/Brian_21.png","link":"\\/ver_tarea\\/40"}', '2017-04-04 22:41:37', '2017-04-04 21:49:22', '2017-04-04 22:41:37');
INSERT INTO `notifications` (`id`, `type`, `notifiable_id`, `notifiable_type`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('ba9df224-e854-482d-9467-6583ed8ce4e1', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":158,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  cre\\u00f3 la Tarea: Amplificar post Palmira Orlando Duque","created_at":"2017-04-07 16:16:59","img_perfil":null,"link":"\\/ver_tarea\\/158"}', NULL, '2017-04-07 21:16:59', '2017-04-07 21:16:59'),
('bad39ef7-baa9-4ca6-9dc9-010b271ca579', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":16,"nombre":"Silvia","cargo":"Ejecutiva de cuentas","descripcion":"Silvia cre\\u00f3 la Tarea: Informe Resultados Pauta descuentos Droguer\\u00ecas","created_at":"2017-03-31 21:50:50","img_perfil":null,"link":"\\/ver_tarea\\/16"}', '2017-04-03 19:13:25', '2017-04-01 02:50:50', '2017-04-03 19:13:25'),
('bb2c9087-4aa6-4007-8ac8-aa19af444900', 'App\\Notifications\\OtTiempoExtraAprobado', 3, 'App\\User', '{"id_tarea":28,"nombre":"Maria Isabel","cargo":"Proyect Owner","descripcion":"Maria Isabel ha editado su Orden de trabajo con la referencia #1011 con el nombre Implementaci\\u00f3n nuevo sitio web ","created_at":"2017-04-05 14:40:36","img_perfil":null,"link":"\\/ots\\/visualizar\\/28"}', '2017-04-06 19:19:45', '2017-04-05 19:40:36', '2017-04-06 19:19:45'),
('bb3d2707-5dea-4919-ab51-c791c68d336a', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":5,"nombre":"Andrea","cargo":"Ejecutiva de Cuentas","descripcion":"Andrea cre\\u00f3 la Tarea: Pauta concierto de la cuna a la jungla - Cali","created_at":"2017-03-31 21:05:54","img_perfil":null,"link":"\\/ver_tarea\\/5"}', '2017-04-03 19:13:25', '2017-04-01 02:05:54', '2017-04-03 19:13:25'),
('bbaaa6c4-de99-459c-ad53-a5493f48df00', 'App\\Notifications\\TareaProgramada', 5, 'App\\User', '{"id_tarea":25,"nombre":"Nestor","cargo":"SEM Performance Manager","descripcion":"Nestor ha programado la Tarea: Capacitaci\\u00f3n Directivos de Comfandi","created_at":"2017-04-03 15:52:58","img_perfil":null,"link":"\\/ver_tarea\\/25"}', '2017-04-03 20:54:51', '2017-04-03 20:52:58', '2017-04-03 20:54:51'),
('bc50e3e9-dbf7-4fdb-8260-c88ed53adb71', 'App\\Notifications\\TareaProgramada', 25, 'App\\User', '{"id_tarea":74,"nombre":"Andres Fabian","cargo":"Encargado de Dise\\u00f1o","descripcion":"Andres Fabian ha programado la Tarea: Icono de play store para el sitio web","created_at":"2017-04-05 16:35:56","img_perfil":"\\/images\\/avatars\\/AndresFabian_9.png","link":"\\/ver_tarea\\/74"}', '2017-04-06 13:56:50', '2017-04-05 21:35:56', '2017-04-06 13:56:50'),
('bca854d1-88e2-405f-9cba-0753913e7a74', 'App\\Notifications\\TareaRealizada', 6, 'App\\User', '{"id_tarea":55,"nombre":"Luisa Fernanda","cargo":"Development  Leader","descripcion":"Luisa Fernanda ha realizado la Tarea: \\"Revisi\\u00f3n de chat en l\\u00ednea\\" en 0.00 Hrs","created_at":"2017-04-06 17:11:44","img_perfil":"\\/images\\/avatars\\/LuisaFernanda_6.png","link":"\\/ver_tarea\\/55"}', '2017-04-06 22:26:09', '2017-04-06 22:11:44', '2017-04-06 22:26:09'),
('bccb5e5c-bd21-4b4c-acd2-1a1852477f46', 'App\\Notifications\\TareaRealizada', 9, 'App\\User', '{"id_tarea":75,"nombre":"Andres Fabian","cargo":"Encargado de Dise\\u00f1o","descripcion":"Andres Fabian ha realizado la Tarea: \\"Realizaci\\u00f3n wireframes\\" en 3.5 Hrs","created_at":"2017-04-05 17:39:23","img_perfil":"\\/images\\/avatars\\/AndresFabian_9.png","link":"\\/ver_tarea\\/75"}', '2017-04-06 13:19:58', '2017-04-05 22:39:23', '2017-04-06 13:19:58'),
('bf745131-a935-4ee0-99b7-fd025c6d4663', 'App\\Notifications\\OtTiempoExtraAprobado', 3, 'App\\User', '{"id_tarea":20,"nombre":"Maria Isabel","cargo":"Proyect Owner","descripcion":"Maria Isabel ha editado su Orden de trabajo con la referencia #970 con el nombre Implementaci\\u00f3n nuevo sitio web ","created_at":"2017-04-05 14:49:55","img_perfil":null,"link":"\\/ots\\/visualizar\\/20"}', '2017-04-06 19:19:45', '2017-04-05 19:49:55', '2017-04-06 19:19:45'),
('c0172937-6108-4ea4-925d-9ddf6bf74bc0', 'App\\Notifications\\TareaRealizada', 9, 'App\\User', '{"id_tarea":72,"nombre":"Alejandro","cargo":"Practicante en Dise\\u00f1o Gr\\u00e1fico","descripcion":"Alejandro ha realizado la Tarea: \\"Ajuste Ent\\u00e9rate nueva sede Jamund\\u00ed\\" en 0.5 Hrs","created_at":"2017-04-05 16:08:01","img_perfil":null,"link":"\\/ver_tarea\\/72"}', '2017-04-05 21:27:57', '2017-04-05 21:08:01', '2017-04-05 21:27:57'),
('c020e2e6-f8f1-49c4-8216-455ba57634ac', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":8,"nombre":"Silvia","cargo":"Ejecutiva de cuentas","descripcion":"Silvia cre\\u00f3 la Tarea: Pauta Descuento Droguer\\u00edas - Pieza HOY 10% de descuento","created_at":"2017-03-31 21:27:52","img_perfil":null,"link":"\\/ver_tarea\\/8"}', '2017-04-03 19:13:25', '2017-04-01 02:27:52', '2017-04-03 19:13:25'),
('c0dcdaba-f111-4098-a13c-acf1b94bfbc3', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":144,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  cre\\u00f3 la Tarea: Amplificar post nuevo punto de la 14","created_at":"2017-04-07 15:37:19","img_perfil":null,"link":"\\/ver_tarea\\/144"}', NULL, '2017-04-07 20:37:19', '2017-04-07 20:37:19'),
('c1f9f5af-7d60-436a-992d-2c08488656e7', 'App\\Notifications\\TareaCreada', 9, 'App\\User', '{"id_tarea":79,"nombre":"Nathalia","cargo":"Account Executive","descripcion":"Nathalia cre\\u00f3 la Tarea: Ajustes en Wireframes","created_at":"2017-04-05 17:00:30","img_perfil":null,"link":"\\/ver_tarea\\/79"}', '2017-04-06 13:19:58', '2017-04-05 22:00:30', '2017-04-06 13:19:58'),
('c2d30fca-36f6-4c56-9009-d559d862e26f', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":27,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  cre\\u00f3 la Tarea: Informe Mensual SEO Abril","created_at":"2017-04-03 16:59:31","img_perfil":null,"link":"\\/ver_tarea\\/27"}', NULL, '2017-04-03 21:59:31', '2017-04-03 21:59:31'),
('c2e72f88-c800-4ab0-81c5-a68d6a44ca4c', 'App\\Notifications\\TareaCreada', 6, 'App\\User', '{"id_tarea":95,"nombre":" Maria Andrea","cargo":"New Bussines","descripcion":" Maria Andrea cre\\u00f3 la Tarea: Creaci\\u00f3n de cuentas de correo","created_at":"2017-04-06 11:27:59","img_perfil":null,"link":"\\/ver_tarea\\/95"}', '2017-04-06 16:40:08', '2017-04-06 16:27:59', '2017-04-06 16:40:08'),
('c3109b96-c0e4-42a1-9947-e5fae5cd950a', 'App\\Notifications\\TareaProgramada', 16, 'App\\User', '{"id_tarea":31,"nombre":"Leonardo","cargo":"Lider de Contenido Escrito","descripcion":"Leonardo ha programado la Tarea: Notas app ProgreSER","created_at":"2017-04-03 15:42:25","img_perfil":"\\/images\\/avatars\\/Leonardo_7.png","link":"\\/ver_tarea\\/31"}', '2017-04-04 20:46:09', '2017-04-03 20:42:25', '2017-04-04 20:46:09'),
('c3ac76de-c73e-4dc1-8623-fdfa0627b587', 'App\\Notifications\\TareaEntregada', 11, 'App\\User', '{"id_tarea":93,"nombre":"Luisa Fernanda","cargo":"Development  Leader","descripcion":"Luisa Fernanda entreg\\u00f3 la Tarea: Maquetado mails p\\u00fablico  externo app ProgreSER y actualiz\\u00f3 el estado a Entregado","created_at":"2017-04-06 17:08:02","img_perfil":"\\/images\\/avatars\\/LuisaFernanda_6.png","link":"\\/ver_tarea\\/93"}', '2017-04-06 23:33:05', '2017-04-06 22:08:02', '2017-04-06 23:33:05'),
('c3dac0c6-dd90-4ad4-9c2a-223e69e54e95', 'App\\Notifications\\TareaProgramada', 16, 'App\\User', '{"id_tarea":49,"nombre":"Leonardo","cargo":"Lider de Contenido Escrito","descripcion":"Leonardo ha programado la Tarea: Ajuste de noticia Wapp","created_at":"2017-04-04 14:38:11","img_perfil":"\\/images\\/avatars\\/Leonardo_7.png","link":"\\/ver_tarea\\/49"}', '2017-04-04 20:46:09', '2017-04-04 19:38:11', '2017-04-04 20:46:09'),
('c419607f-7085-4883-bc2c-04001f98a280', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":3,"nombre":"Silvia","cargo":"Ejecutiva de cuentas","descripcion":"Silvia cre\\u00f3 la Tarea: Pauta Tennis de campo","created_at":"2017-03-31 20:54:38","img_perfil":null,"link":"\\/ver_tarea\\/3"}', '2017-04-03 19:13:25', '2017-04-01 01:54:38', '2017-04-03 19:13:25'),
('c483aaf4-7997-4957-b0d9-22ded9c5410f', 'App\\Notifications\\TareaEntregada', 22, 'App\\User', '{"id_tarea":45,"nombre":"Andres Fabian","cargo":"Encargado de Dise\\u00f1o","descripcion":"Andres Fabian entreg\\u00f3 la Tarea: Revisi\\u00f3n video 3 HV off line y actualiz\\u00f3 el estado a Entregado","created_at":"2017-04-04 17:59:18","img_perfil":"\\/images\\/avatars\\/AndresFabian_9.png","link":"\\/ver_tarea\\/45"}', '2017-04-05 22:38:24', '2017-04-04 22:59:18', '2017-04-05 22:38:24'),
('c48e5c48-bf90-4601-8c09-5aec3d5eb28a', 'App\\Notifications\\TareaCreada', 6, 'App\\User', '{"id_tarea":127,"nombre":"Luisa Fernanda","cargo":"Development  Leader","descripcion":"Luisa Fernanda cre\\u00f3 la Tarea: Organizaci\\u00f3n cuadro de compras","created_at":"2017-04-07 14:36:30","img_perfil":"\\/images\\/avatars\\/LuisaFernanda_6.png","link":"\\/ver_tarea\\/127"}', '2017-04-07 19:36:40', '2017-04-07 19:36:30', '2017-04-07 19:36:40'),
('c541000f-8356-4852-b405-495ab6162a5d', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":6,"nombre":"Silvia","cargo":"Ejecutiva de cuentas","descripcion":"Silvia cre\\u00f3 la Tarea: Pauta Descuento Droguer\\u00edas - Pieza HOY 10% de descuento","created_at":"2017-03-31 21:12:33","img_perfil":null,"link":"\\/ver_tarea\\/6"}', '2017-04-03 19:13:25', '2017-04-01 02:12:33', '2017-04-03 19:13:25'),
('c541f119-0c5b-4b9a-8aaf-bdf658ad9856', 'App\\Notifications\\TareaProgramada', 24, 'App\\User', '{"id_tarea":134,"nombre":"Andres Fabian","cargo":"Encargado de Dise\\u00f1o","descripcion":"Andres Fabian ha programado la Tarea: Dise\\u00f1o de piezas pauta","created_at":"2017-04-07 16:34:39","img_perfil":"\\/images\\/avatars\\/AndresFabian_9.png","link":"\\/ver_tarea\\/134"}', NULL, '2017-04-07 21:34:39', '2017-04-07 21:34:39'),
('c65c9e76-e09b-4088-838c-fbadbc4c7d16', 'App\\Notifications\\TareaCreada', 4, 'App\\User', '{"id_tarea":61,"nombre":"Jose","cargo":"Director Creativo","descripcion":"Jose cre\\u00f3 la Tarea: Reuni\\u00f3n de tr\\u00e1fico","created_at":"2017-04-04 13:31:55","img_perfil":"\\/images\\/avatars\\/Jose_4.png","link":"\\/ver_tarea\\/61"}', '2017-04-04 18:32:01', '2017-04-04 18:31:55', '2017-04-04 18:32:01'),
('c6cc20ea-55c8-4b8d-bd04-3f5df858a17b', 'App\\Notifications\\TareaCreada', 9, 'App\\User', '{"id_tarea":52,"nombre":" Maria Andrea","cargo":"New Bussines","descripcion":" Maria Andrea cre\\u00f3 la Tarea: Dise\\u00f1o de p\\u00e1ginas internas","created_at":"2017-04-04 10:14:41","img_perfil":null,"link":"\\/ver_tarea\\/52"}', '2017-04-04 16:07:06', '2017-04-04 15:14:41', '2017-04-04 16:07:06'),
('c79aa119-c523-44fa-94d2-eb4bc9912cd6', 'App\\Notifications\\OtCreada', 1, 'App\\User', '{"id_tarea":54,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  ha creado una OT con referencia: 1122, nombre : Pauta Orlando Duque y valor: $600,000","created_at":"2017-04-07 16:15:11","img_perfil":null,"link":"\\/ots\\/visualizar\\/54"}', '2017-04-09 02:12:45', '2017-04-07 21:15:11', '2017-04-09 02:12:45'),
('c8522bd9-1ce8-4608-8444-c433ee6de565', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":123,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  cre\\u00f3 la Tarea: Informe pauta mes del ni\\u00f1o","created_at":"2017-04-07 14:30:07","img_perfil":null,"link":"\\/ver_tarea\\/123"}', NULL, '2017-04-07 19:30:07', '2017-04-07 19:30:07'),
('c8d9db13-a2f2-4f1e-a44c-da221a8c3e30', 'App\\Notifications\\TareaAtencionCuentas', 3, 'App\\User', '{"id_tarea":55,"nombre":"Luisa Fernanda","cargo":"Development  Leader","descripcion":"Luisa Fernanda ha devuelto la Tarea: \\"Revisi\\u00f3n de chat en l\\u00ednea\\" a Atenci\\u00f3n Cuentas","created_at":"2017-04-04 14:36:46","img_perfil":"\\/images\\/avatars\\/LuisaFernanda_6.png","link":"\\/ver_tarea\\/55"}', '2017-04-06 19:19:45', '2017-04-04 19:36:46', '2017-04-06 19:19:45'),
('c95d4c6f-30b9-460e-aec5-bc92692ad28c', 'App\\Notifications\\TareaProgramada', 9, 'App\\User', '{"id_tarea":70,"nombre":"Andres Fabian","cargo":"Encargado de Dise\\u00f1o","descripcion":"Andres Fabian ha programado la Tarea: Reunion ProgreSER","created_at":"2017-04-05 10:46:04","img_perfil":"\\/images\\/avatars\\/AndresFabian_9.png","link":"\\/ver_tarea\\/70"}', '2017-04-05 19:53:35', '2017-04-05 15:46:04', '2017-04-05 19:53:35'),
('cb8c6c0c-7a1b-4e4a-a6a1-6aaa6c70bf92', 'App\\Notifications\\TareaRealizada', 9, 'App\\User', '{"id_tarea":56,"nombre":"Zuly","cargo":"Dise\\u00f1adora Gr\\u00e1fica","descripcion":"Zuly ha realizado la Tarea: \\"Cambio de fotos Harinera del Valle parrilla \\" en 0.5 Hrs","created_at":"2017-04-04 11:57:00","img_perfil":"\\/images\\/avatars\\/Zuly_23.png","link":"\\/ver_tarea\\/56"}', '2017-04-04 19:03:56', '2017-04-04 16:57:00', '2017-04-04 19:03:56'),
('cbcbf14b-2c4b-4bed-a98f-5f36f40cfe76', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":145,"nombre":"Andrea","cargo":"Ejecutiva de Cuentas","descripcion":"Andrea cre\\u00f3 la Tarea: Env\\u00edo de mail App ProgreSER interno tarjeta","created_at":"2017-04-07 15:39:30","img_perfil":null,"link":"\\/ver_tarea\\/145"}', NULL, '2017-04-07 20:39:30', '2017-04-07 20:39:30'),
('cc9eefef-b388-40a9-ac65-cbf225dae99b', 'App\\Notifications\\TareaRealizada', 6, 'App\\User', '{"id_tarea":93,"nombre":"Alvaro Jose","cargo":" Ingeniero de desarrollo","descripcion":"Alvaro Jose ha realizado la Tarea: \\"Maquetado mails p\\u00fablico  externo app ProgreSER\\" en 0.5 Hrs","created_at":"2017-04-06 16:21:09","img_perfil":"\\/images\\/avatars\\/AlvaroJose_13.png","link":"\\/ver_tarea\\/93"}', '2017-04-06 22:07:12', '2017-04-06 21:21:09', '2017-04-06 22:07:12'),
('cd2b77a5-d4c3-4c3a-8cac-11b74f9e6621', 'App\\Notifications\\TareaCreada', 6, 'App\\User', '{"id_tarea":68,"nombre":" Maria Andrea","cargo":"New Bussines","descripcion":" Maria Andrea cre\\u00f3 la Tarea: Carga de interactivo 360","created_at":"2017-04-05 08:19:33","img_perfil":null,"link":"\\/ver_tarea\\/68"}', '2017-04-05 16:50:17', '2017-04-05 13:19:33', '2017-04-05 16:50:17'),
('cd88e397-455c-4d82-a38d-db831b36d48a', 'App\\Notifications\\TareaProgramada', 6, 'App\\User', '{"id_tarea":67,"nombre":"Luisa Fernanda","cargo":"Development  Leader","descripcion":"Luisa Fernanda ha programado la Tarea: Compra espacio Hosting","created_at":"2017-04-06 11:03:00","img_perfil":"\\/images\\/avatars\\/LuisaFernanda_6.png","link":"\\/ver_tarea\\/67"}', '2017-04-06 16:27:57', '2017-04-06 16:03:00', '2017-04-06 16:27:57'),
('cda8b97a-5913-4204-8473-6edf6d824474', 'App\\Notifications\\TareaEntregada', 22, 'App\\User', '{"id_tarea":41,"nombre":"Luisa Fernanda","cargo":"Development  Leader","descripcion":"Luisa Fernanda entreg\\u00f3 la Tarea: Revisi\\u00f3n imagen historia y actualiz\\u00f3 el estado a Entregado","created_at":"2017-04-04 17:40:30","img_perfil":"\\/images\\/avatars\\/LuisaFernanda_6.png","link":"\\/ver_tarea\\/41"}', '2017-04-05 22:38:24', '2017-04-04 22:40:30', '2017-04-05 22:38:24'),
('cde02438-77ce-4656-9044-fd907b369e3a', 'App\\Notifications\\OtCreada', 1, 'App\\User', '{"id_tarea":53,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  ha creado una OT con referencia: 1120, nombre : Pauta Video Rocksito y valor: $500,000","created_at":"2017-04-07 15:55:17","img_perfil":null,"link":"\\/ots\\/visualizar\\/53"}', '2017-04-09 02:12:45', '2017-04-07 20:55:17', '2017-04-09 02:12:45'),
('ce909993-2590-4fcd-9f61-77b0f0ff4037', 'App\\Notifications\\OtCreada', 1, 'App\\User', '{"id_tarea":34,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  ha creado una OT con referencia: 1098, nombre : Pauta Droguer\\u00edas Sur Cali y valor: $2,000,000","created_at":"2017-04-06 10:23:03","img_perfil":null,"link":"\\/ots\\/visualizar\\/34"}', '2017-04-06 16:01:20', '2017-04-06 15:23:03', '2017-04-06 16:01:20'),
('ce9fefe8-60f8-4881-8490-7a6e23d4a24b', 'App\\Notifications\\TareaEntregada', 11, 'App\\User', '{"id_tarea":65,"nombre":"Andres Fabian","cargo":"Encargado de Dise\\u00f1o","descripcion":"Andres Fabian entreg\\u00f3 la Tarea: Gr\\u00e1ficos 3 HV y actualiz\\u00f3 el estado a Entregado","created_at":"2017-04-07 09:28:32","img_perfil":"\\/images\\/avatars\\/AndresFabian_9.png","link":"\\/ver_tarea\\/65"}', NULL, '2017-04-07 14:28:32', '2017-04-07 14:28:32'),
('cfc9c4db-c429-4562-b0ee-af816517af14', 'App\\Notifications\\TareaRealizada', 7, 'App\\User', '{"id_tarea":49,"nombre":"Alexandra","cargo":"Practicante en Contenidos - CM","descripcion":"Alexandra ha realizado la Tarea: \\"Ajuste de noticia Wapp\\" en 30 Hrs","created_at":"2017-04-06 12:06:57","img_perfil":null,"link":"\\/ver_tarea\\/49"}', '2017-04-06 18:26:34', '2017-04-06 17:06:57', '2017-04-06 18:26:34'),
('d02382dd-e271-442e-93a1-528786cbbe38', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":170,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  cre\\u00f3 la Tarea: Amplificaci\\u00f3n Post Celebraci\\u00f3n d\\u00eda de las madres","created_at":"2017-04-07 16:51:52","img_perfil":null,"link":"\\/ver_tarea\\/170"}', NULL, '2017-04-07 21:51:52', '2017-04-07 21:51:52'),
('d038d1e9-2151-42fc-bc25-708d3dfca2fd', 'App\\Notifications\\TareaProgramada', 6, 'App\\User', '{"id_tarea":76,"nombre":"Luisa Fernanda","cargo":"Development  Leader","descripcion":"Luisa Fernanda ha programado la Tarea: Realizaci\\u00f3n de Flujos cat\\u00e1logo ","created_at":"2017-04-06 08:27:23","img_perfil":"\\/images\\/avatars\\/LuisaFernanda_6.png","link":"\\/ver_tarea\\/76"}', '2017-04-06 16:00:14', '2017-04-06 13:27:23', '2017-04-06 16:00:14'),
('d05ef573-6dd8-4857-9a10-e9ca17314150', 'App\\Notifications\\TareaProgramada', 25, 'App\\User', '{"id_tarea":50,"nombre":"Andres Fabian","cargo":"Encargado de Dise\\u00f1o","descripcion":"Andres Fabian ha programado la Tarea: Ent\\u00e9rate Nueva ubicaci\\u00f3n Agencia Empleo","created_at":"2017-04-04 11:31:00","img_perfil":"\\/images\\/avatars\\/AndresFabian_9.png","link":"\\/ver_tarea\\/50"}', '2017-04-06 13:56:50', '2017-04-04 16:31:00', '2017-04-06 13:56:50'),
('d14600e9-1e81-4cdb-bc7a-5bad5dabb589', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":112,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  cre\\u00f3 la Tarea: Informe Pauta Cursos Abril","created_at":"2017-04-07 08:35:05","img_perfil":null,"link":"\\/ver_tarea\\/112"}', NULL, '2017-04-07 13:35:05', '2017-04-07 13:35:05'),
('d17ed0b7-6876-4cc4-b027-ce6234a21c3e', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":7,"nombre":"Silvia","cargo":"Ejecutiva de cuentas","descripcion":"Silvia cre\\u00f3 la Tarea: Pauta Descuento Droguer\\u00edas - Gif que Anuncie descuento 15 de abril","created_at":"2017-03-31 21:25:38","img_perfil":null,"link":"\\/ver_tarea\\/7"}', '2017-04-03 19:13:25', '2017-04-01 02:25:38', '2017-04-03 19:13:25'),
('d1964a7b-945e-46d7-81c5-851a75888765', 'App\\Notifications\\TareaEntregada', 2, 'App\\User', '{"id_tarea":37,"nombre":"Andres Fabian","cargo":"Encargado de Dise\\u00f1o","descripcion":"Andres Fabian entreg\\u00f3 la Tarea: Graficar Vacantes y convocatorias Agencias Empleo y actualiz\\u00f3 el estado a Entregado","created_at":"2017-04-03 17:58:23","img_perfil":null,"link":"\\/ver_tarea\\/37"}', '2017-04-04 16:03:04', '2017-04-03 22:58:23', '2017-04-04 16:03:04'),
('d1d84552-2dc1-4446-af7d-007c526992a4', 'App\\Notifications\\TareaEntregada', 11, 'App\\User', '{"id_tarea":90,"nombre":"Andres Fabian","cargo":"Encargado de Dise\\u00f1o","descripcion":"Andres Fabian entreg\\u00f3 la Tarea: Dise\\u00f1o piezas feria de cr\\u00e9dito Honda Dream Neo abril y actualiz\\u00f3 el estado a Entregado","created_at":"2017-04-07 09:32:13","img_perfil":"\\/images\\/avatars\\/AndresFabian_9.png","link":"\\/ver_tarea\\/90"}', NULL, '2017-04-07 14:32:13', '2017-04-07 14:32:13'),
('d1ebe0b1-f433-48fc-bb46-398a3f9ed1d4', 'App\\Notifications\\TareaProgramada', 14, 'App\\User', '{"id_tarea":141,"nombre":"Nestor","cargo":"SEM Performance Manager","descripcion":"Nestor ha programado la Tarea: Amplificar video parque acu\\u00e1tico","created_at":"2017-04-09 20:43:15","img_perfil":"\\/images\\/avatars\\/Nestor_5.png","link":"\\/ver_tarea\\/141"}', NULL, '2017-04-10 01:43:15', '2017-04-10 01:43:15'),
('d1f1627c-8baf-4217-9ead-e4d66a709279', 'App\\Notifications\\TareaCreada', 9, 'App\\User', '{"id_tarea":73,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  cre\\u00f3 la Tarea: Ajustes emailing Conferencia regionales Abril","created_at":"2017-04-05 15:31:21","img_perfil":null,"link":"\\/ver_tarea\\/73"}', '2017-04-05 20:32:10', '2017-04-05 20:31:21', '2017-04-05 20:32:10'),
('d31bb526-d726-430a-85e8-e1093754368c', 'App\\Notifications\\OtCreada', 1, 'App\\User', '{"id_tarea":47,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  ha creado una OT con referencia: 1099, nombre : Pauta Tour hacienda tablones y valor: $400,000","created_at":"2017-04-07 14:26:20","img_perfil":null,"link":"\\/ots\\/visualizar\\/47"}', '2017-04-09 02:12:45', '2017-04-07 19:26:20', '2017-04-09 02:12:45'),
('d32d82df-70f9-4ed8-a9f1-5ab37e99845a', 'App\\Notifications\\OtCreada', 1, 'App\\User', '{"id_tarea":25,"nombre":"Nathalia","cargo":"Account Executive","descripcion":"Nathalia ha creado una OT con referencia: 1108-4, nombre : Soporte Sitio Web y valor: $300,000","created_at":"2017-04-03 15:48:41","img_perfil":null,"link":"\\/ots\\/visualizar\\/25"}', '2017-04-03 22:38:13', '2017-04-03 20:48:41', '2017-04-03 22:38:13'),
('d390090a-8146-48a5-b059-6d6f00552f98', 'App\\Notifications\\OtCreada', 1, 'App\\User', '{"id_tarea":32,"nombre":"Nathalia","cargo":"Account Executive","descripcion":"Nathalia ha creado una OT con referencia: 977, nombre : Dise\\u00f1o y desarrollo de Sitio Web y valor: $9,950,000","created_at":"2017-04-05 16:47:14","img_perfil":null,"link":"\\/ots\\/visualizar\\/32"}', '2017-04-05 22:15:54', '2017-04-05 21:47:14', '2017-04-05 22:15:54'),
('d3d32252-7b4c-4a87-ae9d-4c7f6fc98f56', 'App\\Notifications\\TareaProgramada', 14, 'App\\User', '{"id_tarea":132,"nombre":"Nestor","cargo":"SEM Performance Manager","descripcion":"Nestor ha programado la Tarea: Amplificar post Descuento Jhonson\\"s","created_at":"2017-04-09 20:30:15","img_perfil":"\\/images\\/avatars\\/Nestor_5.png","link":"\\/ver_tarea\\/132"}', NULL, '2017-04-10 01:30:15', '2017-04-10 01:30:15'),
('d51ade15-8809-4f4b-af09-e202d2f4022f', 'App\\Notifications\\TareaCreada', 9, 'App\\User', '{"id_tarea":90,"nombre":"Andrea","cargo":"Ejecutiva de Cuentas","descripcion":"Andrea cre\\u00f3 la Tarea: Dise\\u00f1o piezas feria de cr\\u00e9dito Honda Dream Neo abril","created_at":"2017-04-05 23:10:03","img_perfil":null,"link":"\\/ver_tarea\\/90"}', '2017-04-06 13:19:58', '2017-04-06 04:10:03', '2017-04-06 13:19:58'),
('d585d581-0f55-4f6d-aba0-cd59d460d378', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":166,"nombre":"Andrea","cargo":"Ejecutiva de Cuentas","descripcion":"Andrea cre\\u00f3 la Tarea: Implementaci\\u00f3n pieza pauta engagement ProgreSER","created_at":"2017-04-07 16:37:14","img_perfil":null,"link":"\\/ver_tarea\\/166"}', NULL, '2017-04-07 21:37:14', '2017-04-07 21:37:14'),
('d67e455b-66be-4673-869e-4df06bf9e6ce', 'App\\Notifications\\TareaRealizada', 6, 'App\\User', '{"id_tarea":68,"nombre":"Brian","cargo":"Desarrollador","descripcion":"Brian ha realizado la Tarea: \\"Carga de interactivo 360\\" en 1 Hrs","created_at":"2017-04-07 08:35:05","img_perfil":"\\/images\\/avatars\\/Brian_21.png","link":"\\/ver_tarea\\/68"}', '2017-04-07 16:40:03', '2017-04-07 13:35:05', '2017-04-07 16:40:03'),
('d6ba8301-a345-42b3-8de3-8353d9791532', 'App\\Notifications\\TareaRealizada', 6, 'App\\User', '{"id_tarea":67,"nombre":"Luisa Fernanda","cargo":"Development  Leader","descripcion":"Luisa Fernanda ha realizado la Tarea: \\"Compra espacio Hosting\\" en 1 Hrs","created_at":"2017-04-06 11:17:15","img_perfil":"\\/images\\/avatars\\/LuisaFernanda_6.png","link":"\\/ver_tarea\\/67"}', '2017-04-06 16:27:57', '2017-04-06 16:17:15', '2017-04-06 16:27:57'),
('d6d51b60-de79-407c-bcb3-9bf0541e0a34', 'App\\Notifications\\TareaProgramada', 15, 'App\\User', '{"id_tarea":129,"nombre":"Nestor","cargo":"SEM Performance Manager","descripcion":"Nestor ha programado la Tarea: Informe resultados pauta carruseles revista droguer\\u00edas","created_at":"2017-04-09 20:36:15","img_perfil":"\\/images\\/avatars\\/Nestor_5.png","link":"\\/ver_tarea\\/129"}', NULL, '2017-04-10 01:36:15', '2017-04-10 01:36:15'),
('d6eefa4b-2882-44d5-882e-f3d912cd9729', 'App\\Notifications\\OtTiempoExtraAprobado', 22, 'App\\User', '{"id_tarea":38,"nombre":"Maria Isabel","cargo":"Proyect Owner","descripcion":"Maria Isabel ha editado su Orden de trabajo con la referencia #1112 con el nombre Ajustes y actualizaci\\u00f3n de Formulario Inscripciones Media Marat\\u00f3n Cali ","created_at":"2017-04-06 11:50:36","img_perfil":null,"link":"\\/ots\\/visualizar\\/38"}', '2017-04-06 16:55:33', '2017-04-06 16:50:36', '2017-04-06 16:55:33'),
('d6f8c963-b77d-4d9d-b122-3bdaff2e25dd', 'App\\Notifications\\TareaRealizada', 6, 'App\\User', '{"id_tarea":38,"nombre":"Brian","cargo":"Desarrollador","descripcion":"Brian ha realizado la Tarea: \\"Ajuste bot\\u00f3n de Proveedores\\" en 0.4 Hrs","created_at":"2017-04-04 08:31:11","img_perfil":"\\/images\\/avatars\\/Brian_21.png","link":"\\/ver_tarea\\/38"}', '2017-04-04 16:00:09', '2017-04-04 13:31:11', '2017-04-04 16:00:09'),
('d75d7c3b-1ff5-4831-8983-7ccca4d35eca', 'App\\Notifications\\OtExcedeTiempo', 22, 'App\\User', '{"id_tarea":25,"nombre":"Brian","cargo":"Desarrollador","descripcion":"#1108-4 - Soporte Sitio Web ha excedido el tiempo asignado para el \\u00c1rea Desarrollo","created_at":"2017-04-06 17:57:56","img_perfil":"\\/images\\/avatars\\/Brian_21.png","link":"\\/ots\\/visualizar\\/25"}', '2017-04-06 23:24:30', '2017-04-06 22:57:56', '2017-04-06 23:24:30'),
('d7af41ad-8dcf-4d89-b6c3-f16bdf91c9d9', 'App\\Notifications\\TareaProgramada', 6, 'App\\User', '{"id_tarea":102,"nombre":"Luisa Fernanda","cargo":"Development  Leader","descripcion":"Luisa Fernanda ha programado la Tarea: Creaci\\u00f3n de cuentas de correo ","created_at":"2017-04-07 12:36:30","img_perfil":"\\/images\\/avatars\\/LuisaFernanda_6.png","link":"\\/ver_tarea\\/102"}', '2017-04-07 18:55:39', '2017-04-07 17:36:30', '2017-04-07 18:55:39'),
('d997187e-93f1-4a46-95c9-f41e1dba0412', 'App\\Notifications\\TareaProgramada', 9, 'App\\User', '{"id_tarea":79,"nombre":"Andres Fabian","cargo":"Encargado de Dise\\u00f1o","descripcion":"Andres Fabian ha programado la Tarea: Ajustes en Wireframes","created_at":"2017-04-05 17:58:39","img_perfil":"\\/images\\/avatars\\/AndresFabian_9.png","link":"\\/ver_tarea\\/79"}', '2017-04-06 13:19:58', '2017-04-05 22:58:39', '2017-04-06 13:19:58'),
('d9d422dd-48cc-49b3-a774-37d7a75d55be', 'App\\Notifications\\TareaProgramada', 21, 'App\\User', '{"id_tarea":101,"nombre":"Luisa Fernanda","cargo":"Development  Leader","descripcion":"Luisa Fernanda ha programado la Tarea: Carga de certificados 10K Semana Santa","created_at":"2017-04-07 08:37:02","img_perfil":"\\/images\\/avatars\\/LuisaFernanda_6.png","link":"\\/ver_tarea\\/101"}', '2017-04-07 13:37:46', '2017-04-07 13:37:02', '2017-04-07 13:37:46'),
('db5f94d2-c1bd-46a2-8583-8c4fd4184f42', 'App\\Notifications\\TareaCreada', 9, 'App\\User', '{"id_tarea":187,"nombre":"Silvia","cargo":"Ejecutiva de cuentas","descripcion":"Silvia cre\\u00f3 la Tarea: Dise\\u00f1o de Internas","created_at":"2017-04-07 19:14:57","img_perfil":null,"link":"\\/ver_tarea\\/187"}', NULL, '2017-04-08 00:14:57', '2017-04-08 00:14:57'),
('db758f1b-cfa7-4635-a40d-659843bd32c7', 'App\\Notifications\\OtCreada', 1, 'App\\User', '{"id_tarea":60,"nombre":"Andrea","cargo":"Ejecutiva de Cuentas","descripcion":"Andrea ha creado una OT con referencia: 1115 -2, nombre : Fee administraci\\u00f3n contenidos sitio web y valor: $10,990,000","created_at":"2017-04-07 17:18:06","img_perfil":null,"link":"\\/ots\\/visualizar\\/60"}', '2017-04-09 02:12:45', '2017-04-07 22:18:06', '2017-04-09 02:12:45'),
('db9a54e2-a0f6-4814-96c3-3ba4133f8e87', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":153,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  cre\\u00f3 la Tarea: Amplificar video Tulu\\u00e1 Rocksito","created_at":"2017-04-07 16:01:08","img_perfil":null,"link":"\\/ver_tarea\\/153"}', NULL, '2017-04-07 21:01:08', '2017-04-07 21:01:08'),
('dc2f24a8-dcfc-4f69-b61c-e6841c373a0a', 'App\\Notifications\\TareaRealizada', 6, 'App\\User', '{"id_tarea":102,"nombre":"Luisa Fernanda","cargo":"Development  Leader","descripcion":"Luisa Fernanda ha realizado la Tarea: \\"Creaci\\u00f3n de cuentas de correo \\" en 1.00 Hrs","created_at":"2017-04-07 12:36:42","img_perfil":"\\/images\\/avatars\\/LuisaFernanda_6.png","link":"\\/ver_tarea\\/102"}', '2017-04-07 18:55:39', '2017-04-07 17:36:42', '2017-04-07 18:55:39'),
('dc6d530e-e7a2-4081-bbb8-4228305d1746', 'App\\Notifications\\TareaCreada', 7, 'App\\User', '{"id_tarea":88,"nombre":"Andrea","cargo":"Ejecutiva de Cuentas","descripcion":"Andrea cre\\u00f3 la Tarea: T\\u00e9rminos y condiciones actividad app ProgreSER redes","created_at":"2017-04-05 22:30:06","img_perfil":null,"link":"\\/ver_tarea\\/88"}', '2017-04-06 12:44:59', '2017-04-06 03:30:06', '2017-04-06 12:44:59'),
('ddfe9e0e-b77e-4e93-b41d-27bc670c860f', 'App\\Notifications\\TareaCreada', 7, 'App\\User', '{"id_tarea":49,"nombre":"Andrea","cargo":"Ejecutiva de Cuentas","descripcion":"Andrea cre\\u00f3 la Tarea: Ajuste de noticia Wapp","created_at":"2017-04-03 18:34:23","img_perfil":null,"link":"\\/ver_tarea\\/49"}', '2017-04-04 19:59:15', '2017-04-03 23:34:23', '2017-04-04 19:59:15'),
('de684fce-83c1-46ee-a5d1-79b9ab20212b', 'App\\Notifications\\OtCreada', 1, 'App\\User', '{"id_tarea":29,"nombre":"Andrea","cargo":"Ejecutiva de Cuentas","descripcion":"Andrea ha creado una OT con referencia: 1111, nombre : Renovaci\\u00f3n espacio Hosting  y valor: $180,000","created_at":"2017-04-04 18:21:52","img_perfil":null,"link":"\\/ots\\/visualizar\\/29"}', '2017-04-05 21:33:56', '2017-04-04 23:21:52', '2017-04-05 21:33:56'),
('de78c210-7c1d-404d-9113-dd99d8bcc058', 'App\\Notifications\\TareaCreada', 9, 'App\\User', '{"id_tarea":64,"nombre":"Andrea","cargo":"Ejecutiva de Cuentas","descripcion":"Andrea cre\\u00f3 la Tarea: Dise\\u00f1o de la parrilla ProgreSER ","created_at":"2017-04-04 14:52:18","img_perfil":null,"link":"\\/ver_tarea\\/64"}', '2017-04-05 12:38:33', '2017-04-04 19:52:18', '2017-04-05 12:38:33'),
('df970412-bbec-43a5-81c3-9a72f289714a', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":12,"nombre":"Maria Isabel","cargo":"Proyect Owner","descripcion":"Maria Isabel cre\\u00f3 la Tarea: Pauta concierto de la cuna a la jungla - Buga","created_at":"2017-03-31 21:38:59","img_perfil":null,"link":"\\/ver_tarea\\/12"}', '2017-04-03 19:13:25', '2017-04-01 02:38:59', '2017-04-03 19:13:25'),
('e03a8fa0-acd0-447d-ba3c-f1e8fcaeb6e1', 'App\\Notifications\\TareaProgramada', 21, 'App\\User', '{"id_tarea":68,"nombre":"Luisa Fernanda","cargo":"Development  Leader","descripcion":"Luisa Fernanda ha programado la Tarea: Carga de interactivo 360","created_at":"2017-04-06 17:26:02","img_perfil":"\\/images\\/avatars\\/LuisaFernanda_6.png","link":"\\/ver_tarea\\/68"}', '2017-04-07 12:59:12', '2017-04-06 22:26:02', '2017-04-07 12:59:12'),
('e15ea11d-29d6-45c9-9de1-cab3ae9556d8', 'App\\Notifications\\TareaProgramada', 15, 'App\\User', '{"id_tarea":123,"nombre":"Nestor","cargo":"SEM Performance Manager","descripcion":"Nestor ha programado la Tarea: Informe pauta mes del ni\\u00f1o","created_at":"2017-04-09 21:10:36","img_perfil":"\\/images\\/avatars\\/Nestor_5.png","link":"\\/ver_tarea\\/123"}', NULL, '2017-04-10 02:10:36', '2017-04-10 02:10:36'),
('e17f06ae-ff85-4c7e-815e-92396cb9285b', 'App\\Notifications\\ComentarioNuevoTarea', 24, 'App\\User', '{"id_tarea":42,"nombre":"Andres Fabian","cargo":"Encargado de Dise\\u00f1o","descripcion":"Andres Fabian ha comentado en la Tarea: Ajuste en copy piezas promoci\\u00f3n Hero  \\"Ya quedo realiz...\\"","created_at":"2017-04-04 11:27:47","img_perfil":"\\/images\\/avatars\\/AndresFabian_9.png","link":"\\/ver_tarea\\/42"}', '2017-04-06 12:53:13', '2017-04-04 16:27:47', '2017-04-06 12:53:13'),
('e1a1eb18-54c8-43ee-9292-6dc25f6008c2', 'App\\Notifications\\OtCreada', 1, 'App\\User', '{"id_tarea":28,"nombre":" Maria Andrea","cargo":"New Bussines","descripcion":" Maria Andrea ha creado una OT con referencia: 1011, nombre : Implementaci\\u00f3n nuevo sitio web y valor: $14,960,000","created_at":"2017-04-04 12:42:27","img_perfil":null,"link":"\\/ots\\/visualizar\\/28"}', '2017-04-04 21:14:04', '2017-04-04 17:42:27', '2017-04-04 21:14:04'),
('e1fb4ec4-4985-4d56-b1ff-da85f2a5fcba', 'App\\Notifications\\TareaAtencionCuentas', 11, 'App\\User', '{"id_tarea":184,"nombre":"Leonardo","cargo":"Lider de Contenido Escrito","descripcion":"Leonardo ha devuelto la Tarea: \\"Generar estructura excel y powerpoint informe Manuelita\\" a Atenci\\u00f3n Cuentas","created_at":"2017-04-10 06:56:08","img_perfil":"\\/images\\/avatars\\/Leonardo_7.png","link":"\\/ver_tarea\\/184"}', NULL, '2017-04-10 11:56:08', '2017-04-10 11:56:08'),
('e373dde2-6e68-48bb-8d7d-7d62a81c9b40', 'App\\Notifications\\OtCreada', 1, 'App\\User', '{"id_tarea":41,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  ha creado una OT con referencia: 1060, nombre : Pauta invierte en tus sue\\u00f1os y valor: $800,000","created_at":"2017-04-06 14:20:35","img_perfil":null,"link":"\\/ots\\/visualizar\\/41"}', '2017-04-09 02:12:45', '2017-04-06 19:20:35', '2017-04-09 02:12:45'),
('e4a5cd77-df9e-43a3-b6a5-8c16ec00ef4d', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":19,"nombre":"Silvia","cargo":"Ejecutiva de cuentas","descripcion":"Silvia cre\\u00f3 la Tarea: Pauta cursos Cali Abril Automaquillaje","created_at":"2017-03-31 22:23:46","img_perfil":null,"link":"\\/ver_tarea\\/19"}', '2017-04-03 19:13:25', '2017-04-01 03:23:46', '2017-04-03 19:13:25'),
('e64bab56-03a2-4d52-9eea-845f40111f64', 'App\\Notifications\\TareaCreada', 9, 'App\\User', '{"id_tarea":45,"nombre":"Nathalia","cargo":"Account Executive","descripcion":"Nathalia cre\\u00f3 la Tarea: Revisi\\u00f3n video 3 HV off line","created_at":"2017-04-03 17:04:22","img_perfil":null,"link":"\\/ver_tarea\\/45"}', '2017-04-03 22:25:36', '2017-04-03 22:04:22', '2017-04-03 22:25:36'),
('e6b2f7a3-28a7-4eb0-89b5-dd588ed85310', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":10,"nombre":"Silvia","cargo":"Ejecutiva de cuentas","descripcion":"Silvia cre\\u00f3 la Tarea: Pauta Descuento Droguer\\u00edas - Pieza HOY 10% de descuento","created_at":"2017-03-31 21:31:20","img_perfil":null,"link":"\\/ver_tarea\\/10"}', '2017-04-03 19:13:25', '2017-04-01 02:31:20', '2017-04-03 19:13:25'),
('e7a1724e-70b5-4617-ad48-68ee7a2a1987', 'App\\Notifications\\TareaEntregada', 11, 'App\\User', '{"id_tarea":56,"nombre":"Andres Fabian","cargo":"Encargado de Dise\\u00f1o","descripcion":"Andres Fabian entreg\\u00f3 la Tarea: Cambio de fotos Harinera del Valle parrilla  y actualiz\\u00f3 el estado a Entregado","created_at":"2017-04-04 18:03:47","img_perfil":"\\/images\\/avatars\\/AndresFabian_9.png","link":"\\/ver_tarea\\/56"}', '2017-04-05 21:39:11', '2017-04-04 23:03:47', '2017-04-05 21:39:11'),
('e8ac054c-f862-4ffc-b6b3-893827423864', 'App\\Notifications\\TareaEntregada', 22, 'App\\User', '{"id_tarea":39,"nombre":"Luisa Fernanda","cargo":"Development  Leader","descripcion":"Luisa Fernanda entreg\\u00f3 la Tarea: Ajuste de tipografia en el banner y actualiz\\u00f3 el estado a Entregado","created_at":"2017-04-04 17:40:59","img_perfil":"\\/images\\/avatars\\/LuisaFernanda_6.png","link":"\\/ver_tarea\\/39"}', '2017-04-05 22:38:24', '2017-04-04 22:40:59', '2017-04-05 22:38:24'),
('e8cac639-a606-48c6-a242-4a87d43afac9', 'App\\Notifications\\TareaRealizada', 9, 'App\\User', '{"id_tarea":45,"nombre":"Andres Fabian","cargo":"Encargado de Dise\\u00f1o","descripcion":"Andres Fabian ha realizado la Tarea: \\"Revisi\\u00f3n video 3 HV off line\\" en 2 Hrs","created_at":"2017-04-07 17:40:41","img_perfil":"\\/images\\/avatars\\/AndresFabian_9.png","link":"\\/ver_tarea\\/45"}', '2017-04-07 22:43:25', '2017-04-07 22:40:41', '2017-04-07 22:43:25'),
('e9520ee9-fd78-41d1-b925-e03ed9737945', 'App\\Notifications\\ComentarioNuevoTarea', 6, 'App\\User', '{"id_tarea":51,"nombre":" Maria Andrea","cargo":"New Bussines","descripcion":" Maria Andrea ha comentado en la Tarea: Renovaci\\u00f3n de Hosting y Dominio 2017 \\"Muchas gracias ...\\"","created_at":"2017-04-06 14:24:22","img_perfil":null,"link":"\\/ver_tarea\\/51"}', '2017-04-06 22:07:12', '2017-04-06 19:24:22', '2017-04-06 22:07:12'),
('ea64fa77-e9e9-4225-b6e3-3c9eca8b7d85', 'App\\Notifications\\OtCreada', 1, 'App\\User', '{"id_tarea":56,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  ha creado una OT con referencia: 1123, nombre : Pauta 2 mes del ni\\u00f1o y valor: $200,000","created_at":"2017-04-07 16:38:00","img_perfil":null,"link":"\\/ots\\/visualizar\\/56"}', '2017-04-09 02:12:45', '2017-04-07 21:38:00', '2017-04-09 02:12:45'),
('ea8f10cd-7cde-4916-8647-af6b09eb220e', 'App\\Notifications\\TareaProgramada', 14, 'App\\User', '{"id_tarea":125,"nombre":"Nestor","cargo":"SEM Performance Manager","descripcion":"Nestor ha programado la Tarea: Amplificar carrusel 2 droguer\\u00edas","created_at":"2017-04-09 20:54:05","img_perfil":"\\/images\\/avatars\\/Nestor_5.png","link":"\\/ver_tarea\\/125"}', NULL, '2017-04-10 01:54:05', '2017-04-10 01:54:05'),
('ea93fa83-e718-40bf-8b3d-7bee74c795b3', 'App\\Notifications\\TareaCreada', 7, 'App\\User', '{"id_tarea":82,"nombre":"Andrea","cargo":"Ejecutiva de Cuentas","descripcion":"Andrea cre\\u00f3 la Tarea: Subir video de etiquetas en Fb e Instagram","created_at":"2017-04-05 17:55:31","img_perfil":null,"link":"\\/ver_tarea\\/82"}', '2017-04-06 12:44:59', '2017-04-05 22:55:31', '2017-04-06 12:44:59'),
('eab7233a-40dd-4579-9041-ff8879dc7cef', 'App\\Notifications\\OtCreada', 1, 'App\\User', '{"id_tarea":9,"nombre":"Andrea","cargo":"Ejecutiva de Cuentas","descripcion":"Andrea ha creado una OT con referencia: 1126, nombre : Fee Mensual Abril y valor: $10,060,848","created_at":"2017-04-03 13:27:44","img_perfil":null,"link":"\\/ots\\/visualizar\\/9"}', '2017-04-03 22:38:13', '2017-04-03 18:27:44', '2017-04-03 22:38:13'),
('eaca3b1a-361f-452a-a19d-5f4045adfd09', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":148,"nombre":"Andrea","cargo":"Ejecutiva de Cuentas","descripcion":"Andrea cre\\u00f3 la Tarea: Env\\u00edo 2 mail p\\u00fablico externo cama","created_at":"2017-04-07 15:43:26","img_perfil":null,"link":"\\/ver_tarea\\/148"}', NULL, '2017-04-07 20:43:26', '2017-04-07 20:43:26'),
('eb11e3b6-155a-4b78-b398-b388a7d055bf', 'App\\Notifications\\TareaCreada', 9, 'App\\User', '{"id_tarea":77,"nombre":"Andrea","cargo":"Ejecutiva de Cuentas","descripcion":"Andrea cre\\u00f3 la Tarea: Adaptaci\\u00f3n de dise\\u00f1o a web e intranet","created_at":"2017-04-05 16:35:22","img_perfil":null,"link":"\\/ver_tarea\\/77"}', '2017-04-05 21:36:12', '2017-04-05 21:35:22', '2017-04-05 21:36:12'),
('eb5b936d-8cde-468b-a7fe-7a193105dca1', 'App\\Notifications\\TareaProgramada', 13, 'App\\User', '{"id_tarea":94,"nombre":"Luisa Fernanda","cargo":"Development  Leader","descripcion":"Luisa Fernanda ha programado la Tarea: Maquetado mail ProgreSER P\\u00fablico interno","created_at":"2017-04-06 10:58:33","img_perfil":"\\/images\\/avatars\\/LuisaFernanda_6.png","link":"\\/ver_tarea\\/94"}', '2017-04-06 21:21:15', '2017-04-06 15:58:33', '2017-04-06 21:21:15'),
('ebc0e9bb-6ded-40ab-9164-226f622c82a1', 'App\\Notifications\\OtCreada', 1, 'App\\User', '{"id_tarea":22,"nombre":"Nathalia","cargo":"Account Executive","descripcion":"Nathalia ha creado una OT con referencia: 1108-1, nombre : Fee de Acompa\\u00f1amiento y administraci\\u00f3n en Redes Sociales y valor: $2,207,663","created_at":"2017-04-03 15:36:18","img_perfil":null,"link":"\\/ots\\/visualizar\\/22"}', '2017-04-03 22:38:13', '2017-04-03 20:36:18', '2017-04-03 22:38:13'),
('ebc2db9e-c1a5-4ec2-9b16-3c649ef0f074', 'App\\Notifications\\TareaAtencionArea', 6, 'App\\User', '{"id_tarea":68,"nombre":"Brian","cargo":"Desarrollador","descripcion":"Brian ha devuelto la Tarea: \\"Carga de interactivo 360\\" a Atenci\\u00f3n \\u00c1rea","created_at":"2017-04-05 15:44:26","img_perfil":"\\/images\\/avatars\\/Brian_21.png","link":"\\/ver_tarea\\/68"}', '2017-04-06 16:00:14', '2017-04-05 20:44:26', '2017-04-06 16:00:14'),
('ed3833cc-fdba-4f05-b8a7-e1b97e7e8d50', 'App\\Notifications\\OtTiempoExtraAprobado', 3, 'App\\User', '{"id_tarea":20,"nombre":"Desarrollo","cargo":"Tester","descripcion":"Desarrollo ha editado su Orden de trabajo con la referencia #970 con el nombre Implementaci\\u00f3n nuevo sitio web ","created_at":"2017-04-05 14:54:52","img_perfil":"\\/images\\/avatars\\/Desarrollo_8.png","link":"\\/ots\\/visualizar\\/20"}', '2017-04-06 19:19:45', '2017-04-05 19:54:52', '2017-04-06 19:19:45'),
('ed3e8073-81d1-4650-b243-8f68d44df10b', 'App\\Notifications\\TareaCreada', 6, 'App\\User', '{"id_tarea":102,"nombre":"Andrea","cargo":"Ejecutiva de Cuentas","descripcion":"Andrea cre\\u00f3 la Tarea: Creaci\\u00f3n de cuentas de correo ","created_at":"2017-04-06 18:41:59","img_perfil":null,"link":"\\/ver_tarea\\/102"}', '2017-04-07 12:54:58', '2017-04-06 23:41:59', '2017-04-07 12:54:58'),
('ed6608a1-4ca2-486f-8b24-ca327b7d0029', 'App\\Notifications\\OtTiempoExtraAprobado', 11, 'App\\User', '{"id_tarea":39,"nombre":"Desarrollo","cargo":"Tester","descripcion":"Desarrollo ha editado su Orden de trabajo con la referencia #0961 con el nombre Sitio web desarrollo ","created_at":"2017-04-06 14:35:34","img_perfil":"\\/images\\/avatars\\/Desarrollo_8.png","link":"\\/ots\\/visualizar\\/39"}', '2017-04-06 23:33:05', '2017-04-06 19:35:34', '2017-04-06 23:33:05'),
('ed6ebde7-3f22-42bc-b4f3-4f30bc180192', 'App\\Notifications\\TareaCreada', 9, 'App\\User', '{"id_tarea":84,"nombre":"Nathalia","cargo":"Account Executive","descripcion":"Nathalia cre\\u00f3 la Tarea: Ajustes infograf\\u00eda Metabolismo activo","created_at":"2017-04-05 18:11:40","img_perfil":null,"link":"\\/ver_tarea\\/84"}', '2017-04-06 13:19:58', '2017-04-05 23:11:40', '2017-04-06 13:19:58'),
('edf87523-11d0-49a2-8152-485843f50352', 'App\\Notifications\\OtCreada', 1, 'App\\User', '{"id_tarea":46,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  ha creado una OT con referencia: 1078, nombre : Pauta Lego y valor: $3,000,000","created_at":"2017-04-07 14:20:48","img_perfil":null,"link":"\\/ots\\/visualizar\\/46"}', '2017-04-09 02:12:45', '2017-04-07 19:20:48', '2017-04-09 02:12:45'),
('eea0f932-c7f5-483a-b17e-c8f85217d547', 'App\\Notifications\\TareaRealizada', 6, 'App\\User', '{"id_tarea":101,"nombre":"Brian","cargo":"Desarrollador","descripcion":"Brian ha realizado la Tarea: \\"Carga de certificados 10K Semana Santa\\" en 3 Hrs","created_at":"2017-04-07 13:54:49","img_perfil":"\\/images\\/avatars\\/Brian_21.png","link":"\\/ver_tarea\\/101"}', '2017-04-07 18:55:39', '2017-04-07 18:54:49', '2017-04-07 18:55:39'),
('ef0ce96d-6197-433d-9cd4-11e2bf30aa50', 'App\\Notifications\\TareaRealizada', 7, 'App\\User', '{"id_tarea":86,"nombre":"Leonardo","cargo":"Lider de Contenido Escrito","descripcion":"Leonardo ha realizado la Tarea: \\"Programaci\\u00f3n redes sociales HV\\" en 1 Hrs","created_at":"2017-04-06 07:45:49","img_perfil":"\\/images\\/avatars\\/Leonardo_7.png","link":"\\/ver_tarea\\/86"}', '2017-04-06 14:51:08', '2017-04-06 12:45:49', '2017-04-06 14:51:08'),
('ef52d4fb-2c22-4e02-8488-9582699f5b6e', 'App\\Notifications\\TareaEntregada', 11, 'App\\User', '{"id_tarea":42,"nombre":"Andres Fabian","cargo":"Encargado de Dise\\u00f1o","descripcion":"Andres Fabian entreg\\u00f3 la Tarea: Ajuste en copy piezas promoci\\u00f3n Hero  y actualiz\\u00f3 el estado a Entregado","created_at":"2017-04-04 11:27:55","img_perfil":"\\/images\\/avatars\\/AndresFabian_9.png","link":"\\/ver_tarea\\/42"}', '2017-04-04 22:08:02', '2017-04-04 16:27:55', '2017-04-04 22:08:02'),
('efefd04f-d07b-49b5-970c-a3dda04695e2', 'App\\Notifications\\OtCreada', 1, 'App\\User', '{"id_tarea":62,"nombre":"Andrea","cargo":"Ejecutiva de Cuentas","descripcion":"Andrea ha creado una OT con referencia: 1105, nombre : Fee Administraci\\u00f3n redes sociales Abril  y valor: $3,400,000","created_at":"2017-04-07 18:16:16","img_perfil":null,"link":"\\/ots\\/visualizar\\/62"}', '2017-04-09 02:12:45', '2017-04-07 23:16:16', '2017-04-09 02:12:45'),
('f1dc6d86-dc65-46e4-b121-071877fe2e8a', 'App\\Notifications\\TareaCreada', 6, 'App\\User', '{"id_tarea":131,"nombre":"Luisa Fernanda","cargo":"Development  Leader","descripcion":"Luisa Fernanda cre\\u00f3 la Tarea: Revisi\\u00f3n proceso soporte","created_at":"2017-04-07 14:46:51","img_perfil":"\\/images\\/avatars\\/LuisaFernanda_6.png","link":"\\/ver_tarea\\/131"}', '2017-04-07 19:46:55', '2017-04-07 19:46:51', '2017-04-07 19:46:55'),
('f28396dc-c213-45b7-9df3-cdf00e643ea7', 'App\\Notifications\\TareaCreada', 4, 'App\\User', '{"id_tarea":66,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  cre\\u00f3 la Tarea: Realizar Flow Pauta Primero de Mayo","created_at":"2017-04-04 17:24:25","img_perfil":null,"link":"\\/ver_tarea\\/66"}', '2017-04-05 11:32:44', '2017-04-04 22:24:25', '2017-04-05 11:32:44'),
('f29f9c23-5fb4-4cfa-b4bf-b359c221d9aa', 'App\\Notifications\\TareaProgramada', 15, 'App\\User', '{"id_tarea":112,"nombre":"Nestor","cargo":"SEM Performance Manager","descripcion":"Nestor ha programado la Tarea: Informe Pauta Cursos Abril","created_at":"2017-04-09 21:05:01","img_perfil":"\\/images\\/avatars\\/Nestor_5.png","link":"\\/ver_tarea\\/112"}', NULL, '2017-04-10 02:05:01', '2017-04-10 02:05:01'),
('f3d7770e-c2f9-44e8-98eb-baf156b9339b', 'App\\Notifications\\TareaCreada', 6, 'App\\User', '{"id_tarea":100,"nombre":" Maria Andrea","cargo":"New Bussines","descripcion":" Maria Andrea cre\\u00f3 la Tarea: Revisi\\u00f3n de nueva opci\\u00f3n de pago","created_at":"2017-04-06 17:21:59","img_perfil":null,"link":"\\/ver_tarea\\/100"}', '2017-04-06 22:26:09', '2017-04-06 22:21:59', '2017-04-06 22:26:09'),
('f51f79e7-8895-4f3e-91c0-e6074e54834d', 'App\\Notifications\\OtCreada', 1, 'App\\User', '{"id_tarea":21,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  ha creado una OT con referencia: 1102-3, nombre : Fee Comfandi Centro de Empleo y valor: $4,400,000","created_at":"2017-04-03 15:17:10","img_perfil":null,"link":"\\/ots\\/visualizar\\/21"}', '2017-04-03 22:38:13', '2017-04-03 20:17:10', '2017-04-03 22:38:13'),
('f662b3ff-1a15-412d-96a4-dd1044c53dde', 'App\\Notifications\\TareaEntregada', 22, 'App\\User', '{"id_tarea":40,"nombre":"Luisa Fernanda","cargo":"Development  Leader","descripcion":"Luisa Fernanda entreg\\u00f3 la Tarea: Informe de soporte mes de marzo de sitio web y actualiz\\u00f3 el estado a Entregado","created_at":"2017-04-04 18:04:53","img_perfil":"\\/images\\/avatars\\/LuisaFernanda_6.png","link":"\\/ver_tarea\\/40"}', '2017-04-05 22:38:24', '2017-04-04 23:04:53', '2017-04-05 22:38:24'),
('f7f9e0d6-e7ad-4e78-868d-e30d65b0481f', 'App\\Notifications\\TareaCreada', 4, 'App\\User', '{"id_tarea":104,"nombre":"Jose","cargo":"Director Creativo","descripcion":"Jose cre\\u00f3 la Tarea: Organizaci\\u00f3n equipo redes sociales","created_at":"2017-04-07 06:26:04","img_perfil":"\\/images\\/avatars\\/Jose_4.png","link":"\\/ver_tarea\\/104"}', '2017-04-07 11:26:10', '2017-04-07 11:26:04', '2017-04-07 11:26:10'),
('f82e995d-c1e1-4258-8d99-6d61c8305d4e', 'App\\Notifications\\TareaProgramada', 4, 'App\\User', '{"id_tarea":43,"nombre":"Jose","cargo":"Director Creativo","descripcion":"Jose ha programado la Tarea: Creaci\\u00f3n temas art\\u00edculos Manitoba","created_at":"2017-04-03 16:50:50","img_perfil":"\\/images\\/avatars\\/Jose_4.png","link":"\\/ver_tarea\\/43"}', '2017-04-03 22:10:29', '2017-04-03 21:50:50', '2017-04-03 22:10:29'),
('f87733c3-e61d-4996-a212-cc3b428a0fef', 'App\\Notifications\\TareaRealizada', 4, 'App\\User', '{"id_tarea":43,"nombre":"Jose","cargo":"Director Creativo","descripcion":"Jose ha realizado la Tarea: \\"Creaci\\u00f3n temas art\\u00edculos Manitoba\\" en 0.5 Hrs","created_at":"2017-04-03 17:09:35","img_perfil":"\\/images\\/avatars\\/Jose_4.png","link":"\\/ver_tarea\\/43"}', '2017-04-03 22:10:29', '2017-04-03 22:09:35', '2017-04-03 22:10:29'),
('f9a3edd4-d2aa-4d1a-8674-a0fbb6a0c8b5', 'App\\Notifications\\OtCreada', 1, 'App\\User', '{"id_tarea":3,"nombre":"Andrea","cargo":"Ejecutiva de Cuentas","descripcion":"Andrea ha creado una OT con referencia: 1095, nombre : Pauta Concierto de la Cuna a la Jungla y valor: $500,000","created_at":"2017-03-31 21:01:04","img_perfil":null,"link":"\\/ots\\/visualizar\\/3"}', '2017-04-02 08:08:00', '2017-04-01 02:01:04', '2017-04-02 08:08:00'),
('f9a6fa40-ebb7-4932-9080-9be4528a84cf', 'App\\Notifications\\TareaProgramada', 21, 'App\\User', '{"id_tarea":40,"nombre":"Luisa Fernanda","cargo":"Encargada de Desarrollo","descripcion":"Luisa Fernanda ha programado la Tarea: Informe de soporte mes de marzo de sitio web","created_at":"2017-04-03 17:27:27","img_perfil":"\\/images\\/avatars\\/LuisaFernanda_6.png","link":"\\/ver_tarea\\/40"}', '2017-04-03 22:28:41', '2017-04-03 22:27:27', '2017-04-03 22:28:41'),
('f9ea4291-4e6e-464b-bccc-c705a8783e6e', 'App\\Notifications\\TareaRealizada', 9, 'App\\User', '{"id_tarea":53,"nombre":"Alejandro","cargo":"Practicante en Dise\\u00f1o Gr\\u00e1fico","descripcion":"Alejandro ha realizado la Tarea: \\"Dise\\u00f1o Mailing Abril conferencia empresarial regionales\\" en 7 Hrs","created_at":"2017-04-05 10:37:00","img_perfil":null,"link":"\\/ver_tarea\\/53"}', '2017-04-05 19:53:35', '2017-04-05 15:37:00', '2017-04-05 19:53:35');
INSERT INTO `notifications` (`id`, `type`, `notifiable_id`, `notifiable_type`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('fab29141-74c9-41cf-84fc-7de978e1dd6f', 'App\\Notifications\\TareaCreada', 7, 'App\\User', '{"id_tarea":44,"nombre":"Andrea","cargo":"Ejecutiva de Cuentas","descripcion":"Andrea cre\\u00f3 la Tarea: Cambio en la promoci\\u00f3n de ProgreSER y Hero ","created_at":"2017-04-03 16:53:02","img_perfil":null,"link":"\\/ver_tarea\\/44"}', '2017-04-04 19:59:15', '2017-04-03 21:53:02', '2017-04-04 19:59:15'),
('fb733e02-2d14-4dfb-8929-b97e6348490d', 'App\\Notifications\\TareaCreada', 9, 'App\\User', '{"id_tarea":65,"nombre":"Andrea","cargo":"Ejecutiva de Cuentas","descripcion":"Andrea cre\\u00f3 la Tarea: Gr\\u00e1ficos 3 HV","created_at":"2017-04-04 17:15:51","img_perfil":null,"link":"\\/ver_tarea\\/65"}', '2017-04-05 12:38:33', '2017-04-04 22:15:51', '2017-04-05 12:38:33'),
('fb899202-eb97-4488-9200-4e4c9a7c419d', 'App\\Notifications\\ComentarioNuevoTarea', 5, 'App\\User', '{"id_tarea":144,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  ha comentado en la Tarea: Amplificar post nuevo punto de la 14 \\"Publico objetiv...\\"","created_at":"2017-04-07 15:39:55","img_perfil":null,"link":"\\/ver_tarea\\/144"}', NULL, '2017-04-07 20:39:55', '2017-04-07 20:39:55'),
('fd041193-eed4-4938-bb3d-6b207183a19e', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":4,"nombre":"Silvia","cargo":"Ejecutiva de cuentas","descripcion":"Silvia cre\\u00f3 la Tarea: Pauta Descuento Droguer\\u00edas - Gif d\\u00edas de descuento por iniciar mes ","created_at":"2017-03-31 21:05:52","img_perfil":null,"link":"\\/ver_tarea\\/4"}', '2017-04-03 19:13:25', '2017-04-01 02:05:52', '2017-04-03 19:13:25'),
('fd9b8fe6-8a0d-450f-8e6c-0330c001873a', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":150,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  cre\\u00f3 la Tarea: Amplificar video Cali - Rocksito","created_at":"2017-04-07 15:57:00","img_perfil":null,"link":"\\/ver_tarea\\/150"}', NULL, '2017-04-07 20:57:00', '2017-04-07 20:57:00'),
('fda0826b-6a8c-4a38-97b6-9cee3cdd41ad', 'App\\Notifications\\TareaCreada', 9, 'App\\User', '{"id_tarea":50,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  cre\\u00f3 la Tarea: Ent\\u00e9rate Nueva ubicaci\\u00f3n Agencia Empleo","created_at":"2017-04-04 09:08:32","img_perfil":null,"link":"\\/ver_tarea\\/50"}', '2017-04-04 16:07:06', '2017-04-04 14:08:32', '2017-04-04 16:07:06'),
('fea21f1f-f479-4903-9b8d-6b6393841791', 'App\\Notifications\\TareaCreada', 9, 'App\\User', '{"id_tarea":33,"nombre":" Maria Andrea","cargo":"New Bussines","descripcion":" Maria Andrea cre\\u00f3 la Tarea: Dise\\u00f1o de Home para tres l\\u00edneas de producto","created_at":"2017-04-03 15:40:13","img_perfil":null,"link":"\\/ver_tarea\\/33"}', '2017-04-03 21:13:42', '2017-04-03 20:40:13', '2017-04-03 21:13:42'),
('ff3d7acd-be9b-4d2c-91d5-eccccc5f9192', 'App\\Notifications\\TareaAtencionArea', 6, 'App\\User', '{"id_tarea":55,"nombre":" Maria Andrea","cargo":"New Bussines","descripcion":" Maria Andrea ha devuelto la Tarea: \\"Revisi\\u00f3n de chat en l\\u00ednea\\" a Atenci\\u00f3n \\u00c1rea","created_at":"2017-04-06 14:49:11","img_perfil":null,"link":"\\/ver_tarea\\/55"}', '2017-04-06 22:07:12', '2017-04-06 19:49:11', '2017-04-06 22:07:12'),
('ff938e5c-94d1-4820-a2fc-a2388f81cb57', 'App\\Notifications\\TareaCreada', 6, 'App\\User', '{"id_tarea":124,"nombre":"Luisa Fernanda","cargo":"Development  Leader","descripcion":"Luisa Fernanda cre\\u00f3 la Tarea: Reuni\\u00f3n tr\\u00e1fico","created_at":"2017-04-07 14:32:35","img_perfil":"\\/images\\/avatars\\/LuisaFernanda_6.png","link":"\\/ver_tarea\\/124"}', '2017-04-07 19:32:43', '2017-04-07 19:32:35', '2017-04-07 19:32:43'),
('ff97daac-9adc-4dfa-b44f-b721b015e36b', 'App\\Notifications\\TareaProgramada', 23, 'App\\User', '{"id_tarea":77,"nombre":"Andres Fabian","cargo":"Encargado de Dise\\u00f1o","descripcion":"Andres Fabian ha programado la Tarea: Adaptaci\\u00f3n de dise\\u00f1o a web e intranet","created_at":"2017-04-05 18:01:39","img_perfil":"\\/images\\/avatars\\/AndresFabian_9.png","link":"\\/ver_tarea\\/77"}', '2017-04-06 13:01:16', '2017-04-05 23:01:39', '2017-04-06 13:01:16'),
('ffa16fde-6d18-4cc5-aa5a-012c1cbbbf1f', 'App\\Notifications\\OtCreada', 1, 'App\\User', '{"id_tarea":50,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  ha creado una OT con referencia: 116, nombre : Pauta carruseles cincuentazo 12 abril y valor: $500,000","created_at":"2017-04-07 14:59:50","img_perfil":null,"link":"\\/ots\\/visualizar\\/50"}', '2017-04-09 02:12:45', '2017-04-07 19:59:50', '2017-04-09 02:12:45'),
('fffc5429-6f47-4223-9752-8f3c36673579', 'App\\Notifications\\TareaProgramada', 25, 'App\\User', '{"id_tarea":73,"nombre":"Andres Fabian","cargo":"Encargado de Dise\\u00f1o","descripcion":"Andres Fabian ha programado la Tarea: Ajustes emailing Conferencia regionales Abril","created_at":"2017-04-05 15:33:34","img_perfil":"\\/images\\/avatars\\/AndresFabian_9.png","link":"\\/ver_tarea\\/73"}', '2017-04-06 13:56:50', '2017-04-05 20:33:34', '2017-04-06 13:56:50');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ots`
--

CREATE TABLE IF NOT EXISTS `ots` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(115) COLLATE utf8_unicode_ci NOT NULL,
  `referencia` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `valor` varchar(55) COLLATE utf8_unicode_ci NOT NULL,
  `fee` tinyint(4) NOT NULL,
  `horas_totales` decimal(15,2) NOT NULL,
  `horas_disponibles` decimal(15,2) NOT NULL,
  `total_horas_extra` decimal(15,2) DEFAULT NULL,
  `observaciones` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fecha_inicio` datetime NOT NULL,
  `fecha_final` datetime NOT NULL,
  `estado` tinyint(4) NOT NULL DEFAULT '1',
  `clientes_id` int(10) unsigned NOT NULL,
  `usuarios_id` int(10) unsigned NOT NULL,
  `estados_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ots_estados_id_foreign` (`estados_id`),
  KEY `ots_clientes_id_foreign` (`clientes_id`),
  KEY `ots_usuarios_id_foreign` (`usuarios_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=66 ;

--
-- Volcado de datos para la tabla `ots`
--

INSERT INTO `ots` (`id`, `nombre`, `referencia`, `valor`, `fee`, `horas_totales`, `horas_disponibles`, `total_horas_extra`, `observaciones`, `fecha_inicio`, `fecha_final`, `estado`, `clientes_id`, `usuarios_id`, `estados_id`, `created_at`, `updated_at`) VALUES
(1, 'Pauta Descuentos Droguerias', '1093', '510000', 0, '4.00', '2.00', '0.00', '', '2017-03-31 00:00:00', '2017-04-22 00:00:00', 1, 5, 2, 8, '2017-04-01 00:46:54', '2017-04-01 00:46:54'),
(2, 'Pauta Escuelas Deportiva Tennis deCampo', '1096', '400000', 0, '4.00', '0.00', '0.00', 'Amplificación de 1 post de Facebook', '2017-04-03 00:00:00', '2017-04-17 00:00:00', 1, 5, 2, 8, '2017-04-01 01:39:29', '2017-04-01 02:19:06'),
(3, 'Pauta Concierto de la Cuna a la Jungla', '1095', '500000', 0, '4.00', '0.00', '0.00', 'Adjunto solicitud en OT fisica.', '2017-03-31 00:00:00', '2017-04-29 00:00:00', 1, 5, 2, 8, '2017-04-01 02:01:04', '2017-04-01 02:01:04'),
(4, 'Pauta Cursos Abril', '1094', '1850000', 0, '8.00', '0.00', '0.00', '7 amplificaciones de post', '2017-04-05 00:00:00', '2017-05-01 00:00:00', 1, 5, 2, 8, '2017-04-01 03:01:41', '2017-04-01 03:01:41'),
(5, 'Himalaya - Coordinación', 'HDA-0417', '100000', 1, '800.00', '0.00', '0.00', '', '2017-04-03 00:00:00', '2017-04-29 00:00:00', 1, 4, 10, 8, '2017-04-03 19:50:03', '2017-04-03 19:50:03'),
(6, 'Fee de Mantenimiento al E-Commerce', '1104', '580000', 1, '8.00', '0.00', '0.00', '', '2017-04-03 00:00:00', '2017-04-29 00:00:00', 1, 8, 3, 8, '2017-04-03 21:34:24', '2017-04-03 21:34:24'),
(7, 'Fee Posicionamiento SEO ', '1103', '780000', 1, '10.00', '0.00', '0.00', '', '2017-04-03 00:00:00', '2017-04-29 00:00:00', 1, 7, 2, 8, '2017-04-03 21:38:39', '2017-04-03 21:38:39'),
(8, 'Fee de SEO mes de Abril', '1106', '1290000', 1, '18.00', '0.00', '0.00', '', '2017-04-03 00:00:00', '2017-05-03 00:00:00', 1, 9, 3, 8, '2017-04-03 17:09:52', '2017-04-03 17:09:52'),
(9, 'Fee Mensual Abril', '1126', '10060848', 1, '111.00', '0.00', '0.00', 'Este mes la repartición del Fee es diferente a lo contratado pero dentro de las horas totales, ya que el cliente aun no tiene la persona para en análisis de los canales digitales', '2017-04-03 00:00:00', '2017-04-29 00:00:00', 1, 2, 11, 8, '2017-04-03 18:27:44', '2017-04-03 19:32:16'),
(10, 'Renovación Host, Soporte al Host y SSL 2017', '1107', '2820000', 0, '21.00', '0.00', '0.00', '', '2017-04-03 00:00:00', '2018-04-03 00:00:00', 1, 9, 3, 8, '2017-04-03 19:15:51', '2017-04-03 19:15:51'),
(11, 'Fee de Soporte en Desarrollo para sitio web', '1109', '288000', 1, '4.00', '0.00', '0.00', '', '2017-04-03 00:00:00', '2017-05-03 00:00:00', 1, 9, 3, 8, '2017-04-03 19:49:14', '2017-04-03 19:49:14'),
(14, 'Fee Acompañamiento de Agencia', '1102', '14750000', 1, '680.00', '0.00', '0.00', '', '2017-04-03 00:00:00', '2017-04-29 00:00:00', 1, 5, 2, 8, '2017-04-03 20:08:17', '2017-04-06 16:53:37'),
(15, 'Fee Vallempresa365', '1102-2', '9,450,000', 1, '160.00', '0.00', '0.00', '', '2017-04-03 00:00:00', '2017-04-29 00:00:00', 1, 10, 2, 8, '2017-04-03 20:12:14', '2017-04-03 21:30:49'),
(20, 'Implementación nuevo sitio web', '970', '17,950,000', 0, '263.50', '0.00', '0.00', 'Este proyecto arrancó el 23 de Enero de 2017 con esa fecha está relacionada la OT física con el mismo identificador. ', '2017-04-03 00:00:00', '2017-06-13 00:00:00', 1, 6, 3, 8, '2017-04-03 20:16:26', '2017-04-05 19:54:52'),
(21, 'Fee Comfandi Centro de Empleo', '1102-3', '4400000', 1, '160.00', '0.00', '0.00', '', '2017-04-03 00:00:00', '2017-05-05 00:00:00', 1, 11, 2, 8, '2017-04-03 20:17:10', '2017-04-03 20:17:10'),
(22, 'Fee de Acompañamiento y administración en Redes Sociales', '1108-1', '2207663', 1, '52.00', '1.00', '0.00', '', '2017-04-03 00:00:00', '2017-05-05 00:00:00', 1, 12, 22, 8, '2017-04-03 20:36:18', '2017-04-03 20:36:18'),
(23, 'Fee de Administración Sitio Web', '1108-2', '704000', 1, '8.00', '0.00', '0.00', '', '2017-04-03 00:00:00', '2017-05-05 00:00:00', 1, 12, 22, 8, '2017-04-03 20:41:24', '2017-04-03 20:41:24'),
(24, 'Fee SEO Sitio Web', '1108-3', '788377', 1, '11.00', '0.00', '0.00', '', '2017-04-03 00:00:00', '2017-05-05 00:00:00', 1, 12, 22, 8, '2017-04-03 20:44:32', '2017-04-03 20:44:32'),
(25, 'Soporte Sitio Web', '1108-4', '300000', 1, '4.00', '0.00', '0.00', '', '2017-04-03 00:00:00', '2017-05-05 00:00:00', 1, 12, 22, 8, '2017-04-03 20:48:40', '2017-04-03 20:59:12'),
(26, 'Creación de contenidos para sitio web', '1089', '3980000', 0, '82.00', '0.00', '0.00', 'La creación de contenidos para el nuevo sitio web de PLM se tercerizará pero el canal de comunicación será con José Díaz. ', '2017-04-03 00:00:00', '2017-05-05 00:00:00', 1, 6, 3, 8, '2017-04-03 20:57:48', '2017-04-03 20:57:48'),
(27, 'Renovación Hosting, Dominio y Soporte ', '1110', '1420000', 0, '13.00', '0.00', '0.00', '', '2017-04-04 00:00:00', '2018-04-04 00:00:00', 1, 13, 3, 8, '2017-04-04 13:40:24', '2017-04-04 13:40:24'),
(28, 'Implementación nuevo sitio web', '1011', '14960000', 0, '241.00', '0.00', '0.00', '', '2017-04-04 00:00:00', '2017-06-15 00:00:00', 1, 14, 3, 8, '2017-04-04 17:42:27', '2017-04-05 19:40:36'),
(29, 'Renovación espacio Hosting ', '1111', '180000', 0, '1.00', '0.00', '0.00', '', '2017-04-04 00:00:00', '2017-04-05 00:00:00', 1, 15, 11, 10, '2017-04-04 23:21:52', '2017-04-06 06:00:01'),
(30, 'Catálogo ProgreSER', '0139', '8496000', 0, '12.00', '4.00', '0.00', '', '2017-04-05 00:00:00', '2017-05-05 00:00:00', 1, 2, 11, 8, '2017-04-05 21:23:26', '2017-04-06 14:50:55'),
(31, 'Fee Soporte Sitio Web - Marzo', '1033-4', '75000', 1, '1.00', '0.00', '0.00', 'Informe de Marzo', '2017-04-06 00:00:00', '2017-04-06 00:00:00', 1, 12, 22, 10, '2017-04-05 21:29:48', '2017-04-07 06:00:02'),
(32, 'Diseño y desarrollo de Sitio Web', '977', '9950000', 0, '185.00', '87.00', '0.00', 'Se descontaron 10 Horas de Wireframes al total del tiempo de diseño.', '2017-04-05 00:00:00', '2017-06-07 00:00:00', 1, 16, 22, 8, '2017-04-05 21:47:14', '2017-04-05 21:47:14'),
(33, 'Diseño y desarrollo del Sitio Web', '925', '10755000', 0, '169.00', '0.00', '0.00', 'Diseño: Se está descontando el tiempo de Look and Feel, Mapa de Navegación y Wireframes (Tiempo descontado 23H)\n', '2017-04-05 00:00:00', '2017-07-06 00:00:00', 1, 17, 22, 8, '2017-04-05 22:15:40', '2017-04-05 22:17:23'),
(34, 'Pauta Droguerías Sur Cali', '1098', '2000000', 0, '10.00', '0.00', '0.00', 'Se adjunto plan de pauta a OT y aprobación cliente. ', '2017-04-17 00:00:00', '2017-04-29 00:00:00', 1, 5, 2, 8, '2017-04-06 15:23:03', '2017-04-06 15:23:03'),
(35, 'Pauta Mes del Niño', '1100', '350000', 0, '4.00', '3.00', '0.00', '', '2017-04-06 00:00:00', '2017-04-17 00:00:00', 1, 5, 2, 8, '2017-04-06 16:00:06', '2017-04-06 16:00:06'),
(36, 'Pauta Cincuentazo 12 de Abril', '1075', '500000', 0, '2.00', '0.00', '0.00', '', '2017-04-11 00:00:00', '2017-04-12 00:00:00', 1, 5, 2, 8, '2017-04-06 16:21:50', '2017-04-06 16:21:50'),
(37, 'Soporte Técnico al Hosting', '767', '1685000', 0, '30.00', '0.00', '0.00', '', '2017-04-06 00:00:00', '2017-04-29 00:00:00', 1, 20, 3, 8, '2017-04-06 16:26:17', '2017-04-06 16:26:17'),
(38, 'Ajustes y actualización de Formulario Inscripciones Media Maratón Cali', '1112', '270000', 0, '3.00', '0.00', '0.00', 'Actualizar el formulario de inscripciones para Media Maratón y realizar prueba del botón de pago.', '2017-04-06 00:00:00', '2017-04-10 00:00:00', 1, 18, 22, 8, '2017-04-06 16:38:11', '2017-04-06 16:50:36'),
(39, 'Sitio web desarrollo', '0961', '11,180,344', 0, '126.00', '116.00', '0.00', '', '2017-04-06 00:00:00', '2017-05-29 00:00:00', 1, 21, 11, 8, '2017-04-06 17:02:53', '2017-04-06 19:35:34'),
(40, 'Sitio web espejo', '0961 -2', '1427944', 0, '29.50', '0.00', '0.00', '', '2017-04-06 00:00:00', '2017-05-29 00:00:00', 1, 21, 11, 8, '2017-04-06 17:10:01', '2017-04-06 17:10:01'),
(41, 'Pauta invierte en tus sueños', '1060', '800000', 0, '2.00', '1.00', '0.00', '', '2017-04-06 00:00:00', '2017-04-29 00:00:00', 1, 5, 2, 8, '2017-04-06 19:20:35', '2017-04-06 19:20:35'),
(42, 'Carga de Certificados 10K Semana Santa', '1114', '150000', 0, '2.00', '0.00', '0.00', '', '2017-04-06 00:00:00', '2017-04-07 00:00:00', 1, 18, 22, 10, '2017-04-06 23:02:59', '2017-04-08 06:00:02'),
(43, 'Creación cuentas  de correo', '1092', '690000', 0, '1.00', '0.00', '0.00', '', '2017-04-06 00:00:00', '2018-03-28 00:00:00', 1, 22, 11, 8, '2017-04-06 23:36:17', '2017-04-06 23:36:17'),
(44, 'Pauta Descuento Pescadería', '1097', '500000', 0, '2.00', '0.00', '0.00', '', '2017-04-07 00:00:00', '2017-04-08 00:00:00', 1, 5, 2, 10, '2017-04-07 12:50:50', '2017-04-09 06:00:01'),
(45, 'Piezas Pauta Uni2Kids', '1113', '1540000', 0, '20.50', '0.00', '0.00', '', '2017-04-07 00:00:00', '2017-04-11 00:00:00', 1, 19, 11, 8, '2017-04-07 17:07:13', '2017-04-07 17:07:13'),
(46, 'Pauta Lego', '1078', '3000000', 0, '10.00', '0.00', '0.00', '', '2017-04-07 00:00:00', '2017-04-29 00:00:00', 1, 5, 2, 8, '2017-04-07 19:20:48', '2017-04-07 19:20:48'),
(47, 'Pauta Tour hacienda tablones', '1099', '400000', 0, '2.00', '0.00', '0.00', '', '2017-04-07 00:00:00', '2017-04-26 00:00:00', 1, 5, 2, 8, '2017-04-07 19:26:20', '2017-04-07 19:26:20'),
(48, 'Paura carruseles revistas droguerías', '1101', '400000', 0, '4.00', '0.00', '0.00', '', '2017-04-07 00:00:00', '2017-04-24 00:00:00', 1, 5, 2, 8, '2017-04-07 19:32:55', '2017-04-07 19:32:55'),
(49, 'Pauta Descuento Jhonson¨s', '1117', '100000', 0, '2.00', '0.00', '0.00', '', '2017-04-27 00:00:00', '2017-04-27 00:00:00', 1, 5, 2, 8, '2017-04-07 19:45:57', '2017-04-07 19:45:57'),
(50, 'Pauta carruseles cincuentazo 12 abril', '116', '500000', 0, '4.00', '0.00', '0.00', '', '2017-04-10 00:00:00', '2017-04-12 00:00:00', 1, 5, 2, 8, '2017-04-07 19:59:50', '2017-04-07 19:59:50'),
(51, 'Pauta Parque Acuático', '1118', '300000', 0, '2.00', '0.00', '0.00', '', '2017-04-10 00:00:00', '2017-04-21 00:00:00', 1, 5, 2, 8, '2017-04-07 20:22:09', '2017-04-07 20:22:09'),
(52, 'Pauta Nuevo Punto de la 14', '1119', '300000', 0, '2.00', '0.00', '0.00', '', '2017-04-10 00:00:00', '2017-04-21 00:00:00', 1, 5, 2, 8, '2017-04-07 20:35:48', '2017-04-07 20:35:48'),
(53, 'Pauta Video Rocksito', '1120', '500000', 0, '5.00', '0.00', '0.00', '', '2017-04-14 00:00:00', '2017-04-29 00:00:00', 1, 5, 2, 8, '2017-04-07 20:55:17', '2017-04-07 20:55:17'),
(54, 'Pauta Orlando Duque', '1122', '600000', 1, '3.00', '0.00', '0.00', '', '2017-04-10 00:00:00', '2017-04-20 00:00:00', 1, 5, 2, 8, '2017-04-07 21:15:11', '2017-04-07 21:15:11'),
(55, 'Renovación Hosting y soporte ', '1121', '2650000', 0, '13.00', '0.00', '0.00', '', '2017-04-07 00:00:00', '2018-04-07 00:00:00', 1, 19, 11, 8, '2017-04-07 21:23:02', '2017-04-07 21:23:02'),
(56, 'Pauta 2 mes del niño', '1123', '200000', 0, '2.00', '0.00', '0.00', '', '2017-04-11 00:00:00', '2017-04-20 00:00:00', 1, 5, 2, 8, '2017-04-07 21:38:00', '2017-04-07 21:38:00'),
(57, 'Pauta Celebración día de la madres', '1124', '400000', 0, '2.00', '0.00', '0.00', '', '2017-04-10 00:00:00', '2017-05-02 00:00:00', 1, 5, 2, 8, '2017-04-07 21:49:21', '2017-04-07 21:49:21'),
(58, 'Direccionamiento estratégico abril ', '1115', '10990000', 1, '8.00', '0.00', '0.00', '', '2017-04-07 00:00:00', '2017-04-29 00:00:00', 1, 19, 11, 8, '2017-04-07 21:57:16', '2017-04-07 21:57:16'),
(59, 'Fee Administración redes sociales abril ', '1115-1', '10990000', 1, '160.00', '0.00', '0.00', '', '2017-04-07 00:00:00', '2017-05-05 00:00:00', 1, 19, 11, 8, '2017-04-07 22:13:53', '2017-04-07 22:13:53'),
(60, 'Fee administración contenidos sitio web', '1115 -2', '10990000', 1, '54.00', '0.00', '0.00', '', '2017-04-07 00:00:00', '2017-05-05 00:00:00', 1, 19, 11, 8, '2017-04-07 22:18:06', '2017-04-07 22:18:06'),
(61, 'Pauta Primero de Mayo', '1125', '2500000', 0, '10.00', '0.00', '0.00', '', '2017-04-10 00:00:00', '2017-04-29 00:00:00', 1, 5, 2, 8, '2017-04-07 22:23:44', '2017-04-07 22:23:44'),
(62, 'Fee Administración redes sociales Abril ', '1105', '3400000', 1, '45.00', '0.00', '0.00', '', '2017-04-07 00:00:00', '2017-05-05 00:00:00', 1, 23, 11, 8, '2017-04-07 23:16:16', '2017-04-07 23:16:16'),
(63, 'Fee  creación de contenidos sitio web e intranet', '1105 -1', '3400000', 1, '15.00', '0.00', '0.00', '', '2017-04-07 00:00:00', '2017-05-05 00:00:00', 1, 23, 11, 8, '2017-04-07 23:19:10', '2017-04-07 23:19:10'),
(64, 'Fee creación Key visual ', '1105-2', '3400000', 1, '8.00', '0.00', '0.00', '', '2017-04-07 00:00:00', '2017-05-05 00:00:00', 1, 23, 11, 8, '2017-04-07 23:21:09', '2017-04-07 23:21:09'),
(65, 'Pauta Descuento Droguerías 20% Afiliados', '1129', '400000', 0, '5.00', '0.00', '0.00', '', '2017-04-11 00:00:00', '2017-04-17 00:00:00', 1, 11, 2, 8, '2017-04-08 00:09:58', '2017-04-08 00:09:58');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permissions`
--

CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_unique` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=35 ;

--
-- Volcado de datos para la tabla `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'ver_ots', 'Ver OTS', 'Puede Ver', '2017-03-31 22:32:19', '2017-03-31 22:32:19'),
(2, 'crear_ots', 'Crear OTS', 'Puede Crear', '2017-03-31 22:32:19', '2017-03-31 22:32:19'),
(3, 'editar_ots', 'Editar OTS', 'Puede Editar', '2017-03-31 22:32:19', '2017-03-31 22:32:19'),
(4, 'ver_clientes', 'Ver Clientes', 'Puede Ver', '2017-03-31 22:32:19', '2017-03-31 22:32:19'),
(5, 'crear_clientes', 'Crear Clientes', 'Puede Crear', '2017-03-31 22:32:19', '2017-03-31 22:32:19'),
(6, 'editar_clientes', 'Editar Clientes', 'Puede Editar', '2017-03-31 22:32:19', '2017-03-31 22:32:19'),
(7, 'ver_listado_usuarios', 'Ver Listado de Usuarios', 'Puede Ver', '2017-03-31 22:32:19', '2017-03-31 22:32:19'),
(8, 'crear_usuarios', 'Crear Usuarios', 'Puede Crear', '2017-03-31 22:32:19', '2017-03-31 22:32:19'),
(9, 'editar_usuarios', 'Editar Usuarios', 'Puede Editar', '2017-03-31 22:32:19', '2017-03-31 22:32:19'),
(10, 'ver_foro_creatividad', 'Ver Foro de Creatividad', 'Puede Ver', '2017-03-31 22:32:19', '2017-03-31 22:32:19'),
(11, 'ver_foro_diseno', 'Ver Foro de Diseño', 'Puede Ver', '2017-03-31 22:32:19', '2017-03-31 22:32:19'),
(12, 'ver_foro_desarrollo', 'Ver Foro de Desarrollo', 'Puede Ver', '2017-03-31 22:32:19', '2017-03-31 22:32:19'),
(13, 'ver_foro_contenidos', 'Ver Foro de Contenidos', 'Puede Ver', '2017-03-31 22:32:19', '2017-03-31 22:32:19'),
(14, 'ver_foro_digital', 'Ver Foro de Digital', 'Puede Ver', '2017-03-31 22:32:19', '2017-03-31 22:32:19'),
(15, 'ver_foro_cuentas', 'Ver Foro de Cuentas', 'Puede Ver', '2017-03-31 22:32:19', '2017-03-31 22:32:19'),
(16, 'ver_foro_colaborador', 'Ver Foro Colaborador', 'Muestra el foro dependiendo del area del colaborador', '2017-03-31 22:32:19', '2017-03-31 22:32:19'),
(17, 'ver_listado_areas', 'Ver Areas', 'Puede Ver', '2017-03-31 22:32:19', '2017-03-31 22:32:19'),
(18, 'crear_areas', 'Crear Areas', 'Puede crear', '2017-03-31 22:32:19', '2017-03-31 22:32:19'),
(19, 'editar_areas', 'Editar Areas', 'Puede Editar', '2017-03-31 22:32:19', '2017-03-31 22:32:19'),
(20, 'crear_tareas', 'Crear Tareas', 'Puede crear', '2017-03-31 22:32:19', '2017-03-31 22:32:19'),
(21, 'editar_tareas', 'Editar Tareas', 'Puede Editar', '2017-03-31 22:32:19', '2017-03-31 22:32:19'),
(22, 'ver_roles', 'Ver y editar Roles', 'Puede crear y editar los Roles de la Aplicación', '2017-03-31 22:32:19', '2017-03-31 22:32:19'),
(23, 'ver_trafico', 'Tráfico', 'Puede ver la vista de tráfico', '2017-03-31 22:32:19', '2017-03-31 22:32:19'),
(24, 'editar_trafico', 'Editar Tráfico', 'Puede editar la vista de tráfico', '2017-03-31 22:32:19', '2017-03-31 22:32:19'),
(25, 'ver_historico_areas', 'Historico Áreas', 'Puede ver el Historico de áreas', '2017-03-31 22:32:19', '2017-03-31 22:32:19'),
(26, 'ver_historico_usuarios', 'Historico Usuarios', 'Puede ver el Historico de usuarios', '2017-03-31 22:32:19', '2017-03-31 22:32:19'),
(27, 'ver_fases_planeacion', 'Fases Planeación', 'Puede ver las fases de planeación', '2017-03-31 22:32:19', '2017-03-31 22:32:19'),
(28, 'ver_informes', 'Informes', 'Puede ver las herramientas del foro', '2017-03-31 22:32:19', '2017-03-31 22:32:19'),
(29, 'ver_herramientas', 'Herramientas', 'Puede ver los informes', '2017-03-31 22:32:19', '2017-03-31 22:32:19'),
(30, 'ver_permisos', 'Permisos', 'Puede ver y editar los permisos por rol', '2017-03-31 22:32:19', '2017-03-31 22:32:19'),
(31, 'ver_compras_asociadas', 'Ver Compras Asociadas a la OT', 'Puede Ver las Compras asociadas ', '2017-04-06 22:43:14', '2017-04-06 22:43:14'),
(32, 'crear_compras_asociadas', 'Crear Compras Asociadas a la OT', 'Puede acceder al formulario de Compras asociadas a la OT', '2017-04-06 22:43:14', '2017-04-06 22:43:14'),
(33, 'editar_compras_asociadas', 'Editar Compras Asociadas a la OT', 'Puede Editar alguna compra asociada ya creada', '2017-04-06 22:43:14', '2017-04-06 22:43:14'),
(34, 'borrar_tarea', 'Borrar Tarea', 'Puede Borrar las Tareas ', '2017-04-07 23:00:51', '2017-04-07 23:00:51');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permission_role`
--

CREATE TABLE IF NOT EXISTS `permission_role` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_role_id_foreign` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(1, 2),
(2, 2),
(3, 2),
(4, 2),
(5, 2),
(6, 2),
(7, 2),
(8, 2),
(9, 2),
(10, 2),
(11, 2),
(12, 2),
(13, 2),
(14, 2),
(15, 2),
(16, 2),
(17, 2),
(18, 2),
(19, 2),
(20, 2),
(21, 2),
(22, 2),
(23, 2),
(24, 2),
(25, 2),
(26, 2),
(27, 2),
(28, 2),
(29, 2),
(30, 2),
(31, 2),
(32, 2),
(33, 2),
(34, 2),
(1, 3),
(2, 3),
(4, 3),
(5, 3),
(6, 3),
(10, 3),
(11, 3),
(12, 3),
(13, 3),
(14, 3),
(15, 3),
(17, 3),
(34, 3),
(1, 4),
(4, 4),
(10, 4),
(11, 4),
(12, 4),
(13, 4),
(14, 4),
(17, 4),
(20, 4),
(21, 4),
(31, 4),
(32, 4),
(33, 4),
(16, 5),
(17, 5),
(21, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planeacion_fases`
--

CREATE TABLE IF NOT EXISTS `planeacion_fases` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(85) COLLATE utf8_unicode_ci NOT NULL,
  `planeacion_tipos_id` int(10) unsigned NOT NULL,
  `estado` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `planeacion_fases_planeacion_tipos_id_foreign` (`planeacion_tipos_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=76 ;

--
-- Volcado de datos para la tabla `planeacion_fases`
--

INSERT INTO `planeacion_fases` (`id`, `nombre`, `planeacion_tipos_id`, `estado`, `created_at`, `updated_at`) VALUES
(1, 'Levantamiento Requerimientos', 1, 0, '2017-03-31 22:32:19', '2017-03-31 22:32:19'),
(2, 'Desarrollo/Maquetado', 2, 0, '2017-03-31 22:32:19', '2017-03-31 22:32:19'),
(3, 'Calidad y pruebas Desarrollo', 3, 0, '2017-03-31 22:32:19', '2017-03-31 22:32:19'),
(4, 'Publicacion', 4, 0, '2017-03-31 22:32:19', '2017-03-31 22:32:19'),
(5, 'Implementación de Pauta', 5, 0, '2017-04-01 02:42:54', '2017-04-01 02:42:54'),
(6, 'Capacitaciones', 6, 0, '2017-04-03 20:31:07', '2017-04-03 20:31:07'),
(7, 'Reunión Cliente', 6, 0, '2017-04-03 20:31:45', '2017-04-03 20:31:45'),
(8, 'Reunión Interna', 6, 0, '2017-04-03 20:31:57', '2017-04-03 20:31:57'),
(9, 'Cotización Mapa de Cliente', 7, 0, '2017-04-03 20:33:48', '2017-04-03 20:33:48'),
(10, 'Presentación de Propuesta', 7, 0, '2017-04-03 20:35:17', '2017-04-03 20:35:17'),
(11, 'Análisis y definición de Keywords', 8, 0, '2017-04-03 21:50:47', '2017-04-03 21:50:47'),
(12, 'Redacción de las meta etiquetas', 8, 0, '2017-04-03 21:51:00', '2017-04-03 21:51:00'),
(13, 'Implementación de SEO', 8, 0, '2017-04-03 21:51:13', '2017-04-03 21:51:13'),
(14, 'Informe mensual', 8, 0, '2017-04-03 21:51:25', '2017-04-03 21:51:25'),
(15, 'Revisión contenido', 9, 0, '2017-04-03 18:32:58', '2017-04-03 18:32:58'),
(16, 'Ajuste de contenidos', 9, 0, '2017-04-03 18:33:14', '2017-04-03 18:33:14'),
(17, 'Creación de Contenidos', 9, 0, '2017-04-03 18:38:31', '2017-04-03 18:38:31'),
(18, 'Renovación', 10, 0, '2017-04-03 19:16:46', '2017-04-03 19:16:46'),
(19, 'Soporte', 10, 1, '2017-04-03 19:18:29', '2017-04-09 20:20:43'),
(20, 'Diseño de Home', 11, 0, '2017-04-03 20:21:22', '2017-04-03 20:21:22'),
(21, 'Diseño internas', 11, 0, '2017-04-03 20:21:35', '2017-04-03 20:21:35'),
(22, 'Diseño responsive', 11, 0, '2017-04-03 20:21:49', '2017-04-03 20:21:49'),
(23, 'Diseño de Wireframes', 21, 0, '2017-04-03 20:24:25', '2017-04-09 18:14:05'),
(24, 'Diseño de piezas de Redes - Parrilla', 13, 0, '2017-04-03 20:25:39', '2017-04-09 18:31:13'),
(25, 'Diseño Banners  Afiches y artes individuales', 13, 0, '2017-04-03 20:26:13', '2017-04-03 20:26:13'),
(26, 'Despiece de artes', 14, 0, '2017-04-03 20:28:00', '2017-04-03 20:28:00'),
(27, 'Maquetado home', 14, 0, '2017-04-03 20:28:21', '2017-04-03 20:28:21'),
(28, 'Maquetado interna - incluye sólo una', 14, 0, '2017-04-03 20:28:51', '2017-04-03 20:28:51'),
(29, 'Maquetado landing', 14, 0, '2017-04-03 20:29:06', '2017-04-03 20:29:06'),
(30, 'Diseño de piezas', 13, 0, '2017-04-03 21:15:02', '2017-04-09 18:40:18'),
(31, 'Configuración SEO Básico', 4, 0, '2017-04-03 21:18:21', '2017-04-03 21:18:21'),
(32, 'Capacitación', 4, 0, '2017-04-03 21:19:06', '2017-04-03 21:19:06'),
(33, 'Manual', 4, 0, '2017-04-03 21:19:22', '2017-04-03 21:19:22'),
(34, 'Diagramación e Inclusión Contenidos', 2, 0, '2017-04-03 21:20:15', '2017-04-03 21:20:15'),
(35, 'Ajustes de Desarrollo-Maquetado', 2, 0, '2017-04-03 21:20:34', '2017-04-03 21:20:34'),
(36, 'Implementación Responsive design', 2, 0, '2017-04-03 21:20:49', '2017-04-03 21:20:49'),
(37, 'Ajustes Desarrollo-Maquetado', 3, 0, '2017-04-03 21:21:48', '2017-04-03 21:21:48'),
(38, 'Crossbrowsing', 3, 0, '2017-04-03 21:22:01', '2017-04-03 21:22:01'),
(39, 'Ajustes Web', 2, 0, '2017-04-03 21:37:05', '2017-04-03 21:37:05'),
(40, 'Informe de soporte', 2, 0, '2017-04-03 21:42:59', '2017-04-03 21:42:59'),
(41, 'Ajustes de copy', 22, 0, '2017-04-03 22:23:05', '2017-04-09 20:02:38'),
(42, 'Conceptualización de piezas de parrilla', 22, 0, '2017-04-03 22:24:31', '2017-04-09 20:07:40'),
(43, 'Ajuste pieza gráfica ', 13, 0, '2017-04-03 22:25:04', '2017-04-09 18:40:31'),
(44, 'Estrategia', 16, 0, '2017-04-04 02:24:56', '2017-04-04 02:24:56'),
(45, 'Idea y Concepto', 16, 0, '2017-04-04 02:25:58', '2017-04-04 02:25:58'),
(46, 'Diseño de Key Visual', 16, 0, '2017-04-04 02:26:38', '2017-04-04 02:26:38'),
(47, 'Definición de canales y contenidos', 16, 0, '2017-04-04 02:27:00', '2017-04-04 02:27:00'),
(48, 'Estrategia Creativa para Redes Sociales', 16, 0, '2017-04-04 02:28:16', '2017-04-04 02:28:16'),
(49, 'Carga de Contenidos en Redes Socioales', 22, 0, '2017-04-05 22:54:32', '2017-04-09 20:04:53'),
(50, 'Carga de Contenidos en Sitio Web', 18, 0, '2017-04-05 22:55:38', '2017-04-05 22:55:38'),
(51, 'Construcción de KeyWord Planner', 19, 0, '2017-04-06 16:29:23', '2017-04-06 16:29:23'),
(52, 'Envío de Mailings', 20, 0, '2017-04-07 20:27:22', '2017-04-07 20:27:22'),
(53, 'Plan de Pauta', 19, 0, '2017-04-07 22:44:31', '2017-04-07 22:44:31'),
(54, 'Mapa de navegación', 21, 0, '2017-04-09 18:14:46', '2017-04-09 18:14:46'),
(55, 'Partitura de interacción', 21, 0, '2017-04-09 18:15:29', '2017-04-09 18:15:29'),
(56, 'Diseño de Landing Page', 11, 0, '2017-04-09 18:25:07', '2017-04-09 18:25:07'),
(57, 'Despiece de interfaces', 11, 0, '2017-04-09 18:26:04', '2017-04-09 18:26:04'),
(58, 'Diseño de Mailing', 11, 0, '2017-04-09 18:28:33', '2017-04-09 18:28:33'),
(59, 'Maquetado de Mailing', 11, 0, '2017-04-09 18:29:59', '2017-04-09 18:29:59'),
(60, 'Ajustes depiezas de Parrilla', 13, 0, '2017-04-09 18:55:31', '2017-04-09 20:03:08'),
(61, 'Ajuste de interfases', 11, 0, '2017-04-09 18:56:53', '2017-04-09 18:56:53'),
(62, 'Ajuste en Mailing', 11, 0, '2017-04-09 18:57:32', '2017-04-09 18:57:32'),
(63, 'Ajuste de Home', 11, 0, '2017-04-09 18:58:16', '2017-04-09 18:58:16'),
(64, 'Carga de Contenidos', 9, 0, '2017-04-09 20:03:54', '2017-04-09 20:03:54'),
(65, 'Planeación de Parrilla', 22, 0, '2017-04-09 20:06:50', '2017-04-09 20:06:50'),
(66, 'Programación de Parrilla', 22, 0, '2017-04-09 20:08:03', '2017-04-09 20:08:03'),
(67, 'Servicio al cliente - Monitoreo ', 22, 0, '2017-04-09 20:08:28', '2017-04-09 20:08:28'),
(68, 'Cubrimiento de eventos', 22, 0, '2017-04-09 20:08:43', '2017-04-09 20:08:43'),
(69, 'Informe Mensual - Rendimiento de redes sociales', 22, 0, '2017-04-09 20:09:27', '2017-04-09 20:09:27'),
(70, 'Graficación de líneas editoriales', 23, 0, '2017-04-09 20:11:33', '2017-04-09 20:11:33'),
(71, 'Graficación de Manual para redes sociles', 23, 0, '2017-04-09 20:12:18', '2017-04-09 20:12:18'),
(72, 'Realización de estructura de palabras claves - Keyword Planner', 24, 0, '2017-04-09 20:15:09', '2017-04-09 20:15:09'),
(73, 'Soporte mensual', 10, 0, '2017-04-09 20:19:45', '2017-04-09 20:19:45'),
(74, 'Soporte eventual', 10, 0, '2017-04-09 20:20:10', '2017-04-09 20:20:10'),
(75, 'Creación de Diagrama de Flujos', 1, 0, '2017-04-09 20:25:43', '2017-04-09 20:26:09');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planeacion_tipos`
--

CREATE TABLE IF NOT EXISTS `planeacion_tipos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(85) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `estado` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `areas_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `planeacion_tipos_areas_id_foreign` (`areas_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=25 ;

--
-- Volcado de datos para la tabla `planeacion_tipos`
--

INSERT INTO `planeacion_tipos` (`id`, `nombre`, `descripcion`, `estado`, `created_at`, `updated_at`, `areas_id`) VALUES
(1, 'Planeacion web -  intranet - App', NULL, 0, '2017-03-31 22:32:19', '2017-04-09 20:25:18', 3),
(2, 'Desarrollo', NULL, 0, '2017-03-31 22:32:19', '2017-04-09 19:44:22', 3),
(3, 'Calidad', NULL, 0, '2017-03-31 22:32:19', '2017-04-09 19:43:11', 3),
(4, 'Publicacion', NULL, 0, '2017-03-31 22:32:19', '2017-04-09 19:43:28', 3),
(5, 'Paid Media Display - Paid Media Facebook', NULL, 0, '2017-04-01 02:42:08', '2017-04-09 20:15:59', 5),
(6, 'Reuniones ', NULL, 0, '2017-04-03 20:30:47', '2017-04-03 20:30:47', NULL),
(7, 'Cotización', NULL, 0, '2017-04-03 20:33:26', '2017-04-03 20:33:26', NULL),
(8, 'SEO - Search Engine Optimization', NULL, 0, '2017-04-03 21:50:38', '2017-04-09 19:42:44', 5),
(9, 'Administración de contenidos web', NULL, 0, '2017-04-03 18:32:41', '2017-04-09 19:45:56', 4),
(10, 'Soporte', NULL, 0, '2017-04-03 19:16:26', '2017-04-09 19:43:41', 3),
(11, 'Diseño', NULL, 0, '2017-04-03 20:21:00', '2017-04-09 17:39:34', 2),
(12, 'Planeación estratégica', NULL, 0, '2017-04-03 20:24:01', '2017-04-09 04:10:26', 1),
(13, 'Diseño de piezas gráficas ', NULL, 0, '2017-04-03 20:25:17', '2017-04-09 18:30:30', 2),
(14, 'Maquetado', NULL, 0, '2017-04-03 20:27:44', '2017-04-03 20:27:44', NULL),
(15, 'Contenido', NULL, 0, '2017-04-03 22:24:16', '2017-04-09 19:45:44', 4),
(16, 'Estrategia Creativa', NULL, 0, '2017-04-04 02:24:32', '2017-04-09 04:10:05', 1),
(17, 'Contenidos en Redes Sociales', NULL, 0, '2017-04-05 22:54:26', '2017-04-09 19:46:07', 4),
(18, 'Contenidos en Sitio Web', NULL, 0, '2017-04-05 22:55:24', '2017-04-05 22:55:24', NULL),
(19, 'Planeación de Pauta', NULL, 0, '2017-04-06 16:28:04', '2017-04-06 16:28:04', NULL),
(20, 'Mailings', NULL, 0, '2017-04-07 20:27:08', '2017-04-07 20:27:08', 5),
(21, 'Arquitectura de información', NULL, 0, '2017-04-09 18:13:29', '2017-04-09 18:13:29', 2),
(22, 'Administración de redes sociales', NULL, 0, '2017-04-09 19:53:14', '2017-04-09 19:53:14', 4),
(23, 'Pre-Operativos para redes sociales', NULL, 0, '2017-04-09 20:10:20', '2017-04-09 20:10:20', 1),
(24, 'Pauta en Google Search', NULL, 0, '2017-04-09 20:14:09', '2017-04-09 20:14:09', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `requerimientos_ots`
--

CREATE TABLE IF NOT EXISTS `requerimientos_ots` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `horas` decimal(15,2) NOT NULL,
  `areas_id` int(10) unsigned NOT NULL,
  `ots_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `requerimientos_ots_areas_id_foreign` (`areas_id`),
  KEY `requerimientos_ots_ots_id_foreign` (`ots_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=135 ;

--
-- Volcado de datos para la tabla `requerimientos_ots`
--

INSERT INTO `requerimientos_ots` (`id`, `nombre`, `horas`, `areas_id`, `ots_id`, `created_at`, `updated_at`) VALUES
(1, 'Realizar 8 amplificaciones de post', '2.00', 5, 1, '2017-04-01 00:46:54', '2017-04-01 00:46:54'),
(2, 'Amplificar post', '4.00', 1, 2, '2017-04-01 01:39:29', '2017-04-01 02:19:06'),
(3, 'Amplificación de 6 Post', '4.00', 5, 3, '2017-04-01 02:01:04', '2017-04-01 02:01:04'),
(4, 'Amplificar post', '4.00', 5, 2, '2017-04-01 02:19:06', '2017-04-01 02:19:06'),
(5, '7 amplificaciones de Post', '8.00', 5, 4, '2017-04-01 03:01:41', '2017-04-01 03:01:41'),
(6, 'Coordinación área', '160.00', 1, 5, '2017-04-03 19:50:03', '2017-04-03 19:50:03'),
(7, 'Coordinación área', '160.00', 2, 5, '2017-04-03 19:50:03', '2017-04-03 19:50:03'),
(8, 'Coordinación área', '160.00', 3, 5, '2017-04-03 19:50:03', '2017-04-03 19:50:03'),
(9, 'Coordinación área', '160.00', 4, 5, '2017-04-03 19:50:03', '2017-04-03 19:50:03'),
(10, 'Coordinación área', '160.00', 5, 5, '2017-04-03 19:50:03', '2017-04-03 19:50:03'),
(11, 'Coordinación área', '160.00', 6, 5, '2017-04-03 19:50:03', '2017-04-03 19:50:03'),
(12, 'Fee de Mantenimiento E-Commerce ', '8.00', 3, 6, '2017-04-03 21:34:24', '2017-04-03 21:34:24'),
(13, 'Seo sitio web e informe ', '10.00', 5, 7, '2017-04-03 21:38:39', '2017-04-03 21:38:39'),
(14, 'Análisis y definición de Keywords', '5.00', 5, 8, '2017-04-03 17:09:52', '2017-04-03 17:09:52'),
(15, 'Redacción de las meta etiquetas', '8.00', 5, 8, '2017-04-03 17:09:52', '2017-04-03 17:09:52'),
(16, 'Implementación de SEO', '3.00', 5, 8, '2017-04-03 17:09:52', '2017-04-03 17:09:52'),
(17, 'Informe mensual', '2.00', 5, 8, '2017-04-03 17:09:52', '2017-04-03 17:09:52'),
(18, 'Analista Digital', '17.00', 1, 9, '2017-04-03 18:27:44', '2017-04-03 19:32:16'),
(19, 'Diseño de piezas y de parrilla', '28.00', 2, 9, '2017-04-03 18:27:44', '2017-04-03 19:32:16'),
(20, 'Diseño para activos digitales', '4.00', 2, 9, '2017-04-03 18:27:44', '2017-04-03 19:32:16'),
(21, 'Desarrollo en activos digitales', '8.00', 3, 9, '2017-04-03 18:27:44', '2017-04-03 19:32:16'),
(22, 'Community & Content Manager', '50.00', 4, 9, '2017-04-03 18:27:44', '2017-04-03 19:32:16'),
(23, 'Analista Digital', '17.00', 5, 9, '2017-04-03 18:27:44', '2017-04-03 19:32:16'),
(24, 'Renovación de Hosting', '0.50', 3, 10, '2017-04-03 19:15:51', '2017-04-03 19:15:51'),
(25, 'Compra de Certificado SSL', '0.50', 3, 10, '2017-04-03 19:15:51', '2017-04-03 19:15:51'),
(26, 'Soporte Técnico al Hosting ', '20.00', 3, 10, '2017-04-03 19:15:51', '2017-04-03 19:15:51'),
(27, 'Fee de soporte para sitio web', '4.00', 3, 11, '2017-04-03 19:49:14', '2017-04-03 19:49:14'),
(29, 'Acompañamiento Estratégico', '12.00', 1, 14, '2017-04-03 20:08:17', '2017-04-06 16:53:37'),
(30, 'Diseñador Gráfico Full time -In house', '160.00', 2, 14, '2017-04-03 20:08:17', '2017-04-06 16:53:37'),
(31, 'Diseñador Gráfico Medio Tiempo - In house', '80.00', 2, 14, '2017-04-03 20:08:17', '2017-04-06 16:53:37'),
(32, 'Desarrollo Activos Digitales', '48.00', 3, 14, '2017-04-03 20:08:17', '2017-04-06 16:53:37'),
(33, 'Content Manager Full Time In house', '160.00', 4, 14, '2017-04-03 20:08:17', '2017-04-06 16:53:37'),
(34, 'Community Manager Full time In house', '160.00', 4, 14, '2017-04-03 20:08:17', '2017-04-06 16:53:37'),
(35, 'Analista Campañas ', '44.00', 5, 14, '2017-04-03 20:08:17', '2017-04-06 16:53:37'),
(36, 'Acompañamiento al cliente Ejecutiva', '16.00', 6, 14, '2017-04-03 20:08:17', '2017-04-06 16:53:37'),
(37, 'Diseñador Medio Tiempo', '80.00', 2, 15, '2017-04-03 20:12:14', '2017-04-03 21:30:49'),
(38, 'Content Manager Vallempresa', '40.00', 4, 15, '2017-04-03 20:12:14', '2017-04-03 20:12:14'),
(45, 'Diseño de Sitio Web PLM', '49.50', 2, 20, '2017-04-03 20:16:26', '2017-04-05 19:54:52'),
(46, 'Desarrollo de Sitio Web PLM', '143.00', 3, 20, '2017-04-03 20:16:26', '2017-04-05 19:54:52'),
(47, 'Carga de contenido de Sitio Web PLM', '31.00', 4, 20, '2017-04-03 20:16:26', '2017-04-05 19:54:52'),
(48, 'SEO inicial del Sitio Web PLM', '40.00', 5, 20, '2017-04-03 20:16:26', '2017-04-05 19:54:52'),
(49, 'Diseñador Piezas Gráficas Centro de Empleo', '80.00', 2, 21, '2017-04-03 20:17:10', '2017-04-03 20:17:10'),
(50, 'Community Manager Centro de Empleo', '40.00', 4, 21, '2017-04-03 20:17:10', '2017-04-03 20:17:10'),
(51, 'Content Manager Centro de Empleo', '40.00', 4, 21, '2017-04-03 20:17:10', '2017-04-03 20:17:10'),
(52, 'Acompañamiento Estratégico Redes Sociales', '2.00', 1, 22, '2017-04-03 20:36:18', '2017-04-03 20:36:18'),
(53, 'Diseño de piezas para redes sociales', '9.50', 2, 22, '2017-04-03 20:36:18', '2017-04-03 20:36:18'),
(54, 'Video Mensual', '22.00', 2, 22, '2017-04-03 20:36:18', '2017-04-03 20:36:18'),
(55, 'Diseño de piezas para redes sociales', '9.50', 4, 22, '2017-04-03 20:36:18', '2017-04-03 20:36:18'),
(56, 'Video Mensual', '22.00', 4, 22, '2017-04-03 20:36:18', '2017-04-03 20:36:18'),
(57, 'Administración sitio web', '2.00', 2, 23, '2017-04-03 20:41:24', '2017-04-03 20:41:24'),
(58, 'Administración sitio web', '4.00', 3, 23, '2017-04-03 20:41:24', '2017-04-03 20:41:24'),
(59, 'Administración sitio web', '2.00', 4, 23, '2017-04-03 20:41:24', '2017-04-03 20:41:24'),
(60, 'Creación de pieza grafica - Infografía sencilla', '2.00', 2, 24, '2017-04-03 20:44:32', '2017-04-03 20:44:32'),
(61, 'Monitoreo y optimización de contenidos e Informe mensual SEO', '9.00', 5, 24, '2017-04-03 20:44:32', '2017-04-03 20:44:32'),
(62, 'Soporte Sitio Web', '4.00', 3, 25, '2017-04-03 20:48:40', '2017-04-03 20:59:12'),
(63, 'Elaboración de minitextos para sección productos', '13.00', 1, 26, '2017-04-03 20:57:48', '2017-04-03 20:57:48'),
(64, 'Creación de 3 artículos para Novedades', '9.00', 1, 26, '2017-04-03 20:57:48', '2017-04-03 20:57:48'),
(65, 'Creación de contenidos para Blog Momentos', '54.00', 1, 26, '2017-04-03 20:57:48', '2017-04-03 20:57:48'),
(66, 'Creación de 3 artículos para Actividades', '6.00', 1, 26, '2017-04-03 20:57:48', '2017-04-03 20:57:48'),
(67, 'Community Manager Vallempresa', '40.00', 4, 15, '2017-04-03 21:30:49', '2017-04-03 21:30:49'),
(68, 'Content Manager Vallempresa', '40.00', 4, 15, '2017-04-03 21:30:49', '2017-04-03 21:30:49'),
(69, 'Renovación hosting y dominio', '1.00', 3, 27, '2017-04-04 13:40:24', '2017-04-04 13:40:24'),
(70, 'Soporte al Hosting', '12.00', 3, 27, '2017-04-04 13:40:24', '2017-04-04 13:40:24'),
(71, 'Diseño de sitio web y edición de 100 imágenes', '56.00', 2, 28, '2017-04-04 17:42:27', '2017-04-05 19:40:36'),
(72, 'Desarrollo de sitio web', '118.00', 3, 28, '2017-04-04 17:42:27', '2017-04-05 19:40:36'),
(73, 'Carga de contenidos sitio web ', '33.00', 4, 28, '2017-04-04 17:42:27', '2017-04-05 19:40:36'),
(74, 'SEO inicial estándar', '34.00', 5, 28, '2017-04-04 17:42:27', '2017-04-05 19:40:36'),
(75, 'Compra espacio en Hosting ', '1.00', 3, 29, '2017-04-04 23:21:52', '2017-04-04 23:21:52'),
(76, 'Realización de Flujo', '4.00', 2, 30, '2017-04-05 21:23:26', '2017-04-06 14:50:55'),
(77, 'Realización de Flujo', '4.00', 3, 30, '2017-04-05 21:23:26', '2017-04-06 14:50:55'),
(78, 'Informe Marzo - Soporte Sitio Web', '1.00', 3, 31, '2017-04-05 21:29:48', '2017-04-05 21:33:37'),
(79, 'Desarrollo de Sitio Web', '98.00', 2, 32, '2017-04-05 21:47:14', '2017-04-05 21:47:14'),
(80, 'Desarrollo de Sitio Web', '98.00', 3, 32, '2017-04-05 21:47:14', '2017-04-05 21:47:14'),
(81, 'Diseño de Sitio Web', '56.00', 2, 33, '2017-04-05 22:15:40', '2017-04-05 22:17:23'),
(82, 'Desarrollo Sitio Web', '99.00', 3, 33, '2017-04-05 22:15:40', '2017-04-05 22:17:23'),
(83, 'Carga de Contenidos', '14.00', 4, 33, '2017-04-05 22:15:40', '2017-04-05 22:17:23'),
(84, 'Implementar Plan de Pauta realizado', '8.00', 5, 34, '2017-04-06 15:23:03', '2017-04-06 15:23:03'),
(85, 'Amplificar post mes del niño', '1.00', 5, 35, '2017-04-06 16:00:06', '2017-04-06 16:00:06'),
(86, 'Amplificar post cincuentazo', '1.00', 5, 36, '2017-04-06 16:21:50', '2017-04-06 16:21:50'),
(87, 'Soporte al Hosting del Sitio Web', '30.00', 3, 37, '2017-04-06 16:26:17', '2017-04-06 16:26:17'),
(88, 'Actualizar el formulario de inscripciones para Media Maratón Cali', '3.00', 3, 38, '2017-04-06 16:38:11', '2017-04-06 16:50:36'),
(89, 'carga de contenidos ', '2.00', 1, 39, '2017-04-06 17:02:53', '2017-04-06 19:35:34'),
(90, 'carga de contenidos ', '2.00', 2, 39, '2017-04-06 17:02:53', '2017-04-06 19:35:34'),
(91, 'carga de contenidos ', '2.00', 3, 39, '2017-04-06 17:02:53', '2017-04-06 19:35:34'),
(92, 'Desarrollo sitio web espejo', '24.00', 3, 40, '2017-04-06 17:10:01', '2017-04-06 17:10:01'),
(93, 'Carga contenidos sitio espejo ', '5.50', 4, 40, '2017-04-06 17:10:01', '2017-04-06 17:10:01'),
(94, 'carga de contenidos ', '2.00', 4, 39, '2017-04-06 17:15:56', '2017-04-06 19:35:34'),
(95, 'carga de contenidos ', '2.00', 5, 39, '2017-04-06 17:15:56', '2017-04-06 19:35:34'),
(96, 'Amplificar post', '1.00', 5, 41, '2017-04-06 19:20:35', '2017-04-06 19:20:35'),
(97, 'Carga de certificados 10K Semana Santa', '2.00', 3, 42, '2017-04-06 23:02:59', '2017-04-06 23:02:59'),
(98, 'Creación de cuentas de correo', '1.00', 3, 43, '2017-04-06 23:36:17', '2017-04-06 23:36:17'),
(99, 'Amplificar post ', '1.00', 5, 44, '2017-04-07 12:50:50', '2017-04-07 12:50:50'),
(100, 'Piezas pauta Uni2Kids Abril', '20.50', 2, 45, '2017-04-07 17:07:13', '2017-04-07 17:07:13'),
(101, 'Implementar Plan de Pauta', '10.00', 5, 46, '2017-04-07 19:20:48', '2017-04-07 19:20:48'),
(102, 'Amplificar post', '1.00', 5, 47, '2017-04-07 19:26:20', '2017-04-07 19:26:20'),
(103, 'Informe pauta', '1.00', 5, 47, '2017-04-07 19:26:20', '2017-04-07 19:26:20'),
(104, 'Pautar 4 carruseles', '3.00', 5, 48, '2017-04-07 19:32:55', '2017-04-07 19:32:55'),
(105, 'pauta post', '1.00', 5, 49, '2017-04-07 19:45:57', '2017-04-07 19:45:57'),
(106, 'informe', '1.00', 5, 49, '2017-04-07 19:45:57', '2017-04-07 19:45:57'),
(107, 'Pautar 3 carruseles', '3.00', 5, 50, '2017-04-07 19:59:50', '2017-04-07 20:24:07'),
(108, 'Informe', '2.00', 5, 50, '2017-04-07 19:59:50', '2017-04-07 20:24:07'),
(109, 'amplificar post', '1.00', 5, 51, '2017-04-07 20:22:09', '2017-04-07 20:22:09'),
(110, 'informe', '1.00', 5, 51, '2017-04-07 20:22:09', '2017-04-07 20:22:09'),
(111, 'amplificar post', '1.00', 5, 52, '2017-04-07 20:35:48', '2017-04-07 20:35:48'),
(112, 'informe ', '1.00', 5, 52, '2017-04-07 20:35:48', '2017-04-07 20:35:48'),
(113, 'Pauta post regionales', '4.00', 5, 53, '2017-04-07 20:55:17', '2017-04-07 20:55:17'),
(114, 'Informe', '1.00', 5, 53, '2017-04-07 20:55:17', '2017-04-07 20:55:17'),
(115, 'Pauta 3 post', '2.00', 5, 54, '2017-04-07 21:15:11', '2017-04-07 21:15:11'),
(116, 'Informe', '1.00', 5, 54, '2017-04-07 21:15:11', '2017-04-07 21:15:11'),
(117, 'Renovación Hosting y soporte al Hosting ', '13.00', 3, 55, '2017-04-07 21:23:02', '2017-04-07 21:23:02'),
(118, 'Pauta 2 mes del niño', '2.00', 5, 56, '2017-04-07 21:38:00', '2017-04-07 21:38:00'),
(119, 'amplificar post', '1.00', 5, 57, '2017-04-07 21:49:21', '2017-04-07 21:49:21'),
(120, 'Informe', '1.00', 5, 57, '2017-04-07 21:49:21', '2017-04-07 21:49:21'),
(121, 'Direccionamiento estratégico', '5.00', 1, 58, '2017-04-07 21:57:16', '2017-04-07 21:57:16'),
(122, 'Informe de gestión mensual', '3.00', 6, 58, '2017-04-07 21:57:16', '2017-04-07 21:57:16'),
(123, 'Administración redes sociales ( CM + Diseño)', '160.00', 4, 59, '2017-04-07 22:13:53', '2017-04-07 22:13:53'),
(124, 'Adaptación de piezas basadas en editable enviado por cliente', '8.00', 2, 60, '2017-04-07 22:18:06', '2017-04-07 22:18:06'),
(125, 'Ajustes en sitio web ', '4.00', 3, 60, '2017-04-07 22:18:06', '2017-04-07 22:18:06'),
(126, 'Carga de contenidos en sitio web ', '38.00', 4, 60, '2017-04-07 22:18:06', '2017-04-07 22:18:06'),
(127, 'Informe sitio web', '4.00', 5, 60, '2017-04-07 22:18:06', '2017-04-07 22:18:06'),
(128, 'Implementar Pauta', '9.00', 5, 61, '2017-04-07 22:23:44', '2017-04-07 22:23:44'),
(129, 'Informe', '1.00', 5, 61, '2017-04-07 22:23:44', '2017-04-07 22:23:44'),
(130, 'Administración redes sociales ', '45.00', 4, 62, '2017-04-07 23:16:16', '2017-04-07 23:16:16'),
(131, 'Creación contenidos sitio web e intranet', '15.00', 4, 63, '2017-04-07 23:19:10', '2017-04-07 23:19:10'),
(132, 'Creación Key visual', '8.00', 1, 64, '2017-04-07 23:21:09', '2017-04-07 23:21:09'),
(133, 'Amplificar post', '4.00', 5, 65, '2017-04-08 00:09:58', '2017-04-08 00:09:58'),
(134, 'Informe', '1.00', 5, 65, '2017-04-08 00:09:58', '2017-04-08 00:09:58');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'owner', 'Proyect Owner', 'Usuario con todos los privilegios de la aplicación', '2017-03-31 22:32:19', '2017-03-31 22:32:19'),
(2, 'desarrollo', 'Test Profile', 'Usuario con Privilegios para poder testear la Aplicación', '2017-03-31 22:32:19', '2017-03-31 22:32:19'),
(3, 'cuentas', 'Cuentas', 'Usuario con algunos permisos especiales, pero con restricciones', '2017-03-31 22:32:19', '2017-03-31 22:32:19'),
(4, 'coordinador', 'Coordinador', 'Usuario con los permisos de asignar tareas', '2017-03-31 22:32:19', '2017-03-31 22:32:19'),
(5, 'colaborador', 'Colaborador', 'Usuario sin permisos, solo puede cambiar estados de tareas', '2017-03-31 22:32:19', '2017-03-31 22:32:19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `role_user`
--

CREATE TABLE IF NOT EXISTS `role_user` (
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `role_user_role_id_foreign` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `role_user`
--

INSERT INTO `role_user` (`user_id`, `role_id`) VALUES
(1, 1),
(8, 2),
(2, 3),
(3, 3),
(10, 3),
(11, 3),
(22, 3),
(4, 4),
(5, 4),
(6, 4),
(7, 4),
(9, 4),
(12, 5),
(13, 5),
(14, 5),
(15, 5),
(16, 5),
(17, 5),
(18, 5),
(19, 5),
(20, 5),
(21, 5),
(23, 5),
(24, 5),
(25, 5),
(26, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8_unicode_ci,
  `payload` text COLLATE utf8_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL,
  UNIQUE KEY `sessions_id_unique` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tareas`
--

CREATE TABLE IF NOT EXISTS `tareas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre_tarea` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_entrega_area` datetime DEFAULT NULL,
  `fecha_entrega_cuentas` datetime DEFAULT NULL,
  `descripcion` varchar(2024) COLLATE utf8_unicode_ci NOT NULL,
  `enlaces_externos` varchar(2050) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tiempo_estimado` decimal(15,2) DEFAULT NULL,
  `tiempo_real` decimal(15,2) DEFAULT NULL,
  `tiempo_mapa_cliente` decimal(15,2) DEFAULT NULL,
  `fecha_entrega_cliente` datetime DEFAULT NULL,
  `estados_id` int(10) unsigned NOT NULL,
  `areas_id` int(10) unsigned NOT NULL,
  `usuarios_id` int(10) unsigned NOT NULL,
  `ots_id` int(10) unsigned NOT NULL,
  `planeacion_fases_id` int(10) unsigned NOT NULL,
  `encargado_id` int(11) DEFAULT NULL,
  `prioridad_id` int(11) DEFAULT NULL,
  `estado_trafico_id` int(11) DEFAULT NULL,
  `comentario_trafico` varchar(2024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tareas_estados_id_foreign` (`estados_id`),
  KEY `tareas_usuarios_id_foreign` (`usuarios_id`),
  KEY `tareas_areas_id_foreign` (`areas_id`),
  KEY `tareas_planeacion_fases_id_foreign` (`planeacion_fases_id`),
  KEY `tareas_ots_id_foreign` (`ots_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=191 ;

--
-- Volcado de datos para la tabla `tareas`
--

INSERT INTO `tareas` (`id`, `nombre_tarea`, `fecha_entrega_area`, `fecha_entrega_cuentas`, `descripcion`, `enlaces_externos`, `tiempo_estimado`, `tiempo_real`, `tiempo_mapa_cliente`, `fecha_entrega_cliente`, `estados_id`, `areas_id`, `usuarios_id`, `ots_id`, `planeacion_fases_id`, `encargado_id`, `prioridad_id`, `estado_trafico_id`, `comentario_trafico`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Pauta Descuento Droguerías - Gif días de descuento por iniciar mes ', NULL, NULL, 'Inverisión Neta: $70.000 el 31 de marzo', '', NULL, NULL, NULL, '2017-04-01 00:00:00', 7, 5, 1, 1, 1, 5, 11, NULL, NULL, '2017-04-01 00:52:49', '2017-04-01 00:52:49', NULL),
(2, 'Pauta Tennis de campo', NULL, NULL, 'Inversión neta $280.000 del 3 al 17 de abril', '', NULL, NULL, '4.00', '2017-04-03 00:00:00', 7, 5, 2, 2, 4, 5, 11, NULL, NULL, '2017-04-01 01:51:06', '2017-04-01 01:51:06', NULL),
(3, 'Pauta Tennis de campo', NULL, NULL, 'Inversión neta $280.000 del 3 al 17 de abril', NULL, NULL, NULL, '4.00', '2017-04-03 00:00:00', 7, 5, 2, 2, 4, 5, 11, NULL, NULL, '2017-04-01 01:54:38', '2017-04-01 01:54:38', NULL),
(4, 'Pauta Descuento Droguerías - Gif días de descuento por iniciar mes ', NULL, NULL, 'Inverisión Neta: $70.000 el 31 de marzo', '', NULL, NULL, NULL, '2017-03-31 00:00:00', 7, 5, 2, 1, 4, 5, 11, NULL, NULL, '2017-04-01 02:05:52', '2017-04-01 02:05:52', NULL),
(5, 'Pauta concierto de la cuna a la jungla - Cali', NULL, NULL, 'Inversión neta:$105.000  pauta del 12 al 29 de abril', '', NULL, NULL, NULL, '2017-04-12 00:00:00', 7, 5, 11, 3, 1, 5, 12, NULL, NULL, '2017-04-01 02:05:54', '2017-04-01 02:05:54', NULL),
(6, 'Pauta Descuento Droguerías - Pieza HOY 10% de descuento', NULL, NULL, 'Pauta Descuento Droguerías - Pieza HOY 10% de descuento', '', NULL, NULL, NULL, '2017-03-31 00:00:00', 7, 5, 2, 1, 4, 5, 11, NULL, NULL, '2017-04-01 02:12:33', '2017-04-01 02:12:33', NULL),
(7, 'Pauta Descuento Droguerías - Gif que Anuncie descuento 15 de abril', NULL, NULL, 'Inverisión Neta: $49.000 el 6 y 7 de abril', '', NULL, NULL, NULL, '2017-04-06 00:00:00', 7, 5, 2, 1, 4, 5, 11, NULL, NULL, '2017-04-01 02:25:38', '2017-04-01 02:25:38', NULL),
(8, 'Pauta Descuento Droguerías - Pieza HOY 10% de descuento', NULL, NULL, 'Inverisión Neta: $35.000, pauta solo el 8 de abril', NULL, NULL, NULL, NULL, '2017-04-08 00:00:00', 7, 5, 2, 1, 4, 5, 11, NULL, NULL, '2017-04-01 02:27:52', '2017-04-01 02:27:52', NULL),
(9, 'Pauta Descuento Droguerías - Gif que Anuncie descuento 15 de abril', NULL, NULL, 'Inversión Neta: $35.000, el 13 y 14 de abril. ', '', NULL, NULL, NULL, '2017-04-13 00:00:00', 7, 5, 2, 1, 4, 5, 12, NULL, NULL, '2017-04-01 02:30:14', '2017-04-01 02:30:14', NULL),
(10, 'Pauta Descuento Droguerías - Pieza HOY 10% de descuento', NULL, NULL, 'Inverisión Neta: $35.000 para pauta solo el 15 de abril', NULL, NULL, NULL, NULL, '2017-04-15 00:00:00', 7, 5, 2, 1, 4, 5, 12, NULL, NULL, '2017-04-01 02:31:20', '2017-04-01 02:31:20', NULL),
(11, 'Pauta Descuento Droguerías - Gif que Anuncie descuento este 15 de abril)', NULL, NULL, 'Inverisión Neta: $49.000 el 20 y 21 de abril', NULL, NULL, NULL, NULL, '2017-04-20 00:00:00', 5, 5, 2, 1, 4, 5, 12, NULL, NULL, '2017-04-01 02:32:19', '2017-04-04 21:25:12', NULL),
(12, 'Pauta concierto de la cuna a la jungla - Buga', NULL, NULL, 'Inversión neta: $70.000  pauta del 12 al 29 de abril.', '', NULL, NULL, NULL, '2017-04-12 00:00:00', 7, 5, 1, 3, 4, 5, 13, NULL, NULL, '2017-04-01 02:38:59', '2017-04-01 02:38:59', NULL),
(13, 'Pauta concierto de la cuna a la jungla - Tuluá', NULL, NULL, 'Inversión neta: $70.000  pauta del 12 al 29 de abril.', '', NULL, NULL, NULL, '2017-04-12 00:00:00', 7, 5, 1, 3, 5, 5, 13, NULL, NULL, '2017-04-01 02:46:27', '2017-04-01 02:46:27', NULL),
(14, 'Pauta concierto de la cuna a la jungla - Cartago', NULL, NULL, 'Inversión neta: $70.000  pauta del 12 al 29 de abril', NULL, NULL, NULL, NULL, '2017-04-12 00:00:00', 7, 5, 1, 3, 5, 5, 12, NULL, NULL, '2017-04-01 02:48:12', '2017-04-01 02:48:12', NULL),
(15, 'Pauta Descuento Droguerías - Pieza HOY 10% de descuento', NULL, NULL, 'Inverisión Neta: $35.000 para pauta solo el 22 de abril', NULL, NULL, NULL, NULL, '2017-04-22 00:00:00', 7, 5, 2, 1, 4, 5, 12, NULL, NULL, '2017-04-01 02:49:54', '2017-04-01 02:49:54', NULL),
(16, 'Informe Resultados Pauta descuentos Droguerìas', NULL, NULL, 'Informe Resultados Pauta descuentos Droguerías', NULL, NULL, NULL, NULL, '2017-04-25 00:00:00', 7, 5, 2, 1, 4, 5, 12, NULL, NULL, '2017-04-01 02:50:50', '2017-04-01 02:50:50', NULL),
(17, 'Pauta concierto de la cuna a la jungla - Buenaventura', NULL, NULL, 'Inversión neta:$35.000  pauta del 12 al 29 de abril', NULL, NULL, NULL, NULL, '2017-04-12 00:00:00', 7, 5, 1, 3, 5, 5, 12, NULL, NULL, '2017-04-01 02:51:06', '2017-04-01 02:51:06', NULL),
(18, 'Pauta cursos Cali Abril - Preparación a base de cafe', NULL, NULL, 'Fecha de pauta:10 al 24 de abril\nInversión:$140.000 \nCiudad de pauta :  Cali\nPublico objetivos: mujeres y hombres jóvenes con niños entre 25 y 45 años.', '', NULL, NULL, NULL, '2017-04-10 00:00:00', 7, 5, 2, 4, 5, 5, 11, NULL, NULL, '2017-04-01 03:22:20', '2017-04-01 03:22:20', NULL),
(19, 'Pauta cursos Cali Abril Automaquillaje', NULL, NULL, 'Fecha de pauta: 5 al 17 de abril\nInversión de pauta:$175.000', NULL, NULL, NULL, NULL, '2017-04-05 00:00:00', 7, 5, 2, 4, 5, 5, 11, NULL, NULL, '2017-04-01 03:23:46', '2017-04-01 03:23:46', NULL),
(20, 'Pauta cursos Cali Abril Decoración y extensión de uñas', NULL, NULL, 'Fecha de pauta: 24 de abril  al 4 de mayo\nInversión de pauta:$175.000', NULL, NULL, NULL, NULL, '2017-04-24 00:00:00', 7, 5, 2, 4, 5, 5, 11, NULL, NULL, '2017-04-01 03:25:34', '2017-04-01 03:25:34', NULL),
(21, 'Pauta cursos Cali Abril Decoración de fiestas temáticas', NULL, NULL, 'MB: Fecha de pauta:17 al 30 de abril\nInversión:189.000', NULL, NULL, NULL, NULL, '2017-04-17 00:00:00', 7, 5, 2, 4, 5, 5, 11, NULL, NULL, '2017-04-01 03:26:18', '2017-04-01 03:26:18', NULL),
(22, 'Pauta cursos Cali Abril - Excel avanzado, oficce básico, tablas dinámicas', NULL, NULL, 'Fecha de pauta: 25 de abril a 6 de mayo\nInversión:$280.000', NULL, NULL, NULL, NULL, '2017-04-25 00:00:00', 7, 5, 2, 4, 5, 5, 12, NULL, NULL, '2017-04-01 03:28:57', '2017-04-01 03:28:57', NULL),
(23, 'Pauta cursos Cali Abril - Secretariado sistematizado contable', NULL, NULL, 'Fecha de pauta: 1  al 21 de mayo \nInversión:$126.000', NULL, NULL, NULL, NULL, '2017-05-01 00:00:00', 7, 5, 2, 4, 5, 5, 12, NULL, NULL, '2017-04-01 03:30:01', '2017-04-01 03:30:01', NULL),
(24, 'Pauta cursos Cali Abril - Cocina mexicana', NULL, NULL, 'Fecha de pauta:1 a 11 de mayo\nInversión: $210.000', NULL, NULL, NULL, NULL, '2017-05-01 00:00:00', 7, 5, 2, 4, 5, 5, 12, NULL, NULL, '2017-04-01 03:30:47', '2017-04-01 03:30:47', NULL),
(25, 'Capacitación Directivos de Comfandi', '2017-04-04 00:00:00', '2017-04-04 00:00:00', 'Capacitación a directivos sobre posicionamiento de marca en medios digitales', '', '4.00', '28.00', '28.00', '2017-04-04 00:00:00', 1, 5, 5, 5, 6, 5, 11, NULL, NULL, '2017-04-03 20:37:47', '2017-04-03 21:00:16', NULL),
(26, 'Implementar y optimizar seo Polylon', NULL, NULL, 'Implementar y optimizar seo al sitio web de polylon www.polylon.com', '', NULL, NULL, NULL, NULL, 7, 5, 2, 7, 13, 5, 12, NULL, NULL, '2017-04-03 21:53:10', '2017-04-03 21:53:10', NULL),
(27, 'Informe Mensual SEO Abril', NULL, NULL, 'Realizar informe mensual del seo realizado para polylon. ', '', NULL, NULL, NULL, NULL, 7, 5, 2, 7, 14, 5, 12, NULL, NULL, '2017-04-03 21:59:31', '2017-04-03 21:59:31', NULL),
(28, 'Implementación e  informe de SEO ', '2017-04-28 00:00:00', '2017-05-02 00:00:00', 'Implementación de estrategia SEO e informe del comportamiento del SEO para mes de Abril. ', '', '18.00', NULL, '18.00', '2017-05-01 00:00:00', 3, 5, 3, 8, 13, 15, 12, NULL, NULL, '2017-04-03 17:19:21', '2017-04-10 01:22:45', NULL),
(29, 'Cambiar nombre del seguro de ProgreSER', '2017-04-05 00:00:00', '2017-04-05 00:00:00', 'Cambiar nombre del seguro de ProgreSER por Seguro Todo Riesgo, en titular, texto e interna de preguntas frecuentes. ', '', '0.25', '0.25', NULL, '2017-04-05 00:00:00', 1, 4, 11, 9, 16, 7, 11, NULL, NULL, '2017-04-03 18:36:26', '2017-04-05 12:47:25', NULL),
(30, 'Artículo blog ProgreSER Semana Santa ', '2017-04-05 00:00:00', '2017-04-06 00:00:00', 'Artículo para el blog de ProgreSER para publicar antes de semana santa, sobre una ruta en moto para esos días, invitando a los usuarios a disfrutar de la moto en esos días de descanso. Recordar las palabras clave: Crédito para motos\nFinanciación para motos\nSeguro para motos\nAseguradoras de motos\nMotos Honda\nMotos Hero\n\nSi tiene dudas sobre el SEO preguntar antes  al área de digital, ya que a partir de ahora ellos también van a revisar el contenido ', NULL, '4.00', '8.00', NULL, '2017-04-06 00:00:00', 20, 4, 11, 9, 17, 16, 12, NULL, NULL, '2017-04-03 18:39:54', '2017-04-07 20:14:35', NULL),
(31, 'Notas app ProgreSER', '2017-04-04 00:00:00', '2017-04-05 00:00:00', 'Redactar dos notas sobre educación financiera para la app. Deben ser consejos sobre educación financiera, no tan largos como los de la app. Siempre tener en cuenta que son consejos de Próspero y los amigos de Próspero.', '', '2.00', '4.00', NULL, '2017-04-05 00:00:00', 20, 4, 11, 9, 17, 16, 12, NULL, NULL, '2017-04-03 18:41:51', '2017-04-07 20:15:28', NULL),
(32, 'Renovación Hosting, SSL y Soporte al Host', NULL, NULL, 'Se debe realizar la renovación de espacio en Hosting para el sitio web de Constructora Meléndez por un año. Se debe comprar el Certificado de Seguridad SSL por un año. Este cliente contará con 20 horas de Soporte al Hosting. ', '', NULL, NULL, NULL, '2017-04-25 00:00:00', 7, 3, 3, 10, 18, 6, 12, NULL, NULL, '2017-04-03 19:22:11', '2017-04-03 19:22:11', NULL),
(33, 'Diseño de Home para tres líneas de producto', '2017-04-07 00:00:00', '2017-04-07 00:00:00', 'Se debe realizar el diseño del Home para cada línea de producto-micrositio: Muñeca Tradicional, Muñeca Express y Muñeca Mini. Para esto basarse en la propuesta de Key Visual del pre-home aprobada por el cliente. Tener en cuenta el mapa de navegación final para incluirlo dentro del menú que tendría cada mundo. La estructura sería la misma, solo cambian colores e imágenes. ', 'https://drive.google.com/drive/folders/0B86D1VMd7k4gckRaTmRJWm9nbDg\n\nhttps://drive.google.com/drive/folders/0B86D1VMd7k4gb2pQY3RueEdIS1E', '12.00', '28.00', '12.00', '2017-04-10 00:00:00', 1, 2, 3, 20, 20, 9, 11, NULL, NULL, '2017-04-03 20:40:13', '2017-04-10 13:08:58', NULL),
(34, 'Pieza Mocoa - Harinera', '2017-04-05 00:00:00', '2017-04-05 00:00:00', 'Sería algo como estamos unidos de Harinera, y en texto de arriba del post la invitación a donar con el banco de alimento', '', '0.50', '0.50', '0.50', '2017-04-04 00:00:00', 1, 4, 22, 22, 4, 7, 11, NULL, NULL, '2017-04-03 20:55:01', '2017-04-05 12:47:07', NULL),
(35, 'Diseño pieza mocoa Harinera del Valle ', '2017-04-05 00:00:00', '2017-04-05 00:00:00', 'Diseño deuna pieza sobre Mocoa  para Harinera del Valle. Se pone en espera hasta tener la conceptualización. ', '', '1.00', '1.00', '1.00', '2017-04-04 00:00:00', 1, 2, 22, 22, 4, 23, 11, NULL, NULL, '2017-04-03 21:00:52', '2017-04-07 20:08:26', NULL),
(36, 'Creación Contenidos Productos, Tips y Recetas', '2017-04-07 00:00:00', '2017-04-10 00:00:00', 'Crear minitextos finales para los productos de las tres líneas (Muñeca Tradicional, Express y Mini), tener en cuenta comentarios del cliente: menos información funcional y más contenido emocional que evoque al antojo y a la ilusión. Realizar ajuste de estilo de 9 recetas, 3 por línea de producto. Redacción de 9 tips, 3 por cada línea de producto. \nNota: ir pensando en los temas que podríamos abordar para los 9 artículos del Blog, estudiar la competencia y ver cómo se está comportando la marca en cuanto a contenidos que realizan.  ', '\\\\SERVER\\Elementos_Compartidos2\\PASTAS LA MUÑECA/CONTENIDOS - BLOG MOMENTOS\n\n\\\\SERVER\\Elementos_Compartidos2\\PASTAS LA MUÑECA/CONTENIDOS - PRODUCTOS\n\n\\\\SERVER\\Elementos_Compartidos2\\PASTAS LA MUÑECA/PRESENTACIÓN PLM', '16.00', NULL, '97.00', '2017-04-10 00:00:00', 3, 1, 3, 26, 17, 4, 12, NULL, NULL, '2017-04-03 21:13:59', '2017-04-03 21:18:09', NULL),
(37, 'Graficar Vacantes y convocatorias Agencias Empleo', '2017-04-04 00:00:00', '2017-04-04 00:00:00', 'Graficar  vacantes y convocatorias de empleo según la descripción realizada en el drive', 'https://docs.google.com/presentation/d/1Jg5kHK183PWqY-CrdJYB0puK7Qmv73UBXxj3MQ83xx4/edit?usp=sharing', '2.00', '1.00', NULL, '2017-04-04 00:00:00', 1, 2, 2, 15, 24, 23, 11, NULL, NULL, '2017-04-03 21:31:04', '2017-04-07 20:09:27', NULL),
(38, 'Ajuste botón de Proveedores', '2017-04-04 00:00:00', '2017-04-05 00:00:00', 'En el home el botón de proveedores debe generar un link en una pestaña nueva! Target Blanc.', '', '0.50', '0.40', NULL, NULL, 1, 3, 22, 23, 39, 21, 11, NULL, NULL, '2017-04-03 21:37:59', '2017-04-06 22:57:38', NULL),
(39, 'Ajuste de tipografia en el banner', '2017-04-04 00:00:00', '2017-04-05 00:00:00', 'Se debe realizar un ajuste en la tipografia del banner de esta interna de: http://www.harineradelvalle.com/es/nuestras-marcas.html \nla letra que se visualiza debe ser un poco más gruesa. No sé si este tipo de letra tenga una versión bold. ', NULL, '1.00', '0.50', NULL, NULL, 1, 3, 22, 23, 39, 21, 13, NULL, NULL, '2017-04-03 21:40:36', '2017-04-06 22:44:37', NULL),
(40, 'Informe de soporte mes de marzo de sitio web', '2017-04-04 00:00:00', '2017-04-05 00:00:00', 'Se debe realizar el informe de soporte del mes de marzo correspondiente al comportamiento del sitio web. Por favor se debe revisar porque el sitio web no esta cargando debidamente cuando se digita www.hv.com.co sin embargo se sigue navegando después del inicio y la url cambia a harineradelvalle.com. Incluir estas recomendaciones en el informe y como podemos corregirlo.', NULL, '4.00', '5.00', NULL, NULL, 1, 3, 22, 25, 40, 21, 12, NULL, NULL, '2017-04-03 21:44:18', '2017-04-06 22:57:56', NULL),
(41, 'Revisión imagen historia', '2017-04-04 00:00:00', '2017-04-05 00:00:00', 'En la línea de tiempo de la interna de historia, en el año 2014 se realizó el cambio de la imagen y no se esta visualizando en la web. Por favor revisar.', NULL, '0.50', '0.40', NULL, NULL, 1, 3, 22, 23, 39, 21, 12, NULL, NULL, '2017-04-03 21:46:18', '2017-04-06 22:56:51', NULL),
(42, 'Ajuste en copy piezas promoción Hero ', '2017-04-04 00:00:00', '2017-04-04 00:00:00', 'Ajuste en el copy de estas piezas: el post redes, en el slide  de la web, noticia de la web y nota web.  En lugar $700.000 debe decir $500.000. ', '', '3.00', '1.00', '0.50', '2017-04-04 00:00:00', 1, 2, 11, 9, 30, 24, 11, NULL, NULL, '2017-04-03 21:48:19', '2017-04-07 19:19:17', NULL),
(43, 'Creación temas artículos Manitoba', '2017-04-04 00:00:00', '2017-04-04 00:00:00', 'Esta tarea se realiza porque la persona que nos va a ayudar con los artículos, necesita que se le especifiquen los temas a trabajar.', '', '1.00', '0.50', NULL, NULL, 1, 1, 4, 5, 17, 4, 12, NULL, NULL, '2017-04-03 21:49:21', '2017-04-03 22:45:15', NULL),
(44, 'Cambio en la promoción de ProgreSER y Hero ', '2017-04-05 00:00:00', '2017-04-05 00:00:00', 'Cambio en la promoción de Hero y ProgreSER, ya que el bono de $700.000 ya no aplica si no que es es de $500.000. Así que se debe cambiar en el texto de la noticia y nota, despublicar la información en la web e intranet, mientras se ajustan las piezas. ', '', '1.00', '1.00', '1.00', '2017-04-04 00:00:00', 1, 4, 11, 9, 4, 16, 11, NULL, NULL, '2017-04-03 21:53:02', '2017-04-05 12:47:44', NULL),
(45, 'Revisión video 3 HV off line', '2017-04-05 00:00:00', '2017-04-06 00:00:00', 'Revisión video off line del video 3, revisar si se está de acuerdo con lo enviado por Rodolfo. si estan de acuerdo con lo propuesto por Rodolfo, la idea es que a partir de este salga la gráfica. Este video lo envió Natalia a Andrés por correo', '', '2.00', '2.00', NULL, '2017-04-05 00:00:00', 1, 2, 22, 22, 16, 9, 11, NULL, NULL, '2017-04-03 22:04:22', '2017-04-07 22:40:59', NULL),
(46, 'Detener pauta Formulario Hero bono $700.000', NULL, NULL, 'Detener pauta sobre el bono de $700.000 con Hero, ya que el bono cambio a $500.000 pesos y se vana ajustar las piezas. ', '', NULL, NULL, '0.50', '2017-04-03 00:00:00', 7, 5, 11, 9, 5, 5, 11, NULL, NULL, '2017-04-03 22:12:21', '2017-04-03 22:12:21', NULL),
(47, 'Activar pauta formulario Hero ProgreSER', NULL, NULL, 'Duplicar pauta formulario Hero - ProgreSER con el nuevo bono de $500.000 una vez se tenga la pieza ajustada. ', '', NULL, NULL, '0.50', '2017-04-05 00:00:00', 6, 5, 11, 9, 5, 5, 11, NULL, NULL, '2017-04-03 22:15:13', '2017-04-03 22:15:13', NULL),
(48, 'Creación de Artículos para Sección Blog Momentos', NULL, NULL, 'Luego de definir los temas para los artículos que irían dentro del Blog, se deben redactar 9 artículos (3 por cada línea de producto). Éstos deben ser artículos de máximo 500 palabras y deben reflejar el enfoque de cada línea de producto. ', '', NULL, NULL, '9.00', '2017-04-24 00:00:00', 7, 1, 3, 26, 17, 4, 12, NULL, NULL, '2017-04-03 22:43:19', '2017-04-03 22:43:19', NULL),
(49, 'Ajuste de noticia Wapp', '2017-04-05 00:00:00', '2017-04-05 00:00:00', 'Ajustar noticia sobre la herramienta de la app, no es una herramienta para cliente sino para la fuerza comercial, en play store leer la descripción: https://play.google.com/store/apps/details?id=com.progreser.waapprogreser&hl=es. En la ruta estás las piezas para subir la noticia una vez ajustada a la web e intranet. ', '\\\\SERVER\\Elementos_Compartidos2\\ProgreSER\\Wapp ProgreSER\\piezas', '0.50', '30.00', '0.50', '2017-04-05 00:00:00', 20, 4, 11, 9, 16, 16, 11, NULL, NULL, '2017-04-03 23:34:23', '2017-04-07 20:14:59', NULL),
(50, 'Entérate Nueva ubicación Agencia Empleo', '2017-04-05 00:00:00', '2017-04-05 00:00:00', ' solicitan pieza entérate para informar nueva ubicación de la Agencia Comfandi en Jamundí. Indicaciones en el PPT\n', 'https://docs.google.com/presentation/d/1euXKrInkRPSp1j_kNqkONSU2UwKa5XYC_VyMRGK-j3M/edit?usp=sharing', '1.00', '0.50', NULL, NULL, 1, 2, 2, 21, 30, 25, 12, NULL, NULL, '2017-04-04 14:08:32', '2017-04-07 19:19:58', NULL),
(51, 'Renovación de Hosting y Dominio 2017', '2017-04-07 00:00:00', '2017-04-07 00:00:00', 'Realizar la renovación del Hosting y Dominio del sitio web de SIDOC por un año, este cliente cuenta con 12 horas de soporte al año. ', '', '1.00', '1.00', NULL, NULL, 1, 3, 3, 27, 18, 6, 11, NULL, NULL, '2017-04-04 14:21:10', '2017-04-06 16:39:54', NULL),
(52, 'Diseño de páginas internas', NULL, NULL, 'Realizar propuesta de diseño para las siguientes páginas internas del sitio web de PLM: \n1) Productos: interna general e interna de sub-categoría. \n2) Novedades: tipo blog, listado de ítems y detalle de ítems con imágenes. Basarse en Wireframes. \n3) Blog - Momentos \n4) Actividades \n5) Contáctanos\nTener en cuenta el Look and Feel aprobado por el cliente. ', 'https://docs.google.com/spreadsheets/d/1x9siw6pllwsjME5CNomaKb-uJEu_w3Vccw0CxjqE67U/edit#gid=556845817\n\nhttps://drive.google.com/drive/folders/0B86D1VMd7k4gckRaTmRJWm9nbDg\n\n\\\\SERVER\\Elementos_Compartidos2\\PASTAS LA MUÑECA/CONTENIDOS - BLOG MOMENTOS\n\n\\\\SERVER\\Elementos_Compartidos2\\PASTAS LA MUÑECA/CONTENIDOS - PRODUCTOS\n', NULL, NULL, '22.00', '2017-04-19 00:00:00', 7, 2, 3, 20, 21, 9, 12, NULL, NULL, '2017-04-04 15:14:41', '2017-04-04 15:14:41', NULL),
(53, 'Diseño Mailing Abril conferencia empresarial regionales', '2017-04-06 00:00:00', '2017-04-07 00:00:00', 'Diseñar mailing para promocionar conferencia empresarial organizada en convenio con Cámara de Comercio Palmira para darse en regionales. \n info e indicaciones en el PPT.', 'https://docs.google.com/presentation/d/1Bhimhpw7hUUTTrtGAtwzSg5I7cMmvP5bqW4SU2BO5_Y/edit?usp=sharing', '8.00', '7.00', NULL, NULL, 1, 2, 2, 21, 30, 25, 12, NULL, NULL, '2017-04-04 16:10:10', '2017-04-07 19:35:57', NULL),
(54, 'Adaptación del diseño del Home para 2 líneas de producto', NULL, NULL, 'Adaptar el diseño del Home de Muñeca Tradicional para el Home de Muñeca Express y Muñeca Mini. ', '', NULL, NULL, '8.00', '2017-04-10 00:00:00', 7, 2, 3, 20, 20, 9, 11, NULL, NULL, '2017-04-04 16:29:31', '2017-04-04 16:29:31', NULL),
(55, 'Revisión de chat en línea', '2017-04-07 00:00:00', '2017-04-07 00:00:00', 'Cliente solicita que se revise el Chat en Línea del E-Commerce de Kassis que actualmente se encuentra deshabilitado. ', '', '0.00', '0.00', NULL, NULL, 1, 3, 3, 6, 19, 6, 11, NULL, NULL, '2017-04-04 16:33:35', '2017-04-06 22:36:33', NULL),
(56, 'Cambio de fotos Harinera del Valle parrilla ', '2017-04-05 00:00:00', '2017-04-05 00:00:00', 'Cambio de fotos en la parrilla en harinera del Valle.\n\nhttps://we.tl/3jfghwrfWO. \n', '', '1.00', '0.50', NULL, '2017-04-04 00:00:00', 1, 2, 11, 22, 43, 23, 11, NULL, NULL, '2017-04-04 16:38:30', '2017-04-07 20:06:34', NULL),
(57, 'Diseño Responsive', NULL, NULL, 'Se realiza el diseño responsive para las interfaces que se consideren necesarias. ', '', NULL, NULL, '14.00', '2017-04-27 00:00:00', 7, 2, 3, 20, 22, 9, 12, NULL, NULL, '2017-04-04 16:41:31', '2017-04-04 16:41:31', NULL),
(58, 'Análisis y Definición de Key Words', NULL, NULL, 'Análisis inicial para el SEO del sitio web. \nDefinición de Key Words para optimización del sitio web. \nNota: Tener en cuenta que HDA está construyendo los contenidos para el sitio web. La primera entrega de éstos es el 10 de Abril y la segunda entrega el 24 de Abril. ', '', NULL, NULL, '8.00', '2017-04-28 00:00:00', 7, 5, 3, 20, 31, 5, 12, NULL, NULL, '2017-04-04 16:45:46', '2017-04-04 16:45:46', NULL),
(59, 'Desarrollo y maquetado del 50% del sitio en WordPress', NULL, NULL, 'Realizar el desarrollo y maquetado en Wordpress para el 50% del sitio web: \nDiseño debe hacer entrega del despiece al área de Desarrollo. \nInstalación y configuración del CMS Wordpress versión estable. \nCreación contenido administrable, menú, creación de categorías e ítems. \nSe debe maquetar el Home principal y el Home de las tres Líneas de Producto.  \n', '', NULL, NULL, '60.00', '2017-05-10 00:00:00', 7, 3, 3, 20, 2, 6, 12, NULL, NULL, '2017-04-04 16:52:59', '2017-04-04 16:52:59', NULL),
(60, 'Cotización AHL Asesores de Seguros', '2017-04-05 00:00:00', '2017-04-05 00:00:00', 'Cotización para el diseño de sitio web', '', '0.50', '0.50', NULL, '2017-04-04 00:00:00', 1, 1, 4, 5, 9, 4, 12, NULL, NULL, '2017-04-04 18:29:00', '2017-04-04 18:30:55', NULL),
(61, 'Reunión de tráfico', '2017-04-05 00:00:00', '2017-04-05 00:00:00', 'Reunión semanal de tráfico.', '', '3.00', '3.00', NULL, NULL, 1, 1, 4, 5, 8, 4, 13, NULL, NULL, '2017-04-04 18:31:55', '2017-04-04 18:33:06', NULL),
(62, 'Diseño de Páginas Internas', NULL, NULL, 'Realizar el diseño de las siguientes páginas: \n1) La Empresa\n2) Nuestros Productos \n3) Calidad\n4) Escuela del Ladrillo \n5) Nuestras Obras\n6) Tiendas \n7) Contacto \n8) Preguntas Frecuentes \n9) Página de error 404\nNota: todavía NO realizar el diseño de la página interna de cada producto, necesitamos que el cliente nos apruebe primero el formulario cotizador.  ', 'https://drive.google.com/drive/folders/0B86D1VMd7k4gVG82eUxhak1nU00', NULL, NULL, '27.00', '2017-04-20 00:00:00', 7, 2, 3, 28, 21, 9, 11, NULL, NULL, '2017-04-04 19:02:24', '2017-04-04 19:02:24', NULL),
(63, 'Diseño Responsive de Interfaces', NULL, NULL, 'Realizar el diseño responsive para las interfaces que se consideren necesario visualizar. ', '', NULL, NULL, '8.00', '2017-04-27 00:00:00', 7, 2, 3, 28, 22, 9, 12, NULL, NULL, '2017-04-04 19:04:55', '2017-04-04 19:04:55', NULL),
(64, 'Diseño de la parrilla ProgreSER ', '2017-04-07 00:00:00', '2017-04-11 00:00:00', 'Darle prioridad a la pieza de baloto y la pieza de actividad de la app. Avisar cuando están graficadas para enviar a aprobación ', 'https://docs.google.com/presentation/d/18J9bJqYzgxnEPb0ycRU_GYOuqprymM1Cl72Jr_sMgLs/edit?ts=58dede8b#slide=id.p15', '15.00', '8.00', NULL, '2017-04-06 00:00:00', 1, 2, 11, 9, 24, 24, 11, NULL, NULL, '2017-04-04 19:52:17', '2017-04-07 19:18:52', NULL),
(65, 'Gráficos 3 HV', '2017-04-06 00:00:00', '2017-04-07 00:00:00', 'Gráficos del video 3 de Harinera del Valle. Ya se estableció con Rodolfo como debe ser. De igual forma esta primera semana de abril Andrés se va a reunir con Rodolfo. Andrés dime la entrega de esta tarea al cliente final. ', 'Referente establecido por diseño: https://drive.google.com/open?id=0ByONayvbI9CkMlRMSS1uaVdPeEU', '6.00', '6.00', NULL, '2017-04-07 00:00:00', 1, 2, 11, 22, 30, 23, 11, NULL, NULL, '2017-04-04 22:15:51', '2017-04-07 20:06:00', NULL),
(66, 'Realizar Flow Pauta Primero de Mayo', '2017-04-10 00:00:00', '2017-04-10 00:00:00', 'Realizar Flow Pauta Primero de Mayo según la estrategia digital planteada y el plan de pauta desarrollado el cual se encuentra en una pestaña del drive de la ruta. ', 'https://docs.google.com/a/himalayada.com/spreadsheets/d/1FRuFSwTTpKP_idAtLONj_7iT_ZxoTy8pi4n5S4iVuxw/edit?usp=drive_web', '2.00', '1.50', NULL, NULL, 1, 1, 2, 14, 47, 4, 11, NULL, NULL, '2017-04-04 22:24:25', '2017-04-07 12:58:12', NULL),
(67, 'Compra espacio Hosting', '2017-04-07 00:00:00', '2017-04-07 00:00:00', 'Realizar compra de espacio en Hosting para la creación de correos. Se puso la tarea como ajuste web , ya que no se encontró una similar. ', '', '1.00', '1.00', NULL, '2017-04-05 00:00:00', 1, 3, 11, 29, 39, 6, 11, NULL, NULL, '2017-04-04 23:24:43', '2017-04-06 16:17:35', NULL),
(68, 'Carga de interactivo 360', '2017-04-07 00:00:00', '2017-04-07 00:00:00', 'Cliente solicita que se cargue el interactivo 360 para los siguientes proyectos de apartamentos:  Celeste y Magenta. Les comparto las vistas por el Server. ', '\\\\SERVER\\Elementos_Compartidos2\\SOPORTE\\Constructora Meléndez/tour-360-Magenta.rar\n\n\\\\SERVER\\Elementos_Compartidos2\\SOPORTE\\Constructora Meléndez/tour-360-Celeste-apts.rar', '1.50', '1.00', NULL, '2017-04-07 00:00:00', 20, 3, 3, 11, 19, 21, 11, NULL, NULL, '2017-04-05 13:19:31', '2017-04-07 18:56:41', NULL),
(69, 'Capacitación Digital Lyda Comfandi', '2017-04-12 00:00:00', '2017-04-12 00:00:00', 'Capacitación Digital para la persona responsable actualmente de las pautas en Comfandi. \nSe proponen 2 horas de 10 a 12 pm.  ', '', '3.00', NULL, NULL, '2017-04-12 00:00:00', 3, 5, 2, 14, 32, 5, 12, NULL, NULL, '2017-04-05 13:56:51', '2017-04-10 02:01:32', NULL),
(70, 'Reunion ProgreSER', '2017-04-06 00:00:00', '2017-04-06 00:00:00', 'Reunion para solucionar funcionalidad a implementar para catalogos de motos de progreser', '', '4.00', '3.50', '4.00', '2017-04-05 00:00:00', 1, 2, 9, 5, 8, 9, 11, NULL, NULL, '2017-04-05 15:33:15', '2017-04-07 20:09:12', NULL),
(71, 'Revisión de copies parrilla manitoba', '2017-04-06 00:00:00', '2017-04-06 00:00:00', 'Revisión y ajustes de los copies sobre la parrilla de Abril.', '', '1.50', '1.50', NULL, NULL, 1, 1, 4, 5, 15, 4, 12, NULL, NULL, '2017-04-05 19:47:42', '2017-04-05 19:48:53', NULL),
(72, 'Ajuste Entérate nueva sede Jamundí', '2017-04-06 00:00:00', '2017-04-06 00:00:00', 'Realizar los siguientes ajustes importantes para aprobar:\n\n1. Colocar este copy: \nNueva ubicación \nAgencia de Empleo Comfandi\nJAMUNDÍ\n\nA partir de abril \nEncuéntrenos en Cra 7 N° 17 A 27 B/ Bello Horizonte \nTeléfonos: 269 4843 - 315 392 2648\n\n¡Los esperamos!\n\n2. Cambiar imagen de fondo por la de la ruta. ', '\\\\SERVER\\Elementos_Compartidos2\\Comfandi\\Centro de Empleo\\Piezas\\Nueva sede Jamundí', '1.00', '0.50', NULL, '2017-04-05 00:00:00', 1, 2, 2, 21, 30, 25, 11, NULL, NULL, '2017-04-05 20:29:17', '2017-04-07 19:35:38', NULL),
(73, 'Ajustes emailing Conferencia regionales Abril', '2017-04-06 00:00:00', '2017-04-06 00:00:00', '-No son 3 mailing (uno por ciudad) Es uno solo con las 3 fechas\n- Darle más relevancia al título de la conferencia que al ante titulo.\n- Revisar el perfil del conferencista, quedó duplicada la información en una parte', NULL, '2.00', '1.00', NULL, '2017-04-05 00:00:00', 1, 2, 2, 21, 30, 25, 11, NULL, NULL, '2017-04-05 20:31:21', '2017-04-07 19:19:40', NULL),
(74, 'Icono de play store para el sitio web', '2017-04-06 00:00:00', '2017-04-07 00:00:00', 'La idea es poner en el footer de ProgreSER el icono de descargar de la app en Android, Entonces se debe pasar el icono para que desarrollo lo implemente. La idea es que quede debajo del icono de fB \n', '', '0.50', '0.50', '0.50', '2017-04-07 00:00:00', 1, 2, 11, 9, 30, 25, 11, NULL, NULL, '2017-04-05 21:15:55', '2017-04-07 19:18:37', NULL),
(75, 'Realización wireframes', '2017-04-06 00:00:00', '2017-04-06 00:00:00', 'Realización de wireframes del catálogo después de reunión interna ', '', '4.00', '3.50', '4.00', '2017-04-05 00:00:00', 1, 2, 11, 30, 23, 9, 11, NULL, NULL, '2017-04-05 21:25:33', '2017-04-07 19:17:49', NULL),
(76, 'Realización de Flujos catálogo ', '2017-04-07 00:00:00', '2017-04-07 00:00:00', 'Realización de Flujos del catálogo después de reunión interna. ', '', '2.00', '2.00', '4.00', '2017-04-05 00:00:00', 1, 3, 11, 30, 37, 6, 11, NULL, NULL, '2017-04-05 21:27:10', '2017-04-06 22:57:22', NULL),
(77, 'Adaptación de diseño a web e intranet', '2017-04-06 00:00:00', '2017-04-06 00:00:00', 'Adaptar a piezas de la web e intranet, la pieza de cover de la aplicación.  \nWEB.\nSlide Home: 781x338 \nNoticia:  458x339\nINTRANET\nSlide Home sin copy  ( degradado azul) 1240x397: solo la persona, los iconos y el celular sin copy. \nNota intranet sin pata: 585x504. \nLa nota y noticia quitar el botón de descarga y el de icono de play store. \n\nEn la ruta  fijarse en la diapositiva del cover. \n \n', 'https://docs.google.com/presentation/d/1kRE3E4Zb0tPCwQ6_Wxc3tIzp7HCoVrRuSJ1kSh3OH6U/edit?ts=58e4e928#slide=id.p6', '1.00', NULL, '1.00', '2017-04-07 00:00:00', 3, 2, 11, 23, 30, 23, 11, NULL, NULL, '2017-04-05 21:35:22', '2017-04-05 23:01:39', NULL),
(78, 'Adaptación piezas web e intranet  App ', '2017-04-06 00:00:00', '2017-04-06 00:00:00', 'Adaptar a piezas de la web e intranet, la pieza de cover de la aplicación. \n\nWEB. \nSlide Home: 781x338 \nNoticia: 458x339 \nINTRANET \nSlide Home sin copy ( degradado azul) 1240x397: solo la persona, los iconos y el celular sin copy. Nota intranet sin pata: 585x504. \n\nLa nota y noticia quitar el botón de descarga y el de icono de play store. En la ruta fijarse en la diapositiva del cover.\n\n', 'https://docs.google.com/presentation/d/1kRE3E4Zb0tPCwQ6_Wxc3tIzp7HCoVrRuSJ1kSh3OH6U/edit?ts=58e4e928#slide=id.p6', '2.00', '1.00', '1.00', '2017-04-07 00:00:00', 1, 2, 11, 9, 30, 23, 11, NULL, NULL, '2017-04-05 21:44:01', '2017-04-07 19:18:04', NULL),
(79, 'Ajustes en Wireframes', '2017-04-06 00:00:00', '2017-04-06 00:00:00', '- Ajustar en el menú del lado izquierdo Comunidad Dorada para que quede al mismo nivel de Panadería Práctica (Los dos ítems deben quedar al mismo nivel).\n- En la interna de Panadería Práctica cambiar el título por Comunidad dorada y en el botón debajo del texto dejar solo las opciones de CAP APP y Eventos.\n', '', '1.00', '0.50', '1.50', '2017-04-06 00:00:00', 1, 2, 22, 32, 23, 9, 11, NULL, NULL, '2017-04-05 22:00:30', '2017-04-07 20:08:55', NULL),
(80, 'Diseño Home', NULL, NULL, 'Iniciar con el diseño del según Look and Feel aprobado HOME y estructura de Wireframes: tener en cuenta los sgtes. ajustes:\n- En el home se recomienda incluir un vídeo, pueden ser clips del comercial o micro vídeos de shutter stock, también Himalaya debe revisar si hay posibilidad de integrar micro vídeos con un slide de imágenes relacionadas con productos.\n- En la parte inferior del home deben aparecer accesos directos a las categorías de producto con imágenes pequeñas.\n- El orden de las categorías de productos debe ser el siguiente:\n 1. Harina de trigo\n 2. Pre mezclas\n 3. Tortillas \n 4. Syrup', '', NULL, NULL, '8.00', '2017-04-12 00:00:00', 7, 2, 22, 33, 20, 9, 11, NULL, NULL, '2017-04-05 22:27:32', '2017-04-05 22:27:32', NULL),
(81, 'Diseño de Internas', NULL, NULL, 'Realizar diseño de Internas según mapa de navegación aprobado. (Adjunto ruta server).\nTener en cuenta:\n- Para las imágenes que van en cada producto se deben tener en cuenta las siguientes recomendaciones:\nCupcakes y galletas deben llevar imágenes infantiles\nBrownies deben ser imágenes de momentos en familia. Ejemplo: madre e hija.\nTortillas deben ser imágenes de amigos o familias compartiendo un momento especial.\nHarina debe mostrar preparaciones: Ejemplo: deditos de queso.\nPancakes debe mostrar desayunos.\nDoña torta debe mostrar celebraciones\nTortillas de chía, debe mostrar fotos fitness.\n\n- Los vídeos se mostrarán dentro del blog sorprende con haz de oros, ya no quedarán como una sección suelta, todos los videos se traerán desde YouTube.\n\n- Si es necesario Himalaya puede revisar qué artes hay en el fan page de Facebook de la marca para utilizar en los contenidos del nuevo sitio. En caso de elegir alguno, Angie compartiría los artes.\nPara descargar las imágenes Himalaya envía link o código a Angie para que las descargue.\n\n- En el formulario de contacto dejar solo un campo de número telefónico, no manejar teléfono y celular.\n', 'Enlace en el server:\n\\\\SERVER\\Elementos_Compartidos2\\HARINERA DEL VALLE\\2017\\HAZ DE OROS', NULL, NULL, '18.00', '2017-04-18 00:00:00', 7, 2, 22, 33, 21, 9, 11, NULL, NULL, '2017-04-05 22:37:44', '2017-04-05 22:37:44', NULL),
(82, 'Subir video de etiquetas en Fb e Instagram', '2017-04-10 00:00:00', '2017-04-10 00:00:00', 'Subir video  enviado por Rodolfo. Este video debe quedar publicado el sábado día 8 de abril.  Se envía video por wetransfer. \n\nSeguir recomendaciones de rodolfo. \nRodolfo: Te envío las versiones del video. \n\n- AppleProresH1422 - esta versiones es full (es bueno que queden con una versión sin compresión ó muy poco) \n\nFacebook - Te envio el video de facebook en dos versiones a 720p y 1080p. \nInstagram - Te envio el video de Instagram en dos versiones a 720p y 1080p. ', '', '0.50', '0.50', '0.50', '2017-04-07 00:00:00', 1, 4, 11, 22, 17, 7, 12, NULL, NULL, '2017-04-05 22:55:31', '2017-04-10 11:59:47', NULL),
(83, 'Cargar términos y condiciones del concurso', '2017-04-07 00:00:00', '2017-04-07 00:00:00', 'Publicar contenidos de actividad "Locheras" con fecha de vigencia desde el 05 hasta el 21 de abril. ', '', '0.25', '0.25', '0.25', '2017-04-05 00:00:00', 1, 4, 22, 22, 42, 7, 11, NULL, NULL, '2017-04-05 22:55:35', '2017-04-06 12:44:34', NULL),
(84, 'Ajustes infografía Metabolismo activo', '2017-04-07 00:00:00', '2017-04-07 00:00:00', 'Nosotras comenzamos a leer desde media mañana y no desde desayuno, no sé si se pueda cambiar el orden para que comience desayuno desde la esquina y termine la cena en la ubicación de desayuno.\n-          Cambiar la familia por una más colombiana.\n-          Colocar diferentes colores en los círculos para que se vea más variado.\n-          Separar la barra de cereal que está muy pegada a proteína.\n-          Proteína lleva tilde.\n-          Corregir la palabra lácteo tiene la “a” en minúscula.\n-          En el desayuno se debe dejar claro que es una sola opción entre pan, avena o cereal, y agregar huevo.\n-          En media mañana y media tarde, dejar claro que solo se debe consumir una de las opciones.\n-          En el almuerzo quitar la sopa\n-          En la cena quitar las verduras y solo dejar la sopa de verduras. En la Harina Integral poner las tortillas con chía Haz de Oros y agregar proteína.', '', '2.00', '2.00', '1.00', '2017-04-06 00:00:00', 1, 2, 22, 23, 43, 23, 11, NULL, NULL, '2017-04-05 23:11:40', '2017-04-07 20:05:27', NULL),
(85, 'Cambio de video en sitio web HV', '2017-04-10 00:00:00', '2017-04-11 00:00:00', 'Se debe cambiar el video que esta en esta interna http://www.harineradelvalle.com/es/proveedores.html  por el que se adjunta. Código de conducta de Proveedores.\n \nMuchas gracias!\n \nLink descarga video Código de Proveedores:', '\\\\SERVER\\Elementos_Compartidos2\\HARINERA DEL VALLE\\2017\\VIDEOS HV', '0.50', NULL, '0.50', '2017-04-06 00:00:00', 3, 4, 11, 23, 16, 7, 11, NULL, NULL, '2017-04-05 23:27:55', '2017-04-10 12:11:33', NULL),
(86, 'Programación redes sociales HV', '2017-04-07 00:00:00', '2017-04-07 00:00:00', 'Programar parrilla de HV ', 'https://docs.google.com/spreadsheets/d/1thiGbA7Do6KPfJH-a9t20GakpvfTz8oSFyM_fSPyrRg/edit#gid=0', '1.00', '1.00', '1.00', '2017-04-07 00:00:00', 1, 4, 11, 22, 49, 7, 11, NULL, NULL, '2017-04-05 23:32:37', '2017-04-10 12:13:18', NULL),
(87, 'Ajuste interna sostenibilidad HV', NULL, NULL, 'Se debe quitar texto que está debajo del gráfico de la interna siguiente: http://www.harineradelvalle.com/es/sostenibilidad.html. Revisar que al quitarlo no quede mucho espacio en la parte inferior. ', '', NULL, NULL, NULL, '2017-04-06 00:00:00', 6, 3, 11, 23, 39, 6, 11, NULL, NULL, '2017-04-06 00:15:55', '2017-04-06 00:15:55', NULL),
(88, 'Términos y condiciones actividad app ProgreSER redes', '2017-04-07 00:00:00', '2017-04-07 00:00:00', 'Hacer términos y condiciones para actividad app ProgreSER. Consultar la dinámica de la app en la ruta de la parrilla: Diapositiva 2\nhttps://docs.google.com/presentation/d/18J9bJqYzgxnEPb0ycRU_GYOuqprymM1Cl72Jr_sMgLs/edit?ts=58dede8b#slide=id.g2153dc6e82_0_1', '', '1.00', '1.00', '1.00', '2017-04-06 00:00:00', 20, 4, 11, 9, 49, 16, 11, NULL, NULL, '2017-04-06 03:30:06', '2017-04-07 20:14:22', NULL),
(89, 'Noticia sobre Feria crédito Dream Neo web e intranet', '2017-04-07 00:00:00', '2017-04-07 00:00:00', 'Hacer noticia web e intranet sobre feria de crédito Dream Neo Honda', 'Se envía correo con la información o promoción de la feria. Pendiente de poner en el server el doc con la info. ', '0.50', '1.00', '0.50', '2017-04-07 00:00:00', 2, 4, 11, 9, 50, 16, 11, NULL, NULL, '2017-04-06 03:35:34', '2017-04-07 20:50:04', NULL),
(90, 'Diseño piezas feria de crédito Honda Dream Neo abril', '2017-04-07 00:00:00', '2017-04-07 00:00:00', 'Diseño de piezas de feria de crédito Honda Dream Neo\n- Facebook: post orgánico, formulario Facebook. \n- Piezas sitio web e intranet\n\nSe envía por correo solicitud de piezas en presentación. Pendiente de poner en el server la ppto. ', NULL, '8.00', '6.00', NULL, '2017-04-07 00:00:00', 1, 2, 11, 9, 30, 25, 11, NULL, NULL, '2017-04-06 04:10:03', '2017-04-07 19:18:21', NULL),
(91, 'Subir circular de ventas Feria promoción Honda Dream Neo', NULL, NULL, 'Subir circular de ventas de la feria de Honda dream Neo.  A partir del 6 de abril no se puede subir ninguna solicitud a la intranet ya que la vana migrar a otro servidor. ', '', NULL, NULL, '0.15', '2017-04-10 00:00:00', 6, 4, 11, 9, 50, 7, 12, NULL, NULL, '2017-04-06 04:15:49', '2017-04-06 04:15:49', NULL),
(92, 'Medidas App ProgreSER', NULL, NULL, 'Se requiere me pasen un cuadro con las medidas de la app ProgreSER ( Slides) piezas de noticia en miniatura y cuando se abre la noticia para hacer las solicitudes a diseño.', '', NULL, NULL, NULL, '2017-04-07 00:00:00', 7, 3, 11, 9, 39, 6, 11, NULL, NULL, '2017-04-06 04:19:01', '2017-04-06 04:19:01', NULL),
(93, 'Maquetado mails público  externo app ProgreSER', '2017-04-07 00:00:00', '2017-04-07 00:00:00', 'Maquetado mail ProgreSER para el público externo o clientes. Se manda con correo con los mails (3)', NULL, '1.00', '0.50', NULL, NULL, 20, 3, 11, 9, 2, 13, 11, NULL, NULL, '2017-04-06 04:53:35', '2017-04-06 22:08:02', NULL),
(94, 'Maquetado mail ProgreSER Público interno', '2017-04-07 00:00:00', '2017-04-07 00:00:00', 'Maquetado de mails público interno.  Se mando correo con los mails. ', NULL, '1.00', '0.50', NULL, '2017-04-07 00:00:00', 20, 3, 11, 9, 2, 13, 11, NULL, NULL, '2017-04-06 05:03:53', '2017-04-06 22:07:37', NULL),
(95, 'Creación de cuentas de correo', NULL, NULL, 'Cliente solicita que se creen las siguientes cuentas de correo: \n i.fawcett@caffeswimwear.com\ncustomerservice@caffeswimwear.com\n ', '', NULL, NULL, NULL, NULL, 7, 3, 3, 37, 19, 6, 11, NULL, NULL, '2017-04-06 16:27:59', '2017-04-06 16:27:59', NULL),
(96, 'Construcción de Keyword Planner Droguerías Sur Cali', '2017-04-11 00:00:00', '2017-04-11 00:00:00', 'Realizar una estructura de palabras claves ( Keyword Planner) para el plan de pauta de Droguerías Sur Cali, recordemos que el objetivo es dar a conocer estos puntos en el sur. ', '', '2.00', NULL, NULL, '2017-04-11 00:00:00', 3, 5, 2, 34, 51, 14, 11, NULL, NULL, '2017-04-06 16:32:59', '2017-04-10 01:57:26', NULL),
(97, 'Realizar Copies Search Pauta Droguerías Sur Cali', '2017-04-12 00:00:00', '2017-04-12 00:00:00', ' Realizar copies basado en las palabras claves de la estructura que esta realizando Digital P. Separar el espacio para entrega el 18, digital lo realizará en la semana del 10 al 14. ', '', '2.50', NULL, NULL, '2017-04-18 00:00:00', 3, 1, 2, 14, 1, 4, 11, NULL, NULL, '2017-04-06 16:37:38', '2017-04-07 11:23:44', NULL),
(98, 'Actualizar el formulario de inscripciones para Media Maratón', '2017-04-07 00:00:00', '2017-04-10 00:00:00', 'Actualizar el formulario de inscripciones para Media Maratón \n\nHabilitar las inscripciones on-line para la Media Maratón de Cali \nLos datos para tener en cuenta en la modificación del formato:\n\nDistancias: 21.1K, 10K, 5K \nValor inscripción: $60.000 todas las distancias\n\n Tallas camisetas: 6-8, 10-12, 14-16, S, M, L, XL, XXL', '', '3.00', NULL, '3.00', '2017-04-10 00:00:00', 3, 3, 22, 38, 35, 20, 11, NULL, NULL, '2017-04-06 16:54:38', '2017-04-06 17:10:27', NULL),
(99, 'Informe Pauta invierte en tus sueños', '2017-04-10 00:00:00', '2017-04-10 00:00:00', 'Realizar un informe de resultados de la pauta invierte en tus sueños. ', '', '1.00', NULL, NULL, '2017-04-06 00:00:00', 3, 5, 2, 41, 14, 15, 12, NULL, NULL, '2017-04-06 19:22:25', '2017-04-10 01:56:29', NULL),
(100, 'Revisión de nueva opción de pago', NULL, NULL, 'Cliente solicita ayuda revisando lo siguiente: \nEn método de pago aparece una nueva opción de pago que antes no existía: \nPague en línea con Tarjetas de Crédito y Débito De descuento (10%-20%).\nEsto a qué se debe? ', '\\SERVER\\Elementos_Compartidos2\\SOPORTE\\Kassis/opción de pago que no existía.png', NULL, NULL, NULL, NULL, 7, 3, 3, 6, 19, 6, 11, NULL, NULL, '2017-04-06 22:21:59', '2017-04-06 22:21:59', NULL),
(101, 'Carga de certificados 10K Semana Santa', '2017-04-07 00:00:00', '2017-04-07 00:00:00', 'Carga de certificados 10K Semana Santa, es necesario para la carrera del finde 9-abr.-2017', 'https://drive.google.com/drive/folders/0B01qyrjgr0AkUFB1WnB5VjFaTUU', '2.00', '3.00', '2.00', '2017-04-07 00:00:00', 2, 3, 22, 42, 50, 21, 11, NULL, NULL, '2017-04-06 23:24:25', '2017-04-07 18:54:48', NULL),
(102, 'Creación de cuentas de correo ', '2017-04-07 00:00:00', '2017-04-07 00:00:00', 'Se debe crear las siguientes cuentas de correo: \ngerentenacional@borojoelpioneroltda.com ( Carlos Cuero)\nsales@borojoelpioneroltda.com (Yenny Casella)\ncontabilidad@borojoelpioneroltda.com\nfabrica@borojoelpioneroltda.com ( Lily de Ossa)\ngerencia@borojoelpioneroltda.com ( este ya esta pero se debe a Hugo Escobar) y todos deben tener acceso a este correos. \n', '', '1.00', '1.00', NULL, '2017-04-10 00:00:00', 20, 3, 11, 43, 19, 6, 11, NULL, NULL, '2017-04-06 23:41:59', '2017-04-07 17:36:54', NULL),
(103, 'Subir contenido sitio web ProgreSER', '2017-04-07 00:00:00', '2017-04-07 00:00:00', 'Subir contenido sitio web  ProgreSER  sobre la app ( Slide web y noticia) y subir artículo dejarlo despublicado.', 'https://docs.google.com/presentation/d/1kRE3E4Zb0tPCwQ6_Wxc3tIzp7HCoVrRuSJ1kSh3OH6U/edit?ts=58e4e928#slide=id.g2155b4badd_1_42', '2.00', '1.00', NULL, '2017-04-07 00:00:00', 2, 4, 11, 9, 50, 16, 11, NULL, NULL, '2017-04-07 00:01:38', '2017-04-07 20:33:01', NULL),
(104, 'Organización equipo redes sociales', '2017-04-07 00:00:00', '2017-04-07 00:00:00', 'Organización del equipo y cronograma de realización de parrillas para redes sociales.', '', '3.00', '3.00', NULL, NULL, 1, 1, 4, 5, 8, 4, 11, NULL, NULL, '2017-04-07 11:26:04', '2017-04-07 11:27:12', NULL),
(105, 'Reunión interna equipo Comfandi', '2017-04-07 00:00:00', '2017-04-07 00:00:00', 'Reunión interna con Juan Ignacio para hablar del equipo Comfandi.', '', '3.00', '3.00', NULL, NULL, 1, 1, 4, 5, 8, 4, 11, NULL, NULL, '2017-04-07 11:28:17', '2017-04-07 11:29:05', NULL),
(106, 'Reunión interna equipo Comfandi', '2017-04-07 00:00:00', '2017-04-07 00:00:00', 'Reunión interna con Juan Ignacio para hablar del equipo Comfandi.', '', '3.00', '3.00', NULL, NULL, 1, 1, 4, 5, 8, 4, 11, NULL, NULL, '2017-04-07 11:28:19', '2017-04-07 23:33:27', NULL),
(107, 'Comité de producción', '2017-04-07 00:00:00', '2017-04-07 00:00:00', 'Reunión comité de producción.', '', '2.00', '2.00', NULL, NULL, 1, 1, 4, 5, 8, 4, 13, NULL, NULL, '2017-04-07 11:30:23', '2017-04-07 11:30:51', NULL),
(108, 'Presentación estrategia Christus Health', '2017-04-07 00:00:00', '2017-04-07 00:00:00', 'Presentación estrategia Christus Health.', '', '2.00', '2.00', NULL, NULL, 1, 1, 4, 5, 7, 4, 12, NULL, NULL, '2017-04-07 11:31:46', '2017-04-07 11:32:16', NULL),
(109, 'Cotización Diamante', '2017-04-07 00:00:00', '2017-04-07 00:00:00', 'Cotización mailings y landing page.', '', '0.50', '0.50', NULL, NULL, 1, 1, 4, 5, 9, 4, 12, NULL, NULL, '2017-04-07 11:33:16', '2017-04-07 11:33:43', NULL),
(110, 'Conceptualización y revisión parrilla manitoba', '2017-04-07 00:00:00', '2017-04-07 00:00:00', 'Ajustes parrilla Manitoba para incluir a solicitud del cliente el producto Maní con Chocolota.', '', '1.50', '1.50', NULL, NULL, 1, 1, 4, 5, 42, 4, 12, NULL, NULL, '2017-04-07 11:35:30', '2017-04-07 11:36:01', NULL),
(111, 'Resultados Pauta Descuento Pescadería', NULL, NULL, 'Realizar un reporte de como le fue a esta amplificación. ', '', NULL, NULL, NULL, NULL, 4, 5, 2, 44, 14, 2, 12, NULL, NULL, '2017-04-07 12:53:33', '2017-04-10 01:55:00', NULL),
(112, 'Informe Pauta Cursos Abril', '2017-05-08 00:00:00', '2017-05-09 00:00:00', 'Realizar un informe de las pautas de los cursos de abril. ', '', '4.00', NULL, NULL, '2017-05-09 00:00:00', 3, 5, 2, 4, 14, 15, 12, NULL, NULL, '2017-04-07 13:35:05', '2017-04-10 02:05:00', NULL),
(113, 'Informe Pauta Concierto de la Cuna a la Jungla', '2017-05-04 00:00:00', '2017-05-04 00:00:00', 'Realizar un informe de pauta del concierto de la cuna a la jungla que incluya los resultados de la pauta realizada para las diferentes ciudades. Cali - Buga - Tuluá - Cartago - Buenaventura. ', '', '4.00', NULL, NULL, '2017-05-02 00:00:00', 3, 5, 2, 3, 14, 15, 12, NULL, NULL, '2017-04-07 13:41:20', '2017-04-10 02:09:01', NULL),
(114, 'Reporte pauta post tennis de campo', '2017-04-18 00:00:00', '2017-04-18 00:00:00', 'Realizar un reporte de los resultados de la amplificación de este post. ', '', '1.20', NULL, NULL, '2017-04-18 00:00:00', 3, 5, 2, 2, 14, 14, 12, NULL, NULL, '2017-04-07 13:47:31', '2017-04-10 02:16:13', NULL),
(115, 'Informe Pauta Cincuentazo Abril 12', NULL, NULL, 'Realizar un reporte de la pauta del cincuentazo. ', '', NULL, NULL, NULL, '2017-04-13 00:00:00', 7, 5, 2, 36, 14, 5, 12, NULL, NULL, '2017-04-07 13:49:20', '2017-04-07 13:49:20', NULL),
(116, 'Ubicar puntos droguerías Sur en Waze', '2017-04-12 00:00:00', '2017-04-12 00:00:00', 'Ubicar puntos droguerías sur en Waze. La información a colocar en cada punto esta en la ruta indicada. ', '\\\\SERVER\\Elementos_Compartidos2\\Comfandi\\Campañas\\Droguerías Sur\\Waze', '2.00', NULL, NULL, '2017-04-12 00:00:00', 3, 5, 2, 34, 1, 14, 11, NULL, NULL, '2017-04-07 16:16:29', '2017-04-10 02:14:22', NULL),
(117, 'Piezas emailing conferencias mayo', '2017-04-11 00:00:00', '2017-04-12 00:00:00', ' Diseñar tres mailings para conferencias empresariales en mayo. \n\nEn el siguiente ppt de la ruta se encuentran las indicaciones para cada pieza.', 'https://docs.google.com/presentation/d/17-_4ucssxF2zDPeaa5GvzKBSgAF4cCXRglrfIFKR9J0/edit?usp=sharing', '10.00', NULL, NULL, NULL, 3, 2, 2, 21, 30, 25, 12, NULL, NULL, '2017-04-07 19:04:53', '2017-04-07 19:35:22', NULL),
(118, 'Revisión de correo', NULL, NULL, 'Cliente solicita lo siguiente:  que los mensajes que lleguen al correo a.ocampo@caffeswimwear.com no se reenvíen al correo de saavedra_paula@yahoo.com', '', NULL, NULL, NULL, NULL, 7, 3, 3, 37, 19, 6, 12, NULL, NULL, '2017-04-07 19:12:05', '2017-04-07 19:12:05', NULL),
(119, 'Cotización Christus Sinergia Salud', '2017-04-07 00:00:00', '2017-04-07 00:00:00', 'Cotizar nuevamente el plan de trabajo de Christus Sinergia Salud, de acuerdo a los nuevos requerimientos solicitados por el client.', '', '1.00', '1.00', NULL, NULL, 1, 1, 4, 5, 9, 4, 12, NULL, NULL, '2017-04-07 19:22:31', '2017-04-07 19:23:29', NULL),
(120, 'Amplificar Post Lego', '2017-04-11 00:00:00', '2017-04-11 00:00:00', 'Amplificar Post Lego del 11 al 19 de Abril. Inversión según plan de pauta. ', '', '1.00', NULL, NULL, '2017-04-11 00:00:00', 3, 5, 2, 46, 5, 14, 12, NULL, NULL, '2017-04-07 19:24:07', '2017-04-10 02:12:25', NULL),
(121, 'Informe pauta hacienda tablones', '2017-04-28 00:00:00', '2017-04-28 00:00:00', 'Realizar reporte de resultados y recomendaciones según amploficación de post', '', '3.00', NULL, NULL, '2017-04-28 00:00:00', 3, 5, 2, 47, 14, 15, 12, NULL, NULL, '2017-04-07 19:27:27', '2017-04-10 01:52:33', NULL),
(122, 'Tráfico', NULL, NULL, 'Reunión de tráfico', '', NULL, NULL, '3.00', '2017-04-07 00:00:00', 1, 3, 6, 5, 8, 6, 13, NULL, NULL, '2017-04-07 19:27:29', '2017-04-07 19:27:29', NULL),
(123, 'Informe pauta mes del niño', '2017-04-24 00:00:00', '2017-04-24 00:00:00', 'Realizar un reporte de pauta en el que indiquemos como le fue a este post y recomendaciones. ', '', '2.00', NULL, NULL, '2017-04-18 00:00:00', 3, 5, 2, 35, 14, 15, 12, NULL, NULL, '2017-04-07 19:30:07', '2017-04-10 02:10:36', NULL);
INSERT INTO `tareas` (`id`, `nombre_tarea`, `fecha_entrega_area`, `fecha_entrega_cuentas`, `descripcion`, `enlaces_externos`, `tiempo_estimado`, `tiempo_real`, `tiempo_mapa_cliente`, `fecha_entrega_cliente`, `estados_id`, `areas_id`, `usuarios_id`, `ots_id`, `planeacion_fases_id`, `encargado_id`, `prioridad_id`, `estado_trafico_id`, `comentario_trafico`, `created_at`, `updated_at`, `deleted_at`) VALUES
(124, 'Reunión tráfico', '2017-04-07 00:00:00', '2017-04-07 00:00:00', 'Tráfico interno', '', '3.00', '3.00', '3.00', '2017-04-07 00:00:00', 1, 3, 6, 5, 8, 6, 13, NULL, NULL, '2017-04-07 19:32:35', '2017-04-07 19:33:24', NULL),
(125, 'Amplificar carrusel 2 droguerías', '2017-04-10 00:00:00', '2017-04-10 00:00:00', 'Amplificar carrusel 2 droguerías solo para el lunes 10 de abril. Inversión neta $70.000', '', '1.00', NULL, NULL, '2017-04-10 00:00:00', 3, 5, 2, 48, 5, 14, 11, NULL, NULL, '2017-04-07 19:35:01', '2017-04-10 01:54:05', NULL),
(126, 'amplificar carrusel 3 revista droguerías', '2017-04-17 00:00:00', '2017-04-17 00:00:00', 'este carrusel va solo pautado el lunes 17 de abril. Inversión neta $70.000', '', '1.00', NULL, NULL, '2017-04-17 00:00:00', 3, 5, 2, 48, 5, 14, 12, NULL, NULL, '2017-04-07 19:36:25', '2017-04-10 01:50:58', NULL),
(127, 'Organización cuadro de compras', '2017-04-07 00:00:00', '2017-04-07 00:00:00', 'Organizar cuadro de compras mes de marzo', '', '4.00', '4.00', '4.00', '2017-04-07 00:00:00', 1, 3, 6, 5, 8, 6, 13, NULL, NULL, '2017-04-07 19:36:30', '2017-04-07 19:37:23', NULL),
(128, 'amplificar carrusel 4 revista droguerías', '2017-04-24 00:00:00', '2017-04-24 00:00:00', 'amplificar carrusel 4 revista droguerías solo por el día lunes 24 de abril. Inversión neta $70.000', '', '1.00', NULL, NULL, '2017-04-24 00:00:00', 3, 5, 2, 48, 5, 14, 12, NULL, NULL, '2017-04-07 19:37:33', '2017-04-10 01:34:34', NULL),
(129, 'Informe resultados pauta carruseles revista droguerías', '2017-04-24 00:00:00', '2017-04-25 00:00:00', 'Realizar un reporte de la pauta de los 4 carruseles.', '', '3.00', NULL, NULL, '2017-04-25 00:00:00', 3, 5, 2, 48, 14, 15, 13, NULL, NULL, '2017-04-07 19:38:43', '2017-04-10 01:36:14', NULL),
(130, 'Reunión borojó', '2017-04-07 00:00:00', '2017-04-07 00:00:00', 'Reunión borojó el pionero para cotizar ', '', '2.00', '2.00', '2.00', '2017-04-07 00:00:00', 1, 3, 6, 5, 7, 6, 12, NULL, NULL, '2017-04-07 19:44:29', '2017-04-07 19:45:14', NULL),
(131, 'Revisión proceso soporte', '2017-04-07 00:00:00', '2017-04-07 00:00:00', 'revisión con maria isabel del proceso de soporte', '', '1.00', '1.00', '1.00', '2017-04-07 00:00:00', 1, 3, 6, 5, 8, 6, 13, NULL, NULL, '2017-04-07 19:46:51', '2017-04-07 19:47:24', NULL),
(132, 'Amplificar post Descuento Jhonson"s', '2017-04-26 00:00:00', '2017-04-27 00:00:00', 'Amplificar post solo el día 27 de abril. Inversión neta $70.000', '', '1.00', NULL, NULL, '2017-04-27 00:00:00', 3, 5, 2, 49, 5, 14, 13, NULL, NULL, '2017-04-07 19:47:04', '2017-04-10 01:30:15', NULL),
(133, 'Informe pauta descuento Jhonson"s', '2017-04-27 00:00:00', '2017-04-28 00:00:00', 'Realizar un reporte de como le fue a este post y recomendaciones. ', '', '2.00', NULL, NULL, '2017-04-28 00:00:00', 3, 5, 2, 49, 14, 15, 13, NULL, NULL, '2017-04-07 19:48:03', '2017-04-10 01:26:29', NULL),
(134, 'Diseño de piezas pauta', '2017-04-12 00:00:00', '2017-04-17 00:00:00', 'Diseño de piezas de pauta para la campaña de Uni2kids. \n1 Event response - Facebook - 1,5 hrs\n3 promoted post - Facebook - 4,5 hrs\n1 page like - Facebook - 1.5 hrs\n2 Banner - Google - 300x250 - 8 hrs en total\n1 Interstitial - El País - 800x600- 5 hrs \n\nVer en la ruta en el server los editables', '\\\\SERVER\\Elementos_Compartidos2\\Unicentro\\Campaña Uni2kids ', '20.00', NULL, '20.50', '2017-04-11 00:00:00', 3, 2, 11, 45, 30, 24, 11, NULL, NULL, '2017-04-07 20:01:56', '2017-04-07 21:34:39', NULL),
(135, 'Amplificar carrusel 1 cincuentazo', '2017-04-10 00:00:00', '2017-04-10 00:00:00', 'Inversión neta $116.666 del 10 al 12 de abril. ', '', '1.00', NULL, NULL, '2017-04-10 00:00:00', 3, 5, 2, 50, 5, 14, 11, NULL, NULL, '2017-04-07 20:02:09', '2017-04-10 01:37:29', NULL),
(136, 'Amplificar carrusel 2 cincuentazo -trasnochón', '2017-04-10 00:00:00', '2017-04-10 00:00:00', 'Inversión neta $116.666 del 10 al 12 de abril. ', NULL, '1.00', NULL, NULL, '2017-04-10 00:00:00', 3, 5, 2, 50, 5, 14, 11, NULL, NULL, '2017-04-07 20:03:42', '2017-04-10 01:39:28', NULL),
(137, 'Amplificar carrusel 2 cincuentazo -trasnochón', NULL, NULL, 'Inversión neta $116.666 del 10 al 12 de abril. ', NULL, NULL, NULL, NULL, '2017-04-10 00:00:00', 4, 5, 2, 50, 5, 2, 11, NULL, NULL, '2017-04-07 20:03:43', '2017-04-10 01:49:20', NULL),
(138, 'Amplificar carrusel 2 cincuentazo -trasnochón', NULL, NULL, 'Inversión neta $116.666 del 10 al 12 de abril. ', NULL, NULL, NULL, NULL, '2017-04-10 00:00:00', 4, 5, 2, 50, 5, 2, 11, NULL, NULL, '2017-04-07 20:03:43', '2017-04-10 01:40:24', NULL),
(139, 'Amplificar carrusel 3 cincuentazo - trasnochón', '2017-04-11 00:00:00', '2017-04-11 00:00:00', 'Inversión neta $116.666 del 10 al 12 de abril. ', '', '1.00', NULL, NULL, '2017-04-11 00:00:00', 3, 5, 2, 50, 5, 14, 12, NULL, NULL, '2017-04-07 20:05:22', '2017-04-10 01:47:51', NULL),
(140, 'Informe carruseles cincuentazo', '2017-04-21 00:00:00', '2017-04-21 00:00:00', 'Realizar informe de como le fueron a los carruseles del cincuentazo - trasnochón. ', '', '3.00', NULL, NULL, '2017-04-17 00:00:00', 3, 5, 2, 50, 14, 15, 12, NULL, NULL, '2017-04-07 20:11:02', '2017-04-10 01:46:30', NULL),
(141, 'Amplificar video parque acuático', '2017-04-10 00:00:00', '2017-04-10 00:00:00', 'Pauta para impulsar en Centro Campestre Pance, desde el lunes 10 al 21 de abril , inversión neta $210.000\n\nPublico objetivo: familias jóvenes con niños que muestren interés por espacios al aire libre, actividades acuáticas.   ', '', '1.00', NULL, NULL, '2017-04-10 00:00:00', 3, 5, 2, 51, 5, 14, 11, NULL, NULL, '2017-04-07 20:25:30', '2017-04-10 01:43:15', NULL),
(142, 'Informe Pauta Parque Acuático', NULL, NULL, 'Informe de resultados de como le fue a este video. ', '', NULL, NULL, NULL, '2017-04-25 00:00:00', 7, 5, 2, 51, 14, 5, 13, NULL, NULL, '2017-04-07 20:29:36', '2017-04-07 20:29:36', NULL),
(143, 'Envío de mail externo 1 billetera ', NULL, NULL, 'Envío de mail 1 cliente externo - billetera  a la base de datos de clientes externo ', '\\\\SERVER\\Elementos_Compartidos2\\ProgreSER\\App ProgreSER\\Mail externos maquetado', NULL, NULL, NULL, '2017-04-10 00:00:00', 7, 5, 11, 9, 52, 5, 11, NULL, NULL, '2017-04-07 20:32:20', '2017-04-07 20:32:20', NULL),
(144, 'Amplificar post nuevo punto de la 14', NULL, NULL, 'Amplificar post nuevo punto de la 14 teniendo en cuenta las sgtes fechas del 10 al 12 y 17 al 21  de abril. Inversión neta $210.000', '', NULL, NULL, NULL, '2017-04-10 00:00:00', 7, 5, 2, 52, 5, 5, 11, NULL, NULL, '2017-04-07 20:37:19', '2017-04-07 20:37:19', NULL),
(145, 'Envío de mail App ProgreSER interno tarjeta', NULL, NULL, 'Envío de mail para público interno de la app. Se debe hacer una prueba en estos mails ya que el público interno puede tener problema al visualizarlos. El cliente da la siguiente recomendación:  Escribir cuerpo de mailing , adjunta la imagen al correo, en el cuerpo del texo se debe poner el link de la descarga.  \n\nEl objetivo de los mails es que se descarguen la app en playstore. Link a play store : https://play.google.com/store/apps/details?id=com.progreser&hl=es\n\nY el logo de ProgreSER va al sitio web: http://www.progreser.com.co', '\\\\SERVER\\Elementos_Compartidos2\\ProgreSER\\App ProgreSER\\Mail internos maquetado', NULL, NULL, NULL, '2017-04-10 00:00:00', 7, 5, 11, 9, 52, 5, 11, NULL, NULL, '2017-04-07 20:39:30', '2017-04-07 20:39:30', NULL),
(146, 'Envío de mail App ProgreSER interno tarjeta', NULL, NULL, 'Envío de mail para público interno de la app. Se debe hacer una prueba en estos mails ya que el público interno puede tener problema al visualizarlos. El cliente da la siguiente recomendación:  Escribir cuerpo de mailing , adjunta la imagen al correo, en el cuerpo del texo se debe poner el link de la descarga.  \n\nEl objetivo de los mails es que se descarguen la app en playstore. Link a play store : https://play.google.com/store/apps/details?id=com.progreser&hl=es\n\nY el logo de ProgreSER va al sitio web: http://www.progreser.com.co', '\\\\SERVER\\Elementos_Compartidos2\\ProgreSER\\App ProgreSER\\Mail internos maquetado', NULL, NULL, NULL, '2017-04-10 00:00:00', 7, 5, 11, 9, 52, 5, 11, NULL, NULL, '2017-04-07 20:39:30', '2017-04-07 20:39:30', NULL),
(147, 'Informe resultados pauta punto de venta la 14', NULL, NULL, 'Realizar informe de como le fue a este post y recomendaciones. ', '', NULL, NULL, NULL, '2017-04-25 00:00:00', 7, 5, 2, 52, 14, 5, 13, NULL, NULL, '2017-04-07 20:42:32', '2017-04-07 20:42:32', NULL),
(148, 'Envío 2 mail público externo cama', NULL, NULL, 'Envío de segundo mail de la app ProgreSER a público externo. Es decir a la BD que paso el cliente y que ya se organizó. Hacer pruebas de envío con el cliente. La idea es dejar programado este mail para el día 14 de abril  ', '\\\\SERVER\\Elementos_Compartidos2\\ProgreSER\\App ProgreSER\\Mail externos maquetado', NULL, NULL, NULL, '2017-04-12 00:00:00', 7, 5, 11, 9, 52, 5, 11, NULL, NULL, '2017-04-07 20:43:26', '2017-04-07 20:43:26', NULL),
(149, 'Envío de segundo mail público interno App ProgreSER', NULL, NULL, 'Envío de segundo mail para público interno ProgreSER, el mail de la llave. Estos mails para la BD de datos de publico interno, se debe tener en cuenta las recomendaciones del primer mail para público interno que se realizó y hacer pruebas. ', '\\\\SERVER\\Elementos_Compartidos2\\ProgreSER\\App ProgreSER\\Mail internos maquetado', NULL, NULL, NULL, '2017-04-14 00:00:00', 7, 5, 11, 9, 52, 5, 11, NULL, NULL, '2017-04-07 20:47:29', '2017-04-07 20:47:29', NULL),
(150, 'Amplificar video Cali - Rocksito', NULL, NULL, 'Inversión neta $105.000 del 14 al 29 de Abril. ', '', NULL, NULL, NULL, '2017-04-14 00:00:00', 7, 5, 2, 53, 1, 5, 12, NULL, NULL, '2017-04-07 20:57:00', '2017-04-07 20:57:00', NULL),
(151, 'Compra de Herramientas ProgreSER abril ', NULL, NULL, 'Compra de herramientas de ProgreSER: Mailchimp ( mes de abril), similar web ( abril que es el primer pago) y Hotjar ( mes de abril). Se debe poner en la fase compra de herramientas ', NULL, NULL, NULL, NULL, '2017-04-10 00:00:00', 7, 5, 11, 9, 39, 5, 11, NULL, NULL, '2017-04-07 20:57:35', '2017-04-07 20:57:35', NULL),
(152, 'Amplificar video Buga - Rocksito', NULL, NULL, 'Programar del 14 al 29 de abril. Inversión neta $70.000. ', NULL, NULL, NULL, NULL, '2017-04-12 00:00:00', 7, 5, 2, 53, 5, 5, 12, NULL, NULL, '2017-04-07 20:59:11', '2017-04-07 20:59:11', NULL),
(153, 'Amplificar video Tuluá Rocksito', NULL, NULL, 'Inversión neta $70.000 del 14 al 29 de abril. ', '', NULL, NULL, NULL, '2017-04-12 00:00:00', 7, 5, 2, 53, 5, 5, 12, NULL, NULL, '2017-04-07 21:01:08', '2017-04-07 21:01:08', NULL),
(154, 'Amplificar video pauta Rocksito Palmira', NULL, NULL, 'Programar del 14 al 29 de abril. Inversión neta $70.000', '', NULL, NULL, NULL, '2017-04-12 00:00:00', 7, 5, 2, 53, 5, 5, 12, NULL, NULL, '2017-04-07 21:04:27', '2017-04-07 21:04:27', NULL),
(155, 'Amplificar video Rocksito Cartago', NULL, NULL, 'Programar del 14 al 29 de abril. Inversión neta $70.000', '', NULL, NULL, NULL, '2017-04-12 00:00:00', 7, 5, 2, 53, 5, 5, 12, NULL, NULL, '2017-04-07 21:05:18', '2017-04-07 21:05:18', NULL),
(156, 'Amplificar video Rocksito Buenaventura', NULL, NULL, 'Programar del 14 al 29 de abril. Inversión neta $35.000', '', NULL, NULL, NULL, '2017-04-12 00:00:00', 7, 5, 2, 53, 5, 5, 12, NULL, NULL, '2017-04-07 21:06:11', '2017-04-07 21:06:11', NULL),
(157, 'Informe Paura Rocksito Regionales', NULL, NULL, 'Realizar un informe en el cual se mueste los resultados de pauta de cada uno de los post realizado para las diferentes regionales, incluir recomendaciones. ', '', NULL, NULL, NULL, '2017-05-02 00:00:00', 7, 5, 2, 53, 14, 5, 12, NULL, NULL, '2017-04-07 21:08:32', '2017-04-07 21:08:32', NULL),
(158, 'Amplificar post Palmira Orlando Duque', NULL, NULL, 'Palmira: del 7 al 11 de abril. Inversión: $140.000', '', NULL, NULL, NULL, '2017-04-10 00:00:00', 7, 5, 2, 54, 5, 5, 11, NULL, NULL, '2017-04-07 21:16:59', '2017-04-07 21:16:59', NULL),
(159, 'Amplificar post Buenaventura Orlando Duque', NULL, NULL, ' Buenaventura: del 10 al 18 de abril. Inversión neta: $140.000', '', NULL, NULL, NULL, '2017-04-10 00:00:00', 7, 5, 2, 54, 5, 5, 11, NULL, NULL, '2017-04-07 21:17:50', '2017-04-07 21:17:50', NULL),
(160, 'Amplificar post Tuluá Orlando Duque', NULL, NULL, 'Tuluá: del 10 al 20 de abril. Inversión: $140.000. Por favor optimizar de tal manera esta pauta, que sea la mayor inversión desde el 17 hasta el 20 de abril, pues en semana santa no sé qué tanto se interesen por este evento.\n', '', NULL, NULL, NULL, '2017-04-10 00:00:00', 7, 5, 2, 54, 5, 5, 11, NULL, NULL, '2017-04-07 21:19:23', '2017-04-07 21:19:23', NULL),
(161, 'Informe Pauta Orlando Duque', NULL, NULL, 'Realizar un informe de como le fueron a las 3 pautas de las diferentes regionales. ', '', NULL, NULL, NULL, '2017-04-24 00:00:00', 7, 5, 2, 54, 14, 5, 12, NULL, NULL, '2017-04-07 21:20:43', '2017-04-07 21:20:43', NULL),
(162, 'Renovación hosting Unicentro - compra', NULL, NULL, 'Espacio de 6 gb para la creación o migración de cuentas de correo electrónico.\n● Vinculación de cinco (5) dominios.\n● Capacidad de recibir hasta 100.000 visitas mensuales.\n● Espacio web de 30gb.\n● 30 procesos activos consecutivamente (como cpanel, cache, php y gestores de\ncorreos).\n● Número de ejecuciones de CPU 40.000 diarios.\n● Back-up semanal, soporte por caídas y ataques y verificación del buen\nfuncionamiento de los correos. ', '', NULL, NULL, '1.00', '2017-04-07 00:00:00', 7, 3, 11, 55, 19, 6, 11, NULL, NULL, '2017-04-07 21:25:16', '2017-04-07 21:25:16', NULL),
(163, 'Diseño pieza blog ProgreSER semana santa ', NULL, NULL, 'Diseño de pieza para blog ProgreSER para artículo de semana santa. Al final del doc está la conceptualización. ', 'https://docs.google.com/document/d/1ahJoRF4CBGe_Xpq3TD3gMmocL0PFKiFY19vgyNy2HzA/edit?ts=58e65d45#', NULL, NULL, NULL, '2017-04-10 00:00:00', 7, 2, 11, 9, 30, 9, 11, NULL, NULL, '2017-04-07 21:29:51', '2017-04-07 21:29:51', NULL),
(164, 'Pieza concurso baterías ProgreSER', '2017-04-10 00:00:00', '2017-04-11 00:00:00', 'Publicar pieza concurso Baterías App ProgreSER en redes sociales. Este post es de engagement al publicar pasar el link para pautar. \n\nAdemás de publicar hacer monitoreo. En la ruta está la pieza ( diapositiva 3). ', 'https://docs.google.com/presentation/d/18J9bJqYzgxnEPb0ycRU_GYOuqprymM1Cl72Jr_sMgLs/edit#slide=id.g2147df720e_0_74', '0.50', NULL, NULL, '2017-04-10 00:00:00', 3, 4, 11, 9, 49, 16, 11, NULL, NULL, '2017-04-07 21:33:31', '2017-04-10 12:19:59', NULL),
(165, 'Ampliación de Capacidad de Correo', NULL, NULL, 'Cliente solicita que se amplíe la capacidad de mails de los correos, especialmente del correo de \nsales@caffeswimwear.com. \nEsto se conversó con Luisa el 7-abr-2017 debido a que se debe revisar las restricciones de las cuentas de correo. Esto se debe revisar con Silvia Salamanca.  \n', '', NULL, NULL, NULL, NULL, 7, 3, 3, 37, 19, 6, 11, NULL, NULL, '2017-04-07 21:35:50', '2017-04-07 21:35:50', NULL),
(166, 'Implementación pieza pauta engagement ProgreSER', NULL, NULL, 'Amplificación de pieza con pauta de engagement ( concurso de baterías) el lunes contenidos pasa el link, a esta pieza se le debe poner 50.000 y debe estar un día al aire. ', NULL, NULL, NULL, NULL, '2017-04-10 00:00:00', 7, 5, 11, 9, 5, 5, 11, NULL, NULL, '2017-04-07 21:37:14', '2017-04-07 21:37:14', NULL),
(167, 'Pauta 2 mes del niño ', NULL, NULL, 'Del 11 al 20 de abril, inversión neta $140.000 \nValle del cauca y eje cafetero.  Público objetivo: familias con niños, para celebrar el mes del niño.', '', NULL, NULL, NULL, '2017-04-11 00:00:00', 7, 5, 2, 56, 5, 5, 12, NULL, NULL, '2017-04-07 21:39:51', '2017-04-07 21:39:51', NULL),
(168, 'Implementación pauta con objetivo descarga FB', NULL, NULL, 'Implementación de pauta con objetivo descarga de la app. Esta tarea Néstor la programó para el día 11 de abril, ya que estamos a la espera de que Mydigital incluye un código en la app.  Esta pauta va para la BD de clientes ya entregada por el cliente y va hasta final de mes de abril, solo para mobile.  Estas piezas ya están montadas en la plataforma. ', NULL, NULL, NULL, NULL, '2017-04-11 00:00:00', 7, 5, 11, 9, 5, 5, 11, NULL, NULL, '2017-04-07 21:40:06', '2017-04-07 21:40:06', NULL),
(169, 'Informe Pauta post mes del niña', NULL, NULL, 'Informe Pauta post mes del niña en tobogan. ', '', NULL, NULL, NULL, '2017-04-25 00:00:00', 7, 5, 2, 56, 14, 5, 12, NULL, NULL, '2017-04-07 21:41:01', '2017-04-07 21:41:01', NULL),
(170, 'Amplificación Post Celebración día de las madres', NULL, NULL, 'Inversión neta $180.000 del 10 abril al 2 de mayo. ', '', NULL, NULL, NULL, '2017-04-10 00:00:00', 7, 5, 2, 57, 5, 5, 11, NULL, NULL, '2017-04-07 21:51:52', '2017-04-07 21:51:52', NULL),
(171, 'Amplificar post celebración día de las madres', NULL, NULL, 'Inversión neta $280.000 de 10 de abril al 2 mayo. ', NULL, NULL, NULL, NULL, '2017-04-10 00:00:00', 7, 5, 2, 57, 5, 5, 11, NULL, NULL, '2017-04-07 22:01:17', '2017-04-07 22:01:17', NULL),
(172, 'Informe Pauta celebración día de la madres', NULL, NULL, 'Realizar informe pauta post celebración día de la madre. ', '', NULL, NULL, NULL, '2017-05-04 00:00:00', 7, 5, 2, 57, 14, 5, 12, NULL, NULL, '2017-04-07 22:04:55', '2017-04-07 22:04:55', NULL),
(173, 'Amplificar post evento primero de mayo', NULL, NULL, 'Amplificar post evento primero de mayo hasta el 30 de abril. Inversión según plan de pauta. ', '', NULL, NULL, NULL, '2017-04-11 00:00:00', 7, 5, 2, 61, 5, 5, 12, NULL, NULL, '2017-04-07 22:26:01', '2017-04-07 22:26:01', NULL),
(174, 'Ajustes Parrilla Abril Centro de empleo', NULL, NULL, 'Realizar los ajustes descritos en la parrilla. ', '', NULL, NULL, NULL, NULL, 4, 2, 2, 21, 24, 2, 12, NULL, NULL, '2017-04-07 22:37:14', '2017-04-10 12:52:37', NULL),
(175, 'Ajuste Parrilla Vallempresa Abril', NULL, NULL, 'Realizar los ajustes descritos en la parrilla. ', '', NULL, NULL, NULL, NULL, 7, 2, 2, 15, 30, 9, 12, NULL, NULL, '2017-04-07 22:37:50', '2017-04-07 22:37:50', NULL),
(176, 'Despiece interfaces GEV', NULL, NULL, 'Despiece de interfaces de GEV para pasar a desarollo. ', '\\\\SERVER\\Elementos_Compartidos2\\GEV\\Último look aprobado', NULL, NULL, '4.00', '2017-04-10 00:00:00', 7, 2, 11, 39, 26, 9, 11, NULL, NULL, '2017-04-07 23:37:50', '2017-04-07 23:37:50', NULL),
(177, 'Diseño responsive', NULL, NULL, 'Diseño responsive ( visualizaciones que se crean necesarias del sitio web) ', NULL, NULL, NULL, NULL, '2017-04-11 00:00:00', 7, 2, 11, 39, 22, 9, 11, NULL, NULL, '2017-04-07 23:41:41', '2017-04-07 23:41:41', NULL),
(178, 'Instalación y configuración del CMS', NULL, NULL, 'Instalación y configuración del CMS. ', NULL, NULL, NULL, NULL, NULL, 7, 3, 11, 39, 2, 6, 11, NULL, NULL, '2017-04-07 23:52:01', '2017-04-07 23:52:01', NULL),
(179, 'Creación de contenido administrable ', NULL, NULL, 'Creación de contenido administrable ( menús, items,  categorias)', NULL, NULL, NULL, NULL, NULL, 7, 3, 11, 39, 2, 6, 11, NULL, NULL, '2017-04-07 23:54:40', '2017-04-07 23:54:40', NULL),
(180, 'Ajustar planes de pauta cursos regionales', '2017-04-11 00:00:00', '2017-04-12 00:00:00', 'Favor ajustar el plan de pauta teniendo en cuenta que:\n\nPalmira: son 4 categorias (sistemas, belleza, gastronomía, manualidades).\nBuga: son 4 categorias (gastronomia, manualidades, area tecnica, sistemas)\nTuluá: son 6 categorias (gastronomia, manualidades, confeccion, belleza, sistemas, área técnica).\nCartago: son 4 categorias (gastronomia, belleza, sistemas, confeccion)\nBuenaventura: son 4 categorías (area tecnica, gestion empresarial, gastronomia, sistemas).\n', '', '1.25', NULL, NULL, '2017-04-12 00:00:00', 3, 5, 2, 5, 53, 5, 11, NULL, NULL, '2017-04-07 23:54:50', '2017-04-10 01:08:31', NULL),
(181, 'Maquetado de internas ', NULL, NULL, 'Maquetado de internas: Home, quiénes somos, noticias,contáctanos, ', NULL, NULL, NULL, NULL, NULL, 7, 3, 11, 39, 2, 6, 11, NULL, NULL, '2017-04-07 23:58:36', '2017-04-07 23:58:36', NULL),
(182, 'Calidad del 50% del sitio web ', NULL, NULL, 'Calidad del 50% del sitio web. Se pone en espera ya que para este paso se de tener otros pasos. ', NULL, NULL, NULL, NULL, NULL, 6, 3, 11, 39, 3, 6, 13, NULL, NULL, '2017-04-08 00:02:00', '2017-04-08 00:02:00', NULL),
(183, 'Ajuste diseño interfaces GEV', NULL, NULL, 'Ajuste en el diseño de las interfaces de Gev.  Te copio los comentarios del cliente: \n- Home: nos gustaría que las imágenes no tuvieran filtros de color, es decir, que la imagen no se vea verde ni azul, sino que tenga sus colores originales. \n- No estamos muy seguros del verde que escogieron para la sección.\n- Proyectos: nos gustaría que no se vieran las imágenes que siguen después de la que se esta reproduciendo, es decir, que solo se vea la imagen y las flechas que indica que hay otras que siguen.\n\nSe miraron estos ajustes y no impiden para que desarrollo inicie. ', '', NULL, NULL, NULL, '2017-04-17 00:00:00', 7, 2, 11, 39, 21, 9, 11, NULL, NULL, '2017-04-08 00:07:43', '2017-04-08 00:07:43', NULL),
(184, 'Generar estructura excel y powerpoint informe Manuelita', NULL, NULL, 'Digital debe generar la estructura de excel y powerpoint para el informe de redes de Manuelita mensual. \n\nSe pone al área de contenidos, pero esta tarea es una tarea inicial de digital cuando por primera vez se hace un informe de redes sociales. ', NULL, NULL, NULL, '0.50', '2017-04-12 00:00:00', 4, 4, 11, 62, 49, 11, 11, NULL, NULL, '2017-04-08 00:12:57', '2017-04-10 11:56:08', NULL),
(185, 'Diseño de Home del Sitio Web - Industrial', NULL, NULL, 'Diseñar el home con el Key Visual aprobado. \nTener en cuenta los sgtes. ajustes:\n- Home: En el menú de navegación se incluirá el logo de Harinera Haz de Oros Familiar al final.\n- Menú de navegación: Quitar KAP y dejar APP.\n', '', NULL, NULL, '2.00', '2017-04-18 00:00:00', 7, 2, 10, 32, 20, 9, 11, NULL, NULL, '2017-04-08 00:12:59', '2017-04-08 00:12:59', NULL),
(186, 'Amplificar post descuento droguería 20% afiliados', NULL, NULL, 'Pauta del 11 del 12 y del 15 al 16 inversión neta $210.000', '', NULL, NULL, NULL, NULL, 7, 5, 2, 65, 5, 5, 11, NULL, NULL, '2017-04-08 00:13:53', '2017-04-08 00:13:53', NULL),
(187, 'Diseño de Internas', NULL, NULL, 'Diseñar internas: \n-Comunidad Dorada:  corresponde a eventos (pasados y a futuro), capacitaciones, ferias y actividades.\n-Realizar propuesta gráfica de interna de comunidad dorada.\n-APP (Atención profesional Panadería): se recomendarán las recetas del mes.\n-Los productos están divididos en tres (3): Línea Comercial, Especializados y Premezclas.\n-Contáctenos: Quitar télefono y dejar solo el campo de celular.\n-Presentar propuesta gráfica de cómo se verán los productos en cada categoría.\n', NULL, NULL, NULL, '12.00', NULL, 7, 2, 10, 32, 21, 9, 11, NULL, NULL, '2017-04-08 00:14:56', '2017-04-08 00:14:56', NULL),
(188, 'Cambiar nombres Google Search', NULL, NULL, 'Cambiar nombre de las pautas de Google search. Esta tarea es solicitud de Digital. ', '', NULL, NULL, NULL, '2017-04-12 00:00:00', 7, 5, 11, 9, 53, 5, 11, NULL, NULL, '2017-04-08 00:15:22', '2017-04-08 00:15:22', NULL),
(189, 'Amplificar post hoy descuento 20% afiliados', '2017-04-17 00:00:00', '2017-04-17 00:00:00', 'Inversión neta $70.000  solo para el 17 de abril. ', '', '1.00', NULL, NULL, '2017-04-17 00:00:00', 3, 5, 2, 65, 5, 14, 12, NULL, NULL, '2017-04-08 00:16:12', '2017-04-10 01:16:06', NULL),
(190, 'Realizar plan de pauta Semana del afiliado', '2017-04-10 00:00:00', '2017-04-11 00:00:00', 'Realizar plan de pauta Semana del afiliado dos escenarios uno básico y otro ideal. \nMe parece fundamental incluir dentro de la pauta formatos para dispositivos móvil. ', NULL, '1.00', NULL, NULL, '2017-04-10 00:00:00', 3, 5, 2, 5, 53, 5, 11, NULL, NULL, '2017-04-08 00:18:56', '2017-04-10 01:10:09', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiempos_x_area`
--

CREATE TABLE IF NOT EXISTS `tiempos_x_area` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tiempo_estimado_ot` decimal(15,2) NOT NULL,
  `tiempo_real` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tiempo_extra` decimal(15,2) NOT NULL DEFAULT '0.00',
  `ots_id` int(10) unsigned NOT NULL,
  `areas_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tiempos_x_area_ots_id_foreign` (`ots_id`),
  KEY `tiempos_x_area_areas_id_foreign` (`areas_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=110 ;

--
-- Volcado de datos para la tabla `tiempos_x_area`
--

INSERT INTO `tiempos_x_area` (`id`, `tiempo_estimado_ot`, `tiempo_real`, `tiempo_extra`, `ots_id`, `areas_id`, `created_at`, `updated_at`) VALUES
(1, '2.00', '0.00', '0.00', 1, 5, '2017-04-01 00:46:54', '2017-04-01 00:46:54'),
(2, '4.00', '0.00', '0.00', 2, 1, '2017-04-01 01:39:29', '2017-04-01 02:19:06'),
(3, '4.00', '0.00', '0.00', 3, 5, '2017-04-01 02:01:04', '2017-04-01 02:01:04'),
(4, '4.00', '0.00', '0.00', 2, 5, '2017-04-01 02:19:06', '2017-04-01 02:19:06'),
(5, '8.00', '0.00', '0.00', 4, 5, '2017-04-01 03:01:41', '2017-04-01 03:01:41'),
(6, '160.00', '24.50', '0.00', 5, 1, '2017-04-03 19:50:03', '2017-04-07 23:33:27'),
(7, '160.00', '3.50', '0.00', 5, 2, '2017-04-03 19:50:03', '2017-04-07 20:09:12'),
(8, '160.00', '10.00', '0.00', 5, 3, '2017-04-03 19:50:03', '2017-04-07 19:47:24'),
(9, '160.00', '0.00', '0.00', 5, 4, '2017-04-03 19:50:03', '2017-04-03 19:50:03'),
(10, '160.00', '28.00', '0.00', 5, 5, '2017-04-03 19:50:03', '2017-04-03 21:00:16'),
(11, '160.00', '0.00', '0.00', 5, 6, '2017-04-03 19:50:03', '2017-04-03 19:50:03'),
(12, '8.00', '0.00', '0.00', 6, 3, '2017-04-03 21:34:24', '2017-04-06 22:36:33'),
(13, '10.00', '0.00', '0.00', 7, 5, '2017-04-03 21:38:39', '2017-04-03 21:38:39'),
(14, '18.00', '0.00', '0.00', 8, 5, '2017-04-03 17:09:52', '2017-04-03 17:09:52'),
(15, '17.00', '0.00', '0.00', 9, 1, '2017-04-03 18:27:44', '2017-04-03 19:32:16'),
(16, '32.00', '16.50', '0.00', 9, 2, '2017-04-03 18:27:44', '2017-04-07 19:19:17'),
(17, '8.00', '0.00', '0.00', 9, 3, '2017-04-03 18:27:44', '2017-04-03 19:32:16'),
(18, '50.00', '2.25', '0.00', 9, 4, '2017-04-03 18:27:44', '2017-04-05 12:47:44'),
(19, '17.00', '0.00', '0.00', 9, 5, '2017-04-03 18:27:44', '2017-04-03 19:32:16'),
(20, '21.00', '0.00', '0.00', 10, 3, '2017-04-03 19:15:51', '2017-04-03 19:15:51'),
(21, '4.00', '0.00', '0.00', 11, 3, '2017-04-03 19:49:14', '2017-04-03 19:49:14'),
(25, '12.00', '1.50', '0.00', 14, 1, '2017-04-03 20:08:17', '2017-04-07 12:58:12'),
(26, '240.00', '0.00', '0.00', 14, 2, '2017-04-03 20:08:17', '2017-04-06 16:53:37'),
(27, '48.00', '0.00', '0.00', 14, 3, '2017-04-03 20:08:17', '2017-04-06 16:53:37'),
(28, '320.00', '0.00', '0.00', 14, 4, '2017-04-03 20:08:17', '2017-04-06 16:53:37'),
(29, '44.00', '0.00', '0.00', 14, 5, '2017-04-03 20:08:17', '2017-04-06 16:53:37'),
(30, '16.00', '0.00', '0.00', 14, 6, '2017-04-03 20:08:17', '2017-04-06 16:53:37'),
(31, '80.00', '1.00', '0.00', 15, 2, '2017-04-03 20:12:14', '2017-04-07 20:09:27'),
(38, '49.50', '28.00', '0.00', 20, 2, '2017-04-03 20:16:26', '2017-04-10 13:08:58'),
(39, '143.00', '0.00', '0.00', 20, 3, '2017-04-03 20:16:26', '2017-04-05 19:54:52'),
(40, '31.00', '0.00', '0.00', 20, 4, '2017-04-03 20:16:26', '2017-04-05 19:54:52'),
(41, '40.00', '0.00', '0.00', 20, 5, '2017-04-03 20:16:26', '2017-04-05 19:54:52'),
(42, '80.00', '9.00', '0.00', 21, 2, '2017-04-03 20:17:10', '2017-04-07 19:35:57'),
(43, '80.00', '0.00', '0.00', 21, 4, '2017-04-03 20:17:10', '2017-04-03 20:17:10'),
(44, '2.00', '0.00', '0.00', 22, 1, '2017-04-03 20:36:18', '2017-04-03 20:36:18'),
(45, '31.50', '9.50', '0.00', 22, 2, '2017-04-03 20:36:18', '2017-04-07 22:40:59'),
(46, '31.50', '2.75', '0.00', 22, 4, '2017-04-03 20:36:18', '2017-04-10 12:13:18'),
(47, '2.00', '2.00', '0.00', 23, 2, '2017-04-03 20:41:24', '2017-04-07 20:05:27'),
(48, '4.00', '1.30', '0.00', 23, 3, '2017-04-03 20:41:24', '2017-04-06 22:57:38'),
(49, '2.00', '0.00', '0.00', 23, 4, '2017-04-03 20:41:24', '2017-04-03 20:41:24'),
(50, '2.00', '0.00', '0.00', 24, 2, '2017-04-03 20:44:32', '2017-04-03 20:44:32'),
(51, '9.00', '0.00', '0.00', 24, 5, '2017-04-03 20:44:32', '2017-04-03 20:44:32'),
(52, '4.00', '5.00', '0.00', 25, 3, '2017-04-03 20:48:40', '2017-04-06 22:57:56'),
(53, '82.00', '0.00', '0.00', 26, 1, '2017-04-03 20:57:48', '2017-04-03 20:57:48'),
(54, '80.00', '0.00', '0.00', 15, 4, '2017-04-03 21:30:49', '2017-04-03 21:30:49'),
(55, '13.00', '1.00', '0.00', 27, 3, '2017-04-04 13:40:24', '2017-04-06 16:39:54'),
(56, '56.00', '0.00', '0.00', 28, 2, '2017-04-04 17:42:27', '2017-04-05 19:40:36'),
(57, '118.00', '0.00', '0.00', 28, 3, '2017-04-04 17:42:27', '2017-04-05 19:40:36'),
(58, '33.00', '0.00', '0.00', 28, 4, '2017-04-04 17:42:27', '2017-04-05 19:40:36'),
(59, '34.00', '0.00', '0.00', 28, 5, '2017-04-04 17:42:27', '2017-04-05 19:40:36'),
(60, '1.00', '1.00', '0.00', 29, 3, '2017-04-04 23:21:52', '2017-04-06 16:17:35'),
(61, '4.00', '3.50', '0.00', 30, 2, '2017-04-05 21:23:26', '2017-04-07 19:17:49'),
(62, '4.00', '2.00', '0.00', 30, 3, '2017-04-05 21:23:26', '2017-04-06 22:57:22'),
(63, '1.00', '0.00', '0.00', 31, 3, '2017-04-05 21:29:48', '2017-04-05 21:33:37'),
(64, '98.00', '0.50', '0.00', 32, 2, '2017-04-05 21:47:14', '2017-04-07 20:08:55'),
(65, '98.00', '0.00', '0.00', 32, 3, '2017-04-05 21:47:14', '2017-04-05 21:47:14'),
(66, '56.00', '0.00', '0.00', 33, 2, '2017-04-05 22:15:40', '2017-04-05 22:17:23'),
(67, '99.00', '0.00', '0.00', 33, 3, '2017-04-05 22:15:40', '2017-04-05 22:17:23'),
(68, '14.00', '0.00', '0.00', 33, 4, '2017-04-05 22:15:40', '2017-04-05 22:17:23'),
(69, '10.00', '0.00', '0.00', 34, 5, '2017-04-06 15:23:03', '2017-04-06 15:23:03'),
(70, '1.00', '0.00', '0.00', 35, 5, '2017-04-06 16:00:06', '2017-04-06 16:00:06'),
(71, '2.00', '0.00', '0.00', 36, 5, '2017-04-06 16:21:50', '2017-04-06 16:21:50'),
(72, '30.00', '0.00', '0.00', 37, 3, '2017-04-06 16:26:17', '2017-04-06 16:26:17'),
(73, '3.00', '0.00', '0.00', 38, 3, '2017-04-06 16:38:11', '2017-04-06 16:50:36'),
(74, '2.00', '0.00', '0.00', 39, 1, '2017-04-06 17:02:53', '2017-04-06 19:35:34'),
(75, '2.00', '0.00', '0.00', 39, 2, '2017-04-06 17:02:53', '2017-04-06 19:35:34'),
(76, '2.00', '0.00', '0.00', 39, 3, '2017-04-06 17:02:53', '2017-04-06 19:35:34'),
(77, '24.00', '0.00', '0.00', 40, 3, '2017-04-06 17:10:01', '2017-04-06 17:10:01'),
(78, '5.50', '0.00', '0.00', 40, 4, '2017-04-06 17:10:01', '2017-04-06 17:10:01'),
(79, '2.00', '0.00', '0.00', 39, 4, '2017-04-06 17:15:56', '2017-04-06 19:35:34'),
(80, '2.00', '0.00', '0.00', 39, 5, '2017-04-06 17:15:56', '2017-04-06 19:35:34'),
(81, '1.00', '0.00', '0.00', 41, 5, '2017-04-06 19:20:35', '2017-04-06 19:20:35'),
(82, '2.00', '0.00', '0.00', 42, 3, '2017-04-06 23:02:59', '2017-04-06 23:02:59'),
(83, '1.00', '0.00', '0.00', 43, 3, '2017-04-06 23:36:17', '2017-04-06 23:36:17'),
(84, '2.00', '0.00', '0.00', 44, 5, '2017-04-07 12:50:50', '2017-04-07 12:50:50'),
(85, '20.50', '0.00', '0.00', 45, 2, '2017-04-07 17:07:13', '2017-04-07 17:07:13'),
(86, '10.00', '0.00', '0.00', 46, 5, '2017-04-07 19:20:48', '2017-04-07 19:20:48'),
(87, '2.00', '0.00', '0.00', 47, 5, '2017-04-07 19:26:20', '2017-04-07 19:26:20'),
(88, '4.00', '0.00', '0.00', 48, 5, '2017-04-07 19:32:55', '2017-04-07 19:32:55'),
(89, '2.00', '0.00', '0.00', 49, 5, '2017-04-07 19:45:57', '2017-04-07 19:45:57'),
(90, '5.00', '0.00', '0.00', 50, 5, '2017-04-07 19:59:50', '2017-04-07 20:24:07'),
(91, '2.00', '0.00', '0.00', 51, 5, '2017-04-07 20:22:09', '2017-04-07 20:22:09'),
(92, '2.00', '0.00', '0.00', 52, 5, '2017-04-07 20:35:48', '2017-04-07 20:35:48'),
(93, '5.00', '0.00', '0.00', 53, 5, '2017-04-07 20:55:17', '2017-04-07 20:55:17'),
(94, '3.00', '0.00', '0.00', 54, 5, '2017-04-07 21:15:11', '2017-04-07 21:15:11'),
(95, '13.00', '0.00', '0.00', 55, 3, '2017-04-07 21:23:02', '2017-04-07 21:23:02'),
(96, '2.00', '0.00', '0.00', 56, 5, '2017-04-07 21:38:00', '2017-04-07 21:38:00'),
(97, '2.00', '0.00', '0.00', 57, 5, '2017-04-07 21:49:21', '2017-04-07 21:49:21'),
(98, '5.00', '0.00', '0.00', 58, 1, '2017-04-07 21:57:16', '2017-04-07 21:57:16'),
(99, '3.00', '0.00', '0.00', 58, 6, '2017-04-07 21:57:16', '2017-04-07 21:57:16'),
(100, '160.00', '0.00', '0.00', 59, 4, '2017-04-07 22:13:53', '2017-04-07 22:13:53'),
(101, '8.00', '0.00', '0.00', 60, 2, '2017-04-07 22:18:06', '2017-04-07 22:18:06'),
(102, '4.00', '0.00', '0.00', 60, 3, '2017-04-07 22:18:06', '2017-04-07 22:18:06'),
(103, '38.00', '0.00', '0.00', 60, 4, '2017-04-07 22:18:06', '2017-04-07 22:18:06'),
(104, '4.00', '0.00', '0.00', 60, 5, '2017-04-07 22:18:06', '2017-04-07 22:18:06'),
(105, '10.00', '0.00', '0.00', 61, 5, '2017-04-07 22:23:44', '2017-04-07 22:23:44'),
(106, '45.00', '0.00', '0.00', 62, 4, '2017-04-07 23:16:16', '2017-04-07 23:16:16'),
(107, '15.00', '0.00', '0.00', 63, 4, '2017-04-07 23:19:10', '2017-04-07 23:19:10'),
(108, '8.00', '0.00', '0.00', 64, 1, '2017-04-07 23:21:09', '2017-04-07 23:21:09'),
(109, '5.00', '0.00', '0.00', 65, 5, '2017-04-08 00:09:58', '2017-04-08 00:09:58');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_compras`
--

CREATE TABLE IF NOT EXISTS `tipos_compras` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `estado` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=9 ;

--
-- Volcado de datos para la tabla `tipos_compras`
--

INSERT INTO `tipos_compras` (`id`, `nombre`, `estado`, `created_at`, `updated_at`) VALUES
(1, 'Pauta', 1, '2017-03-31 22:32:19', '2017-03-31 22:32:19'),
(2, 'Hosting', 1, '2017-03-31 22:32:19', '2017-03-31 22:32:19'),
(3, 'Plugin', 1, '2017-03-31 22:32:19', '2017-03-31 22:32:19'),
(4, 'B. Imagenes', 1, '2017-03-31 22:32:19', '2017-03-31 22:32:19'),
(5, 'Certificado SSL', 1, '2017-04-03 19:04:54', '2017-04-03 19:04:54'),
(6, 'Certificado SSL', 0, '2017-04-03 19:05:45', '2017-04-03 19:06:10'),
(7, 'Dominio', 1, '2017-04-03 19:06:30', '2017-04-03 19:06:30'),
(8, 'Herramientas', 1, '2017-04-07 22:03:52', '2017-04-07 22:03:52');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_estados`
--

CREATE TABLE IF NOT EXISTS `tipos_estados` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `tipos_estados`
--

INSERT INTO `tipos_estados` (`id`, `nombre`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, 'Estados Tareas', NULL, '2017-03-31 22:32:19', '2017-03-31 22:32:19'),
(2, 'Estados OT', NULL, '2017-03-31 22:32:19', '2017-03-31 22:32:19'),
(3, 'Prioridad Tarea', NULL, '2017-03-31 22:32:19', '2017-03-31 22:32:19'),
(4, 'Trafico', NULL, '2017-03-31 22:32:19', '2017-03-31 22:32:19'),
(5, 'Estados Transacción', NULL, '2017-04-06 22:43:14', '2017-04-06 22:43:14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trafico_tareas`
--

CREATE TABLE IF NOT EXISTS `trafico_tareas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre_tarea` varchar(115) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_entrega_estimada` datetime DEFAULT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enlaces_externos` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tiempo_estimado` decimal(15,2) DEFAULT NULL,
  `tiempo_real` decimal(15,2) DEFAULT NULL,
  `fecha_entrega_cliente` datetime NOT NULL,
  `estados_id` int(11) DEFAULT NULL,
  `areas_id` int(11) DEFAULT NULL,
  `usuarios_id` int(11) DEFAULT NULL,
  `ots_id` int(11) DEFAULT NULL,
  `roles_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `apellido` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `cargo` varchar(85) COLLATE utf8_unicode_ci NOT NULL,
  `telefono` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(85) COLLATE utf8_unicode_ci NOT NULL,
  `estado` tinyint(4) NOT NULL DEFAULT '1',
  `horas_disponible` decimal(15,2) NOT NULL,
  `horas_gastadas` decimal(15,2) NOT NULL DEFAULT '0.00',
  `api_token` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fecha_nacimiento` date NOT NULL,
  `img_perfil` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `roles_id` int(10) unsigned NOT NULL,
  `areas_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_api_token_unique` (`api_token`),
  KEY `users_areas_id_foreign` (`areas_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=27 ;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `nombre`, `apellido`, `cargo`, `telefono`, `email`, `estado`, `horas_disponible`, `horas_gastadas`, `api_token`, `password`, `remember_token`, `fecha_nacimiento`, `img_perfil`, `roles_id`, `areas_id`, `created_at`, `updated_at`) VALUES
(1, 'Maria Isabel', 'Astorquiza Garcia', 'Proyect Owner', '3799180', 'miastorquiza@himalayada.com', 1, '160.00', '0.00', '3NgB9hKrA53Bwg7Vy8x29NVhTwFys0g7dsJsslZqRRr1SmsNInvqSmV11r3i', '$2y$10$iN7ULC2BxHSC7a5wbaQVtuKMASp2lRQURxd3drktnVGAqPLmnQS0u', 'A27URxWebc4H1WOpdLRzPrzXt4ZhB4fBEW9NBODv5mrPMMynskcZaUXDV237', '1985-11-26', '/images/avatars/MariaIsabel_1.png', 1, 6, '2017-03-31 22:32:19', '2017-04-07 20:40:54'),
(2, 'Marcela ', 'Benavides', 'Ejecutiva de cuenta', '3799189', 'mbenavides@himalayada.com', 1, '160.00', '0.00', 'ERwuAYETA9EUs0rMgsMlsbIwRPZ2Pf2yqyMD69T7iSiTeIRgb8Tg7wofCdpv', '$2y$10$2SolpOvJWaSYVgMQodzOPuzJOpAejhsydBthHX98f6MJxGIISmxAq', 'bhShAMT0WfrIxIb8lSNUBoSSf5vaUpGSP6fi0MmY5Wse4HObbf1wHpwyQhGG', '1989-01-12', NULL, 3, 6, '2017-04-01 00:06:37', '2017-04-01 00:06:37'),
(3, ' Maria Andrea', 'Ramirez', 'New Bussines', '3799180', 'mramirez@himalayada.com', 1, '160.00', '0.00', 'Q7rxu2DcDoryMNJ60wGTx60wYJhzOk51tWk87thqIKEllsS6ufFPcnknjDda', '$2y$10$BCkvGoqlTWd6hpoHmmGwkOX8xX3Ets1xYwTN.xY9T7pvR1Ol5E85C', 'S5LySw4VsLZOy2aUmlKAg4kratqWhXkoCZlPc9avqTowyZqNn0Lbrtw3JcLf', '1995-04-13', NULL, 3, 6, '2017-04-01 00:09:29', '2017-04-01 00:09:29'),
(4, 'Jose', 'Díaz', 'Director Creativo', '3799180', 'jdiaz@himalayada.com', 1, '160.00', '26.00', 'GwbXB4sqIiOUuxOL1dStShj0vcdIF2AKKY281QOUcm38H1xrwTHdWM45J23A', '$2y$10$qrJtAjAmZMq.QSYaYsuxzezTqK/JmgRnEAeSramLboJtInRzVFQj2', 'FpjqSoVcDbJBbVGOrK6rDzPhNwf98TIso66ipQAHmn64ylxi2YhEINMPe2MA', '1996-12-11', '/images/avatars/Jose_4.png', 4, 1, '2017-04-01 00:11:52', '2017-04-10 11:51:27'),
(5, 'Nestor', 'Sepúlveda', 'SEM Performance Manager', '3799180', 'nsepulveda@himalayada.com', 1, '160.00', '28.00', 'RuvvNWFbO0DvZIbQuMgwTcrbN08FvfaWN9JAX5tTIXfOaOHOVi3ehxpoXQrf', '$2y$10$sUcfUkp3nZd1f/cpDGPahOm01im8NHCO5RDD9A7mSzM9GLOy1R3kO', 'VTduDqF5UWhX81Y3ENs2lW7dOqFVlPuxrpoQe4z3Z3pYiZg4ptmIW7su0NUT', '1997-02-14', '/images/avatars/Nestor_5.png', 4, 5, '2017-04-01 00:14:24', '2017-04-05 14:37:22'),
(6, 'Luisa Fernanda', 'Carvajal', 'Development  Leader', '3799180', 'lfcarvajal@himalayada.com', 1, '160.00', '14.00', 'bCtuZG3leZWgvpx7pBZCAtabkQnhDeZd5CbyZhOkYOMLAf7mbfhF0NL4zt2V', '$2y$10$2O2JgFd1F5.SH.unCjtMB.I1F9Vq8hp61EgzjWEc8cnHzewwXT6lG', 'bJoYZvPOEcyPyzfHxjFX3YVdSqnNtkEwT5MDYoCF11VM5oZ6hCBUPO6Rl4s0', '1992-01-12', '/images/avatars/LuisaFernanda_6.png', 4, 3, '2017-04-01 00:16:07', '2017-04-07 19:47:24'),
(7, 'Leonardo', 'Rodriguez Mora', 'Lider de Contenido Escrito', '3799180', 'lrodriguez@himalayada.com', 1, '160.00', '4.00', '8jPsmaUhBsSTKe325wtCC6N5JQhkCCm8gQMn6ge5s1oQxdPAYCKc4rwmGt4J', '$2y$10$.p8Ikli/PiMGEzNYsCkXTe1lL9RIVwQVKu/b/opkn/AKUd5zJ9Xeu', 'DYsJNoCgMgXKnHYHI3SfHGafvmDqjzdq8zdhPyvB1iPSGtQLxLCiwKAlRv5A', '1987-02-24', '/images/avatars/Leonardo_7.png', 4, 4, '2017-04-01 00:18:46', '2017-04-10 12:13:18'),
(8, 'Desarrollo', 'Himalaya', 'Tester', '', 'soporte@himalayada.com', 2, '0.00', '0.00', 'wFIbQsjOHYrgFPq1DHu3UkEmItjvxEBYrDuBcMTvOVnQXwdU2GxPP1NhEjMI', '$2y$10$PHrpsY5IWOevdO8fu2zjF.tFEHBdYV3tcAxmKqgPah8f0PMEUCmX.', 'BfKKKltOpLqhlzGLvQiqOVecW1AUzZEo9dQWy6ZjIG9fDx6H0Aa5VtZS27Nd', '1999-01-01', '/images/avatars/Desarrollo_8.png', 2, 3, '2017-04-01 00:20:29', '2017-04-09 00:10:16'),
(9, 'Andres Fabian', 'Mabesoy Jimenez', 'Encargado de Diseño', '3799180', 'afmabesoy@himalayada.com', 1, '160.00', '37.50', 'W5mQJidqz3LufqDiuW0kTRlMGeBpOqLBC6n4YCpFP6GSGdiDEYJqC1AWxI4h', '$2y$10$ScofXNXbRDoTVCEZC80dquuJXmLy8XOSVlUVx.LZOP0BZAZFUA6GG', 'NymtGRzTOh8YCkuGFsuMYEOjmIOpS3YoFFlLNohzCWYayzJFWG21RJeQb2qd', '1996-04-18', '/images/avatars/AndresFabian_9.png', 4, 2, '2017-04-01 00:21:13', '2017-04-10 13:08:58'),
(10, 'Silvia', 'Salamanca', 'Ejecutiva de cuentas', '39057069', 'ssalamanca@himalayada.com', 1, '160.00', '0.00', '89lN0Tdo9WSxKOhYATwGiZWLfX4HltT9OeVOgCtQifD8IsHXlSh2pWbulLWg', '$2y$10$Spb8Hb1Nq2INVSDkvYi1S.1vPNamZrWCpv4dVAkApY8Tuewsk.bpG', '5xzOqAA2SDFXaDmCZcwjzz17iGG485HsnTpFwrydb3tf63vLhDn92zdz3jiF', '1986-10-07', NULL, 3, 6, '2017-04-01 00:29:41', '2017-04-05 16:39:12'),
(11, 'Andrea', 'Martinez Satizabal', 'Ejecutiva de Cuentas', '3799180', 'bamartinez@himalayada.com', 1, '160.00', '0.00', 'HUymwZan0aN6aBEFVVvajMHfU9WfyUXeBO82WU8alkG9ITgWY0aEyEhf9jzq', '$2y$10$4W50sYVU6WmVqP6cCRu.G.QNg0ROL2LEil.LDz4tatZVGLUe.mirC', 'ciC8AGxADcU2eWvKq7kvIHWd5dCqXrcdaULXWusZnpDyFdNGJCFlrSKJHtWO', '1987-11-19', NULL, 3, 6, '2017-04-01 01:49:57', '2017-04-09 02:23:59'),
(12, 'Juan Pablo', 'Isasi', 'Community Manager', '', 'jisasi@himalayada.com', 1, '160.00', '0.00', 'UaNlOeUhMQnX2d6MHV9lzoRMQNSRJ9RPsVfVzlUyKQyQl6WiGciDvjuBObz2', '$2y$10$cF66kFThA5L9s4x0wbbo4uIs1KkHkevEYN9ne7TdbXLitqqvMSZfG', 'iLlyL7M1SjsYV6k2t1yIyC2tnwIOk7LUmSyf6Ez4RV6hPZMQ8qLa6ElJkxka', '1993-05-12', NULL, 5, 4, '2017-04-03 18:23:06', '2017-04-03 18:23:06'),
(13, 'Alvaro Jose', 'Borrero', ' Ingeniero de desarrollo', '3865350', 'aborrero@himalayada.com', 1, '160.00', '0.00', 'frf0L9CKPHKJvQd9EYEfeHnyOa5YGpZDUcuXsfEE0NEMMtM8ZUAQzuperZPc', '$2y$10$H/52PwevUFw8JC5YL08gNOhGgJ/Klk9IQBvzr0IwQIm6xBDqg8906', 'bev4DEExW55V7JsahkqBm1F3CCkywTrwRvBBxyNycPu400ijBhkAArL3nti0', '1997-10-14', '/images/avatars/AlvaroJose_13.png', 5, 3, '2017-04-03 18:33:18', '2017-04-07 15:00:46'),
(14, 'Juan Pablo', 'Portilla', 'Campaign Manager', '3865350', 'jportilla@himalayada.com', 1, '160.00', '0.00', 'R1k1WsTtH2qXFdXhQm18sD7gN8yisxRVHkqDxScTiIiM0nTXUiXVsueEcUoS', '$2y$10$QGunZoZwR0maduXUc3DsLuWLyMs4qZe1/cFQ90UP9GSbqOM.sQaa2', '4ajEQLvBntnxYjS95cRwur28FjaKBi58P9wUKCYb6mfvPVZt54mSbl3kkl38', '1994-08-11', NULL, 5, 5, '2017-04-03 19:26:15', '2017-04-04 14:07:15'),
(15, 'Maria Camila', 'Matallana', 'Data Specialist', '3865350', 'mcmatallana@himalayada.com', 1, '160.00', '0.00', 'hV23xOf3KOyCtVLJD74PYRDiDDMaf4CeI5ERl5FIDxASRIWCza7ZbXkGUe56', '$2y$10$cQlQdH4xASHHQ9ph1U9uMe2xFVS77J0D/MgXtV4egl.w8rXOxsRgu', '720KGlGpdfuVVI9MqrhnQTHE6c7qnaH0wesAAg9sEIdqEG8IPNGPAVfi80ia', '1994-07-13', NULL, 5, 5, '2017-04-03 19:30:08', '2017-04-03 22:06:57'),
(16, 'Alexandra', 'Narvaez', 'Practicante en Contenidos - CM', '3865350', 'anarvaez@himalayada.com', 1, '160.00', '1.00', 'uThXBZ9sl7m3k82WfNBnr7yedtbjvT7S667znt5NcrjXY7bQIsQ9ccIJ7IDb', '$2y$10$3b3C2PZKlm/xP2GTskiKK.dxFNiRqcd2kdFf7sTjzPoP8pzpDHFWS', 'NDb4MCsh3RpuPjCZ7E1Hw5KLdGirigHmejbzgksyBVhIQDm1URNhewcCnla4', '1999-04-02', NULL, 5, 4, '2017-04-03 18:07:20', '2017-04-05 12:47:44'),
(17, 'John', 'Acosta', 'Content Manager', '3865350', 'jacosta@himalayada.com', 1, '160.00', '0.00', 'mdFc0QIeFaBb7VIoaHC9MRgxoTbuHGgePsmXG2zHsilL0FBvRNIENEQ8tglk', '$2y$10$JKPqAcqaSzqxQEy2h3Mf1uXBxFYrSLPa9tmb85ESwgmMZRwQB.A32', 'qTuBrqiGDKQyp7tSdbSvVwna7yPHpkKUDnVZvDpuZIJuqrj768039xKUFbJ3', '1997-05-02', '/images/avatars/John_17.png', 5, 4, '2017-04-03 18:09:13', '2017-04-04 19:38:24'),
(18, 'Karen', 'Piedrahita Mora', 'Community Manager', '3865350', 'kpiedrahita@himalayada.com', 1, '160.00', '0.00', 'nRGsbJlfsvPlwZVg3F3lT0cDVvAx5dP2QJRbkhXgrXoqlYZGDHCZW0CEWtIS', '$2y$10$eVlV7uIkcKT3smihzyhjnOkaq.8cChofAmLYC80.RMiKlsK8z8yz2', 'GNxnFGRnWpEKGJgahsHLsR0PJKhFiD4ptEjyR4JbHfuXGITidtRlKlAcxmj2', '1996-08-14', NULL, 5, 4, '2017-04-03 18:11:44', '2017-04-03 18:11:44'),
(19, 'Daniela', 'Roncancio', 'Content Manager', '3865350', 'droncancio@himalayada.com', 1, '160.00', '0.00', 'oeG4gETrGdSew7u83dEFM1qfgZxk3T45SQaZankeCzM3f2UdlSG92ikvfI74', '$2y$10$0kIW5OJLHXQNmp6FgH8SHO2JOc9Rk2S6ozdpYE7Dxfd7k6fv/JRY2', 'VDHRV7u64d7E79enF3FGUEu5muCKWhOTWuGLajNlqQgAk9js6ChVq3CvtnR8', '1999-03-17', NULL, 5, 4, '2017-04-03 18:16:14', '2017-04-03 18:16:14'),
(20, 'David', 'Salazar', 'Desarrollador', '', 'dsalazar@himalayada.com', 1, '160.00', '0.00', 'NfyuUBRwsoXezRBdcLvxoQmFD7X7NbXKVfc57SkGROKsXG5kNbHvzVBDe4M6', '$2y$10$2ZPziARPHwzvR5qcABsiJu0BzL9hQ67iC0Rf90371jkTw8r7pnb7K', 'EyYCYCAkgkWN2SducHiANeb93FOZRo062JaIH87PJ3TjdfeKsBxC3PYcuEkE', '1995-07-18', '/images/avatars/David_20.png', 5, 3, '2017-04-03 19:33:02', '2017-04-07 23:02:14'),
(21, 'Brian', 'Caldas', 'Desarrollador', NULL, 'bcaldas@himalayada.com', 1, '160.00', '6.30', 'OyrXcARUU8LqjHleWE8KVevmxPZ6RKFYUZI4Q6YbYbkgLDl8nr6d6Cwvrcqk', '$2y$10$PVpqHuQhdtGZQkhWQhz5oehLmPmWpzKWJp900FOp156f64axNSlga', 'ReUDta2UsYLq7DmdpXiJafBXmNT6VMoLOH3YYdOutS9jdZJP6TzSL8wRgfI4', '1993-01-23', '/images/avatars/Brian_21.png', 5, 3, '2017-04-03 19:33:49', '2017-04-07 23:10:01'),
(22, 'Nathalia', 'Dominguez Gonzales', 'Account Executive', '3865350', 'ndominguez@himalayada.com', 1, '160.00', '0.00', 'xbqPlRGQQ7CdsWr2yS5IBQ85MEXgRxt92dmyCI4lfkwcc0QVQVwgsNswnpAZ', '$2y$10$XEm.vq.un1WtV5qga7BLgel7q7r..3rH1bUbfshsiwOvKqwlOoK3C', 'OU5FtELQORy5dm8CqIp1K7foxPC5AJmXPk3L70S0EbM0x2EsfmKxGS7OU5eC', '1984-10-24', NULL, 3, 6, '2017-04-03 19:39:40', '2017-04-03 22:55:42'),
(23, 'Zuly', 'Villamil', 'Diseñadora Gráfica', '3865350', 'zpvillamil@himalayada.com', 1, '160.00', '11.50', 'AWwlIMrCu00AZaO8ico9Ou4ha4YO3u2dt0TtNZmS2oP8XvwaXK44uIchlutS', '$2y$10$BYYJ1oFhSBo9y9pvEeunA.Zc4u42M/GDpFJjNQMLsr6tN2eC8ts/W', 'YnTeJiJYEcpAuZUvyUHPRolYUO6Nnw6ayduamkfhd2yeguZ1a2r8LOC3qdBX', '1989-09-28', '/images/avatars/Zuly_23.png', 5, 2, '2017-04-03 21:04:20', '2017-04-07 20:09:27'),
(24, 'Christian', 'Gil Bernal', 'Diseñador Gráfico', '3865350', 'cgil@himalayada.com', 1, '160.00', '9.00', '6gNk9nhPH3Ils7RltcVEYT1bmNLxjRIjvtGBJOCXKp74xogOgv8XTPgWaBnt', '$2y$10$Bp9Z0iHWCGtrwcPGTWMkme0LMmPMH8buJ0PGHHl/cpdNWopqszrJe', 'T8gsi1hb5wLxcqyoYGXoOCtYkbehhxhXP8JMmYcWE3gAJg4dvL8djaBNeGp5', '1991-01-14', '/images/avatars/Christian_24.png', 5, 2, '2017-04-03 21:06:05', '2017-04-07 19:19:17'),
(25, 'Alejandro', 'Garrido', 'Practicante en Diseño Gráfico', '3865350', 'agarrido@himalayada.com', 1, '160.00', '15.50', 'tYRCjXYFvuXL6UpUFtYG0mUtVUU7lh9J0avKxkuh8rQpnW2O7nXzwOy9K1Hu', '$2y$10$Vo03MHWRKOp9/muXeEa5EOfgbMxycXPJqtIjqvjGNb1ipGcbRQs.6', 'apCE9zBycN3AUCWATc54JWVb1feszssFWlLuxNyRWL05SDnjlL3HH9CbE1vm', '1998-05-13', NULL, 5, 2, '2017-04-03 21:09:00', '2017-04-07 19:35:57'),
(26, 'Juan Pablo ', 'Murillo Parra', 'Digital Design Leader', '3865350', 'jpmurillo@himalayada.com', 1, '160.00', '0.00', 'ZxeaoRUUzJSxcKM7fxVkjAOTvZ2eG5GKid2yMtL6KsBMSNJpa0VaMNDdEZXp', '$2y$10$Sn3YwsJwc5uFwS1ueAjuVeadXsfNjrbnAcnd5GBn0juinathLzuL2', 'u1T8GhkMC6Q0e0vL7EdQ2M5nB5XsOpZtu9F4IsboqFzI8m1xprP4csmsyCS1', '1979-02-11', '/images/avatars/JuanPablo_26.png', 5, 1, '2017-04-03 22:34:53', '2017-04-04 14:15:20');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `comentarios_estados_id_foreign` FOREIGN KEY (`estados_id`) REFERENCES `estados` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comentarios_tareas_id_foreign` FOREIGN KEY (`tareas_id`) REFERENCES `tareas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comentarios_usuarios_comentario_id_foreign` FOREIGN KEY (`usuarios_comentario_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `compras_ots`
--
ALTER TABLE `compras_ots`
  ADD CONSTRAINT `compras_ots_areas_id_foreign` FOREIGN KEY (`areas_id`) REFERENCES `areas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compras_ots_divisas_id_foreign` FOREIGN KEY (`divisas_id`) REFERENCES `divisas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compras_ots_ots_id_foreign` FOREIGN KEY (`ots_id`) REFERENCES `ots` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compras_ots_tipos_compras_id_foreign` FOREIGN KEY (`tipos_compras_id`) REFERENCES `tipos_compras` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `estados`
--
ALTER TABLE `estados`
  ADD CONSTRAINT `estados_tipos_estados_id_foreign` FOREIGN KEY (`tipos_estados_id`) REFERENCES `tipos_estados` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `estados_x_roles`
--
ALTER TABLE `estados_x_roles`
  ADD CONSTRAINT `estados_x_roles_estados_id_foreign` FOREIGN KEY (`estados_id`) REFERENCES `estados` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `estados_x_roles_roles_id_foreign` FOREIGN KEY (`roles_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `ots`
--
ALTER TABLE `ots`
  ADD CONSTRAINT `ots_clientes_id_foreign` FOREIGN KEY (`clientes_id`) REFERENCES `clientes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ots_estados_id_foreign` FOREIGN KEY (`estados_id`) REFERENCES `estados` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ots_usuarios_id_foreign` FOREIGN KEY (`usuarios_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `planeacion_fases`
--
ALTER TABLE `planeacion_fases`
  ADD CONSTRAINT `planeacion_fases_planeacion_tipos_id_foreign` FOREIGN KEY (`planeacion_tipos_id`) REFERENCES `planeacion_tipos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `planeacion_tipos`
--
ALTER TABLE `planeacion_tipos`
  ADD CONSTRAINT `planeacion_tipos_areas_id_foreign` FOREIGN KEY (`areas_id`) REFERENCES `areas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `requerimientos_ots`
--
ALTER TABLE `requerimientos_ots`
  ADD CONSTRAINT `requerimientos_ots_areas_id_foreign` FOREIGN KEY (`areas_id`) REFERENCES `areas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `requerimientos_ots_ots_id_foreign` FOREIGN KEY (`ots_id`) REFERENCES `ots` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tareas`
--
ALTER TABLE `tareas`
  ADD CONSTRAINT `tareas_areas_id_foreign` FOREIGN KEY (`areas_id`) REFERENCES `areas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tareas_estados_id_foreign` FOREIGN KEY (`estados_id`) REFERENCES `estados` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tareas_ots_id_foreign` FOREIGN KEY (`ots_id`) REFERENCES `ots` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tareas_planeacion_fases_id_foreign` FOREIGN KEY (`planeacion_fases_id`) REFERENCES `planeacion_fases` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tareas_usuarios_id_foreign` FOREIGN KEY (`usuarios_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tiempos_x_area`
--
ALTER TABLE `tiempos_x_area`
  ADD CONSTRAINT `tiempos_x_area_areas_id_foreign` FOREIGN KEY (`areas_id`) REFERENCES `areas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tiempos_x_area_ots_id_foreign` FOREIGN KEY (`ots_id`) REFERENCES `ots` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_areas_id_foreign` FOREIGN KEY (`areas_id`) REFERENCES `areas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
