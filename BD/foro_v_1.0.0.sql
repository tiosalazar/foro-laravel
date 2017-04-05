-- phpMyAdmin SQL Dump
-- version 4.0.10.18
-- https://www.phpmyadmin.net
--
-- Servidor: localhost:3306
-- Tiempo de generación: 05-04-2017 a las 09:23:14
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
(1, 'Creatividad', '300', '7.00', 1, '2017-03-31 22:32:19', '2017-04-04 18:33:06'),
(2, 'Diseño', '300', '0.00', 1, '2017-03-31 22:32:19', '2017-04-03 18:00:03'),
(3, 'Desarrollo', '202', '0.00', 1, '2017-03-31 22:32:19', '2017-04-03 17:59:38'),
(4, 'Contenidos', '100', '2.75', 1, '2017-03-31 22:32:19', '2017-04-05 12:47:44'),
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=16 ;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `nombre`, `nit`, `email`, `telefono`, `nombre_contacto`, `estado`, `created_at`, `updated_at`) VALUES
(1, 'Electrojaponesa', '12345678', NULL, NULL, 'Victoria', 0, '2017-03-31 22:32:19', '2017-04-03 19:44:54'),
(2, 'Adeinco', '12345678', NULL, NULL, 'Pablo', 1, '2017-03-31 22:32:19', '2017-03-31 22:32:19'),
(3, 'Calzatodo', '12345678', NULL, NULL, 'Santiago', 0, '2017-03-31 22:32:19', '2017-04-03 19:45:04'),
(4, 'Himalaya', '87654321', NULL, NULL, 'M. Isabel', 1, '2017-03-31 22:32:19', '2017-03-31 22:32:19'),
(5, 'Comfandi - Corporativo', '37469569567', '', '', 'Lyda Prado', 1, '2017-04-01 00:33:12', '2017-04-01 01:13:01'),
(6, 'Harinera del Valle - Pastas La Muñeca', '891.300.382', 'mp.mejia@hv.com.co', '', 'Paola Mejia', 1, '2017-04-01 00:40:54', '2017-04-01 00:40:54'),
(7, 'Polylon', '817000960-3', 'victor.guerrero@polylon.com', '4854848', 'Victor Guerrero', 1, '2017-04-03 20:49:59', '2017-04-03 20:49:59'),
(8, 'Kassis', '8050201613', 'neiver-castaneda@kassis.com.co', '8893967', 'Neiver Castaneda', 1, '2017-04-03 21:22:46', '2017-04-03 21:22:46'),
(9, 'Constructora Meléndez', '890302629-8', 'jdcorrea@constructoramelendez.com', '', 'Juan David Correa ', 1, '2017-04-03 21:57:28', '2017-04-03 21:57:28'),
(10, 'Comfandi - Vallempresa365', '890303208-5', 'lydaprado@comfandi.com.co', '3185483292', 'Lyda Prado', 1, '2017-04-03 18:50:52', '2017-04-03 18:50:52'),
(11, 'Comfandi - Centro de Empleo', '89030303208-5', 'lydaprado@comfandi.com.co', '3185483292', 'Lyda prado', 1, '2017-04-03 18:51:48', '2017-04-03 18:51:48'),
(12, 'Harinera del Valle - Corporativo', '891300382​-9', 'kj.londono@hv.com.co', 'kj.londono@hv.com.co', 'Kelly Johanna ', 1, '2017-04-03 19:06:37', '2017-04-03 19:44:45'),
(13, 'Siderúrgica de Occidente - SIDOC', '8903330231', 'redes@sidocsa.com', '', 'Jaime Munoz', 1, '2017-04-04 13:36:14', '2017-04-04 13:36:14'),
(14, 'Ladrillera San Benito ', '800133691-2', 'gerencia@ladrillerasanbenito.com', '', 'Maria del Rosario Arias', 1, '2017-04-04 17:35:10', '2017-04-04 17:35:10'),
(15, 'Simark ', '900407971-1', '', '', 'Adriana Echeverry', 1, '2017-04-04 23:15:07', '2017-04-04 23:15:07');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=75 ;

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
(74, 'Esta tarea se pasa a programar.', 9, 64, 3, '2017-04-05 13:10:41', '2017-04-05 13:10:41');

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
  PRIMARY KEY (`id`),
  KEY `compras_ots_ots_id_foreign` (`ots_id`),
  KEY `compras_ots_areas_id_foreign` (`areas_id`),
  KEY `compras_ots_tipos_compras_id_foreign` (`tipos_compras_id`),
  KEY `compras_ots_divisas_id_foreign` (`divisas_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=12 ;

--
-- Volcado de datos para la tabla `compras_ots`
--

INSERT INTO `compras_ots` (`id`, `nombre`, `descripcion`, `provedor`, `valor`, `ots_id`, `areas_id`, `tipos_compras_id`, `divisas_id`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Amplificar post de Facebook', 'Facebook', '357000', 1, 5, 1, 1, '2017-04-01 00:46:54', '2017-04-01 00:46:54'),
(2, NULL, 'Amplificar 1 post', 'Facebook', '280000', 2, 5, 1, 1, '2017-04-01 01:39:29', '2017-04-01 01:39:29'),
(3, NULL, 'Pauta Post Cali, Buga, Tuluá, Cartago y Buenaventura', 'Facebook', '350000', 3, 5, 1, 1, '2017-04-01 02:01:04', '2017-04-01 02:01:04'),
(4, NULL, '7 Amplificaciones de Post ', 'Facebook', '1295000', 4, 5, 1, 1, '2017-04-01 03:01:41', '2017-04-01 03:01:41'),
(5, NULL, 'Compra de Certificado de Seguridad SSL para sitio web de Constructora Meléndez. ', 'Siteground ', '358400', 10, 3, 5, 1, '2017-04-03 19:15:51', '2017-04-03 19:15:51'),
(6, NULL, 'Renovación de espacio en Hosting por un año para sitio web de Constructora Meléndez', 'Siteground', '1150080', 10, 3, 2, 1, '2017-04-03 19:15:51', '2017-04-03 19:15:51'),
(7, NULL, 'Pauta en Facebook - Fans, Clic to Web, Engagement, Formulario.\n', 'Facebook', '2450000', 9, 1, 1, 1, '2017-04-03 19:32:16', '2017-04-03 19:32:16'),
(8, NULL, 'Pauta Google - Search y Display', 'Google', '1050000', 9, 1, 1, 1, '2017-04-03 19:32:16', '2017-04-03 19:32:16'),
(9, NULL, 'Creación de hasta 5 cuentas de correo, vinculación de un dominio, 10000 visitas mensuales, espacio web de 10 gb. ', 'Siteground', '382080', 27, 3, 2, 1, '2017-04-04 13:40:24', '2017-04-04 13:40:24'),
(10, NULL, 'Renovación de Dominio sidocsa.com por un año con Godaddy. ', 'Godaddy', '93000', 27, 3, 7, 1, '2017-04-04 13:40:24', '2017-04-04 13:40:24'),
(11, NULL, 'Compra de espacio hosting de hasta 2 GB de disco duro para la creación de 5 cuentas de correo. Se aprobó por Juan.I esta renovación y la revisión en 2018 de la conveniencia de seguir. ', 'Siteground', '180000', 29, 3, 2, 1, '2017-04-04 23:21:52', '2017-04-04 23:21:52');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=21 ;

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
(20, 'Entregado', 1, '2017-03-31 22:32:19', '2017-03-31 22:32:19');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=28 ;

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
(27, 7, 4);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `historicos_ots`
--

INSERT INTO `historicos_ots` (`id`, `ots_id`, `nombre`, `referencia`, `valor`, `fee`, `horas_totales`, `horas_disponibles`, `total_horas_extra`, `observaciones`, `requerimientos_ot`, `compras_ot`, `fecha_inicio`, `fecha_final`, `clientes_id`, `usuarios_id`, `estados_id`, `editor_id`, `created_at`, `updated_at`) VALUES
(1, 2, 'Pauta Escuelas Deportiva Tennis deCampo', '1096', '400000', 0, '4.00', '0.00', '0.00', 'Amplificación de 1 post de Facebook', '[{"area":1,"horas":4,"tiempo_extra":"0.00","requerimientos":[{"model_nom":"Amplificar post","model_horas":4}]},{"area":5,"horas":4,"tiempo_extra":"0.00","requerimientos":[{"model_nom":"Amplificar post","model_horas":4}]}]', '[]', '2017-04-03 00:00:00', '2017-04-17 00:00:00', 5, 2, 8, 1, '2017-04-01 02:19:06', '2017-04-01 02:19:06'),
(2, 9, 'Fee Mensual Abril', '1126', '10060848', 1, '111.00', '0.00', '0.00', 'Este mes la repartición del Fee es diferente a lo contratado pero dentro de las horas totales, ya que el cliente aun no tiene la persona para en análisis de los canales digitales', '[{"area":1,"horas":4,"tiempo_extra":"0.00","requerimientos":[{"model_nom":"Acompa\\u00f1amiento Estrat\\u00e9gico","model_horas":4}]},{"area":2,"horas":32,"tiempo_extra":"0.00","requerimientos":[{"model_nom":"Dise\\u00f1o de piezas y de parrilla","model_horas":28},{"model_nom":"Dise\\u00f1o para activos digitales","model_horas":4}]},{"area":3,"horas":8,"tiempo_extra":"0.00","requerimientos":[{"model_nom":"Desarrollo en activos digitales","model_horas":8}]},{"area":4,"horas":50,"tiempo_extra":"0.00","requerimientos":[{"model_nom":"Community & Content Manager","model_horas":50}]},{"area":5,"horas":17,"tiempo_extra":"0.00","requerimientos":[{"model_nom":"Analista Digital","model_horas":17}]}]', '[]', '2017-04-03 00:00:00', '2017-04-29 00:00:00', 2, 11, 8, 1, '2017-04-03 18:29:42', '2017-04-03 18:29:42'),
(3, 9, 'Fee Mensual Abril', '1126', '10060848', 1, '111.00', '0.00', '0.00', 'Este mes la repartición del Fee es diferente a lo contratado pero dentro de las horas totales, ya que el cliente aun no tiene la persona para en análisis de los canales digitales', '[{"area":1,"horas":17,"tiempo_extra":"0.00","requerimientos":[{"model_nom":"Analista Digital","model_horas":17}]},{"area":2,"horas":32,"tiempo_extra":"0.00","requerimientos":[{"model_nom":"Dise\\u00f1o de piezas y de parrilla","model_horas":28},{"model_nom":"Dise\\u00f1o para activos digitales","model_horas":4}]},{"area":3,"horas":8,"tiempo_extra":"0.00","requerimientos":[{"model_nom":"Desarrollo en activos digitales","model_horas":8}]},{"area":4,"horas":50,"tiempo_extra":"0.00","requerimientos":[{"model_nom":"Community & Content Manager","model_horas":50}]},{"area":5,"horas":17,"tiempo_extra":"0.00","requerimientos":[{"model_nom":"Analista Digital","model_horas":17}]}]', '[{"areas_id":1,"tipos_compras_id":1,"divisas_id":1,"descripcion":"Pauta en Facebook - Fans, Clic to Web, Engagement, Formulario.\\n","provedor":"Facebook","valor":2450000},{"areas_id":1,"tipos_compras_id":1,"divisas_id":1,"descripcion":"Pauta Google - Search y Display","provedor":"Google","valor":1050000}]', '2017-04-03 00:00:00', '2017-04-29 00:00:00', 2, 11, 8, 1, '2017-04-03 19:32:16', '2017-04-03 19:32:16'),
(4, 25, 'Soporte Sitio Web', '1108-4', '300000', 1, '4.00', '0.00', '0.00', '', '[{"area":3,"horas":4,"tiempo_extra":"0.00","requerimientos":[{"model_nom":"Soporte Sitio Web","model_horas":4}]}]', '[]', '2017-04-03 00:00:00', '2017-05-05 00:00:00', 12, 22, 8, 1, '2017-04-03 20:59:12', '2017-04-03 20:59:12'),
(5, 15, 'Fee Vallempresa365', '1102-2', '9,450,000', 1, '160.00', '0.00', '0.00', '', '[{"area":2,"horas":"80","tiempo_extra":0,"requerimientos":[{"model_nom":"Dise\\u00f1ador Medio Tiempo","model_horas":"80"}]},{"area":4,"horas":80,"tiempo_extra":"0.00","requerimientos":[{"model_nom":"Community Manager Vallempresa","model_horas":40},{"model_nom":"Content Manager Vallempresa","model_horas":40}]}]', '[]', '2017-04-03 00:00:00', '2017-04-29 00:00:00', 10, 2, 8, 1, '2017-04-03 21:30:49', '2017-04-03 21:30:49'),
(6, 20, 'Implementación nuevo sitio web', '970', '17,950,000', 0, '268.50', '62.00', '0.00', 'Este proyecto arrancó el 23 de Enero de 2017 con esa fecha está relacionada la OT física con el mismo identificador. ', '[{"area":2,"horas":55.5,"tiempo_extra":"0.00","requerimientos":[{"model_nom":"Dise\\u00f1o de Sitio Web PLM","model_horas":55}]},{"area":3,"horas":55.5,"tiempo_extra":"0.00","requerimientos":[{"model_nom":"Dise\\u00f1o de Sitio Web PLM","model_horas":55}]},{"area":4,"horas":55.5,"tiempo_extra":"0.00","requerimientos":[{"model_nom":"Dise\\u00f1o de Sitio Web PLM","model_horas":55}]},{"area":5,"horas":"40","tiempo_extra":"0.00","requerimientos":[{"model_nom":"Dise\\u00f1o de Sitio Web PLM","model_horas":"40"}]}]', '[]', '2017-04-03 00:00:00', '2017-06-13 00:00:00', 6, 3, 8, 8, '2017-04-04 21:46:28', '2017-04-04 21:46:28');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=75 ;

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
(74, '15.00', NULL, 74, 24, 3, 11, 64, 9, NULL, NULL, '2017-04-05 13:10:41', '2017-04-05 13:10:41');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=354 ;

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
(353, '2017_04_03_163109_update_tareas_v1_0_0', 2);

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
('01ac8bd1-317f-4004-8067-57f44c886d7e', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":2,"nombre":"Silvia","cargo":"Ejecutiva de cuentas","descripcion":"Silvia cre\\u00f3 la Tarea: Pauta Tennis de campo","created_at":"2017-03-31 20:51:06","img_perfil":null,"link":"\\/ver_tarea\\/2"}', '2017-04-03 19:13:25', '2017-04-01 01:51:06', '2017-04-03 19:13:25'),
('0267b5bc-7ff9-4b97-bea3-131da4b5f792', 'App\\Notifications\\TareaRealizada', 7, 'App\\User', '{"id_tarea":29,"nombre":"Leonardo","cargo":"Lider de Contenido Escrito","descripcion":"Leonardo ha realizado la Tarea: \\"Cambiar nombre del seguro de ProgreSER\\" en 0.25 Hrs","created_at":"2017-04-04 17:38:04","img_perfil":"\\/images\\/avatars\\/Leonardo_7.png","link":"\\/ver_tarea\\/29"}', NULL, '2017-04-04 22:38:04', '2017-04-04 22:38:04'),
('033b37cf-1f51-4d3e-b63f-8b802580c0b1', 'App\\Notifications\\OtCreada', 1, 'App\\User', '{"id_tarea":7,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  ha creado una OT con referencia: 1103, nombre : Fee Posicionamiento SEO  y valor: $780,000","created_at":"2017-04-03 16:38:39","img_perfil":null,"link":"\\/ots\\/visualizar\\/7"}', '2017-04-03 21:56:36', '2017-04-03 21:38:39', '2017-04-03 21:56:36'),
('036e9749-3bbf-46ee-a50d-12a9f1c7a7af', 'App\\Notifications\\OtCreada', 1, 'App\\User', '{"id_tarea":11,"nombre":" Maria Andrea","cargo":"New Bussines","descripcion":" Maria Andrea ha creado una OT con referencia: 1109, nombre : Fee de Soporte en Desarrollo para sitio web y valor: $288,000","created_at":"2017-04-03 14:49:14","img_perfil":null,"link":"\\/ots\\/visualizar\\/11"}', '2017-04-03 22:38:13', '2017-04-03 19:49:14', '2017-04-03 22:38:13'),
('03cf898e-3bc0-4607-8cd9-7732c1b8c708', 'App\\Notifications\\TareaProgramada', 4, 'App\\User', '{"id_tarea":66,"nombre":"Jose","cargo":"Director Creativo","descripcion":"Jose ha programado la Tarea: Realizar Flow Pauta Primero de Mayo","created_at":"2017-04-05 06:43:54","img_perfil":"\\/images\\/avatars\\/Jose_4.png","link":"\\/ver_tarea\\/66"}', '2017-04-05 11:44:11', '2017-04-05 11:43:54', '2017-04-05 11:44:11'),
('04fdb0fc-da7b-47ac-a16b-f9f2abb346ad', 'App\\Notifications\\TareaCreada', 4, 'App\\User', '{"id_tarea":48,"nombre":" Maria Andrea","cargo":"New Bussines","descripcion":" Maria Andrea cre\\u00f3 la Tarea: Creaci\\u00f3n de Art\\u00edculos para Secci\\u00f3n Blog Momentos","created_at":"2017-04-03 17:43:19","img_perfil":null,"link":"\\/ver_tarea\\/48"}', '2017-04-03 22:44:00', '2017-04-03 22:43:19', '2017-04-03 22:44:00'),
('0503d069-a990-4a9f-9631-886bb353cd32', 'App\\Notifications\\OtTiempoExtraAprobado', 11, 'App\\User', '{"id_tarea":9,"nombre":"Maria Isabel","cargo":"Proyect Owner","descripcion":"Maria Isabel ha editado su Orden de trabajo con la referencia #1126 con el nombre Fee Mensual Abril ","created_at":"2017-04-03 14:32:16","img_perfil":null,"link":"\\/ots\\/visualizar\\/9"}', '2017-04-03 20:31:03', '2017-04-03 19:32:16', '2017-04-03 20:31:03'),
('0666b210-8ad5-4f6b-91fb-602593ee75e5', 'App\\Notifications\\OtCreada', 1, 'App\\User', '{"id_tarea":6,"nombre":" Maria Andrea","cargo":"New Bussines","descripcion":" Maria Andrea ha creado una OT con referencia: 1104, nombre : Fee de Mantenimiento al E-Commerce y valor: $580,000","created_at":"2017-04-03 16:34:24","img_perfil":null,"link":"\\/ots\\/visualizar\\/6"}', '2017-04-03 21:56:36', '2017-04-03 21:34:24', '2017-04-03 21:56:36'),
('0b05f1c4-0bf1-441c-9aac-0d860f47c101', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":47,"nombre":"Andrea","cargo":"Ejecutiva de Cuentas","descripcion":"Andrea cre\\u00f3 la Tarea: Activar pauta formulario Hero ProgreSER","created_at":"2017-04-03 17:15:13","img_perfil":null,"link":"\\/ver_tarea\\/47"}', NULL, '2017-04-03 22:15:13', '2017-04-03 22:15:13'),
('0ca1cb0b-942c-40a5-bdb0-ce632f491a74', 'App\\Notifications\\TareaRealizada', 9, 'App\\User', '{"id_tarea":37,"nombre":"Zuly","cargo":"Dise\\u00f1adora Gr\\u00e1fica","descripcion":"Zuly ha realizado la Tarea: \\"Graficar Vacantes y convocatorias Agencias Empleo\\" en 1 Hrs","created_at":"2017-04-03 17:57:11","img_perfil":"\\/images\\/avatars\\/Zuly_23.png","link":"\\/ver_tarea\\/37"}', '2017-04-04 16:07:06', '2017-04-03 22:57:11', '2017-04-04 16:07:06'),
('0e4cebad-8b70-4578-9f80-c1b114320471', 'App\\Notifications\\TareaProgramada', 7, 'App\\User', '{"id_tarea":49,"nombre":"Leonardo","cargo":"Lider de Contenido Escrito","descripcion":"Leonardo ha programado la Tarea: Ajuste de noticia Wapp","created_at":"2017-04-04 14:37:51","img_perfil":"\\/images\\/avatars\\/Leonardo_7.png","link":"\\/ver_tarea\\/49"}', '2017-04-04 19:59:15', '2017-04-04 19:37:51', '2017-04-04 19:59:15'),
('0f627f71-518a-4365-9f36-086467fbfc51', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":26,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  cre\\u00f3 la Tarea: Implementar y optimizar seo Polylon","created_at":"2017-04-03 16:53:10","img_perfil":null,"link":"\\/ver_tarea\\/26"}', NULL, '2017-04-03 21:53:10', '2017-04-03 21:53:10'),
('1264aba2-35e2-4b5d-95d9-b4aefeefead2', 'App\\Notifications\\TareaRealizada', 5, 'App\\User', '{"id_tarea":25,"nombre":"Nestor","cargo":"SEM Performance Manager","descripcion":"Nestor ha realizado la Tarea: \\"Capacitaci\\u00f3n Directivos de Comfandi\\" en 4 Hrs","created_at":"2017-04-03 15:56:46","img_perfil":null,"link":"\\/ver_tarea\\/25"}', '2017-04-03 21:06:13', '2017-04-03 20:56:46', '2017-04-03 21:06:13'),
('18d9ee8a-90b1-4617-be7a-f25862ab35b4', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":21,"nombre":"Silvia","cargo":"Ejecutiva de cuentas","descripcion":"Silvia cre\\u00f3 la Tarea: Pauta cursos Cali Abril Decoraci\\u00f3n de fiestas tem\\u00e1ticas","created_at":"2017-03-31 22:26:18","img_perfil":null,"link":"\\/ver_tarea\\/21"}', '2017-04-03 19:13:25', '2017-04-01 03:26:18', '2017-04-03 19:13:25'),
('1a4260e3-4a20-4edf-90ef-f2e1c5abcca2', 'App\\Notifications\\TareaProgramada', 7, 'App\\User', '{"id_tarea":34,"nombre":"Leonardo","cargo":"Lider de Contenido Escrito","descripcion":"Leonardo ha programado la Tarea: Pieza Mocoa - Harinera","created_at":"2017-04-04 11:02:57","img_perfil":"\\/images\\/avatars\\/Leonardo_7.png","link":"\\/ver_tarea\\/34"}', '2017-04-04 19:59:15', '2017-04-04 16:02:57', '2017-04-04 19:59:15'),
('1abaa621-a253-4c16-9f34-75f08bf8bc4f', 'App\\Notifications\\TareaProgramada', 4, 'App\\User', '{"id_tarea":36,"nombre":"Jose","cargo":"Director Creativo","descripcion":"Jose ha programado la Tarea: Creaci\\u00f3n Contenidos Productos, Tips y Recetas","created_at":"2017-04-03 16:18:09","img_perfil":"\\/images\\/avatars\\/Jose_4.png","link":"\\/ver_tarea\\/36"}', '2017-04-03 21:18:40', '2017-04-03 21:18:09', '2017-04-03 21:18:40'),
('1af37ec2-e810-4716-8c78-a73327a7fdc5', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":20,"nombre":"Silvia","cargo":"Ejecutiva de cuentas","descripcion":"Silvia cre\\u00f3 la Tarea: Pauta cursos Cali Abril Decoraci\\u00f3n y extensi\\u00f3n de u\\u00f1as","created_at":"2017-03-31 22:25:34","img_perfil":null,"link":"\\/ver_tarea\\/20"}', '2017-04-03 19:13:25', '2017-04-01 03:25:34', '2017-04-03 19:13:25'),
('1d132eb1-682e-4f52-9871-271095f487c1', 'App\\Notifications\\TareaProgramada', 16, 'App\\User', '{"id_tarea":30,"nombre":"Leonardo","cargo":"Lider de Contenido Escrito","descripcion":"Leonardo ha programado la Tarea: Art\\u00edculo blog ProgreSER Semana Santa ","created_at":"2017-04-03 15:38:39","img_perfil":"\\/images\\/avatars\\/Leonardo_7.png","link":"\\/ver_tarea\\/30"}', '2017-04-04 20:46:09', '2017-04-03 20:38:39', '2017-04-04 20:46:09'),
('1d6cb9d2-6ee5-4316-873d-a31060114ff4', 'App\\Notifications\\TareaProgramada', 23, 'App\\User', '{"id_tarea":65,"nombre":"Andres Fabian","cargo":"Encargado de Dise\\u00f1o","descripcion":"Andres Fabian ha programado la Tarea: Gr\\u00e1ficos 3 HV","created_at":"2017-04-05 07:47:23","img_perfil":"\\/images\\/avatars\\/AndresFabian_9.png","link":"\\/ver_tarea\\/65"}', NULL, '2017-04-05 12:47:23', '2017-04-05 12:47:23'),
('2078993b-6f26-447c-aa13-6a3ae6559c8f', 'App\\Notifications\\TareaCreada', 7, 'App\\User', '{"id_tarea":29,"nombre":"Andrea","cargo":"Ejecutiva de Cuentas","descripcion":"Andrea cre\\u00f3 la Tarea: Cambiar nombre del seguro de ProgreSER","created_at":"2017-04-03 13:36:26","img_perfil":null,"link":"\\/ver_tarea\\/29"}', '2017-04-03 19:04:20', '2017-04-03 18:36:26', '2017-04-03 19:04:20'),
('218ee028-df20-4e4f-a2a3-003fe424fd44', 'App\\Notifications\\TareaProgramada', 4, 'App\\User', '{"id_tarea":60,"nombre":"Jose","cargo":"Director Creativo","descripcion":"Jose ha programado la Tarea: Cotizaci\\u00f3n AHL Asesores de Seguros","created_at":"2017-04-04 13:30:17","img_perfil":"\\/images\\/avatars\\/Jose_4.png","link":"\\/ver_tarea\\/60"}', '2017-04-04 18:30:24', '2017-04-04 18:30:17', '2017-04-04 18:30:24'),
('21f26ff3-41cf-4aed-bf30-4499075693c0', 'App\\Notifications\\TareaProgramada', 25, 'App\\User', '{"id_tarea":53,"nombre":"Andres Fabian","cargo":"Encargado de Dise\\u00f1o","descripcion":"Andres Fabian ha programado la Tarea: Dise\\u00f1o Mailing Abril conferencia empresarial regionales","created_at":"2017-04-04 11:22:28","img_perfil":"\\/images\\/avatars\\/AndresFabian_9.png","link":"\\/ver_tarea\\/53"}', NULL, '2017-04-04 16:22:28', '2017-04-04 16:22:28'),
('236c54c2-eeb3-4763-b277-2afccaa5a972', 'App\\Notifications\\OtCreada', 1, 'App\\User', '{"id_tarea":5,"nombre":"Maria Isabel","cargo":"Proyect Owner","descripcion":"Maria Isabel ha creado una OT con referencia: HDA-0417, nombre : Himalaya - Coordinaci\\u00f3n y valor: $100,000","created_at":"2017-04-03 14:50:03","img_perfil":null,"link":"\\/ots\\/visualizar\\/5"}', '2017-04-03 20:23:57', '2017-04-03 19:50:03', '2017-04-03 20:23:57'),
('2485ec8f-5a24-41c2-957e-d45cc580b350', 'App\\Notifications\\TareaProgramada', 24, 'App\\User', '{"id_tarea":64,"nombre":"Andres Fabian","cargo":"Encargado de Dise\\u00f1o","descripcion":"Andres Fabian ha programado la Tarea: Dise\\u00f1o de la parrilla ProgreSER ","created_at":"2017-04-05 08:10:41","img_perfil":"\\/images\\/avatars\\/AndresFabian_9.png","link":"\\/ver_tarea\\/64"}', NULL, '2017-04-05 13:10:41', '2017-04-05 13:10:41'),
('24a2d761-d2e1-4c22-96a3-8d90869ff030', 'App\\Notifications\\TareaCreada', 6, 'App\\User', '{"id_tarea":40,"nombre":"Nathalia","cargo":"Account Executive","descripcion":"Nathalia cre\\u00f3 la Tarea: Informe de soporte mes de marzo de sitio web","created_at":"2017-04-03 16:44:18","img_perfil":null,"link":"\\/ver_tarea\\/40"}', '2017-04-03 22:23:23', '2017-04-03 21:44:18', '2017-04-03 22:23:23'),
('266cdb1e-a4df-4e27-8d37-f58c2629d0ca', 'App\\Notifications\\TareaProgramada', 4, 'App\\User', '{"id_tarea":66,"nombre":"Jose","cargo":"Director Creativo","descripcion":"Jose ha programado la Tarea: Realizar Flow Pauta Primero de Mayo","created_at":"2017-04-05 06:43:54","img_perfil":"\\/images\\/avatars\\/Jose_4.png","link":"\\/ver_tarea\\/66"}', '2017-04-05 11:44:11', '2017-04-05 11:43:54', '2017-04-05 11:44:11'),
('2737c5a8-69dc-49e2-a9fa-85d924bd5c4a', 'App\\Notifications\\TareaAtencionArea', 5, 'App\\User', '{"id_tarea":11,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  ha devuelto la Tarea: \\"Pauta Descuento Droguer\\u00edas - Gif que Anuncie descuento este 15 de abril)\\" a Atenci\\u00f3n \\u00c1rea","created_at":"2017-04-04 16:25:12","img_perfil":null,"link":"\\/ver_tarea\\/11"}', NULL, '2017-04-04 21:25:12', '2017-04-04 21:25:12'),
('277c3417-72c2-4677-9632-c5785f6c0665', 'App\\Notifications\\ComentarioNuevoTarea', 5, 'App\\User', '{"id_tarea":15,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  ha comentado en la Tarea: Pauta Descuento Droguer\\u00edas - Pieza HOY 10% de descuento \\"MB: Se ajusto l...\\"","created_at":"2017-04-04 16:56:14","img_perfil":null,"link":"\\/ver_tarea\\/15"}', NULL, '2017-04-04 21:56:14', '2017-04-04 21:56:14'),
('2a5bb855-a40a-42c6-b68a-9748e8494da0', 'App\\Notifications\\OtTiempoExtraAprobado', 22, 'App\\User', '{"id_tarea":25,"nombre":"Maria Isabel","cargo":"Proyect Owner","descripcion":"Maria Isabel ha editado su Orden de trabajo con la referencia #1108-4 con el nombre Soporte Sitio Web ","created_at":"2017-04-03 15:59:12","img_perfil":null,"link":"\\/ots\\/visualizar\\/25"}', '2017-04-03 21:11:49', '2017-04-03 20:59:12', '2017-04-03 21:11:49'),
('2c7b3fd3-32b0-47b0-a43c-8160959dc36d', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":23,"nombre":"Silvia","cargo":"Ejecutiva de cuentas","descripcion":"Silvia cre\\u00f3 la Tarea: Pauta cursos Cali Abril - Secretariado sistematizado contable","created_at":"2017-03-31 22:30:01","img_perfil":null,"link":"\\/ver_tarea\\/23"}', '2017-04-03 19:13:25', '2017-04-01 03:30:01', '2017-04-03 19:13:25'),
('310e5051-0331-4dcb-85b9-98887f6827eb', 'App\\Notifications\\OtCreada', 1, 'App\\User', '{"id_tarea":20,"nombre":" Maria Andrea","cargo":"New Bussines","descripcion":" Maria Andrea ha creado una OT con referencia: 970, nombre : Implementaci\\u00f3n nuevo sitio web y valor: $17,950,000","created_at":"2017-04-03 15:16:26","img_perfil":null,"link":"\\/ots\\/visualizar\\/20"}', '2017-04-03 22:38:13', '2017-04-03 20:16:26', '2017-04-03 22:38:13'),
('314040fe-b832-4eca-9cbf-52871662940f', 'App\\Notifications\\ComentarioNuevoTarea', 5, 'App\\User', '{"id_tarea":10,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  ha comentado en la Tarea: Pauta Descuento Droguer\\u00edas - Pieza HOY 10% de descuento \\"Esta amplificac...\\"","created_at":"2017-04-04 17:02:55","img_perfil":null,"link":"\\/ver_tarea\\/10"}', NULL, '2017-04-04 22:02:55', '2017-04-04 22:02:55'),
('32472894-736a-457f-b617-f416cfddce06', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":18,"nombre":"Silvia","cargo":"Ejecutiva de cuentas","descripcion":"Silvia cre\\u00f3 la Tarea: Pauta cursos Cali Abril - Preparaci\\u00f3n a base de cafe","created_at":"2017-03-31 22:22:20","img_perfil":null,"link":"\\/ver_tarea\\/18"}', '2017-04-03 19:13:25', '2017-04-01 03:22:20', '2017-04-03 19:13:25'),
('33bfee6c-6a38-4253-9da1-80e4d5407db0', 'App\\Notifications\\TareaCreada', 6, 'App\\User', '{"id_tarea":51,"nombre":" Maria Andrea","cargo":"New Bussines","descripcion":" Maria Andrea cre\\u00f3 la Tarea: Renovaci\\u00f3n de Hosting y Dominio 2017","created_at":"2017-04-04 09:21:10","img_perfil":null,"link":"\\/ver_tarea\\/51"}', '2017-04-04 16:00:09', '2017-04-04 14:21:10', '2017-04-04 16:00:09'),
('342cd439-4b7f-4e41-9d6c-5d90af4dd2a8', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":1,"nombre":"Maria Isabel","cargo":"Proyect Owner","descripcion":"Maria Isabel cre\\u00f3 la Tarea: Pauta Descuento Droguer\\u00edas - Gif d\\u00edas de descuento por iniciar mes ","created_at":"2017-03-31 19:52:50","img_perfil":null,"link":"\\/ver_tarea\\/1"}', '2017-04-03 19:13:25', '2017-04-01 00:52:50', '2017-04-03 19:13:25'),
('344f75c0-7830-47d3-bd8b-6df0006fefb1', 'App\\Notifications\\TareaEntregada', 4, 'App\\User', '{"id_tarea":43,"nombre":"Jose","cargo":"Director Creativo","descripcion":"Jose entreg\\u00f3 la Tarea: Creaci\\u00f3n temas art\\u00edculos Manitoba y actualiz\\u00f3 el estado a Entregado","created_at":"2017-04-03 17:09:58","img_perfil":"\\/images\\/avatars\\/Jose_4.png","link":"\\/ver_tarea\\/43"}', '2017-04-03 22:10:29', '2017-04-03 22:09:58', '2017-04-03 22:10:29'),
('34b85a99-0ad2-4835-aced-2bb3d02d064e', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":11,"nombre":"Silvia","cargo":"Ejecutiva de cuentas","descripcion":"Silvia cre\\u00f3 la Tarea: Pauta Descuento Droguer\\u00edas - Gif que Anuncie descuento este 15 de abril)","created_at":"2017-03-31 21:32:19","img_perfil":null,"link":"\\/ver_tarea\\/11"}', '2017-04-03 19:13:25', '2017-04-01 02:32:19', '2017-04-03 19:13:25'),
('35444482-187c-475c-9f11-3fee55bc2355', 'App\\Notifications\\ComentarioNuevoTarea', 5, 'App\\User', '{"id_tarea":9,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  ha comentado en la Tarea: Pauta Descuento Droguer\\u00edas - Gif que Anuncie descuento 15 de abril \\"Esta amplificac...\\"","created_at":"2017-04-04 17:01:59","img_perfil":null,"link":"\\/ver_tarea\\/9"}', NULL, '2017-04-04 22:01:59', '2017-04-04 22:01:59'),
('363a59c4-3b77-4334-8fe1-c58be50008fc', 'App\\Notifications\\OtCreada', 1, 'App\\User', '{"id_tarea":24,"nombre":"Nathalia","cargo":"Account Executive","descripcion":"Nathalia ha creado una OT con referencia: 1108-3, nombre : Fee SEO Sitio Web y valor: $788,377","created_at":"2017-04-03 15:44:32","img_perfil":null,"link":"\\/ots\\/visualizar\\/24"}', '2017-04-03 22:38:13', '2017-04-03 20:44:32', '2017-04-03 22:38:13'),
('387e29ff-b49a-47b4-aa33-28db5444c213', 'App\\Notifications\\OtTiempoExtraAprobado', 2, 'App\\User', '{"id_tarea":15,"nombre":"Maria Isabel","cargo":"Proyect Owner","descripcion":"Maria Isabel ha editado su Orden de trabajo con la referencia #1102-2 con el nombre Fee Vallempresa365 ","created_at":"2017-04-03 16:30:49","img_perfil":null,"link":"\\/ots\\/visualizar\\/15"}', '2017-04-04 16:03:04', '2017-04-03 21:30:49', '2017-04-04 16:03:04'),
('3a598850-8520-44fe-b2d3-b26c32b9c8df', 'App\\Notifications\\TareaCreada', 6, 'App\\User', '{"id_tarea":67,"nombre":"Andrea","cargo":"Ejecutiva de Cuentas","descripcion":"Andrea cre\\u00f3 la Tarea: Compra espacio Hosting","created_at":"2017-04-04 18:24:43","img_perfil":null,"link":"\\/ver_tarea\\/67"}', NULL, '2017-04-04 23:24:43', '2017-04-04 23:24:43'),
('3a7d7534-3a7b-4420-b25f-92d8bcb95e5b', 'App\\Notifications\\TareaCreada', 9, 'App\\User', '{"id_tarea":53,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  cre\\u00f3 la Tarea: Dise\\u00f1o Mailing Abril conferencia empresarial regionales","created_at":"2017-04-04 11:10:10","img_perfil":null,"link":"\\/ver_tarea\\/53"}', '2017-04-04 16:10:34', '2017-04-04 16:10:10', '2017-04-04 16:10:34'),
('3d2b93d9-29b8-40c6-bae2-6c0128ca7bbe', 'App\\Notifications\\TareaRealizada', 9, 'App\\User', '{"id_tarea":35,"nombre":"Zuly","cargo":"Dise\\u00f1adora Gr\\u00e1fica","descripcion":"Zuly ha realizado la Tarea: \\"Dise\\u00f1o pieza mocoa Harinera del Valle \\" en 1 Hrs","created_at":"2017-04-04 11:02:59","img_perfil":"\\/images\\/avatars\\/Zuly_23.png","link":"\\/ver_tarea\\/35"}', '2017-04-04 16:07:06', '2017-04-04 16:02:59', '2017-04-04 16:07:06'),
('3f3c90fa-072d-4f65-9092-16f7955c3f4a', 'App\\Notifications\\TareaCreada', 6, 'App\\User', '{"id_tarea":41,"nombre":"Nathalia","cargo":"Account Executive","descripcion":"Nathalia cre\\u00f3 la Tarea: Revisi\\u00f3n imagen historia","created_at":"2017-04-03 16:46:18","img_perfil":null,"link":"\\/ver_tarea\\/41"}', '2017-04-03 22:23:23', '2017-04-03 21:46:18', '2017-04-03 22:23:23'),
('3ff5232c-860d-4b79-a38c-8df2a1a7d471', 'App\\Notifications\\OtCreada', 1, 'App\\User', '{"id_tarea":10,"nombre":" Maria Andrea","cargo":"New Bussines","descripcion":" Maria Andrea ha creado una OT con referencia: 1107, nombre : Renovaci\\u00f3n Host, Soporte al Host y SSL 2017 y valor: $2,820,000","created_at":"2017-04-03 14:15:51","img_perfil":null,"link":"\\/ots\\/visualizar\\/10"}', '2017-04-03 22:38:13', '2017-04-03 19:15:51', '2017-04-03 22:38:13'),
('41058bab-4204-4750-8cfd-2396772ca70e', 'App\\Notifications\\TareaCreada', 9, 'App\\User', '{"id_tarea":54,"nombre":" Maria Andrea","cargo":"New Bussines","descripcion":" Maria Andrea cre\\u00f3 la Tarea: Adaptaci\\u00f3n del dise\\u00f1o del Home para 2 l\\u00edneas de producto","created_at":"2017-04-04 11:29:31","img_perfil":null,"link":"\\/ver_tarea\\/54"}', '2017-04-04 16:29:39', '2017-04-04 16:29:31', '2017-04-04 16:29:39'),
('41665ec2-b4f9-446c-b7f1-0d8ce3eb10b2', 'App\\Notifications\\TareaCreada', 7, 'App\\User', '{"id_tarea":34,"nombre":"Nathalia","cargo":"Account Executive","descripcion":"Nathalia cre\\u00f3 la Tarea: Pieza Mocoa - Harinera","created_at":"2017-04-03 15:55:01","img_perfil":null,"link":"\\/ver_tarea\\/34"}', '2017-04-03 21:33:32', '2017-04-03 20:55:01', '2017-04-03 21:33:32'),
('47b9e339-2c95-41c7-a8e5-f8e19be94f81', 'App\\Notifications\\TareaCreada', 6, 'App\\User', '{"id_tarea":59,"nombre":" Maria Andrea","cargo":"New Bussines","descripcion":" Maria Andrea cre\\u00f3 la Tarea: Desarrollo y maquetado del 50% del sitio en WordPress","created_at":"2017-04-04 11:52:59","img_perfil":null,"link":"\\/ver_tarea\\/59"}', '2017-04-04 19:35:06', '2017-04-04 16:52:59', '2017-04-04 19:35:06'),
('4950f62b-7cf6-447e-bee6-f63f3edac8f9', 'App\\Notifications\\TareaCreada', 9, 'App\\User', '{"id_tarea":37,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  cre\\u00f3 la Tarea: Graficar Vacantes y convocatorias Agencias Empleo","created_at":"2017-04-03 16:31:04","img_perfil":null,"link":"\\/ver_tarea\\/37"}', '2017-04-03 22:25:36', '2017-04-03 21:31:04', '2017-04-03 22:25:36'),
('4ef50c18-ab7c-4cee-a440-fa85216c137f', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":24,"nombre":"Silvia","cargo":"Ejecutiva de cuentas","descripcion":"Silvia cre\\u00f3 la Tarea: Pauta cursos Cali Abril - Cocina mexicana","created_at":"2017-03-31 22:30:48","img_perfil":null,"link":"\\/ver_tarea\\/24"}', '2017-04-03 19:13:25', '2017-04-01 03:30:48', '2017-04-03 19:13:25'),
('4ef9dcd5-db2f-4923-a2bd-ecff7372959e', 'App\\Notifications\\OtCreada', 1, 'App\\User', '{"id_tarea":27,"nombre":" Maria Andrea","cargo":"New Bussines","descripcion":" Maria Andrea ha creado una OT con referencia: 1110, nombre : Renovaci\\u00f3n Hosting, Dominio y Soporte  y valor: $1,420,000","created_at":"2017-04-04 08:40:25","img_perfil":null,"link":"\\/ots\\/visualizar\\/27"}', '2017-04-04 13:40:42', '2017-04-04 13:40:25', '2017-04-04 13:40:42'),
('502ae11f-fb28-437f-97be-449a7996e9f5', 'App\\Notifications\\TareaCreada', 4, 'App\\User', '{"id_tarea":60,"nombre":"Jose","cargo":"Director Creativo","descripcion":"Jose cre\\u00f3 la Tarea: Cotizaci\\u00f3n AHL Asesores de Seguros","created_at":"2017-04-04 13:29:00","img_perfil":"\\/images\\/avatars\\/Jose_4.png","link":"\\/ver_tarea\\/60"}', '2017-04-04 18:30:24', '2017-04-04 18:29:00', '2017-04-04 18:30:24'),
('52d19393-0ebd-458f-a0bc-3cdcf401557d', 'App\\Notifications\\TareaRealizada', 5, 'App\\User', '{"id_tarea":25,"nombre":"Nestor","cargo":"SEM Performance Manager","descripcion":"Nestor ha realizado la Tarea: \\"Capacitaci\\u00f3n Directivos de Comfandi\\" en 28 Hrs","created_at":"2017-04-03 15:58:37","img_perfil":null,"link":"\\/ver_tarea\\/25"}', '2017-04-03 21:06:13', '2017-04-03 20:58:37', '2017-04-03 21:06:13'),
('56021b7a-ff58-4794-b3f8-37f0db2b1c57', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":69,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  cre\\u00f3 la Tarea: Capacitaci\\u00f3n Digital Lyda Comfandi","created_at":"2017-04-05 08:56:52","img_perfil":null,"link":"\\/ver_tarea\\/69"}', NULL, '2017-04-05 13:56:52', '2017-04-05 13:56:52'),
('586d0129-6e64-4a8e-b29b-9f13cd850cd0', 'App\\Notifications\\OtCreada', 1, 'App\\User', '{"id_tarea":4,"nombre":"Silvia","cargo":"Ejecutiva de cuentas","descripcion":"Silvia ha creado una OT con referencia: 1094, nombre : Pauta Cursos Abril y valor: $1,850,000","created_at":"2017-03-31 22:01:41","img_perfil":null,"link":"\\/ots\\/visualizar\\/4"}', '2017-04-02 08:08:00', '2017-04-01 03:01:41', '2017-04-02 08:08:00'),
('5a213d39-66e0-43c7-9046-5ec975cbb812', 'App\\Notifications\\TareaRealizada', 7, 'App\\User', '{"id_tarea":44,"nombre":"Alexandra","cargo":"Practicante en Contenidos - CM","descripcion":"Alexandra ha realizado la Tarea: \\"Cambio en la promoci\\u00f3n de ProgreSER y Hero \\" en 1.00 Hrs","created_at":"2017-04-04 15:32:37","img_perfil":null,"link":"\\/ver_tarea\\/44"}', '2017-04-04 20:33:02', '2017-04-04 20:32:37', '2017-04-04 20:33:02'),
('5a6c62a2-88eb-4b34-b690-251819b4e85a', 'App\\Notifications\\TareaAtencionCuentas', 2, 'App\\User', '{"id_tarea":66,"nombre":"Jose","cargo":"Director Creativo","descripcion":"Jose ha devuelto la Tarea: \\"Realizar Flow Pauta Primero de Mayo\\" a Atenci\\u00f3n Cuentas","created_at":"2017-04-05 06:49:14","img_perfil":"\\/images\\/avatars\\/Jose_4.png","link":"\\/ver_tarea\\/66"}', NULL, '2017-04-05 11:49:14', '2017-04-05 11:49:14'),
('5c6e8aa3-0864-40ac-ae19-d8bf517165a4', 'App\\Notifications\\TareaProgramada', 23, 'App\\User', '{"id_tarea":37,"nombre":"Andres Fabian","cargo":"Encargado de Dise\\u00f1o","descripcion":"Andres Fabian ha programado la Tarea: Graficar Vacantes y convocatorias Agencias Empleo","created_at":"2017-04-03 16:58:15","img_perfil":null,"link":"\\/ver_tarea\\/37"}', '2017-04-03 21:58:53', '2017-04-03 21:58:15', '2017-04-03 21:58:53'),
('5dd254a5-0fe1-4581-9af2-ff609f969b80', 'App\\Notifications\\TareaCreada', 9, 'App\\User', '{"id_tarea":63,"nombre":" Maria Andrea","cargo":"New Bussines","descripcion":" Maria Andrea cre\\u00f3 la Tarea: Dise\\u00f1o Responsive de Interfaces","created_at":"2017-04-04 14:04:56","img_perfil":null,"link":"\\/ver_tarea\\/63"}', '2017-04-04 19:05:01', '2017-04-04 19:04:56', '2017-04-04 19:05:01'),
('5eed42b8-154e-4cc7-8a7d-fd1240b5221d', 'App\\Notifications\\TareaEntregada', 22, 'App\\User', '{"id_tarea":38,"nombre":"Luisa Fernanda","cargo":"Development  Leader","descripcion":"Luisa Fernanda entreg\\u00f3 la Tarea: Ajuste bot\\u00f3n de Proveedores y actualiz\\u00f3 el estado a Entregado","created_at":"2017-04-04 17:41:18","img_perfil":"\\/images\\/avatars\\/LuisaFernanda_6.png","link":"\\/ver_tarea\\/38"}', NULL, '2017-04-04 22:41:18', '2017-04-04 22:41:18'),
('613a1504-bd4b-42ac-8790-f324454f9069', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":9,"nombre":"Silvia","cargo":"Ejecutiva de cuentas","descripcion":"Silvia cre\\u00f3 la Tarea: Pauta Descuento Droguer\\u00edas - Gif que Anuncie descuento 15 de abril","created_at":"2017-03-31 21:30:14","img_perfil":null,"link":"\\/ver_tarea\\/9"}', '2017-04-03 19:13:25', '2017-04-01 02:30:14', '2017-04-03 19:13:25'),
('62c9dd2c-2ce8-4704-95b9-8c3f4cd72f70', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":28,"nombre":" Maria Andrea","cargo":"New Bussines","descripcion":" Maria Andrea cre\\u00f3 la Tarea: Implementaci\\u00f3n e  informe de SEO ","created_at":"2017-04-03 12:19:21","img_perfil":null,"link":"\\/ver_tarea\\/28"}', NULL, '2017-04-03 17:19:21', '2017-04-03 17:19:21'),
('6397fdf6-198d-4f22-a4c2-0681b0b498ac', 'App\\Notifications\\TareaRealizada', 6, 'App\\User', '{"id_tarea":41,"nombre":"Brian","cargo":"Desarrollador","descripcion":"Brian ha realizado la Tarea: \\"Revisi\\u00f3n imagen historia\\" en 0.4 Hrs","created_at":"2017-04-04 09:47:37","img_perfil":"\\/images\\/avatars\\/Brian_21.png","link":"\\/ver_tarea\\/41"}', '2017-04-04 16:00:09', '2017-04-04 14:47:37', '2017-04-04 16:00:09'),
('6ca99981-06df-41f2-81da-f992149b82f0', 'App\\Notifications\\TareaProgramada', 21, 'App\\User', '{"id_tarea":39,"nombre":"Luisa Fernanda","cargo":"Encargada de Desarrollo","descripcion":"Luisa Fernanda ha programado la Tarea: Ajuste de tipografia en el banner","created_at":"2017-04-03 17:24:59","img_perfil":"\\/images\\/avatars\\/LuisaFernanda_6.png","link":"\\/ver_tarea\\/39"}', '2017-04-03 22:25:27', '2017-04-03 22:24:59', '2017-04-03 22:25:27'),
('6cb9102b-839a-49e5-abfc-c6b35287f453', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":58,"nombre":" Maria Andrea","cargo":"New Bussines","descripcion":" Maria Andrea cre\\u00f3 la Tarea: An\\u00e1lisis y Definici\\u00f3n de Key Words","created_at":"2017-04-04 11:45:47","img_perfil":null,"link":"\\/ver_tarea\\/58"}', NULL, '2017-04-04 16:45:47', '2017-04-04 16:45:47'),
('6de58dc9-974a-416d-a5c2-bed12202bf9f', 'App\\Notifications\\OtCreada', 1, 'App\\User', '{"id_tarea":14,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  ha creado una OT con referencia: 1102-1, nombre : Fee Acompa\\u00f1amiento de Agencia y valor: $14,750,000","created_at":"2017-04-03 15:08:17","img_perfil":null,"link":"\\/ots\\/visualizar\\/14"}', '2017-04-03 22:38:13', '2017-04-03 20:08:17', '2017-04-03 22:38:13'),
('6f3f9a4c-54ef-4fa6-962e-0f874ae6a1e5', 'App\\Notifications\\TareaProgramada', 5, 'App\\User', '{"id_tarea":25,"nombre":"Nestor","cargo":"SEM Performance Manager","descripcion":"Nestor ha programado la Tarea: Capacitaci\\u00f3n Directivos de Comfandi","created_at":"2017-04-03 15:57:51","img_perfil":null,"link":"\\/ver_tarea\\/25"}', '2017-04-03 21:06:13', '2017-04-03 20:57:51', '2017-04-03 21:06:13'),
('73244c81-9500-4f52-89f9-b7030dd64488', 'App\\Notifications\\TareaRealizada', 9, 'App\\User', '{"id_tarea":50,"nombre":"Alejandro","cargo":"Practicante en Dise\\u00f1o Gr\\u00e1fico","descripcion":"Alejandro ha realizado la Tarea: \\"Ent\\u00e9rate Nueva ubicaci\\u00f3n Agencia Empleo\\" en 0.5 Hrs","created_at":"2017-04-04 18:11:12","img_perfil":null,"link":"\\/ver_tarea\\/50"}', '2017-04-05 12:38:33', '2017-04-04 23:11:12', '2017-04-05 12:38:33'),
('75fac132-30c4-4e1e-9f22-a41d5cdd5ac4', 'App\\Notifications\\TareaRealizada', 7, 'App\\User', '{"id_tarea":34,"nombre":"Leonardo","cargo":"Lider de Contenido Escrito","descripcion":"Leonardo ha realizado la Tarea: \\"Pieza Mocoa - Harinera\\" en 0.50 Hrs","created_at":"2017-04-04 11:03:05","img_perfil":"\\/images\\/avatars\\/Leonardo_7.png","link":"\\/ver_tarea\\/34"}', '2017-04-04 19:59:15', '2017-04-04 16:03:05', '2017-04-04 19:59:15'),
('784bd719-b25c-4e6f-b674-12aa0be4db80', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":46,"nombre":"Andrea","cargo":"Ejecutiva de Cuentas","descripcion":"Andrea cre\\u00f3 la Tarea: Detener pauta Formulario Hero bono $700.000","created_at":"2017-04-03 17:12:21","img_perfil":null,"link":"\\/ver_tarea\\/46"}', NULL, '2017-04-03 22:12:21', '2017-04-03 22:12:21'),
('78ad69e0-c2f5-4187-ad1c-28efd3d2fd2c', 'App\\Notifications\\ComentarioNuevoTarea', 5, 'App\\User', '{"id_tarea":6,"nombre":"Silvia","cargo":"Ejecutiva de cuentas","descripcion":"Silvia ha comentado en la Tarea: Pauta Descuento Droguer\\u00edas - Pieza HOY 10% de descuento \\"Inverisi\\u00f3n Net...\\"","created_at":"2017-03-31 21:21:59","img_perfil":null,"link":"\\/ver_tarea\\/6"}', '2017-04-03 19:13:25', '2017-04-01 02:21:59', '2017-04-03 19:13:25'),
('78b10b6a-c6b4-44e0-9ce1-2424d301ad61', 'App\\Notifications\\OtCreada', 1, 'App\\User', '{"id_tarea":15,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  ha creado una OT con referencia: 1102-2, nombre : Fee Vallempresa365 y valor: $9,450,000","created_at":"2017-04-03 15:12:14","img_perfil":null,"link":"\\/ots\\/visualizar\\/15"}', '2017-04-03 22:38:13', '2017-04-03 20:12:14', '2017-04-03 22:38:13'),
('7a11e259-1590-47c3-8942-3f600ef5b3b4', 'App\\Notifications\\OtTiempoExtraAprobado', 11, 'App\\User', '{"id_tarea":9,"nombre":"Maria Isabel","cargo":"Proyect Owner","descripcion":"Maria Isabel ha editado su Orden de trabajo con la referencia #1126 con el nombre Fee Mensual Abril ","created_at":"2017-04-03 13:29:42","img_perfil":null,"link":"\\/ots\\/visualizar\\/9"}', '2017-04-03 19:03:12', '2017-04-03 18:29:42', '2017-04-03 19:03:12'),
('7bc5a733-e99e-400e-95f9-cb76a34b6a86', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":15,"nombre":"Silvia","cargo":"Ejecutiva de cuentas","descripcion":"Silvia cre\\u00f3 la Tarea: Pauta Descuento Droguer\\u00edas - Pieza HOY 10% de descuento","created_at":"2017-03-31 21:49:54","img_perfil":null,"link":"\\/ver_tarea\\/15"}', '2017-04-03 19:13:25', '2017-04-01 02:49:54', '2017-04-03 19:13:25'),
('7bd1b5c4-cc8a-4803-9340-20dd3f554f4d', 'App\\Notifications\\OtCreada', 1, 'App\\User', '{"id_tarea":8,"nombre":" Maria Andrea","cargo":"New Bussines","descripcion":" Maria Andrea ha creado una OT con referencia: 1106, nombre : Fee de SEO mes de Abril y valor: $1,290,000","created_at":"2017-04-03 12:09:52","img_perfil":null,"link":"\\/ots\\/visualizar\\/8"}', '2017-04-03 18:17:03', '2017-04-03 17:09:52', '2017-04-03 18:17:03'),
('7c75705b-7cb6-48b8-b109-c066abba8c51', 'App\\Notifications\\ComentarioNuevoTarea', 9, 'App\\User', '{"id_tarea":35,"nombre":"Zuly","cargo":"Dise\\u00f1adora Gr\\u00e1fica","descripcion":"Zuly ha comentado en la Tarea: Dise\\u00f1o pieza mocoa Harinera del Valle  \\"Esta pieza se a...\\"","created_at":"2017-04-04 10:44:10","img_perfil":"\\/images\\/avatars\\/Zuly_23.png","link":"\\/ver_tarea\\/35"}', '2017-04-04 16:07:06', '2017-04-04 15:44:10', '2017-04-04 16:07:06'),
('7ff969a2-5d17-4c53-8e35-51bda88b3b60', 'App\\Notifications\\OtCreada', 1, 'App\\User', '{"id_tarea":2,"nombre":"Silvia","cargo":"Ejecutiva de cuentas","descripcion":"Silvia ha creado una OT con referencia: 1096, nombre : Pauta Escuelas Deportiva Tennis deCampo y valor: $400,000","created_at":"2017-03-31 20:39:29","img_perfil":null,"link":"\\/ots\\/visualizar\\/2"}', '2017-04-02 08:08:00', '2017-04-01 01:39:29', '2017-04-02 08:08:00'),
('823696c6-bd74-4e26-9913-ba509429346c', 'App\\Notifications\\TareaCreada', 6, 'App\\User', '{"id_tarea":55,"nombre":" Maria Andrea","cargo":"New Bussines","descripcion":" Maria Andrea cre\\u00f3 la Tarea: Revisi\\u00f3n de chat en l\\u00ednea","created_at":"2017-04-04 11:33:35","img_perfil":null,"link":"\\/ver_tarea\\/55"}', '2017-04-04 19:35:06', '2017-04-04 16:33:35', '2017-04-04 19:35:06'),
('82e5d1ed-7f4e-4e96-a2a1-9ad733aca04b', 'App\\Notifications\\TareaCreada', 9, 'App\\User', '{"id_tarea":35,"nombre":"Nathalia","cargo":"Account Executive","descripcion":"Nathalia cre\\u00f3 la Tarea: Dise\\u00f1o pieza mocoa Harinera del Valle ","created_at":"2017-04-03 16:00:52","img_perfil":null,"link":"\\/ver_tarea\\/35"}', '2017-04-03 21:13:42', '2017-04-03 21:00:52', '2017-04-03 21:13:42'),
('85115d29-d107-4e86-8c95-24a436a18694', 'App\\Notifications\\TareaRealizada', 6, 'App\\User', '{"id_tarea":39,"nombre":"Brian","cargo":"Desarrollador","descripcion":"Brian ha realizado la Tarea: \\"Ajuste de tipografia en el banner\\" en 0.5 Hrs","created_at":"2017-04-04 08:59:11","img_perfil":"\\/images\\/avatars\\/Brian_21.png","link":"\\/ver_tarea\\/39"}', '2017-04-04 16:00:09', '2017-04-04 13:59:11', '2017-04-04 16:00:09'),
('8a3a405a-c94e-4790-b48e-b1e2cf5b1ade', 'App\\Notifications\\OtCreada', 1, 'App\\User', '{"id_tarea":1,"nombre":"Maria Isabel","cargo":"Proyect Owner","descripcion":"Maria Isabel ha creado una OT con referencia: 1093, nombre : Pauta Descuentos Droguerias y valor: $510,000","created_at":"2017-03-31 19:46:54","img_perfil":null,"link":"\\/ots\\/visualizar\\/1"}', '2017-04-02 08:08:00', '2017-04-01 00:46:54', '2017-04-02 08:08:00'),
('8cb3cce8-e7be-437d-a42f-7753e924e057', 'App\\Notifications\\TareaProgramada', 9, 'App\\User', '{"id_tarea":33,"nombre":"Andres Fabian","cargo":"Encargado de Dise\\u00f1o","descripcion":"Andres Fabian ha programado la Tarea: Dise\\u00f1o de Home para tres l\\u00edneas de producto","created_at":"2017-04-04 11:11:42","img_perfil":"\\/images\\/avatars\\/AndresFabian_9.png","link":"\\/ver_tarea\\/33"}', '2017-04-04 16:29:39', '2017-04-04 16:11:42', '2017-04-04 16:29:39'),
('8d01c6aa-3200-4e6b-89c5-6ef2f4b51133', 'App\\Notifications\\TareaCreada', 4, 'App\\User', '{"id_tarea":43,"nombre":"Jose","cargo":"Director Creativo","descripcion":"Jose cre\\u00f3 la Tarea: Creaci\\u00f3n temas art\\u00edculos Manitoba","created_at":"2017-04-03 16:49:21","img_perfil":"\\/images\\/avatars\\/Jose_4.png","link":"\\/ver_tarea\\/43"}', '2017-04-03 22:10:29', '2017-04-03 21:49:21', '2017-04-03 22:10:29'),
('940adc12-9eb8-4255-a491-19cb13d640cf', 'App\\Notifications\\TareaCreada', 7, 'App\\User', '{"id_tarea":30,"nombre":"Andrea","cargo":"Ejecutiva de Cuentas","descripcion":"Andrea cre\\u00f3 la Tarea: Art\\u00edculo blog ProgreSER Semana Santa ","created_at":"2017-04-03 13:39:54","img_perfil":null,"link":"\\/ver_tarea\\/30"}', '2017-04-03 19:04:20', '2017-04-03 18:39:54', '2017-04-03 19:04:20'),
('942bdde2-f071-4645-aeea-2cc9abea2253', 'App\\Notifications\\TareaCreada', 9, 'App\\User', '{"id_tarea":57,"nombre":" Maria Andrea","cargo":"New Bussines","descripcion":" Maria Andrea cre\\u00f3 la Tarea: Dise\\u00f1o Responsive","created_at":"2017-04-04 11:41:31","img_perfil":null,"link":"\\/ver_tarea\\/57"}', '2017-04-04 16:42:42', '2017-04-04 16:41:31', '2017-04-04 16:42:42'),
('9438763d-39b0-4660-a289-936d4bbd5f55', 'App\\Notifications\\TareaProgramada', 21, 'App\\User', '{"id_tarea":38,"nombre":"Luisa Fernanda","cargo":"Encargada de Desarrollo","descripcion":"Luisa Fernanda ha programado la Tarea: Ajuste bot\\u00f3n de Proveedores","created_at":"2017-04-03 17:23:08","img_perfil":"\\/images\\/avatars\\/LuisaFernanda_6.png","link":"\\/ver_tarea\\/38"}', '2017-04-03 22:23:18', '2017-04-03 22:23:08', '2017-04-03 22:23:18'),
('9634bcdf-7c8f-4313-af22-6e58df8d0f78', 'App\\Notifications\\OtTiempoExtraAprobado', 3, 'App\\User', '{"id_tarea":20,"nombre":"Desarrollo","cargo":"Tester","descripcion":"Desarrollo ha editado su Orden de trabajo con la referencia #970 con el nombre Implementaci\\u00f3n nuevo sitio web ","created_at":"2017-04-04 16:46:28","img_perfil":null,"link":"\\/ots\\/visualizar\\/20"}', NULL, '2017-04-04 21:46:28', '2017-04-04 21:46:28'),
('976018ba-88d6-425e-99ef-9639b3bfb17f', 'App\\Notifications\\TareaCreada', 9, 'App\\User', '{"id_tarea":62,"nombre":" Maria Andrea","cargo":"New Bussines","descripcion":" Maria Andrea cre\\u00f3 la Tarea: Dise\\u00f1o de P\\u00e1ginas Internas","created_at":"2017-04-04 14:02:24","img_perfil":null,"link":"\\/ver_tarea\\/62"}', '2017-04-04 19:03:56', '2017-04-04 19:02:24', '2017-04-04 19:03:56'),
('98436eeb-ed6e-4172-a1f0-61d25a6b3112', 'App\\Notifications\\TareaProgramada', 23, 'App\\User', '{"id_tarea":56,"nombre":"Andres Fabian","cargo":"Encargado de Dise\\u00f1o","descripcion":"Andres Fabian ha programado la Tarea: Cambio de fotos Harinera del Valle parrilla ","created_at":"2017-04-04 11:42:36","img_perfil":"\\/images\\/avatars\\/AndresFabian_9.png","link":"\\/ver_tarea\\/56"}', '2017-04-04 16:42:41', '2017-04-04 16:42:36', '2017-04-04 16:42:41'),
('9868d64b-ad3f-4790-b352-13df09b1ff30', 'App\\Notifications\\TareaCreada', 7, 'App\\User', '{"id_tarea":31,"nombre":"Andrea","cargo":"Ejecutiva de Cuentas","descripcion":"Andrea cre\\u00f3 la Tarea: Notas app ProgreSER","created_at":"2017-04-03 13:41:51","img_perfil":null,"link":"\\/ver_tarea\\/31"}', '2017-04-03 19:04:20', '2017-04-03 18:41:51', '2017-04-03 19:04:20'),
('9a844b05-cf92-45de-8a90-6fec25049280', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":17,"nombre":"Maria Isabel","cargo":"Proyect Owner","descripcion":"Maria Isabel cre\\u00f3 la Tarea: Pauta concierto de la cuna a la jungla - Buenaventura","created_at":"2017-03-31 21:51:06","img_perfil":null,"link":"\\/ver_tarea\\/17"}', '2017-04-03 19:13:25', '2017-04-01 02:51:06', '2017-04-03 19:13:25'),
('9af26b40-c45f-4e41-bb69-532e6391bf25', 'App\\Notifications\\TareaAtencionArea', 7, 'App\\User', '{"id_tarea":44,"nombre":"Alexandra","cargo":"Practicante en Contenidos - CM","descripcion":"Alexandra ha devuelto la Tarea: \\"Cambio en la promoci\\u00f3n de ProgreSER y Hero \\" a Atenci\\u00f3n \\u00c1rea","created_at":"2017-04-04 14:56:16","img_perfil":null,"link":"\\/ver_tarea\\/44"}', '2017-04-04 19:59:15', '2017-04-04 19:56:16', '2017-04-04 19:59:15'),
('9be5ab57-42a5-4f3c-a968-47eb80f25f30', 'App\\Notifications\\OtCreada', 1, 'App\\User', '{"id_tarea":23,"nombre":"Nathalia","cargo":"Account Executive","descripcion":"Nathalia ha creado una OT con referencia: 1108-2, nombre : Fee de Administraci\\u00f3n Sitio Web y valor: $704,000","created_at":"2017-04-03 15:41:24","img_perfil":null,"link":"\\/ots\\/visualizar\\/23"}', '2017-04-03 22:38:13', '2017-04-03 20:41:24', '2017-04-03 22:38:13'),
('9dfecd65-ce0f-4e32-b205-87e8504b2039', 'App\\Notifications\\TareaProgramada', 24, 'App\\User', '{"id_tarea":42,"nombre":"Andres Fabian","cargo":"Encargado de Dise\\u00f1o","descripcion":"Andres Fabian ha programado la Tarea: Ajuste en copy piezas promoci\\u00f3n Hero ","created_at":"2017-04-03 17:08:08","img_perfil":null,"link":"\\/ver_tarea\\/42"}', '2017-04-03 22:31:36', '2017-04-03 22:08:08', '2017-04-03 22:31:36'),
('9e484f7d-5b16-451f-90f2-be2768db87c0', 'App\\Notifications\\TareaEntregada', 22, 'App\\User', '{"id_tarea":35,"nombre":"Andres Fabian","cargo":"Encargado de Dise\\u00f1o","descripcion":"Andres Fabian entreg\\u00f3 la Tarea: Dise\\u00f1o pieza mocoa Harinera del Valle  y actualiz\\u00f3 el estado a Entregado","created_at":"2017-04-04 11:18:50","img_perfil":"\\/images\\/avatars\\/AndresFabian_9.png","link":"\\/ver_tarea\\/35"}', NULL, '2017-04-04 16:18:50', '2017-04-04 16:18:50'),
('9eb9f1f1-35a6-48ce-852f-a4e07be61afa', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":13,"nombre":"Maria Isabel","cargo":"Proyect Owner","descripcion":"Maria Isabel cre\\u00f3 la Tarea: Pauta concierto de la cuna a la jungla - Tulu\\u00e1","created_at":"2017-03-31 21:46:28","img_perfil":null,"link":"\\/ver_tarea\\/13"}', '2017-04-03 19:13:25', '2017-04-01 02:46:28', '2017-04-03 19:13:25'),
('9edb254f-753e-48eb-8f29-c6d5ae7141cd', 'App\\Notifications\\ComentarioNuevoTarea', 9, 'App\\User', '{"id_tarea":42,"nombre":"Andrea","cargo":"Ejecutiva de Cuentas","descripcion":"Andrea ha comentado en la Tarea: Ajuste en copy piezas promoci\\u00f3n Hero  \\"Tambi\\u00e9n se deb...\\"","created_at":"2017-04-03 17:04:19","img_perfil":null,"link":"\\/ver_tarea\\/42"}', '2017-04-03 22:25:36', '2017-04-03 22:04:19', '2017-04-03 22:25:36'),
('a06265a5-a6ac-48c5-8613-d66fc61d231f', 'App\\Notifications\\TareaCreada', 6, 'App\\User', '{"id_tarea":38,"nombre":"Nathalia","cargo":"Account Executive","descripcion":"Nathalia cre\\u00f3 la Tarea: Ajuste bot\\u00f3n de Proveedores","created_at":"2017-04-03 16:38:00","img_perfil":null,"link":"\\/ver_tarea\\/38"}', '2017-04-03 22:23:23', '2017-04-03 21:38:00', '2017-04-03 22:23:23'),
('a0b70e11-79ad-42b2-9b57-6e57d06f2d62', 'App\\Notifications\\TareaCreada', 6, 'App\\User', '{"id_tarea":39,"nombre":"Nathalia","cargo":"Account Executive","descripcion":"Nathalia cre\\u00f3 la Tarea: Ajuste de tipografia en el banner","created_at":"2017-04-03 16:40:36","img_perfil":null,"link":"\\/ver_tarea\\/39"}', '2017-04-03 22:23:23', '2017-04-03 21:40:36', '2017-04-03 22:23:23'),
('a176d148-6bf2-4146-8cf7-649f0767963b', 'App\\Notifications\\TareaProgramada', 9, 'App\\User', '{"id_tarea":45,"nombre":"Andres Fabian","cargo":"Encargado de Dise\\u00f1o","descripcion":"Andres Fabian ha programado la Tarea: Revisi\\u00f3n video 3 HV off line","created_at":"2017-04-03 17:25:09","img_perfil":null,"link":"\\/ver_tarea\\/45"}', '2017-04-03 22:25:36', '2017-04-03 22:25:09', '2017-04-03 22:25:36'),
('a1d6046d-f643-4ed5-8949-80d538b5ba81', 'App\\Notifications\\TareaCreada', 9, 'App\\User', '{"id_tarea":56,"nombre":"Andrea","cargo":"Ejecutiva de Cuentas","descripcion":"Andrea cre\\u00f3 la Tarea: Cambio de fotos Harinera del Valle parrilla ","created_at":"2017-04-04 11:38:30","img_perfil":null,"link":"\\/ver_tarea\\/56"}', '2017-04-04 16:42:42', '2017-04-04 16:38:30', '2017-04-04 16:42:42'),
('a45880c1-536a-4c6d-85af-e66cc58895bc', 'App\\Notifications\\TareaCreada', 6, 'App\\User', '{"id_tarea":32,"nombre":" Maria Andrea","cargo":"New Bussines","descripcion":" Maria Andrea cre\\u00f3 la Tarea: Renovaci\\u00f3n Hosting, SSL y Soporte al Host","created_at":"2017-04-03 14:22:11","img_perfil":null,"link":"\\/ver_tarea\\/32"}', '2017-04-03 22:23:23', '2017-04-03 19:22:11', '2017-04-03 22:23:23'),
('a537f788-9e36-48db-bb85-e40257c643b3', 'App\\Notifications\\TareaEntregada', 2, 'App\\User', '{"id_tarea":50,"nombre":"Andres Fabian","cargo":"Encargado de Dise\\u00f1o","descripcion":"Andres Fabian entreg\\u00f3 la Tarea: Ent\\u00e9rate Nueva ubicaci\\u00f3n Agencia Empleo y actualiz\\u00f3 el estado a Entregado","created_at":"2017-04-04 18:12:22","img_perfil":"\\/images\\/avatars\\/AndresFabian_9.png","link":"\\/ver_tarea\\/50"}', NULL, '2017-04-04 23:12:22', '2017-04-04 23:12:22'),
('a5812899-b3ac-43a7-b0b4-7e6ec108e742', 'App\\Notifications\\TareaAtencionCuentas', 10, 'App\\User', '{"id_tarea":11,"nombre":"Nestor","cargo":"SEM Performance Manager","descripcion":"Nestor ha devuelto la Tarea: \\"Pauta Descuento Droguer\\u00edas - Gif que Anuncie descuento este 15 de abril)\\" a Atenci\\u00f3n Cuentas","created_at":"2017-04-03 15:08:39","img_perfil":null,"link":"\\/ver_tarea\\/11"}', '2017-04-04 18:58:42', '2017-04-03 20:08:39', '2017-04-04 18:58:42'),
('a5a4c2a7-975b-4997-a154-ee289d3980fa', 'App\\Notifications\\TareaRealizada', 9, 'App\\User', '{"id_tarea":42,"nombre":"Christian","cargo":"Dise\\u00f1ador Gr\\u00e1fico","descripcion":"Christian ha realizado la Tarea: \\"Ajuste en copy piezas promoci\\u00f3n Hero \\" en 1 Hrs","created_at":"2017-04-04 10:16:09","img_perfil":"\\/images\\/avatars\\/Christian_24.png","link":"\\/ver_tarea\\/42"}', '2017-04-04 16:07:06', '2017-04-04 15:16:09', '2017-04-04 16:07:06'),
('a6b9fa56-a735-41ab-a438-069d61a01872', 'App\\Notifications\\TareaProgramada', 21, 'App\\User', '{"id_tarea":41,"nombre":"Luisa Fernanda","cargo":"Encargada de Desarrollo","descripcion":"Luisa Fernanda ha programado la Tarea: Revisi\\u00f3n imagen historia","created_at":"2017-04-03 17:28:32","img_perfil":"\\/images\\/avatars\\/LuisaFernanda_6.png","link":"\\/ver_tarea\\/41"}', '2017-04-03 22:28:41', '2017-04-03 22:28:32', '2017-04-03 22:28:41'),
('a7a07920-12fb-49d3-b211-2fa4be629c4b', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":14,"nombre":"Maria Isabel","cargo":"Proyect Owner","descripcion":"Maria Isabel cre\\u00f3 la Tarea: Pauta concierto de la cuna a la jungla - Cartago","created_at":"2017-03-31 21:48:12","img_perfil":null,"link":"\\/ver_tarea\\/14"}', '2017-04-03 19:13:25', '2017-04-01 02:48:12', '2017-04-03 19:13:25'),
('ab02d368-5826-4319-a3be-c7521c8a8157', 'App\\Notifications\\OtCreada', 1, 'App\\User', '{"id_tarea":26,"nombre":" Maria Andrea","cargo":"New Bussines","descripcion":" Maria Andrea ha creado una OT con referencia: 1089, nombre : Creaci\\u00f3n de contenidos para sitio web y valor: $3,980,000","created_at":"2017-04-03 15:57:48","img_perfil":null,"link":"\\/ots\\/visualizar\\/26"}', '2017-04-03 22:38:13', '2017-04-03 20:57:48', '2017-04-03 22:38:13'),
('adc1b7fe-90d2-4ef6-ba3e-fba679d04c54', 'App\\Notifications\\TareaProgramada', 7, 'App\\User', '{"id_tarea":29,"nombre":"Leonardo","cargo":"Lider de Contenido Escrito","descripcion":"Leonardo ha programado la Tarea: Cambiar nombre del seguro de ProgreSER","created_at":"2017-04-04 17:37:56","img_perfil":"\\/images\\/avatars\\/Leonardo_7.png","link":"\\/ver_tarea\\/29"}', NULL, '2017-04-04 22:37:56', '2017-04-04 22:37:56'),
('ae9ed953-3baa-4172-b832-66b62757a57f', 'App\\Notifications\\TareaProgramada', 16, 'App\\User', '{"id_tarea":44,"nombre":"Leonardo","cargo":"Lider de Contenido Escrito","descripcion":"Leonardo ha programado la Tarea: Cambio en la promoci\\u00f3n de ProgreSER y Hero ","created_at":"2017-04-04 14:33:30","img_perfil":"\\/images\\/avatars\\/Leonardo_7.png","link":"\\/ver_tarea\\/44"}', '2017-04-04 20:46:09', '2017-04-04 19:33:30', '2017-04-04 20:46:09'),
('b2b5ccc5-85f1-46a7-b254-0bfbc0a042b6', 'App\\Notifications\\TareaCreada', 9, 'App\\User', '{"id_tarea":42,"nombre":"Andrea","cargo":"Ejecutiva de Cuentas","descripcion":"Andrea cre\\u00f3 la Tarea: Ajuste en copy piezas promoci\\u00f3n Hero ","created_at":"2017-04-03 16:48:19","img_perfil":null,"link":"\\/ver_tarea\\/42"}', '2017-04-03 22:25:36', '2017-04-03 21:48:19', '2017-04-03 22:25:36'),
('b34e553a-b57a-474d-bfb2-a2af340a85d1', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":22,"nombre":"Silvia","cargo":"Ejecutiva de cuentas","descripcion":"Silvia cre\\u00f3 la Tarea: Pauta cursos Cali Abril - Excel avanzado, oficce b\\u00e1sico, tablas din\\u00e1micas","created_at":"2017-03-31 22:28:58","img_perfil":null,"link":"\\/ver_tarea\\/22"}', '2017-04-03 19:13:25', '2017-04-01 03:28:58', '2017-04-03 19:13:25'),
('b4f8e757-23ab-4379-9728-450034b3e810', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":25,"nombre":"Nestor","cargo":"SEM Performance Manager","descripcion":"Nestor cre\\u00f3 la Tarea: Capacitaci\\u00f3n Directivos de Comfandi","created_at":"2017-04-03 15:37:49","img_perfil":null,"link":"\\/ver_tarea\\/25"}', '2017-04-03 20:38:05', '2017-04-03 20:37:49', '2017-04-03 20:38:05'),
('b5e5c9de-8c41-42c3-aeb3-2e36bd55fe36', 'App\\Notifications\\OtTiempoExtraAprobado', 2, 'App\\User', '{"id_tarea":2,"nombre":"Maria Isabel","cargo":"Proyect Owner","descripcion":"Maria Isabel ha editado su Orden de trabajo con la referencia #1096 con el nombre Pauta Escuelas Deportiva Tennis deCampo ","created_at":"2017-03-31 21:19:06","img_perfil":null,"link":"\\/ots\\/visualizar\\/2"}', '2017-04-03 21:58:16', '2017-04-01 02:19:06', '2017-04-03 21:58:16'),
('b6efb95e-4fe5-40c8-baf4-71c1c1e141ae', 'App\\Notifications\\TareaCreada', 4, 'App\\User', '{"id_tarea":36,"nombre":" Maria Andrea","cargo":"New Bussines","descripcion":" Maria Andrea cre\\u00f3 la Tarea: Creaci\\u00f3n Contenidos Productos, Tips y Recetas","created_at":"2017-04-03 16:13:59","img_perfil":null,"link":"\\/ver_tarea\\/36"}', '2017-04-03 21:14:12', '2017-04-03 21:13:59', '2017-04-03 21:14:12'),
('b711d6fd-48c9-4792-8647-9206c718d9de', 'App\\Notifications\\TareaProgramada', 16, 'App\\User', '{"id_tarea":44,"nombre":"Leonardo","cargo":"Lider de Contenido Escrito","descripcion":"Leonardo ha programado la Tarea: Cambio en la promoci\\u00f3n de ProgreSER y Hero ","created_at":"2017-04-04 15:32:06","img_perfil":"\\/images\\/avatars\\/Leonardo_7.png","link":"\\/ver_tarea\\/44"}', '2017-04-04 20:46:09', '2017-04-04 20:32:06', '2017-04-04 20:46:09'),
('b8992539-80c1-4590-a8a8-8900a71b68b5', 'App\\Notifications\\TareaProgramada', 23, 'App\\User', '{"id_tarea":35,"nombre":"Andres Fabian","cargo":"Encargado de Dise\\u00f1o","descripcion":"Andres Fabian ha programado la Tarea: Dise\\u00f1o pieza mocoa Harinera del Valle ","created_at":"2017-04-04 10:48:05","img_perfil":null,"link":"\\/ver_tarea\\/35"}', '2017-04-04 16:03:35', '2017-04-04 15:48:05', '2017-04-04 16:03:35');
INSERT INTO `notifications` (`id`, `type`, `notifiable_id`, `notifiable_type`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('ba7caf10-c103-4cfb-8dd3-505b98e10934', 'App\\Notifications\\TareaRealizada', 6, 'App\\User', '{"id_tarea":40,"nombre":"Brian","cargo":"Desarrollador","descripcion":"Brian ha realizado la Tarea: \\"Informe de soporte mes de marzo de sitio web\\" en 5 Hrs","created_at":"2017-04-04 16:49:22","img_perfil":"\\/images\\/avatars\\/Brian_21.png","link":"\\/ver_tarea\\/40"}', '2017-04-04 22:41:37', '2017-04-04 21:49:22', '2017-04-04 22:41:37'),
('bad39ef7-baa9-4ca6-9dc9-010b271ca579', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":16,"nombre":"Silvia","cargo":"Ejecutiva de cuentas","descripcion":"Silvia cre\\u00f3 la Tarea: Informe Resultados Pauta descuentos Droguer\\u00ecas","created_at":"2017-03-31 21:50:50","img_perfil":null,"link":"\\/ver_tarea\\/16"}', '2017-04-03 19:13:25', '2017-04-01 02:50:50', '2017-04-03 19:13:25'),
('bb3d2707-5dea-4919-ab51-c791c68d336a', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":5,"nombre":"Andrea","cargo":"Ejecutiva de Cuentas","descripcion":"Andrea cre\\u00f3 la Tarea: Pauta concierto de la cuna a la jungla - Cali","created_at":"2017-03-31 21:05:54","img_perfil":null,"link":"\\/ver_tarea\\/5"}', '2017-04-03 19:13:25', '2017-04-01 02:05:54', '2017-04-03 19:13:25'),
('bbaaa6c4-de99-459c-ad53-a5493f48df00', 'App\\Notifications\\TareaProgramada', 5, 'App\\User', '{"id_tarea":25,"nombre":"Nestor","cargo":"SEM Performance Manager","descripcion":"Nestor ha programado la Tarea: Capacitaci\\u00f3n Directivos de Comfandi","created_at":"2017-04-03 15:52:58","img_perfil":null,"link":"\\/ver_tarea\\/25"}', '2017-04-03 20:54:51', '2017-04-03 20:52:58', '2017-04-03 20:54:51'),
('c020e2e6-f8f1-49c4-8216-455ba57634ac', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":8,"nombre":"Silvia","cargo":"Ejecutiva de cuentas","descripcion":"Silvia cre\\u00f3 la Tarea: Pauta Descuento Droguer\\u00edas - Pieza HOY 10% de descuento","created_at":"2017-03-31 21:27:52","img_perfil":null,"link":"\\/ver_tarea\\/8"}', '2017-04-03 19:13:25', '2017-04-01 02:27:52', '2017-04-03 19:13:25'),
('c2d30fca-36f6-4c56-9009-d559d862e26f', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":27,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  cre\\u00f3 la Tarea: Informe Mensual SEO Abril","created_at":"2017-04-03 16:59:31","img_perfil":null,"link":"\\/ver_tarea\\/27"}', NULL, '2017-04-03 21:59:31', '2017-04-03 21:59:31'),
('c3109b96-c0e4-42a1-9947-e5fae5cd950a', 'App\\Notifications\\TareaProgramada', 16, 'App\\User', '{"id_tarea":31,"nombre":"Leonardo","cargo":"Lider de Contenido Escrito","descripcion":"Leonardo ha programado la Tarea: Notas app ProgreSER","created_at":"2017-04-03 15:42:25","img_perfil":"\\/images\\/avatars\\/Leonardo_7.png","link":"\\/ver_tarea\\/31"}', '2017-04-04 20:46:09', '2017-04-03 20:42:25', '2017-04-04 20:46:09'),
('c3dac0c6-dd90-4ad4-9c2a-223e69e54e95', 'App\\Notifications\\TareaProgramada', 16, 'App\\User', '{"id_tarea":49,"nombre":"Leonardo","cargo":"Lider de Contenido Escrito","descripcion":"Leonardo ha programado la Tarea: Ajuste de noticia Wapp","created_at":"2017-04-04 14:38:11","img_perfil":"\\/images\\/avatars\\/Leonardo_7.png","link":"\\/ver_tarea\\/49"}', '2017-04-04 20:46:09', '2017-04-04 19:38:11', '2017-04-04 20:46:09'),
('c419607f-7085-4883-bc2c-04001f98a280', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":3,"nombre":"Silvia","cargo":"Ejecutiva de cuentas","descripcion":"Silvia cre\\u00f3 la Tarea: Pauta Tennis de campo","created_at":"2017-03-31 20:54:38","img_perfil":null,"link":"\\/ver_tarea\\/3"}', '2017-04-03 19:13:25', '2017-04-01 01:54:38', '2017-04-03 19:13:25'),
('c483aaf4-7997-4957-b0d9-22ded9c5410f', 'App\\Notifications\\TareaEntregada', 22, 'App\\User', '{"id_tarea":45,"nombre":"Andres Fabian","cargo":"Encargado de Dise\\u00f1o","descripcion":"Andres Fabian entreg\\u00f3 la Tarea: Revisi\\u00f3n video 3 HV off line y actualiz\\u00f3 el estado a Entregado","created_at":"2017-04-04 17:59:18","img_perfil":"\\/images\\/avatars\\/AndresFabian_9.png","link":"\\/ver_tarea\\/45"}', NULL, '2017-04-04 22:59:18', '2017-04-04 22:59:18'),
('c541000f-8356-4852-b405-495ab6162a5d', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":6,"nombre":"Silvia","cargo":"Ejecutiva de cuentas","descripcion":"Silvia cre\\u00f3 la Tarea: Pauta Descuento Droguer\\u00edas - Pieza HOY 10% de descuento","created_at":"2017-03-31 21:12:33","img_perfil":null,"link":"\\/ver_tarea\\/6"}', '2017-04-03 19:13:25', '2017-04-01 02:12:33', '2017-04-03 19:13:25'),
('c65c9e76-e09b-4088-838c-fbadbc4c7d16', 'App\\Notifications\\TareaCreada', 4, 'App\\User', '{"id_tarea":61,"nombre":"Jose","cargo":"Director Creativo","descripcion":"Jose cre\\u00f3 la Tarea: Reuni\\u00f3n de tr\\u00e1fico","created_at":"2017-04-04 13:31:55","img_perfil":"\\/images\\/avatars\\/Jose_4.png","link":"\\/ver_tarea\\/61"}', '2017-04-04 18:32:01', '2017-04-04 18:31:55', '2017-04-04 18:32:01'),
('c6cc20ea-55c8-4b8d-bd04-3f5df858a17b', 'App\\Notifications\\TareaCreada', 9, 'App\\User', '{"id_tarea":52,"nombre":" Maria Andrea","cargo":"New Bussines","descripcion":" Maria Andrea cre\\u00f3 la Tarea: Dise\\u00f1o de p\\u00e1ginas internas","created_at":"2017-04-04 10:14:41","img_perfil":null,"link":"\\/ver_tarea\\/52"}', '2017-04-04 16:07:06', '2017-04-04 15:14:41', '2017-04-04 16:07:06'),
('c8d9db13-a2f2-4f1e-a44c-da221a8c3e30', 'App\\Notifications\\TareaAtencionCuentas', 3, 'App\\User', '{"id_tarea":55,"nombre":"Luisa Fernanda","cargo":"Development  Leader","descripcion":"Luisa Fernanda ha devuelto la Tarea: \\"Revisi\\u00f3n de chat en l\\u00ednea\\" a Atenci\\u00f3n Cuentas","created_at":"2017-04-04 14:36:46","img_perfil":"\\/images\\/avatars\\/LuisaFernanda_6.png","link":"\\/ver_tarea\\/55"}', NULL, '2017-04-04 19:36:46', '2017-04-04 19:36:46'),
('cb8c6c0c-7a1b-4e4a-a6a1-6aaa6c70bf92', 'App\\Notifications\\TareaRealizada', 9, 'App\\User', '{"id_tarea":56,"nombre":"Zuly","cargo":"Dise\\u00f1adora Gr\\u00e1fica","descripcion":"Zuly ha realizado la Tarea: \\"Cambio de fotos Harinera del Valle parrilla \\" en 0.5 Hrs","created_at":"2017-04-04 11:57:00","img_perfil":"\\/images\\/avatars\\/Zuly_23.png","link":"\\/ver_tarea\\/56"}', '2017-04-04 19:03:56', '2017-04-04 16:57:00', '2017-04-04 19:03:56'),
('cd2b77a5-d4c3-4c3a-8cac-11b74f9e6621', 'App\\Notifications\\TareaCreada', 6, 'App\\User', '{"id_tarea":68,"nombre":" Maria Andrea","cargo":"New Bussines","descripcion":" Maria Andrea cre\\u00f3 la Tarea: Carga de interactivo 360","created_at":"2017-04-05 08:19:33","img_perfil":null,"link":"\\/ver_tarea\\/68"}', NULL, '2017-04-05 13:19:33', '2017-04-05 13:19:33'),
('cda8b97a-5913-4204-8473-6edf6d824474', 'App\\Notifications\\TareaEntregada', 22, 'App\\User', '{"id_tarea":41,"nombre":"Luisa Fernanda","cargo":"Development  Leader","descripcion":"Luisa Fernanda entreg\\u00f3 la Tarea: Revisi\\u00f3n imagen historia y actualiz\\u00f3 el estado a Entregado","created_at":"2017-04-04 17:40:30","img_perfil":"\\/images\\/avatars\\/LuisaFernanda_6.png","link":"\\/ver_tarea\\/41"}', NULL, '2017-04-04 22:40:30', '2017-04-04 22:40:30'),
('d05ef573-6dd8-4857-9a10-e9ca17314150', 'App\\Notifications\\TareaProgramada', 25, 'App\\User', '{"id_tarea":50,"nombre":"Andres Fabian","cargo":"Encargado de Dise\\u00f1o","descripcion":"Andres Fabian ha programado la Tarea: Ent\\u00e9rate Nueva ubicaci\\u00f3n Agencia Empleo","created_at":"2017-04-04 11:31:00","img_perfil":"\\/images\\/avatars\\/AndresFabian_9.png","link":"\\/ver_tarea\\/50"}', NULL, '2017-04-04 16:31:00', '2017-04-04 16:31:00'),
('d17ed0b7-6876-4cc4-b027-ce6234a21c3e', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":7,"nombre":"Silvia","cargo":"Ejecutiva de cuentas","descripcion":"Silvia cre\\u00f3 la Tarea: Pauta Descuento Droguer\\u00edas - Gif que Anuncie descuento 15 de abril","created_at":"2017-03-31 21:25:38","img_perfil":null,"link":"\\/ver_tarea\\/7"}', '2017-04-03 19:13:25', '2017-04-01 02:25:38', '2017-04-03 19:13:25'),
('d1964a7b-945e-46d7-81c5-851a75888765', 'App\\Notifications\\TareaEntregada', 2, 'App\\User', '{"id_tarea":37,"nombre":"Andres Fabian","cargo":"Encargado de Dise\\u00f1o","descripcion":"Andres Fabian entreg\\u00f3 la Tarea: Graficar Vacantes y convocatorias Agencias Empleo y actualiz\\u00f3 el estado a Entregado","created_at":"2017-04-03 17:58:23","img_perfil":null,"link":"\\/ver_tarea\\/37"}', '2017-04-04 16:03:04', '2017-04-03 22:58:23', '2017-04-04 16:03:04'),
('d32d82df-70f9-4ed8-a9f1-5ab37e99845a', 'App\\Notifications\\OtCreada', 1, 'App\\User', '{"id_tarea":25,"nombre":"Nathalia","cargo":"Account Executive","descripcion":"Nathalia ha creado una OT con referencia: 1108-4, nombre : Soporte Sitio Web y valor: $300,000","created_at":"2017-04-03 15:48:41","img_perfil":null,"link":"\\/ots\\/visualizar\\/25"}', '2017-04-03 22:38:13', '2017-04-03 20:48:41', '2017-04-03 22:38:13'),
('d6f8c963-b77d-4d9d-b122-3bdaff2e25dd', 'App\\Notifications\\TareaRealizada', 6, 'App\\User', '{"id_tarea":38,"nombre":"Brian","cargo":"Desarrollador","descripcion":"Brian ha realizado la Tarea: \\"Ajuste bot\\u00f3n de Proveedores\\" en 0.4 Hrs","created_at":"2017-04-04 08:31:11","img_perfil":"\\/images\\/avatars\\/Brian_21.png","link":"\\/ver_tarea\\/38"}', '2017-04-04 16:00:09', '2017-04-04 13:31:11', '2017-04-04 16:00:09'),
('ddfe9e0e-b77e-4e93-b41d-27bc670c860f', 'App\\Notifications\\TareaCreada', 7, 'App\\User', '{"id_tarea":49,"nombre":"Andrea","cargo":"Ejecutiva de Cuentas","descripcion":"Andrea cre\\u00f3 la Tarea: Ajuste de noticia Wapp","created_at":"2017-04-03 18:34:23","img_perfil":null,"link":"\\/ver_tarea\\/49"}', '2017-04-04 19:59:15', '2017-04-03 23:34:23', '2017-04-04 19:59:15'),
('de684fce-83c1-46ee-a5d1-79b9ab20212b', 'App\\Notifications\\OtCreada', 1, 'App\\User', '{"id_tarea":29,"nombre":"Andrea","cargo":"Ejecutiva de Cuentas","descripcion":"Andrea ha creado una OT con referencia: 1111, nombre : Renovaci\\u00f3n espacio Hosting  y valor: $180,000","created_at":"2017-04-04 18:21:52","img_perfil":null,"link":"\\/ots\\/visualizar\\/29"}', NULL, '2017-04-04 23:21:52', '2017-04-04 23:21:52'),
('de78c210-7c1d-404d-9113-dd99d8bcc058', 'App\\Notifications\\TareaCreada', 9, 'App\\User', '{"id_tarea":64,"nombre":"Andrea","cargo":"Ejecutiva de Cuentas","descripcion":"Andrea cre\\u00f3 la Tarea: Dise\\u00f1o de la parrilla ProgreSER ","created_at":"2017-04-04 14:52:18","img_perfil":null,"link":"\\/ver_tarea\\/64"}', '2017-04-05 12:38:33', '2017-04-04 19:52:18', '2017-04-05 12:38:33'),
('df970412-bbec-43a5-81c3-9a72f289714a', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":12,"nombre":"Maria Isabel","cargo":"Proyect Owner","descripcion":"Maria Isabel cre\\u00f3 la Tarea: Pauta concierto de la cuna a la jungla - Buga","created_at":"2017-03-31 21:38:59","img_perfil":null,"link":"\\/ver_tarea\\/12"}', '2017-04-03 19:13:25', '2017-04-01 02:38:59', '2017-04-03 19:13:25'),
('e17f06ae-ff85-4c7e-815e-92396cb9285b', 'App\\Notifications\\ComentarioNuevoTarea', 24, 'App\\User', '{"id_tarea":42,"nombre":"Andres Fabian","cargo":"Encargado de Dise\\u00f1o","descripcion":"Andres Fabian ha comentado en la Tarea: Ajuste en copy piezas promoci\\u00f3n Hero  \\"Ya quedo realiz...\\"","created_at":"2017-04-04 11:27:47","img_perfil":"\\/images\\/avatars\\/AndresFabian_9.png","link":"\\/ver_tarea\\/42"}', NULL, '2017-04-04 16:27:47', '2017-04-04 16:27:47'),
('e1a1eb18-54c8-43ee-9292-6dc25f6008c2', 'App\\Notifications\\OtCreada', 1, 'App\\User', '{"id_tarea":28,"nombre":" Maria Andrea","cargo":"New Bussines","descripcion":" Maria Andrea ha creado una OT con referencia: 1011, nombre : Implementaci\\u00f3n nuevo sitio web y valor: $14,960,000","created_at":"2017-04-04 12:42:27","img_perfil":null,"link":"\\/ots\\/visualizar\\/28"}', '2017-04-04 21:14:04', '2017-04-04 17:42:27', '2017-04-04 21:14:04'),
('e4a5cd77-df9e-43a3-b6a5-8c16ec00ef4d', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":19,"nombre":"Silvia","cargo":"Ejecutiva de cuentas","descripcion":"Silvia cre\\u00f3 la Tarea: Pauta cursos Cali Abril Automaquillaje","created_at":"2017-03-31 22:23:46","img_perfil":null,"link":"\\/ver_tarea\\/19"}', '2017-04-03 19:13:25', '2017-04-01 03:23:46', '2017-04-03 19:13:25'),
('e64bab56-03a2-4d52-9eea-845f40111f64', 'App\\Notifications\\TareaCreada', 9, 'App\\User', '{"id_tarea":45,"nombre":"Nathalia","cargo":"Account Executive","descripcion":"Nathalia cre\\u00f3 la Tarea: Revisi\\u00f3n video 3 HV off line","created_at":"2017-04-03 17:04:22","img_perfil":null,"link":"\\/ver_tarea\\/45"}', '2017-04-03 22:25:36', '2017-04-03 22:04:22', '2017-04-03 22:25:36'),
('e6b2f7a3-28a7-4eb0-89b5-dd588ed85310', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":10,"nombre":"Silvia","cargo":"Ejecutiva de cuentas","descripcion":"Silvia cre\\u00f3 la Tarea: Pauta Descuento Droguer\\u00edas - Pieza HOY 10% de descuento","created_at":"2017-03-31 21:31:20","img_perfil":null,"link":"\\/ver_tarea\\/10"}', '2017-04-03 19:13:25', '2017-04-01 02:31:20', '2017-04-03 19:13:25'),
('e7a1724e-70b5-4617-ad48-68ee7a2a1987', 'App\\Notifications\\TareaEntregada', 11, 'App\\User', '{"id_tarea":56,"nombre":"Andres Fabian","cargo":"Encargado de Dise\\u00f1o","descripcion":"Andres Fabian entreg\\u00f3 la Tarea: Cambio de fotos Harinera del Valle parrilla  y actualiz\\u00f3 el estado a Entregado","created_at":"2017-04-04 18:03:47","img_perfil":"\\/images\\/avatars\\/AndresFabian_9.png","link":"\\/ver_tarea\\/56"}', NULL, '2017-04-04 23:03:47', '2017-04-04 23:03:47'),
('e8ac054c-f862-4ffc-b6b3-893827423864', 'App\\Notifications\\TareaEntregada', 22, 'App\\User', '{"id_tarea":39,"nombre":"Luisa Fernanda","cargo":"Development  Leader","descripcion":"Luisa Fernanda entreg\\u00f3 la Tarea: Ajuste de tipografia en el banner y actualiz\\u00f3 el estado a Entregado","created_at":"2017-04-04 17:40:59","img_perfil":"\\/images\\/avatars\\/LuisaFernanda_6.png","link":"\\/ver_tarea\\/39"}', NULL, '2017-04-04 22:40:59', '2017-04-04 22:40:59'),
('eab7233a-40dd-4579-9041-ff8879dc7cef', 'App\\Notifications\\OtCreada', 1, 'App\\User', '{"id_tarea":9,"nombre":"Andrea","cargo":"Ejecutiva de Cuentas","descripcion":"Andrea ha creado una OT con referencia: 1126, nombre : Fee Mensual Abril y valor: $10,060,848","created_at":"2017-04-03 13:27:44","img_perfil":null,"link":"\\/ots\\/visualizar\\/9"}', '2017-04-03 22:38:13', '2017-04-03 18:27:44', '2017-04-03 22:38:13'),
('ebc0e9bb-6ded-40ab-9164-226f622c82a1', 'App\\Notifications\\OtCreada', 1, 'App\\User', '{"id_tarea":22,"nombre":"Nathalia","cargo":"Account Executive","descripcion":"Nathalia ha creado una OT con referencia: 1108-1, nombre : Fee de Acompa\\u00f1amiento y administraci\\u00f3n en Redes Sociales y valor: $2,207,663","created_at":"2017-04-03 15:36:18","img_perfil":null,"link":"\\/ots\\/visualizar\\/22"}', '2017-04-03 22:38:13', '2017-04-03 20:36:18', '2017-04-03 22:38:13'),
('ef52d4fb-2c22-4e02-8488-9582699f5b6e', 'App\\Notifications\\TareaEntregada', 11, 'App\\User', '{"id_tarea":42,"nombre":"Andres Fabian","cargo":"Encargado de Dise\\u00f1o","descripcion":"Andres Fabian entreg\\u00f3 la Tarea: Ajuste en copy piezas promoci\\u00f3n Hero  y actualiz\\u00f3 el estado a Entregado","created_at":"2017-04-04 11:27:55","img_perfil":"\\/images\\/avatars\\/AndresFabian_9.png","link":"\\/ver_tarea\\/42"}', '2017-04-04 22:08:02', '2017-04-04 16:27:55', '2017-04-04 22:08:02'),
('f28396dc-c213-45b7-9df3-cdf00e643ea7', 'App\\Notifications\\TareaCreada', 4, 'App\\User', '{"id_tarea":66,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  cre\\u00f3 la Tarea: Realizar Flow Pauta Primero de Mayo","created_at":"2017-04-04 17:24:25","img_perfil":null,"link":"\\/ver_tarea\\/66"}', '2017-04-05 11:32:44', '2017-04-04 22:24:25', '2017-04-05 11:32:44'),
('f51f79e7-8895-4f3e-91c0-e6074e54834d', 'App\\Notifications\\OtCreada', 1, 'App\\User', '{"id_tarea":21,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  ha creado una OT con referencia: 1102-3, nombre : Fee Comfandi Centro de Empleo y valor: $4,400,000","created_at":"2017-04-03 15:17:10","img_perfil":null,"link":"\\/ots\\/visualizar\\/21"}', '2017-04-03 22:38:13', '2017-04-03 20:17:10', '2017-04-03 22:38:13'),
('f662b3ff-1a15-412d-96a4-dd1044c53dde', 'App\\Notifications\\TareaEntregada', 22, 'App\\User', '{"id_tarea":40,"nombre":"Luisa Fernanda","cargo":"Development  Leader","descripcion":"Luisa Fernanda entreg\\u00f3 la Tarea: Informe de soporte mes de marzo de sitio web y actualiz\\u00f3 el estado a Entregado","created_at":"2017-04-04 18:04:53","img_perfil":"\\/images\\/avatars\\/LuisaFernanda_6.png","link":"\\/ver_tarea\\/40"}', NULL, '2017-04-04 23:04:53', '2017-04-04 23:04:53'),
('f82e995d-c1e1-4258-8d99-6d61c8305d4e', 'App\\Notifications\\TareaProgramada', 4, 'App\\User', '{"id_tarea":43,"nombre":"Jose","cargo":"Director Creativo","descripcion":"Jose ha programado la Tarea: Creaci\\u00f3n temas art\\u00edculos Manitoba","created_at":"2017-04-03 16:50:50","img_perfil":"\\/images\\/avatars\\/Jose_4.png","link":"\\/ver_tarea\\/43"}', '2017-04-03 22:10:29', '2017-04-03 21:50:50', '2017-04-03 22:10:29'),
('f87733c3-e61d-4996-a212-cc3b428a0fef', 'App\\Notifications\\TareaRealizada', 4, 'App\\User', '{"id_tarea":43,"nombre":"Jose","cargo":"Director Creativo","descripcion":"Jose ha realizado la Tarea: \\"Creaci\\u00f3n temas art\\u00edculos Manitoba\\" en 0.5 Hrs","created_at":"2017-04-03 17:09:35","img_perfil":"\\/images\\/avatars\\/Jose_4.png","link":"\\/ver_tarea\\/43"}', '2017-04-03 22:10:29', '2017-04-03 22:09:35', '2017-04-03 22:10:29'),
('f9a3edd4-d2aa-4d1a-8674-a0fbb6a0c8b5', 'App\\Notifications\\OtCreada', 1, 'App\\User', '{"id_tarea":3,"nombre":"Andrea","cargo":"Ejecutiva de Cuentas","descripcion":"Andrea ha creado una OT con referencia: 1095, nombre : Pauta Concierto de la Cuna a la Jungla y valor: $500,000","created_at":"2017-03-31 21:01:04","img_perfil":null,"link":"\\/ots\\/visualizar\\/3"}', '2017-04-02 08:08:00', '2017-04-01 02:01:04', '2017-04-02 08:08:00'),
('f9a6fa40-ebb7-4932-9080-9be4528a84cf', 'App\\Notifications\\TareaProgramada', 21, 'App\\User', '{"id_tarea":40,"nombre":"Luisa Fernanda","cargo":"Encargada de Desarrollo","descripcion":"Luisa Fernanda ha programado la Tarea: Informe de soporte mes de marzo de sitio web","created_at":"2017-04-03 17:27:27","img_perfil":"\\/images\\/avatars\\/LuisaFernanda_6.png","link":"\\/ver_tarea\\/40"}', '2017-04-03 22:28:41', '2017-04-03 22:27:27', '2017-04-03 22:28:41'),
('fab29141-74c9-41cf-84fc-7de978e1dd6f', 'App\\Notifications\\TareaCreada', 7, 'App\\User', '{"id_tarea":44,"nombre":"Andrea","cargo":"Ejecutiva de Cuentas","descripcion":"Andrea cre\\u00f3 la Tarea: Cambio en la promoci\\u00f3n de ProgreSER y Hero ","created_at":"2017-04-03 16:53:02","img_perfil":null,"link":"\\/ver_tarea\\/44"}', '2017-04-04 19:59:15', '2017-04-03 21:53:02', '2017-04-04 19:59:15'),
('fb733e02-2d14-4dfb-8929-b97e6348490d', 'App\\Notifications\\TareaCreada', 9, 'App\\User', '{"id_tarea":65,"nombre":"Andrea","cargo":"Ejecutiva de Cuentas","descripcion":"Andrea cre\\u00f3 la Tarea: Gr\\u00e1ficos 3 HV","created_at":"2017-04-04 17:15:51","img_perfil":null,"link":"\\/ver_tarea\\/65"}', '2017-04-05 12:38:33', '2017-04-04 22:15:51', '2017-04-05 12:38:33'),
('fd041193-eed4-4938-bb3d-6b207183a19e', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":4,"nombre":"Silvia","cargo":"Ejecutiva de cuentas","descripcion":"Silvia cre\\u00f3 la Tarea: Pauta Descuento Droguer\\u00edas - Gif d\\u00edas de descuento por iniciar mes ","created_at":"2017-03-31 21:05:52","img_perfil":null,"link":"\\/ver_tarea\\/4"}', '2017-04-03 19:13:25', '2017-04-01 02:05:52', '2017-04-03 19:13:25'),
('fda0826b-6a8c-4a38-97b6-9cee3cdd41ad', 'App\\Notifications\\TareaCreada', 9, 'App\\User', '{"id_tarea":50,"nombre":"Marcela ","cargo":"Ejecutiva de cuenta","descripcion":"Marcela  cre\\u00f3 la Tarea: Ent\\u00e9rate Nueva ubicaci\\u00f3n Agencia Empleo","created_at":"2017-04-04 09:08:32","img_perfil":null,"link":"\\/ver_tarea\\/50"}', '2017-04-04 16:07:06', '2017-04-04 14:08:32', '2017-04-04 16:07:06'),
('fea21f1f-f479-4903-9b8d-6b6393841791', 'App\\Notifications\\TareaCreada', 9, 'App\\User', '{"id_tarea":33,"nombre":" Maria Andrea","cargo":"New Bussines","descripcion":" Maria Andrea cre\\u00f3 la Tarea: Dise\\u00f1o de Home para tres l\\u00edneas de producto","created_at":"2017-04-03 15:40:13","img_perfil":null,"link":"\\/ver_tarea\\/33"}', '2017-04-03 21:13:42', '2017-04-03 20:40:13', '2017-04-03 21:13:42');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=30 ;

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
(14, 'Fee Acompañamiento de Agencia', '1102-1', '14750000', 1, '680.00', '0.00', '0.00', '', '2017-04-03 00:00:00', '2017-04-29 00:00:00', 1, 5, 2, 8, '2017-04-03 20:08:17', '2017-04-03 20:08:17'),
(15, 'Fee Vallempresa365', '1102-2', '9,450,000', 1, '160.00', '0.00', '0.00', '', '2017-04-03 00:00:00', '2017-04-29 00:00:00', 1, 10, 2, 8, '2017-04-03 20:12:14', '2017-04-03 21:30:49'),
(20, 'Implementación nuevo sitio web', '970', '17,950,000', 0, '268.50', '62.00', '0.00', 'Este proyecto arrancó el 23 de Enero de 2017 con esa fecha está relacionada la OT física con el mismo identificador. ', '2017-04-03 00:00:00', '2017-06-13 00:00:00', 1, 6, 3, 8, '2017-04-03 20:16:26', '2017-04-04 21:46:28'),
(21, 'Fee Comfandi Centro de Empleo', '1102-3', '4400000', 1, '160.00', '0.00', '0.00', '', '2017-04-03 00:00:00', '2017-05-05 00:00:00', 1, 11, 2, 8, '2017-04-03 20:17:10', '2017-04-03 20:17:10'),
(22, 'Fee de Acompañamiento y administración en Redes Sociales', '1108-1', '2207663', 1, '52.00', '1.00', '0.00', '', '2017-04-03 00:00:00', '2017-05-05 00:00:00', 1, 12, 22, 8, '2017-04-03 20:36:18', '2017-04-03 20:36:18'),
(23, 'Fee de Administración Sitio Web', '1108-2', '704000', 1, '8.00', '0.00', '0.00', '', '2017-04-03 00:00:00', '2017-05-05 00:00:00', 1, 12, 22, 8, '2017-04-03 20:41:24', '2017-04-03 20:41:24'),
(24, 'Fee SEO Sitio Web', '1108-3', '788377', 1, '11.00', '0.00', '0.00', '', '2017-04-03 00:00:00', '2017-05-05 00:00:00', 1, 12, 22, 8, '2017-04-03 20:44:32', '2017-04-03 20:44:32'),
(25, 'Soporte Sitio Web', '1108-4', '300000', 1, '4.00', '0.00', '0.00', '', '2017-04-03 00:00:00', '2017-05-05 00:00:00', 1, 12, 22, 8, '2017-04-03 20:48:40', '2017-04-03 20:59:12'),
(26, 'Creación de contenidos para sitio web', '1089', '3980000', 0, '82.00', '0.00', '0.00', 'La creación de contenidos para el nuevo sitio web de PLM se tercerizará pero el canal de comunicación será con José Díaz. ', '2017-04-03 00:00:00', '2017-05-05 00:00:00', 1, 6, 3, 8, '2017-04-03 20:57:48', '2017-04-03 20:57:48'),
(27, 'Renovación Hosting, Dominio y Soporte ', '1110', '1420000', 0, '13.00', '0.00', '0.00', '', '2017-04-04 00:00:00', '2018-04-04 00:00:00', 1, 13, 3, 8, '2017-04-04 13:40:24', '2017-04-04 13:40:24'),
(28, 'Implementación nuevo sitio web', '1011', '14960000', 0, '267.50', '0.50', '0.00', '', '2017-04-04 00:00:00', '2017-06-15 00:00:00', 1, 14, 3, 8, '2017-04-04 17:42:27', '2017-04-04 17:42:27'),
(29, 'Renovación espacio Hosting ', '1111', '180000', 0, '1.00', '0.00', '0.00', '', '2017-04-04 00:00:00', '2017-04-05 00:00:00', 1, 15, 11, 8, '2017-04-04 23:21:52', '2017-04-04 23:21:52');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=31 ;

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
(30, 'ver_permisos', 'Permisos', 'Puede ver y editar los permisos por rol', '2017-03-31 22:32:19', '2017-03-31 22:32:19');

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
(20, 3),
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=49 ;

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
(19, 'Soporte', 10, 0, '2017-04-03 19:18:29', '2017-04-03 19:18:29'),
(20, 'Diseño de Home', 11, 0, '2017-04-03 20:21:22', '2017-04-03 20:21:22'),
(21, 'Diseño internas', 11, 0, '2017-04-03 20:21:35', '2017-04-03 20:21:35'),
(22, 'Diseño responsive', 11, 0, '2017-04-03 20:21:49', '2017-04-03 20:21:49'),
(23, 'Diseño de Wiframes', 12, 0, '2017-04-03 20:24:25', '2017-04-03 20:24:25'),
(24, 'Diseño de parrilla', 13, 0, '2017-04-03 20:25:39', '2017-04-03 20:25:39'),
(25, 'Diseño Banners  Afiches y artes individuales', 13, 0, '2017-04-03 20:26:13', '2017-04-03 20:26:13'),
(26, 'Despiece de artes', 14, 0, '2017-04-03 20:28:00', '2017-04-03 20:28:00'),
(27, 'Maquetado home', 14, 0, '2017-04-03 20:28:21', '2017-04-03 20:28:21'),
(28, 'Maquetado interna - incluye sólo una', 14, 0, '2017-04-03 20:28:51', '2017-04-03 20:28:51'),
(29, 'Maquetado landing', 14, 0, '2017-04-03 20:29:06', '2017-04-03 20:29:06'),
(30, 'Diseño de piezas', 11, 0, '2017-04-03 21:15:02', '2017-04-03 21:15:02'),
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
(41, 'Ajustes de copy', 11, 0, '2017-04-03 22:23:05', '2017-04-03 22:23:05'),
(42, 'Conceptualización de parrila', 15, 0, '2017-04-03 22:24:31', '2017-04-03 22:24:31'),
(43, 'Ajuste pieza gráfica ', 11, 0, '2017-04-03 22:25:04', '2017-04-03 22:25:04'),
(44, 'Estrategia', 16, 0, '2017-04-04 02:24:56', '2017-04-04 02:24:56'),
(45, 'Idea y Concepto', 16, 0, '2017-04-04 02:25:58', '2017-04-04 02:25:58'),
(46, 'Diseño de Key Visual', 16, 0, '2017-04-04 02:26:38', '2017-04-04 02:26:38'),
(47, 'Definición de canales y contenidos', 16, 0, '2017-04-04 02:27:00', '2017-04-04 02:27:00'),
(48, 'Estrategia Creativa para Redes Sociales', 16, 0, '2017-04-04 02:28:16', '2017-04-04 02:28:16');

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=17 ;

--
-- Volcado de datos para la tabla `planeacion_tipos`
--

INSERT INTO `planeacion_tipos` (`id`, `nombre`, `descripcion`, `estado`, `created_at`, `updated_at`) VALUES
(1, 'Planeacion', NULL, 0, '2017-03-31 22:32:19', '2017-03-31 22:32:19'),
(2, 'Desarrollo', NULL, 0, '2017-03-31 22:32:19', '2017-03-31 22:32:19'),
(3, 'Calidad', NULL, 0, '2017-03-31 22:32:19', '2017-03-31 22:32:19'),
(4, 'Publicacion', NULL, 0, '2017-03-31 22:32:19', '2017-03-31 22:32:19'),
(5, 'Paid Media Display - Paid Media Facebook', NULL, 0, '2017-04-01 02:42:08', '2017-04-01 02:42:08'),
(6, 'Reuniones ', NULL, 0, '2017-04-03 20:30:47', '2017-04-03 20:30:47'),
(7, 'Cotización', NULL, 0, '2017-04-03 20:33:26', '2017-04-03 20:33:26'),
(8, 'SEO - Search Engine Optimization', NULL, 0, '2017-04-03 21:50:38', '2017-04-03 21:50:38'),
(9, 'Administración de contenidos web', NULL, 0, '2017-04-03 18:32:41', '2017-04-03 18:32:41'),
(10, 'Soporte', NULL, 0, '2017-04-03 19:16:26', '2017-04-03 19:16:26'),
(11, 'Diseño', NULL, 0, '2017-04-03 20:21:00', '2017-04-03 20:21:00'),
(12, 'Planeación estratégica', NULL, 0, '2017-04-03 20:24:01', '2017-04-03 20:24:01'),
(13, 'Diseño de piezas gráficas ', NULL, 0, '2017-04-03 20:25:17', '2017-04-03 20:25:17'),
(14, 'Maquetado', NULL, 0, '2017-04-03 20:27:44', '2017-04-03 20:27:44'),
(15, 'Contenido', NULL, 0, '2017-04-03 22:24:16', '2017-04-03 22:24:16'),
(16, 'Estrategia Creativa', NULL, 0, '2017-04-04 02:24:32', '2017-04-04 02:24:32');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=76 ;

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
(29, 'Acompañamiento Estratégico', '12.00', 1, 14, '2017-04-03 20:08:17', '2017-04-03 20:08:17'),
(30, 'Diseñador Gráfico Full time -In house', '160.00', 2, 14, '2017-04-03 20:08:17', '2017-04-03 20:08:17'),
(31, 'Diseñador Gráfico Medio Tiempo - In house', '80.00', 2, 14, '2017-04-03 20:08:17', '2017-04-03 20:08:17'),
(32, 'Desarrollo Activos Digitales', '48.00', 3, 14, '2017-04-03 20:08:17', '2017-04-03 20:08:17'),
(33, 'Content Manager Full Time In house', '160.00', 4, 14, '2017-04-03 20:08:17', '2017-04-03 20:08:17'),
(34, 'Community Manager Full time In house', '160.00', 4, 14, '2017-04-03 20:08:17', '2017-04-03 20:08:17'),
(35, 'Analista Campañas ', '44.00', 5, 14, '2017-04-03 20:08:17', '2017-04-03 20:08:17'),
(36, 'Acompañamiento al cliente Ejecutiva', '16.00', 6, 14, '2017-04-03 20:08:17', '2017-04-03 20:08:17'),
(37, 'Diseñador Medio Tiempo', '80.00', 2, 15, '2017-04-03 20:12:14', '2017-04-03 21:30:49'),
(38, 'Content Manager Vallempresa', '40.00', 4, 15, '2017-04-03 20:12:14', '2017-04-03 20:12:14'),
(45, 'Diseño de Sitio Web PLM', '55.00', 2, 20, '2017-04-03 20:16:26', '2017-04-04 21:46:28'),
(46, 'Diseño de Sitio Web PLM', '55.00', 3, 20, '2017-04-03 20:16:26', '2017-04-04 21:46:28'),
(47, 'Diseño de Sitio Web PLM', '55.00', 4, 20, '2017-04-03 20:16:26', '2017-04-04 21:46:28'),
(48, 'Diseño de Sitio Web PLM', '40.00', 5, 20, '2017-04-03 20:16:26', '2017-04-04 21:46:28'),
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
(71, 'Diseño de sitio web y edición de 100 imágenes', '82.50', 2, 28, '2017-04-04 17:42:27', '2017-04-04 17:42:27'),
(72, 'Desarrollo de sitio web', '118.00', 3, 28, '2017-04-04 17:42:27', '2017-04-04 17:42:27'),
(73, 'Carga de contenidos sitio web ', '33.00', 4, 28, '2017-04-04 17:42:27', '2017-04-04 17:42:27'),
(74, 'SEO inicial estándar', '33.00', 5, 28, '2017-04-04 17:42:27', '2017-04-04 17:42:27'),
(75, 'Compra espacio en Hosting ', '1.00', 3, 29, '2017-04-04 23:21:52', '2017-04-04 23:21:52');

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
  PRIMARY KEY (`id`),
  KEY `tareas_estados_id_foreign` (`estados_id`),
  KEY `tareas_usuarios_id_foreign` (`usuarios_id`),
  KEY `tareas_areas_id_foreign` (`areas_id`),
  KEY `tareas_planeacion_fases_id_foreign` (`planeacion_fases_id`),
  KEY `tareas_ots_id_foreign` (`ots_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=70 ;

--
-- Volcado de datos para la tabla `tareas`
--

INSERT INTO `tareas` (`id`, `nombre_tarea`, `fecha_entrega_area`, `fecha_entrega_cuentas`, `descripcion`, `enlaces_externos`, `tiempo_estimado`, `tiempo_real`, `tiempo_mapa_cliente`, `fecha_entrega_cliente`, `estados_id`, `areas_id`, `usuarios_id`, `ots_id`, `planeacion_fases_id`, `encargado_id`, `prioridad_id`, `estado_trafico_id`, `comentario_trafico`, `created_at`, `updated_at`) VALUES
(1, 'Pauta Descuento Droguerías - Gif días de descuento por iniciar mes ', NULL, NULL, 'Inverisión Neta: $70.000 el 31 de marzo', '', NULL, NULL, NULL, '2017-04-01 00:00:00', 7, 5, 1, 1, 1, 5, 11, NULL, NULL, '2017-04-01 00:52:49', '2017-04-01 00:52:49'),
(2, 'Pauta Tennis de campo', NULL, NULL, 'Inversión neta $280.000 del 3 al 17 de abril', '', NULL, NULL, '4.00', '2017-04-03 00:00:00', 7, 5, 2, 2, 4, 5, 11, NULL, NULL, '2017-04-01 01:51:06', '2017-04-01 01:51:06'),
(3, 'Pauta Tennis de campo', NULL, NULL, 'Inversión neta $280.000 del 3 al 17 de abril', NULL, NULL, NULL, '4.00', '2017-04-03 00:00:00', 7, 5, 2, 2, 4, 5, 11, NULL, NULL, '2017-04-01 01:54:38', '2017-04-01 01:54:38'),
(4, 'Pauta Descuento Droguerías - Gif días de descuento por iniciar mes ', NULL, NULL, 'Inverisión Neta: $70.000 el 31 de marzo', '', NULL, NULL, NULL, '2017-03-31 00:00:00', 7, 5, 2, 1, 4, 5, 11, NULL, NULL, '2017-04-01 02:05:52', '2017-04-01 02:05:52'),
(5, 'Pauta concierto de la cuna a la jungla - Cali', NULL, NULL, 'Inversión neta:$105.000  pauta del 12 al 29 de abril', '', NULL, NULL, NULL, '2017-04-12 00:00:00', 7, 5, 11, 3, 1, 5, 12, NULL, NULL, '2017-04-01 02:05:54', '2017-04-01 02:05:54'),
(6, 'Pauta Descuento Droguerías - Pieza HOY 10% de descuento', NULL, NULL, 'Pauta Descuento Droguerías - Pieza HOY 10% de descuento', '', NULL, NULL, NULL, '2017-03-31 00:00:00', 7, 5, 2, 1, 4, 5, 11, NULL, NULL, '2017-04-01 02:12:33', '2017-04-01 02:12:33'),
(7, 'Pauta Descuento Droguerías - Gif que Anuncie descuento 15 de abril', NULL, NULL, 'Inverisión Neta: $49.000 el 6 y 7 de abril', '', NULL, NULL, NULL, '2017-04-06 00:00:00', 7, 5, 2, 1, 4, 5, 11, NULL, NULL, '2017-04-01 02:25:38', '2017-04-01 02:25:38'),
(8, 'Pauta Descuento Droguerías - Pieza HOY 10% de descuento', NULL, NULL, 'Inverisión Neta: $35.000, pauta solo el 8 de abril', NULL, NULL, NULL, NULL, '2017-04-08 00:00:00', 7, 5, 2, 1, 4, 5, 11, NULL, NULL, '2017-04-01 02:27:52', '2017-04-01 02:27:52'),
(9, 'Pauta Descuento Droguerías - Gif que Anuncie descuento 15 de abril', NULL, NULL, 'Inversión Neta: $35.000, el 13 y 14 de abril. ', '', NULL, NULL, NULL, '2017-04-13 00:00:00', 7, 5, 2, 1, 4, 5, 12, NULL, NULL, '2017-04-01 02:30:14', '2017-04-01 02:30:14'),
(10, 'Pauta Descuento Droguerías - Pieza HOY 10% de descuento', NULL, NULL, 'Inverisión Neta: $35.000 para pauta solo el 15 de abril', NULL, NULL, NULL, NULL, '2017-04-15 00:00:00', 7, 5, 2, 1, 4, 5, 12, NULL, NULL, '2017-04-01 02:31:20', '2017-04-01 02:31:20'),
(11, 'Pauta Descuento Droguerías - Gif que Anuncie descuento este 15 de abril)', NULL, NULL, 'Inverisión Neta: $49.000 el 20 y 21 de abril', NULL, NULL, NULL, NULL, '2017-04-20 00:00:00', 5, 5, 2, 1, 4, 5, 12, NULL, NULL, '2017-04-01 02:32:19', '2017-04-04 21:25:12'),
(12, 'Pauta concierto de la cuna a la jungla - Buga', NULL, NULL, 'Inversión neta: $70.000  pauta del 12 al 29 de abril.', '', NULL, NULL, NULL, '2017-04-12 00:00:00', 7, 5, 1, 3, 4, 5, 13, NULL, NULL, '2017-04-01 02:38:59', '2017-04-01 02:38:59'),
(13, 'Pauta concierto de la cuna a la jungla - Tuluá', NULL, NULL, 'Inversión neta: $70.000  pauta del 12 al 29 de abril.', '', NULL, NULL, NULL, '2017-04-12 00:00:00', 7, 5, 1, 3, 5, 5, 13, NULL, NULL, '2017-04-01 02:46:27', '2017-04-01 02:46:27'),
(14, 'Pauta concierto de la cuna a la jungla - Cartago', NULL, NULL, 'Inversión neta: $70.000  pauta del 12 al 29 de abril', NULL, NULL, NULL, NULL, '2017-04-12 00:00:00', 7, 5, 1, 3, 5, 5, 12, NULL, NULL, '2017-04-01 02:48:12', '2017-04-01 02:48:12'),
(15, 'Pauta Descuento Droguerías - Pieza HOY 10% de descuento', NULL, NULL, 'Inverisión Neta: $35.000 para pauta solo el 22 de abril', NULL, NULL, NULL, NULL, '2017-04-22 00:00:00', 7, 5, 2, 1, 4, 5, 12, NULL, NULL, '2017-04-01 02:49:54', '2017-04-01 02:49:54'),
(16, 'Informe Resultados Pauta descuentos Droguerìas', NULL, NULL, 'Informe Resultados Pauta descuentos Droguerías', NULL, NULL, NULL, NULL, '2017-04-25 00:00:00', 7, 5, 2, 1, 4, 5, 12, NULL, NULL, '2017-04-01 02:50:50', '2017-04-01 02:50:50'),
(17, 'Pauta concierto de la cuna a la jungla - Buenaventura', NULL, NULL, 'Inversión neta:$35.000  pauta del 12 al 29 de abril', NULL, NULL, NULL, NULL, '2017-04-12 00:00:00', 7, 5, 1, 3, 5, 5, 12, NULL, NULL, '2017-04-01 02:51:06', '2017-04-01 02:51:06'),
(18, 'Pauta cursos Cali Abril - Preparación a base de cafe', NULL, NULL, 'Fecha de pauta:10 al 24 de abril\nInversión:$140.000 \nCiudad de pauta :  Cali\nPublico objetivos: mujeres y hombres jóvenes con niños entre 25 y 45 años.', '', NULL, NULL, NULL, '2017-04-10 00:00:00', 7, 5, 2, 4, 5, 5, 11, NULL, NULL, '2017-04-01 03:22:20', '2017-04-01 03:22:20'),
(19, 'Pauta cursos Cali Abril Automaquillaje', NULL, NULL, 'Fecha de pauta: 5 al 17 de abril\nInversión de pauta:$175.000', NULL, NULL, NULL, NULL, '2017-04-05 00:00:00', 7, 5, 2, 4, 5, 5, 11, NULL, NULL, '2017-04-01 03:23:46', '2017-04-01 03:23:46'),
(20, 'Pauta cursos Cali Abril Decoración y extensión de uñas', NULL, NULL, 'Fecha de pauta: 24 de abril  al 4 de mayo\nInversión de pauta:$175.000', NULL, NULL, NULL, NULL, '2017-04-24 00:00:00', 7, 5, 2, 4, 5, 5, 11, NULL, NULL, '2017-04-01 03:25:34', '2017-04-01 03:25:34'),
(21, 'Pauta cursos Cali Abril Decoración de fiestas temáticas', NULL, NULL, 'MB: Fecha de pauta:17 al 30 de abril\nInversión:189.000', NULL, NULL, NULL, NULL, '2017-04-17 00:00:00', 7, 5, 2, 4, 5, 5, 11, NULL, NULL, '2017-04-01 03:26:18', '2017-04-01 03:26:18'),
(22, 'Pauta cursos Cali Abril - Excel avanzado, oficce básico, tablas dinámicas', NULL, NULL, 'Fecha de pauta: 25 de abril a 6 de mayo\nInversión:$280.000', NULL, NULL, NULL, NULL, '2017-04-25 00:00:00', 7, 5, 2, 4, 5, 5, 12, NULL, NULL, '2017-04-01 03:28:57', '2017-04-01 03:28:57'),
(23, 'Pauta cursos Cali Abril - Secretariado sistematizado contable', NULL, NULL, 'Fecha de pauta: 1  al 21 de mayo \nInversión:$126.000', NULL, NULL, NULL, NULL, '2017-05-01 00:00:00', 7, 5, 2, 4, 5, 5, 12, NULL, NULL, '2017-04-01 03:30:01', '2017-04-01 03:30:01'),
(24, 'Pauta cursos Cali Abril - Cocina mexicana', NULL, NULL, 'Fecha de pauta:1 a 11 de mayo\nInversión: $210.000', NULL, NULL, NULL, NULL, '2017-05-01 00:00:00', 7, 5, 2, 4, 5, 5, 12, NULL, NULL, '2017-04-01 03:30:47', '2017-04-01 03:30:47'),
(25, 'Capacitación Directivos de Comfandi', '2017-04-04 00:00:00', '2017-04-04 00:00:00', 'Capacitación a directivos sobre posicionamiento de marca en medios digitales', '', '4.00', '28.00', '28.00', '2017-04-04 00:00:00', 1, 5, 5, 5, 6, 5, 11, NULL, NULL, '2017-04-03 20:37:47', '2017-04-03 21:00:16'),
(26, 'Implementar y optimizar seo Polylon', NULL, NULL, 'Implementar y optimizar seo al sitio web de polylon www.polylon.com', '', NULL, NULL, NULL, NULL, 7, 5, 2, 7, 13, 5, 12, NULL, NULL, '2017-04-03 21:53:10', '2017-04-03 21:53:10'),
(27, 'Informe Mensual SEO Abril', NULL, NULL, 'Realizar informe mensual del seo realizado para polylon. ', '', NULL, NULL, NULL, NULL, 7, 5, 2, 7, 14, 5, 12, NULL, NULL, '2017-04-03 21:59:31', '2017-04-03 21:59:31'),
(28, 'Implementación e  informe de SEO ', NULL, NULL, 'Implementación de estrategia SEO e informe del comportamiento del SEO para mes de Abril. ', '', NULL, NULL, '18.00', '2017-05-01 00:00:00', 7, 5, 3, 8, 13, 5, 12, NULL, NULL, '2017-04-03 17:19:21', '2017-04-03 17:19:21'),
(29, 'Cambiar nombre del seguro de ProgreSER', '2017-04-05 00:00:00', '2017-04-05 00:00:00', 'Cambiar nombre del seguro de ProgreSER por Seguro Todo Riesgo, en titular, texto e interna de preguntas frecuentes. ', '', '0.25', '0.25', NULL, '2017-04-05 00:00:00', 1, 4, 11, 9, 16, 7, 11, NULL, NULL, '2017-04-03 18:36:26', '2017-04-05 12:47:25'),
(30, 'Artículo blog ProgreSER Semana Santa ', '2017-04-05 00:00:00', '2017-04-06 00:00:00', 'Artículo para el blog de ProgreSER para publicar antes de semana santa, sobre una ruta en moto para esos días, invitando a los usuarios a disfrutar de la moto en esos días de descanso. Recordar las palabras clave: Crédito para motos\nFinanciación para motos\nSeguro para motos\nAseguradoras de motos\nMotos Honda\nMotos Hero\n\nSi tiene dudas sobre el SEO preguntar antes  al área de digital, ya que a partir de ahora ellos también van a revisar el contenido ', NULL, '4.00', NULL, NULL, '2017-04-06 00:00:00', 3, 4, 11, 9, 17, 16, 12, NULL, NULL, '2017-04-03 18:39:54', '2017-04-03 20:38:39'),
(31, 'Notas app ProgreSER', '2017-04-04 00:00:00', '2017-04-05 00:00:00', 'Redactar dos notas sobre educación financiera para la app. Deben ser consejos sobre educación financiera, no tan largos como los de la app. Siempre tener en cuenta que son consejos de Próspero y los amigos de Próspero.', '', '2.00', NULL, NULL, '2017-04-05 00:00:00', 3, 4, 11, 9, 17, 16, 12, NULL, NULL, '2017-04-03 18:41:51', '2017-04-03 20:42:25'),
(32, 'Renovación Hosting, SSL y Soporte al Host', NULL, NULL, 'Se debe realizar la renovación de espacio en Hosting para el sitio web de Constructora Meléndez por un año. Se debe comprar el Certificado de Seguridad SSL por un año. Este cliente contará con 20 horas de Soporte al Hosting. ', '', NULL, NULL, NULL, '2017-04-25 00:00:00', 7, 3, 3, 10, 18, 6, 12, NULL, NULL, '2017-04-03 19:22:11', '2017-04-03 19:22:11'),
(33, 'Diseño de Home para tres líneas de producto', '2017-04-07 00:00:00', '2017-04-07 00:00:00', 'Se debe realizar el diseño del Home para cada línea de producto-micrositio: Muñeca Tradicional, Muñeca Express y Muñeca Mini. Para esto basarse en la propuesta de Key Visual del pre-home aprobada por el cliente. Tener en cuenta el mapa de navegación final para incluirlo dentro del menú que tendría cada mundo. La estructura sería la misma, solo cambian colores e imágenes. ', 'https://drive.google.com/drive/folders/0B86D1VMd7k4gckRaTmRJWm9nbDg\n\nhttps://drive.google.com/drive/folders/0B86D1VMd7k4gb2pQY3RueEdIS1E', '12.00', NULL, '12.00', '2017-04-10 00:00:00', 3, 2, 3, 20, 20, 9, 11, NULL, NULL, '2017-04-03 20:40:13', '2017-04-04 16:11:42'),
(34, 'Pieza Mocoa - Harinera', '2017-04-05 00:00:00', '2017-04-05 00:00:00', 'Sería algo como estamos unidos de Harinera, y en texto de arriba del post la invitación a donar con el banco de alimento', '', '0.50', '0.50', '0.50', '2017-04-04 00:00:00', 1, 4, 22, 22, 4, 7, 11, NULL, NULL, '2017-04-03 20:55:01', '2017-04-05 12:47:07'),
(35, 'Diseño pieza mocoa Harinera del Valle ', '2017-04-05 00:00:00', '2017-04-05 00:00:00', 'Diseño deuna pieza sobre Mocoa  para Harinera del Valle. Se pone en espera hasta tener la conceptualización. ', '', '1.00', '1.00', '1.00', '2017-04-04 00:00:00', 20, 2, 22, 22, 4, 23, 11, NULL, NULL, '2017-04-03 21:00:52', '2017-04-04 16:18:50'),
(36, 'Creación Contenidos Productos, Tips y Recetas', '2017-04-07 00:00:00', '2017-04-10 00:00:00', 'Crear minitextos finales para los productos de las tres líneas (Muñeca Tradicional, Express y Mini), tener en cuenta comentarios del cliente: menos información funcional y más contenido emocional que evoque al antojo y a la ilusión. Realizar ajuste de estilo de 9 recetas, 3 por línea de producto. Redacción de 9 tips, 3 por cada línea de producto. \nNota: ir pensando en los temas que podríamos abordar para los 9 artículos del Blog, estudiar la competencia y ver cómo se está comportando la marca en cuanto a contenidos que realizan.  ', '\\\\SERVER\\Elementos_Compartidos2\\PASTAS LA MUÑECA/CONTENIDOS - BLOG MOMENTOS\n\n\\\\SERVER\\Elementos_Compartidos2\\PASTAS LA MUÑECA/CONTENIDOS - PRODUCTOS\n\n\\\\SERVER\\Elementos_Compartidos2\\PASTAS LA MUÑECA/PRESENTACIÓN PLM', '16.00', NULL, '97.00', '2017-04-10 00:00:00', 3, 1, 3, 26, 17, 4, 12, NULL, NULL, '2017-04-03 21:13:59', '2017-04-03 21:18:09'),
(37, 'Graficar Vacantes y convocatorias Agencias Empleo', '2017-04-04 00:00:00', '2017-04-04 00:00:00', 'Graficar  vacantes y convocatorias de empleo según la descripción realizada en el drive', 'https://docs.google.com/presentation/d/1Jg5kHK183PWqY-CrdJYB0puK7Qmv73UBXxj3MQ83xx4/edit?usp=sharing', '2.00', '1.00', NULL, '2017-04-04 00:00:00', 20, 2, 2, 15, 24, 23, 11, NULL, NULL, '2017-04-03 21:31:04', '2017-04-03 22:58:23'),
(38, 'Ajuste botón de Proveedores', '2017-04-04 00:00:00', '2017-04-05 00:00:00', 'En el home el botón de proveedores debe generar un link en una pestaña nueva! Target Blanc.', '', '0.50', '0.40', NULL, NULL, 20, 3, 22, 23, 39, 21, 11, NULL, NULL, '2017-04-03 21:37:59', '2017-04-04 22:41:18'),
(39, 'Ajuste de tipografia en el banner', '2017-04-04 00:00:00', '2017-04-05 00:00:00', 'Se debe realizar un ajuste en la tipografia del banner de esta interna de: http://www.harineradelvalle.com/es/nuestras-marcas.html \nla letra que se visualiza debe ser un poco más gruesa. No sé si este tipo de letra tenga una versión bold. ', NULL, '1.00', '0.50', NULL, NULL, 20, 3, 22, 23, 39, 21, 13, NULL, NULL, '2017-04-03 21:40:36', '2017-04-04 22:40:59'),
(40, 'Informe de soporte mes de marzo de sitio web', '2017-04-04 00:00:00', '2017-04-05 00:00:00', 'Se debe realizar el informe de soporte del mes de marzo correspondiente al comportamiento del sitio web. Por favor se debe revisar porque el sitio web no esta cargando debidamente cuando se digita www.hv.com.co sin embargo se sigue navegando después del inicio y la url cambia a harineradelvalle.com. Incluir estas recomendaciones en el informe y como podemos corregirlo.', NULL, '4.00', '5.00', NULL, NULL, 20, 3, 22, 25, 40, 21, 12, NULL, NULL, '2017-04-03 21:44:18', '2017-04-04 23:04:53'),
(41, 'Revisión imagen historia', '2017-04-04 00:00:00', '2017-04-05 00:00:00', 'En la línea de tiempo de la interna de historia, en el año 2014 se realizó el cambio de la imagen y no se esta visualizando en la web. Por favor revisar.', NULL, '0.50', '0.40', NULL, NULL, 20, 3, 22, 23, 39, 21, 12, NULL, NULL, '2017-04-03 21:46:18', '2017-04-04 22:40:30'),
(42, 'Ajuste en copy piezas promoción Hero ', '2017-04-04 00:00:00', '2017-04-04 00:00:00', 'Ajuste en el copy de estas piezas: el post redes, en el slide  de la web, noticia de la web y nota web.  En lugar $700.000 debe decir $500.000. ', '', '3.00', '1.00', '0.50', '2017-04-04 00:00:00', 20, 2, 11, 9, 30, 24, 11, NULL, NULL, '2017-04-03 21:48:19', '2017-04-04 16:27:55'),
(43, 'Creación temas artículos Manitoba', '2017-04-04 00:00:00', '2017-04-04 00:00:00', 'Esta tarea se realiza porque la persona que nos va a ayudar con los artículos, necesita que se le especifiquen los temas a trabajar.', '', '1.00', '0.50', NULL, NULL, 1, 1, 4, 5, 17, 4, 12, NULL, NULL, '2017-04-03 21:49:21', '2017-04-03 22:45:15'),
(44, 'Cambio en la promoción de ProgreSER y Hero ', '2017-04-05 00:00:00', '2017-04-05 00:00:00', 'Cambio en la promoción de Hero y ProgreSER, ya que el bono de $700.000 ya no aplica si no que es es de $500.000. Así que se debe cambiar en el texto de la noticia y nota, despublicar la información en la web e intranet, mientras se ajustan las piezas. ', '', '1.00', '1.00', '1.00', '2017-04-04 00:00:00', 1, 4, 11, 9, 4, 16, 11, NULL, NULL, '2017-04-03 21:53:02', '2017-04-05 12:47:44'),
(45, 'Revisión video 3 HV off line', '2017-04-05 00:00:00', '2017-04-06 00:00:00', 'Revisión video off line del video 3, revisar si se está de acuerdo con lo enviado por Rodolfo. si estan de acuerdo con lo propuesto por Rodolfo, la idea es que a partir de este salga la gráfica. Este video lo envió Natalia a Andrés por correo', '', '2.00', NULL, NULL, '2017-04-05 00:00:00', 20, 2, 22, 22, 16, 9, 11, NULL, NULL, '2017-04-03 22:04:22', '2017-04-04 22:59:18'),
(46, 'Detener pauta Formulario Hero bono $700.000', NULL, NULL, 'Detener pauta sobre el bono de $700.000 con Hero, ya que el bono cambio a $500.000 pesos y se vana ajustar las piezas. ', '', NULL, NULL, '0.50', '2017-04-03 00:00:00', 7, 5, 11, 9, 5, 5, 11, NULL, NULL, '2017-04-03 22:12:21', '2017-04-03 22:12:21'),
(47, 'Activar pauta formulario Hero ProgreSER', NULL, NULL, 'Duplicar pauta formulario Hero - ProgreSER con el nuevo bono de $500.000 una vez se tenga la pieza ajustada. ', '', NULL, NULL, '0.50', '2017-04-05 00:00:00', 6, 5, 11, 9, 5, 5, 11, NULL, NULL, '2017-04-03 22:15:13', '2017-04-03 22:15:13'),
(48, 'Creación de Artículos para Sección Blog Momentos', NULL, NULL, 'Luego de definir los temas para los artículos que irían dentro del Blog, se deben redactar 9 artículos (3 por cada línea de producto). Éstos deben ser artículos de máximo 500 palabras y deben reflejar el enfoque de cada línea de producto. ', '', NULL, NULL, '9.00', '2017-05-24 00:00:00', 7, 1, 3, 26, 17, 4, 12, NULL, NULL, '2017-04-03 22:43:19', '2017-04-03 22:43:19'),
(49, 'Ajuste de noticia Wapp', '2017-04-05 00:00:00', '2017-04-05 00:00:00', 'Ajustar noticia sobre la herramienta de la app, no es una herramienta para cliente sino para la fuerza comercial, en play store leer la descripción: https://play.google.com/store/apps/details?id=com.progreser.waapprogreser&hl=es. En la ruta estás las piezas para subir la noticia una vez ajustada a la web e intranet. ', '\\\\SERVER\\Elementos_Compartidos2\\ProgreSER\\Wapp ProgreSER\\piezas', '0.50', NULL, '0.50', '2017-04-05 00:00:00', 3, 4, 11, 9, 16, 16, 11, NULL, NULL, '2017-04-03 23:34:23', '2017-04-04 19:38:10'),
(50, 'Entérate Nueva ubicación Agencia Empleo', '2017-04-05 00:00:00', '2017-04-05 00:00:00', ' solicitan pieza entérate para informar nueva ubicación de la Agencia Comfandi en Jamundí. Indicaciones en el PPT\n', 'https://docs.google.com/presentation/d/1euXKrInkRPSp1j_kNqkONSU2UwKa5XYC_VyMRGK-j3M/edit?usp=sharing', '1.00', '0.50', NULL, NULL, 20, 2, 2, 21, 30, 25, 12, NULL, NULL, '2017-04-04 14:08:32', '2017-04-04 23:12:22'),
(51, 'Renovación de Hosting y Dominio 2017', NULL, NULL, 'Realizar la renovación del Hosting y Dominio del sitio web de SIDOC por un año, este cliente cuenta con 12 horas de soporte al año. ', '', NULL, NULL, NULL, NULL, 7, 3, 3, 27, 18, 6, 11, NULL, NULL, '2017-04-04 14:21:10', '2017-04-04 14:21:10'),
(52, 'Diseño de páginas internas', NULL, NULL, 'Realizar propuesta de diseño para las siguientes páginas internas del sitio web de PLM: \n1) Productos: interna general e interna de sub-categoría. \n2) Novedades: tipo blog, listado de ítems y detalle de ítems con imágenes. Basarse en Wireframes. \n3) Blog - Momentos \n4) Actividades \n5) Contáctanos\nTener en cuenta el Look and Feel aprobado por el cliente. ', 'https://docs.google.com/spreadsheets/d/1x9siw6pllwsjME5CNomaKb-uJEu_w3Vccw0CxjqE67U/edit#gid=556845817\n\nhttps://drive.google.com/drive/folders/0B86D1VMd7k4gckRaTmRJWm9nbDg\n\n\\\\SERVER\\Elementos_Compartidos2\\PASTAS LA MUÑECA/CONTENIDOS - BLOG MOMENTOS\n\n\\\\SERVER\\Elementos_Compartidos2\\PASTAS LA MUÑECA/CONTENIDOS - PRODUCTOS\n', NULL, NULL, '22.00', '2017-04-19 00:00:00', 7, 2, 3, 20, 21, 9, 12, NULL, NULL, '2017-04-04 15:14:41', '2017-04-04 15:14:41'),
(53, 'Diseño Mailing Abril conferencia empresarial regionales', '2017-04-06 00:00:00', '2017-04-07 00:00:00', 'Diseñar mailing para promocionar conferencia empresarial organizada en convenio con Cámara de Comercio Palmira para darse en regionales. \n info e indicaciones en el PPT.', 'https://docs.google.com/presentation/d/1Bhimhpw7hUUTTrtGAtwzSg5I7cMmvP5bqW4SU2BO5_Y/edit?usp=sharing', '8.00', NULL, NULL, NULL, 3, 2, 2, 21, 30, 25, 12, NULL, NULL, '2017-04-04 16:10:10', '2017-04-04 16:22:28'),
(54, 'Adaptación del diseño del Home para 2 líneas de producto', NULL, NULL, 'Adaptar el diseño del Home de Muñeca Tradicional para el Home de Muñeca Express y Muñeca Mini. ', '', NULL, NULL, '8.00', '2017-04-10 00:00:00', 7, 2, 3, 20, 20, 9, 11, NULL, NULL, '2017-04-04 16:29:31', '2017-04-04 16:29:31'),
(55, 'Revisión de chat en línea', NULL, NULL, 'Cliente solicita que se revise el Chat en Línea del E-Commerce de Kassis que actualmente se encuentra deshabilitado. ', '', NULL, NULL, NULL, NULL, 4, 3, 3, 6, 19, 3, 11, NULL, NULL, '2017-04-04 16:33:35', '2017-04-04 19:36:46'),
(56, 'Cambio de fotos Harinera del Valle parrilla ', '2017-04-05 00:00:00', '2017-04-05 00:00:00', 'Cambio de fotos en la parrilla en harinera del Valle.\n\nhttps://we.tl/3jfghwrfWO. \n', '', '1.00', '0.50', NULL, '2017-04-04 00:00:00', 20, 2, 11, 22, 43, 23, 11, NULL, NULL, '2017-04-04 16:38:30', '2017-04-04 23:03:47'),
(57, 'Diseño Responsive', NULL, NULL, 'Se realiza el diseño responsive para las interfaces que se consideren necesarias. ', '', NULL, NULL, '14.00', '2017-04-27 00:00:00', 7, 2, 3, 20, 22, 9, 12, NULL, NULL, '2017-04-04 16:41:31', '2017-04-04 16:41:31'),
(58, 'Análisis y Definición de Key Words', NULL, NULL, 'Análisis inicial para el SEO del sitio web. \nDefinición de Key Words para optimización del sitio web. \nNota: Tener en cuenta que HDA está construyendo los contenidos para el sitio web. La primera entrega de éstos es el 10 de Abril y la segunda entrega el 24 de Abril. ', '', NULL, NULL, '8.00', '2017-04-28 00:00:00', 7, 5, 3, 20, 31, 5, 12, NULL, NULL, '2017-04-04 16:45:46', '2017-04-04 16:45:46'),
(59, 'Desarrollo y maquetado del 50% del sitio en WordPress', NULL, NULL, 'Realizar el desarrollo y maquetado en Wordpress para el 50% del sitio web: \nDiseño debe hacer entrega del despiece al área de Desarrollo. \nInstalación y configuración del CMS Wordpress versión estable. \nCreación contenido administrable, menú, creación de categorías e ítems. \nSe debe maquetar el Home principal y el Home de las tres Líneas de Producto.  \n', '', NULL, NULL, '60.00', '2017-05-10 00:00:00', 7, 3, 3, 20, 2, 6, 12, NULL, NULL, '2017-04-04 16:52:59', '2017-04-04 16:52:59'),
(60, 'Cotización AHL Asesores de Seguros', '2017-04-05 00:00:00', '2017-04-05 00:00:00', 'Cotización para el diseño de sitio web', '', '0.50', '0.50', NULL, '2017-04-04 00:00:00', 1, 1, 4, 5, 9, 4, 12, NULL, NULL, '2017-04-04 18:29:00', '2017-04-04 18:30:55'),
(61, 'Reunión de tráfico', '2017-04-05 00:00:00', '2017-04-05 00:00:00', 'Reunión semanal de tráfico.', '', '3.00', '3.00', NULL, NULL, 1, 1, 4, 5, 8, 4, 13, NULL, NULL, '2017-04-04 18:31:55', '2017-04-04 18:33:06'),
(62, 'Diseño de Páginas Internas', NULL, NULL, 'Realizar el diseño de las siguientes páginas: \n1) La Empresa\n2) Nuestros Productos \n3) Calidad\n4) Escuela del Ladrillo \n5) Nuestras Obras\n6) Tiendas \n7) Contacto \n8) Preguntas Frecuentes \n9) Página de error 404\nNota: todavía NO realizar el diseño de la página interna de cada producto, necesitamos que el cliente nos apruebe primero el formulario cotizador.  ', 'https://drive.google.com/drive/folders/0B86D1VMd7k4gVG82eUxhak1nU00', NULL, NULL, '27.00', '2017-04-20 00:00:00', 7, 2, 3, 28, 21, 9, 11, NULL, NULL, '2017-04-04 19:02:24', '2017-04-04 19:02:24'),
(63, 'Diseño Responsive de Interfaces', NULL, NULL, 'Realizar el diseño responsive para las interfaces que se consideren necesario visualizar. ', '', NULL, NULL, '8.00', '2017-04-27 00:00:00', 7, 2, 3, 28, 22, 9, 12, NULL, NULL, '2017-04-04 19:04:55', '2017-04-04 19:04:55'),
(64, 'Diseño de la parrilla ProgreSER ', '2017-04-07 00:00:00', '2017-04-11 00:00:00', 'Darle prioridad a la pieza de baloto y la pieza de actividad de la app. Avisar cuando están graficadas para enviar a aprobación ', 'https://docs.google.com/presentation/d/18J9bJqYzgxnEPb0ycRU_GYOuqprymM1Cl72Jr_sMgLs/edit?ts=58dede8b#slide=id.p15', '15.00', NULL, NULL, '2017-04-06 00:00:00', 3, 2, 11, 9, 24, 24, 11, NULL, NULL, '2017-04-04 19:52:17', '2017-04-05 13:10:41'),
(65, 'Gráficos 3 HV', '2017-04-06 00:00:00', '2017-04-07 00:00:00', 'Gráficos del video 3 de Harinera del Valle. Ya se estableció con Rodolfo como debe ser. De igual forma esta primera semana de abril Andrés se va a reunir con Rodolfo. Andrés dime la entrega de esta tarea al cliente final. ', 'Referente establecido por diseño: https://drive.google.com/open?id=0ByONayvbI9CkMlRMSS1uaVdPeEU', '6.00', NULL, NULL, '2017-04-07 00:00:00', 3, 2, 11, 22, 30, 23, 11, NULL, NULL, '2017-04-04 22:15:51', '2017-04-05 12:47:23'),
(66, 'Realizar Flow Pauta Primero de Mayo', NULL, NULL, 'Realizar Flow Pauta Primero de Mayo según la estrategia digital planteada y el plan de pauta desarrollado el cual se encuentra en una pestaña del drive de la ruta. ', 'https://docs.google.com/a/himalayada.com/spreadsheets/d/1FRuFSwTTpKP_idAtLONj_7iT_ZxoTy8pi4n5S4iVuxw/edit?usp=drive_web', '2.00', NULL, NULL, NULL, 4, 1, 2, 14, 47, 2, 11, NULL, NULL, '2017-04-04 22:24:25', '2017-04-05 11:49:14'),
(67, 'Compra espacio Hosting', NULL, NULL, 'Realizar compra de espacio en Hosting para la creación de correos. Se puso la tarea como ajuste web , ya que no se encontró una similar. ', '', NULL, NULL, NULL, '2017-04-05 00:00:00', 7, 3, 11, 29, 39, 6, 11, NULL, NULL, '2017-04-04 23:24:43', '2017-04-04 23:24:43'),
(68, 'Carga de interactivo 360', NULL, NULL, 'Cliente solicita que se cargue el interactivo 360 para los siguientes proyectos de apartamentos:  Celeste y Magenta. Les comparto las vistas por el Server. ', '\\\\SERVER\\Elementos_Compartidos2\\SOPORTE\\Constructora Meléndez/tour-360-Magenta.rar\n\n\\\\SERVER\\Elementos_Compartidos2\\SOPORTE\\Constructora Meléndez/tour-360-Celeste-apts.rar', NULL, NULL, NULL, '2017-04-07 00:00:00', 7, 3, 3, 11, 19, 6, 11, NULL, NULL, '2017-04-05 13:19:31', '2017-04-05 13:19:31'),
(69, 'Capacitación Digital Lyda Comfandi', NULL, NULL, 'Capacitación Digital para la persona responsable actualmente de las pautas en Comfandi. \nSe proponen 2 horas de 10 a 12 pm.  ', '', NULL, NULL, NULL, '2017-04-12 00:00:00', 7, 5, 2, 14, 32, 5, 12, NULL, NULL, '2017-04-05 13:56:51', '2017-04-05 13:56:51');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=61 ;

--
-- Volcado de datos para la tabla `tiempos_x_area`
--

INSERT INTO `tiempos_x_area` (`id`, `tiempo_estimado_ot`, `tiempo_real`, `tiempo_extra`, `ots_id`, `areas_id`, `created_at`, `updated_at`) VALUES
(1, '2.00', '0.00', '0.00', 1, 5, '2017-04-01 00:46:54', '2017-04-01 00:46:54'),
(2, '4.00', '0.00', '0.00', 2, 1, '2017-04-01 01:39:29', '2017-04-01 02:19:06'),
(3, '4.00', '0.00', '0.00', 3, 5, '2017-04-01 02:01:04', '2017-04-01 02:01:04'),
(4, '4.00', '0.00', '0.00', 2, 5, '2017-04-01 02:19:06', '2017-04-01 02:19:06'),
(5, '8.00', '0.00', '0.00', 4, 5, '2017-04-01 03:01:41', '2017-04-01 03:01:41'),
(6, '160.00', '7.00', '0.00', 5, 1, '2017-04-03 19:50:03', '2017-04-04 18:33:06'),
(7, '160.00', '0.00', '0.00', 5, 2, '2017-04-03 19:50:03', '2017-04-03 19:50:03'),
(8, '160.00', '0.00', '0.00', 5, 3, '2017-04-03 19:50:03', '2017-04-03 19:50:03'),
(9, '160.00', '0.00', '0.00', 5, 4, '2017-04-03 19:50:03', '2017-04-03 19:50:03'),
(10, '160.00', '28.00', '0.00', 5, 5, '2017-04-03 19:50:03', '2017-04-03 21:00:16'),
(11, '160.00', '0.00', '0.00', 5, 6, '2017-04-03 19:50:03', '2017-04-03 19:50:03'),
(12, '8.00', '0.00', '0.00', 6, 3, '2017-04-03 21:34:24', '2017-04-03 21:34:24'),
(13, '10.00', '0.00', '0.00', 7, 5, '2017-04-03 21:38:39', '2017-04-03 21:38:39'),
(14, '18.00', '0.00', '0.00', 8, 5, '2017-04-03 17:09:52', '2017-04-03 17:09:52'),
(15, '17.00', '0.00', '0.00', 9, 1, '2017-04-03 18:27:44', '2017-04-03 19:32:16'),
(16, '32.00', '0.00', '0.00', 9, 2, '2017-04-03 18:27:44', '2017-04-03 19:32:16'),
(17, '8.00', '0.00', '0.00', 9, 3, '2017-04-03 18:27:44', '2017-04-03 19:32:16'),
(18, '50.00', '2.25', '0.00', 9, 4, '2017-04-03 18:27:44', '2017-04-05 12:47:44'),
(19, '17.00', '0.00', '0.00', 9, 5, '2017-04-03 18:27:44', '2017-04-03 19:32:16'),
(20, '21.00', '0.00', '0.00', 10, 3, '2017-04-03 19:15:51', '2017-04-03 19:15:51'),
(21, '4.00', '0.00', '0.00', 11, 3, '2017-04-03 19:49:14', '2017-04-03 19:49:14'),
(25, '12.00', '0.00', '0.00', 14, 1, '2017-04-03 20:08:17', '2017-04-03 20:08:17'),
(26, '240.00', '0.00', '0.00', 14, 2, '2017-04-03 20:08:17', '2017-04-03 20:08:17'),
(27, '48.00', '0.00', '0.00', 14, 3, '2017-04-03 20:08:17', '2017-04-03 20:08:17'),
(28, '320.00', '0.00', '0.00', 14, 4, '2017-04-03 20:08:17', '2017-04-03 20:08:17'),
(29, '44.00', '0.00', '0.00', 14, 5, '2017-04-03 20:08:17', '2017-04-03 20:08:17'),
(30, '16.00', '0.00', '0.00', 14, 6, '2017-04-03 20:08:17', '2017-04-03 20:08:17'),
(31, '80.00', '0.00', '0.00', 15, 2, '2017-04-03 20:12:14', '2017-04-03 21:30:49'),
(38, '55.50', '0.00', '0.00', 20, 2, '2017-04-03 20:16:26', '2017-04-04 21:46:28'),
(39, '55.50', '0.00', '0.00', 20, 3, '2017-04-03 20:16:26', '2017-04-04 21:46:28'),
(40, '55.50', '0.00', '0.00', 20, 4, '2017-04-03 20:16:26', '2017-04-04 21:46:28'),
(41, '40.00', '0.00', '0.00', 20, 5, '2017-04-03 20:16:26', '2017-04-04 21:46:28'),
(42, '80.00', '0.00', '0.00', 21, 2, '2017-04-03 20:17:10', '2017-04-03 20:17:10'),
(43, '80.00', '0.00', '0.00', 21, 4, '2017-04-03 20:17:10', '2017-04-03 20:17:10'),
(44, '2.00', '0.00', '0.00', 22, 1, '2017-04-03 20:36:18', '2017-04-03 20:36:18'),
(45, '31.50', '0.00', '0.00', 22, 2, '2017-04-03 20:36:18', '2017-04-03 20:36:18'),
(46, '31.50', '0.50', '0.00', 22, 4, '2017-04-03 20:36:18', '2017-04-05 12:47:07'),
(47, '2.00', '0.00', '0.00', 23, 2, '2017-04-03 20:41:24', '2017-04-03 20:41:24'),
(48, '4.00', '0.00', '0.00', 23, 3, '2017-04-03 20:41:24', '2017-04-03 20:41:24'),
(49, '2.00', '0.00', '0.00', 23, 4, '2017-04-03 20:41:24', '2017-04-03 20:41:24'),
(50, '2.00', '0.00', '0.00', 24, 2, '2017-04-03 20:44:32', '2017-04-03 20:44:32'),
(51, '9.00', '0.00', '0.00', 24, 5, '2017-04-03 20:44:32', '2017-04-03 20:44:32'),
(52, '4.00', '0.00', '0.00', 25, 3, '2017-04-03 20:48:40', '2017-04-03 20:59:12'),
(53, '82.00', '0.00', '0.00', 26, 1, '2017-04-03 20:57:48', '2017-04-03 20:57:48'),
(54, '80.00', '0.00', '0.00', 15, 4, '2017-04-03 21:30:49', '2017-04-03 21:30:49'),
(55, '13.00', '0.00', '0.00', 27, 3, '2017-04-04 13:40:24', '2017-04-04 13:40:24'),
(56, '83.00', '0.00', '0.00', 28, 2, '2017-04-04 17:42:27', '2017-04-04 17:42:27'),
(57, '118.00', '0.00', '0.00', 28, 3, '2017-04-04 17:42:27', '2017-04-04 17:42:27'),
(58, '33.00', '0.00', '0.00', 28, 4, '2017-04-04 17:42:27', '2017-04-04 17:42:27'),
(59, '33.00', '0.00', '0.00', 28, 5, '2017-04-04 17:42:27', '2017-04-04 17:42:27'),
(60, '1.00', '0.00', '0.00', 29, 3, '2017-04-04 23:21:52', '2017-04-04 23:21:52');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

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
(7, 'Dominio', 1, '2017-04-03 19:06:30', '2017-04-03 19:06:30');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `tipos_estados`
--

INSERT INTO `tipos_estados` (`id`, `nombre`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, 'Estados Tareas', NULL, '2017-03-31 22:32:19', '2017-03-31 22:32:19'),
(2, 'Estados OT', NULL, '2017-03-31 22:32:19', '2017-03-31 22:32:19'),
(3, 'Prioridad Tarea', NULL, '2017-03-31 22:32:19', '2017-03-31 22:32:19'),
(4, 'Trafico', NULL, '2017-03-31 22:32:19', '2017-03-31 22:32:19');

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
(1, 'Maria Isabel', 'Astorquiza Garcia', 'Proyect Owner', '3799180', 'miastorquiza@himalayada.com', 1, '160.00', '0.00', '3NgB9hKrA53Bwg7Vy8x29NVhTwFys0g7dsJsslZqRRr1SmsNInvqSmV11r3i', '$2y$10$iN7ULC2BxHSC7a5wbaQVtuKMASp2lRQURxd3drktnVGAqPLmnQS0u', 'A27URxWebc4H1WOpdLRzPrzXt4ZhB4fBEW9NBODv5mrPMMynskcZaUXDV237', '1985-11-26', NULL, 1, 6, '2017-03-31 22:32:19', '2017-04-03 22:39:00'),
(2, 'Marcela ', 'Benavides', 'Ejecutiva de cuenta', '3799189', 'mbenavides@himalayada.com', 1, '160.00', '0.00', 'ERwuAYETA9EUs0rMgsMlsbIwRPZ2Pf2yqyMD69T7iSiTeIRgb8Tg7wofCdpv', '$2y$10$2SolpOvJWaSYVgMQodzOPuzJOpAejhsydBthHX98f6MJxGIISmxAq', 'bhShAMT0WfrIxIb8lSNUBoSSf5vaUpGSP6fi0MmY5Wse4HObbf1wHpwyQhGG', '1989-01-12', NULL, 3, 6, '2017-04-01 00:06:37', '2017-04-01 00:06:37'),
(3, ' Maria Andrea', 'Ramirez', 'New Bussines', '3799180', 'mramirez@himalayada.com', 1, '160.00', '0.00', 'Q7rxu2DcDoryMNJ60wGTx60wYJhzOk51tWk87thqIKEllsS6ufFPcnknjDda', '$2y$10$BCkvGoqlTWd6hpoHmmGwkOX8xX3Ets1xYwTN.xY9T7pvR1Ol5E85C', 'S5LySw4VsLZOy2aUmlKAg4kratqWhXkoCZlPc9avqTowyZqNn0Lbrtw3JcLf', '1995-04-13', NULL, 3, 6, '2017-04-01 00:09:29', '2017-04-01 00:09:29'),
(4, 'Jose', 'Díaz', 'Director Creativo', '3799180', 'jdiaz@himalayada.com', 1, '160.00', '7.00', 'GwbXB4sqIiOUuxOL1dStShj0vcdIF2AKKY281QOUcm38H1xrwTHdWM45J23A', '$2y$10$qrJtAjAmZMq.QSYaYsuxzezTqK/JmgRnEAeSramLboJtInRzVFQj2', '1pzknglfN1KD3QdbYy7eMwDeg243PHMiT3F7eQJF0Cwgftn8FgTKeOKpUFlV', '1996-12-11', '/images/avatars/Jose_4.png', 4, 1, '2017-04-01 00:11:52', '2017-04-05 13:58:01'),
(5, 'Nestor', 'Sepúlveda', 'SEM Performance Manager', '3799180', 'nsepulveda@himalayada.com', 1, '160.00', '28.00', 'RuvvNWFbO0DvZIbQuMgwTcrbN08FvfaWN9JAX5tTIXfOaOHOVi3ehxpoXQrf', '$2y$10$sUcfUkp3nZd1f/cpDGPahOm01im8NHCO5RDD9A7mSzM9GLOy1R3kO', 'w19FfVkSDYAVRnYlv6rCgDuhsscaXyo9RCkovodgHXQG0ttRiTTmkyqyb6vv', '1997-02-14', '/images/avatars/Nestor_5.png', 4, 5, '2017-04-01 00:14:24', '2017-04-05 14:03:10'),
(6, 'Luisa Fernanda', 'Carvajal', 'Development  Leader', '3799180', 'lfcarvajal@himalayada.com', 1, '160.00', '0.00', 'bCtuZG3leZWgvpx7pBZCAtabkQnhDeZd5CbyZhOkYOMLAf7mbfhF0NL4zt2V', '$2y$10$2O2JgFd1F5.SH.unCjtMB.I1F9Vq8hp61EgzjWEc8cnHzewwXT6lG', 'bJoYZvPOEcyPyzfHxjFX3YVdSqnNtkEwT5MDYoCF11VM5oZ6hCBUPO6Rl4s0', '1992-01-12', '/images/avatars/LuisaFernanda_6.png', 4, 3, '2017-04-01 00:16:07', '2017-04-04 16:00:28'),
(7, 'Leonardo', 'Rodriguez Mora', 'Lider de Contenido Escrito', '3799180', 'lrodriguez@himalayada.com', 1, '160.00', '1.75', '8jPsmaUhBsSTKe325wtCC6N5JQhkCCm8gQMn6ge5s1oQxdPAYCKc4rwmGt4J', '$2y$10$.p8Ikli/PiMGEzNYsCkXTe1lL9RIVwQVKu/b/opkn/AKUd5zJ9Xeu', 'DYsJNoCgMgXKnHYHI3SfHGafvmDqjzdq8zdhPyvB1iPSGtQLxLCiwKAlRv5A', '1987-02-24', '/images/avatars/Leonardo_7.png', 4, 4, '2017-04-01 00:18:46', '2017-04-05 12:47:25'),
(8, 'Desarrollo', 'Himalaya', 'Tester', '', 'soporte@himalayada.com', 2, '0.00', '0.00', 'wFIbQsjOHYrgFPq1DHu3UkEmItjvxEBYrDuBcMTvOVnQXwdU2GxPP1NhEjMI', '$2y$10$PHrpsY5IWOevdO8fu2zjF.tFEHBdYV3tcAxmKqgPah8f0PMEUCmX.', 'WGgUWqRYjH2GfrRxeVjr26bEmXXgh54sRa2JEpqfDitUqwmiKky4kZFmMNZz', '1999-01-01', '/images/avatars/Desarrollo_8.png', 2, 3, '2017-04-01 00:20:29', '2017-04-05 14:22:41'),
(9, 'Andres Fabian', 'Mabesoy Jimenez', 'Encargado de Diseño', '3799180', 'afmabesoy@himalayada.com', 1, '160.00', '0.00', 'W5mQJidqz3LufqDiuW0kTRlMGeBpOqLBC6n4YCpFP6GSGdiDEYJqC1AWxI4h', '$2y$10$ScofXNXbRDoTVCEZC80dquuJXmLy8XOSVlUVx.LZOP0BZAZFUA6GG', 'NymtGRzTOh8YCkuGFsuMYEOjmIOpS3YoFFlLNohzCWYayzJFWG21RJeQb2qd', '1996-04-18', '/images/avatars/AndresFabian_9.png', 4, 2, '2017-04-01 00:21:13', '2017-04-04 16:08:44'),
(10, 'Silvia', 'Salamanca', 'Ejecutiva de cuentas', '39057069', 'ssalamanca@himalayada.com', 1, '160.00', '0.00', '89lN0Tdo9WSxKOhYATwGiZWLfX4HltT9OeVOgCtQifD8IsHXlSh2pWbulLWg', '$2y$10$Spb8Hb1Nq2INVSDkvYi1S.1vPNamZrWCpv4dVAkApY8Tuewsk.bpG', '0jNzVnVznsj40chtfmE3ECqvFrBpLPS1dRrAcDWMOVsueF2BrkEJwrGRniUH', '1986-10-07', NULL, 3, 6, '2017-04-01 00:29:41', '2017-04-01 04:02:04'),
(11, 'Andrea', 'Martinez Satizabal', 'Ejecutiva de Cuentas', '3799180', 'bamartinez@himalayada.com', 1, '160.00', '0.00', 'HUymwZan0aN6aBEFVVvajMHfU9WfyUXeBO82WU8alkG9ITgWY0aEyEhf9jzq', '$2y$10$4W50sYVU6WmVqP6cCRu.G.QNg0ROL2LEil.LDz4tatZVGLUe.mirC', 'qiQ8kOWPUQMc1NC049CaUx5BHl8W5TjrLZaHlpRlsvmL8c7e25ERRIYzvdxJ', '1987-11-19', NULL, 3, 6, '2017-04-01 01:49:57', '2017-04-03 20:50:36'),
(12, 'Juan Pablo', 'Isasi', 'Community Manager', '', 'jisasi@himalayada.com', 1, '160.00', '0.00', 'UaNlOeUhMQnX2d6MHV9lzoRMQNSRJ9RPsVfVzlUyKQyQl6WiGciDvjuBObz2', '$2y$10$cF66kFThA5L9s4x0wbbo4uIs1KkHkevEYN9ne7TdbXLitqqvMSZfG', 'iLlyL7M1SjsYV6k2t1yIyC2tnwIOk7LUmSyf6Ez4RV6hPZMQ8qLa6ElJkxka', '1993-05-12', NULL, 5, 4, '2017-04-03 18:23:06', '2017-04-03 18:23:06'),
(13, 'Alvaro Jose', 'Borrero', ' Ingeniero de desarrollo', '3865350', 'aborrero@himalayada.com', 1, '160.00', '0.00', 'frf0L9CKPHKJvQd9EYEfeHnyOa5YGpZDUcuXsfEE0NEMMtM8ZUAQzuperZPc', '$2y$10$H/52PwevUFw8JC5YL08gNOhGgJ/Klk9IQBvzr0IwQIm6xBDqg8906', 'BHDxrgIwCM0bw2uZN0NzUsek6qW9cHHxQqK2MAQ56nEDyJyvfGW95j9zaAsU', '1997-10-14', '/images/avatars/AlvaroJose_13.png', 5, 3, '2017-04-03 18:33:18', '2017-04-04 14:03:59'),
(14, 'Juan Pablo', 'Portilla', 'Campaign Manager', '3865350', 'jportilla@himalayada.com', 1, '160.00', '0.00', 'R1k1WsTtH2qXFdXhQm18sD7gN8yisxRVHkqDxScTiIiM0nTXUiXVsueEcUoS', '$2y$10$QGunZoZwR0maduXUc3DsLuWLyMs4qZe1/cFQ90UP9GSbqOM.sQaa2', '4ajEQLvBntnxYjS95cRwur28FjaKBi58P9wUKCYb6mfvPVZt54mSbl3kkl38', '1994-08-11', NULL, 5, 5, '2017-04-03 19:26:15', '2017-04-04 14:07:15'),
(15, 'Maria Camila', 'Matallana', 'Data Specialist', '3865350', 'mcmatallana@himalayada.com', 1, '160.00', '0.00', 'hV23xOf3KOyCtVLJD74PYRDiDDMaf4CeI5ERl5FIDxASRIWCza7ZbXkGUe56', '$2y$10$cQlQdH4xASHHQ9ph1U9uMe2xFVS77J0D/MgXtV4egl.w8rXOxsRgu', '720KGlGpdfuVVI9MqrhnQTHE6c7qnaH0wesAAg9sEIdqEG8IPNGPAVfi80ia', '1994-07-13', NULL, 5, 5, '2017-04-03 19:30:08', '2017-04-03 22:06:57'),
(16, 'Alexandra', 'Narvaez', 'Practicante en Contenidos - CM', '3865350', 'anarvaez@himalayada.com', 1, '160.00', '1.00', 'uThXBZ9sl7m3k82WfNBnr7yedtbjvT7S667znt5NcrjXY7bQIsQ9ccIJ7IDb', '$2y$10$3b3C2PZKlm/xP2GTskiKK.dxFNiRqcd2kdFf7sTjzPoP8pzpDHFWS', 'NDb4MCsh3RpuPjCZ7E1Hw5KLdGirigHmejbzgksyBVhIQDm1URNhewcCnla4', '1999-04-02', NULL, 5, 4, '2017-04-03 18:07:20', '2017-04-05 12:47:44'),
(17, 'John', 'Acosta', 'Content Manager', '3865350', 'jacosta@himalayada.com', 1, '160.00', '0.00', 'mdFc0QIeFaBb7VIoaHC9MRgxoTbuHGgePsmXG2zHsilL0FBvRNIENEQ8tglk', '$2y$10$JKPqAcqaSzqxQEy2h3Mf1uXBxFYrSLPa9tmb85ESwgmMZRwQB.A32', 'qTuBrqiGDKQyp7tSdbSvVwna7yPHpkKUDnVZvDpuZIJuqrj768039xKUFbJ3', '1997-05-02', '/images/avatars/John_17.png', 5, 4, '2017-04-03 18:09:13', '2017-04-04 19:38:24'),
(18, 'Karen', 'Piedrahita Mora', 'Community Manager', '3865350', 'kpiedrahita@himalayada.com', 1, '160.00', '0.00', 'nRGsbJlfsvPlwZVg3F3lT0cDVvAx5dP2QJRbkhXgrXoqlYZGDHCZW0CEWtIS', '$2y$10$eVlV7uIkcKT3smihzyhjnOkaq.8cChofAmLYC80.RMiKlsK8z8yz2', 'GNxnFGRnWpEKGJgahsHLsR0PJKhFiD4ptEjyR4JbHfuXGITidtRlKlAcxmj2', '1996-08-14', NULL, 5, 4, '2017-04-03 18:11:44', '2017-04-03 18:11:44'),
(19, 'Daniela', 'Roncancio', 'Content Manager', '3865350', 'droncancio@himalayada.com', 1, '160.00', '0.00', 'oeG4gETrGdSew7u83dEFM1qfgZxk3T45SQaZankeCzM3f2UdlSG92ikvfI74', '$2y$10$0kIW5OJLHXQNmp6FgH8SHO2JOc9Rk2S6ozdpYE7Dxfd7k6fv/JRY2', 'VDHRV7u64d7E79enF3FGUEu5muCKWhOTWuGLajNlqQgAk9js6ChVq3CvtnR8', '1999-03-17', NULL, 5, 4, '2017-04-03 18:16:14', '2017-04-03 18:16:14'),
(20, 'David', 'Salazar', 'Desarrollador', '', 'dsalazar@himalayada.com', 1, '160.00', '0.00', 'NfyuUBRwsoXezRBdcLvxoQmFD7X7NbXKVfc57SkGROKsXG5kNbHvzVBDe4M6', '$2y$10$2ZPziARPHwzvR5qcABsiJu0BzL9hQ67iC0Rf90371jkTw8r7pnb7K', '7cnqPvYokPjIRevUTR607YruclvEq5p1QP8H4uCs8222IW9EKR6DGrElRL0x', '1995-07-18', '/images/avatars/David_20.png', 5, 3, '2017-04-03 19:33:02', '2017-04-03 19:58:23'),
(21, 'Brian', 'Caldas', 'Desarrollador', NULL, 'bcaldas@himalayada.com', 1, '160.00', '0.00', 'OyrXcARUU8LqjHleWE8KVevmxPZ6RKFYUZI4Q6YbYbkgLDl8nr6d6Cwvrcqk', '$2y$10$PVpqHuQhdtGZQkhWQhz5oehLmPmWpzKWJp900FOp156f64axNSlga', 'rRLTVH8lDownNNxfjrJ5Y83JqLJstofGTptZpZsrkKkAznjxQArCZriebwRe', '1993-01-23', '/images/avatars/Brian_21.png', 5, 3, '2017-04-03 19:33:49', '2017-04-05 13:56:55'),
(22, 'Nathalia', 'Dominguez Gonzales', 'Account Executive', '3865350', 'ndominguez@himalayada.com', 1, '160.00', '0.00', 'xbqPlRGQQ7CdsWr2yS5IBQ85MEXgRxt92dmyCI4lfkwcc0QVQVwgsNswnpAZ', '$2y$10$XEm.vq.un1WtV5qga7BLgel7q7r..3rH1bUbfshsiwOvKqwlOoK3C', 'OU5FtELQORy5dm8CqIp1K7foxPC5AJmXPk3L70S0EbM0x2EsfmKxGS7OU5eC', '1984-10-24', NULL, 3, 6, '2017-04-03 19:39:40', '2017-04-03 22:55:42'),
(23, 'Zuly', 'Villamil', 'Diseñadora Gráfica', '3865350', 'zpvillamil@himalayada.com', 1, '160.00', '0.00', 'AWwlIMrCu00AZaO8ico9Ou4ha4YO3u2dt0TtNZmS2oP8XvwaXK44uIchlutS', '$2y$10$BYYJ1oFhSBo9y9pvEeunA.Zc4u42M/GDpFJjNQMLsr6tN2eC8ts/W', 'YnTeJiJYEcpAuZUvyUHPRolYUO6Nnw6ayduamkfhd2yeguZ1a2r8LOC3qdBX', '1989-09-28', '/images/avatars/Zuly_23.png', 5, 2, '2017-04-03 21:04:20', '2017-04-03 21:39:15'),
(24, 'Christian', 'Gil Bernal', 'Diseñador Gráfico', '3865350', 'cgil@himalayada.com', 1, '160.00', '0.00', '6gNk9nhPH3Ils7RltcVEYT1bmNLxjRIjvtGBJOCXKp74xogOgv8XTPgWaBnt', '$2y$10$Bp9Z0iHWCGtrwcPGTWMkme0LMmPMH8buJ0PGHHl/cpdNWopqszrJe', 'T8gsi1hb5wLxcqyoYGXoOCtYkbehhxhXP8JMmYcWE3gAJg4dvL8djaBNeGp5', '1991-01-14', '/images/avatars/Christian_24.png', 5, 2, '2017-04-03 21:06:05', '2017-04-03 21:18:33'),
(25, 'Alejandro', 'Garrido', 'Practicante en Diseño Gráfico', '3865350', 'agarrido@himalayada.com', 1, '160.00', '0.00', 'tYRCjXYFvuXL6UpUFtYG0mUtVUU7lh9J0avKxkuh8rQpnW2O7nXzwOy9K1Hu', '$2y$10$Vo03MHWRKOp9/muXeEa5EOfgbMxycXPJqtIjqvjGNb1ipGcbRQs.6', 'apCE9zBycN3AUCWATc54JWVb1feszssFWlLuxNyRWL05SDnjlL3HH9CbE1vm', '1998-05-13', NULL, 5, 2, '2017-04-03 21:09:00', '2017-04-03 21:09:00'),
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
