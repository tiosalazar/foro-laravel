-- phpMyAdmin SQL Dump
-- version 4.0.10.18
-- https://www.phpmyadmin.net
--
-- Servidor: localhost:3306
-- Tiempo de generación: 03-04-2017 a las 07:48:58
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
(1, 'Creatividad', '0551', '0.00', 1, '2017-03-31 22:32:19', '2017-03-31 22:32:19'),
(2, 'Diseño', '0581', '0.00', 1, '2017-03-31 22:32:19', '2017-03-31 22:32:19'),
(3, 'Desarrollo', '81', '0.00', 1, '2017-03-31 22:32:19', '2017-03-31 22:32:19'),
(4, 'Contenidos', '0281', '0.00', 1, '2017-03-31 22:32:19', '2017-03-31 22:32:19'),
(5, 'Digital Performance', '0581', '0.00', 1, '2017-03-31 22:32:19', '2017-03-31 22:32:19'),
(6, 'Cuentas', '0581', '0.00', 1, '2017-03-31 22:32:19', '2017-03-31 22:32:19');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `nombre`, `nit`, `email`, `telefono`, `nombre_contacto`, `estado`, `created_at`, `updated_at`) VALUES
(1, 'Electrojaponesa', '12345678', NULL, NULL, 'Victoria', 1, '2017-03-31 22:32:19', '2017-03-31 22:32:19'),
(2, 'Adeinco', '12345678', NULL, NULL, 'Pablo', 1, '2017-03-31 22:32:19', '2017-03-31 22:32:19'),
(3, 'Calzatodo', '12345678', NULL, NULL, 'Santiago', 1, '2017-03-31 22:32:19', '2017-03-31 22:32:19'),
(4, 'Himalaya', '87654321', NULL, NULL, 'M. Isabel', 1, '2017-03-31 22:32:19', '2017-03-31 22:32:19'),
(5, 'Comfandi - Corporativo', '37469569567', '', '', 'Lyda Prado', 1, '2017-04-01 00:33:12', '2017-04-01 01:13:01'),
(6, 'Harinera del Valle - Pastas La Muñeca', '891.300.382', 'mp.mejia@hv.com.co', '', 'Paola Mejia', 1, '2017-04-01 00:40:54', '2017-04-01 00:40:54');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `comentarios`
--

INSERT INTO `comentarios` (`id`, `comentarios`, `usuarios_comentario_id`, `tareas_id`, `estados_id`, `created_at`, `updated_at`) VALUES
(1, 'Inverisión Neta: $35.000 el 1 de abril. dejar programada esta publicación para pauta solo para ese día', 10, 6, NULL, '2017-04-01 02:21:59', '2017-04-01 02:21:59');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `compras_ots`
--

INSERT INTO `compras_ots` (`id`, `nombre`, `descripcion`, `provedor`, `valor`, `ots_id`, `areas_id`, `tipos_compras_id`, `divisas_id`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Amplificar post de Facebook', 'Facebook', '357000', 1, 5, 1, 1, '2017-04-01 00:46:54', '2017-04-01 00:46:54'),
(2, NULL, 'Amplificar 1 post', 'Facebook', '280000', 2, 5, 1, 1, '2017-04-01 01:39:29', '2017-04-01 01:39:29'),
(3, NULL, 'Pauta Post Cali, Buga, Tuluá, Cartago y Buenaventura', 'Facebook', '350000', 3, 5, 1, 1, '2017-04-01 02:01:04', '2017-04-01 02:01:04'),
(4, NULL, '7 Amplificaciones de Post ', 'Facebook', '1295000', 4, 5, 1, 1, '2017-04-01 03:01:41', '2017-04-01 03:01:41');

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
(13, 'Baja', 3, '2017-03-31 22:32:19', '2017-03-31 22:32:19'),
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=27 ;

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
(26, 5, 5);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `historicos_ots`
--

INSERT INTO `historicos_ots` (`id`, `ots_id`, `nombre`, `referencia`, `valor`, `fee`, `horas_totales`, `horas_disponibles`, `total_horas_extra`, `observaciones`, `requerimientos_ot`, `compras_ot`, `fecha_inicio`, `fecha_final`, `clientes_id`, `usuarios_id`, `estados_id`, `editor_id`, `created_at`, `updated_at`) VALUES
(1, 2, 'Pauta Escuelas Deportiva Tennis deCampo', '1096', '400000', 0, '4.00', '0.00', '0.00', 'Amplificación de 1 post de Facebook', '[{"area":1,"horas":4,"tiempo_extra":"0.00","requerimientos":[{"model_nom":"Amplificar post","model_horas":4}]},{"area":5,"horas":4,"tiempo_extra":"0.00","requerimientos":[{"model_nom":"Amplificar post","model_horas":4}]}]', '[]', '2017-04-03 00:00:00', '2017-04-17 00:00:00', 5, 2, 8, 1, '2017-04-01 02:19:06', '2017-04-01 02:19:06');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `historico_tareas`
--

INSERT INTO `historico_tareas` (`id`, `tiempo_estimado`, `tiempo_real`, `comentarios_id`, `encargado_id`, `estados_id`, `usuarios_id`, `tareas_id`, `editor_id`, `fecha_entrega_area`, `fecha_entrega_cuentas`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, 1, 5, 7, 10, 6, 10, NULL, NULL, '2017-04-01 02:21:59', '2017-04-01 02:21:59');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=352 ;

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
(351, '2017_03_10_171400_create_sessions_table', 1);

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
('01ac8bd1-317f-4004-8067-57f44c886d7e', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":2,"nombre":"Silvia","cargo":"Ejecutiva de cuentas","descripcion":"Silvia cre\\u00f3 la Tarea: Pauta Tennis de campo","created_at":"2017-03-31 20:51:06","img_perfil":null,"link":"\\/ver_tarea\\/2"}', NULL, '2017-04-01 01:51:06', '2017-04-01 01:51:06'),
('18d9ee8a-90b1-4617-be7a-f25862ab35b4', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":21,"nombre":"Silvia","cargo":"Ejecutiva de cuentas","descripcion":"Silvia cre\\u00f3 la Tarea: Pauta cursos Cali Abril Decoraci\\u00f3n de fiestas tem\\u00e1ticas","created_at":"2017-03-31 22:26:18","img_perfil":null,"link":"\\/ver_tarea\\/21"}', NULL, '2017-04-01 03:26:18', '2017-04-01 03:26:18'),
('1af37ec2-e810-4716-8c78-a73327a7fdc5', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":20,"nombre":"Silvia","cargo":"Ejecutiva de cuentas","descripcion":"Silvia cre\\u00f3 la Tarea: Pauta cursos Cali Abril Decoraci\\u00f3n y extensi\\u00f3n de u\\u00f1as","created_at":"2017-03-31 22:25:34","img_perfil":null,"link":"\\/ver_tarea\\/20"}', NULL, '2017-04-01 03:25:34', '2017-04-01 03:25:34'),
('2c7b3fd3-32b0-47b0-a43c-8160959dc36d', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":23,"nombre":"Silvia","cargo":"Ejecutiva de cuentas","descripcion":"Silvia cre\\u00f3 la Tarea: Pauta cursos Cali Abril - Secretariado sistematizado contable","created_at":"2017-03-31 22:30:01","img_perfil":null,"link":"\\/ver_tarea\\/23"}', NULL, '2017-04-01 03:30:01', '2017-04-01 03:30:01'),
('32472894-736a-457f-b617-f416cfddce06', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":18,"nombre":"Silvia","cargo":"Ejecutiva de cuentas","descripcion":"Silvia cre\\u00f3 la Tarea: Pauta cursos Cali Abril - Preparaci\\u00f3n a base de cafe","created_at":"2017-03-31 22:22:20","img_perfil":null,"link":"\\/ver_tarea\\/18"}', NULL, '2017-04-01 03:22:20', '2017-04-01 03:22:20'),
('342cd439-4b7f-4e41-9d6c-5d90af4dd2a8', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":1,"nombre":"Maria Isabel","cargo":"Proyect Owner","descripcion":"Maria Isabel cre\\u00f3 la Tarea: Pauta Descuento Droguer\\u00edas - Gif d\\u00edas de descuento por iniciar mes ","created_at":"2017-03-31 19:52:50","img_perfil":null,"link":"\\/ver_tarea\\/1"}', NULL, '2017-04-01 00:52:50', '2017-04-01 00:52:50'),
('34b85a99-0ad2-4835-aced-2bb3d02d064e', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":11,"nombre":"Silvia","cargo":"Ejecutiva de cuentas","descripcion":"Silvia cre\\u00f3 la Tarea: Pauta Descuento Droguer\\u00edas - Gif que Anuncie descuento este 15 de abril)","created_at":"2017-03-31 21:32:19","img_perfil":null,"link":"\\/ver_tarea\\/11"}', NULL, '2017-04-01 02:32:19', '2017-04-01 02:32:19'),
('4ef50c18-ab7c-4cee-a440-fa85216c137f', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":24,"nombre":"Silvia","cargo":"Ejecutiva de cuentas","descripcion":"Silvia cre\\u00f3 la Tarea: Pauta cursos Cali Abril - Cocina mexicana","created_at":"2017-03-31 22:30:48","img_perfil":null,"link":"\\/ver_tarea\\/24"}', NULL, '2017-04-01 03:30:48', '2017-04-01 03:30:48'),
('586d0129-6e64-4a8e-b29b-9f13cd850cd0', 'App\\Notifications\\OtCreada', 1, 'App\\User', '{"id_tarea":4,"nombre":"Silvia","cargo":"Ejecutiva de cuentas","descripcion":"Silvia ha creado una OT con referencia: 1094, nombre : Pauta Cursos Abril y valor: $1,850,000","created_at":"2017-03-31 22:01:41","img_perfil":null,"link":"\\/ots\\/visualizar\\/4"}', '2017-04-02 08:08:00', '2017-04-01 03:01:41', '2017-04-02 08:08:00'),
('613a1504-bd4b-42ac-8790-f324454f9069', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":9,"nombre":"Silvia","cargo":"Ejecutiva de cuentas","descripcion":"Silvia cre\\u00f3 la Tarea: Pauta Descuento Droguer\\u00edas - Gif que Anuncie descuento 15 de abril","created_at":"2017-03-31 21:30:14","img_perfil":null,"link":"\\/ver_tarea\\/9"}', NULL, '2017-04-01 02:30:14', '2017-04-01 02:30:14'),
('78ad69e0-c2f5-4187-ad1c-28efd3d2fd2c', 'App\\Notifications\\ComentarioNuevoTarea', 5, 'App\\User', '{"id_tarea":6,"nombre":"Silvia","cargo":"Ejecutiva de cuentas","descripcion":"Silvia ha comentado en la Tarea: Pauta Descuento Droguer\\u00edas - Pieza HOY 10% de descuento \\"Inverisi\\u00f3n Net...\\"","created_at":"2017-03-31 21:21:59","img_perfil":null,"link":"\\/ver_tarea\\/6"}', NULL, '2017-04-01 02:21:59', '2017-04-01 02:21:59'),
('7bc5a733-e99e-400e-95f9-cb76a34b6a86', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":15,"nombre":"Silvia","cargo":"Ejecutiva de cuentas","descripcion":"Silvia cre\\u00f3 la Tarea: Pauta Descuento Droguer\\u00edas - Pieza HOY 10% de descuento","created_at":"2017-03-31 21:49:54","img_perfil":null,"link":"\\/ver_tarea\\/15"}', NULL, '2017-04-01 02:49:54', '2017-04-01 02:49:54'),
('7ff969a2-5d17-4c53-8e35-51bda88b3b60', 'App\\Notifications\\OtCreada', 1, 'App\\User', '{"id_tarea":2,"nombre":"Silvia","cargo":"Ejecutiva de cuentas","descripcion":"Silvia ha creado una OT con referencia: 1096, nombre : Pauta Escuelas Deportiva Tennis deCampo y valor: $400,000","created_at":"2017-03-31 20:39:29","img_perfil":null,"link":"\\/ots\\/visualizar\\/2"}', '2017-04-02 08:08:00', '2017-04-01 01:39:29', '2017-04-02 08:08:00'),
('8a3a405a-c94e-4790-b48e-b1e2cf5b1ade', 'App\\Notifications\\OtCreada', 1, 'App\\User', '{"id_tarea":1,"nombre":"Maria Isabel","cargo":"Proyect Owner","descripcion":"Maria Isabel ha creado una OT con referencia: 1093, nombre : Pauta Descuentos Droguerias y valor: $510,000","created_at":"2017-03-31 19:46:54","img_perfil":null,"link":"\\/ots\\/visualizar\\/1"}', '2017-04-02 08:08:00', '2017-04-01 00:46:54', '2017-04-02 08:08:00'),
('9a844b05-cf92-45de-8a90-6fec25049280', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":17,"nombre":"Maria Isabel","cargo":"Proyect Owner","descripcion":"Maria Isabel cre\\u00f3 la Tarea: Pauta concierto de la cuna a la jungla - Buenaventura","created_at":"2017-03-31 21:51:06","img_perfil":null,"link":"\\/ver_tarea\\/17"}', NULL, '2017-04-01 02:51:06', '2017-04-01 02:51:06'),
('9eb9f1f1-35a6-48ce-852f-a4e07be61afa', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":13,"nombre":"Maria Isabel","cargo":"Proyect Owner","descripcion":"Maria Isabel cre\\u00f3 la Tarea: Pauta concierto de la cuna a la jungla - Tulu\\u00e1","created_at":"2017-03-31 21:46:28","img_perfil":null,"link":"\\/ver_tarea\\/13"}', NULL, '2017-04-01 02:46:28', '2017-04-01 02:46:28'),
('a7a07920-12fb-49d3-b211-2fa4be629c4b', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":14,"nombre":"Maria Isabel","cargo":"Proyect Owner","descripcion":"Maria Isabel cre\\u00f3 la Tarea: Pauta concierto de la cuna a la jungla - Cartago","created_at":"2017-03-31 21:48:12","img_perfil":null,"link":"\\/ver_tarea\\/14"}', NULL, '2017-04-01 02:48:12', '2017-04-01 02:48:12'),
('b34e553a-b57a-474d-bfb2-a2af340a85d1', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":22,"nombre":"Silvia","cargo":"Ejecutiva de cuentas","descripcion":"Silvia cre\\u00f3 la Tarea: Pauta cursos Cali Abril - Excel avanzado, oficce b\\u00e1sico, tablas din\\u00e1micas","created_at":"2017-03-31 22:28:58","img_perfil":null,"link":"\\/ver_tarea\\/22"}', NULL, '2017-04-01 03:28:58', '2017-04-01 03:28:58'),
('b5e5c9de-8c41-42c3-aeb3-2e36bd55fe36', 'App\\Notifications\\OtTiempoExtraAprobado', 2, 'App\\User', '{"id_tarea":2,"nombre":"Maria Isabel","cargo":"Proyect Owner","descripcion":"Maria Isabel ha editado su Orden de trabajo con la referencia #1096 con el nombre Pauta Escuelas Deportiva Tennis deCampo ","created_at":"2017-03-31 21:19:06","img_perfil":null,"link":"\\/ots\\/visualizar\\/2"}', NULL, '2017-04-01 02:19:06', '2017-04-01 02:19:06'),
('bad39ef7-baa9-4ca6-9dc9-010b271ca579', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":16,"nombre":"Silvia","cargo":"Ejecutiva de cuentas","descripcion":"Silvia cre\\u00f3 la Tarea: Informe Resultados Pauta descuentos Droguer\\u00ecas","created_at":"2017-03-31 21:50:50","img_perfil":null,"link":"\\/ver_tarea\\/16"}', NULL, '2017-04-01 02:50:50', '2017-04-01 02:50:50'),
('bb3d2707-5dea-4919-ab51-c791c68d336a', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":5,"nombre":"Andrea","cargo":"Ejecutiva de Cuentas","descripcion":"Andrea cre\\u00f3 la Tarea: Pauta concierto de la cuna a la jungla - Cali","created_at":"2017-03-31 21:05:54","img_perfil":null,"link":"\\/ver_tarea\\/5"}', NULL, '2017-04-01 02:05:54', '2017-04-01 02:05:54'),
('c020e2e6-f8f1-49c4-8216-455ba57634ac', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":8,"nombre":"Silvia","cargo":"Ejecutiva de cuentas","descripcion":"Silvia cre\\u00f3 la Tarea: Pauta Descuento Droguer\\u00edas - Pieza HOY 10% de descuento","created_at":"2017-03-31 21:27:52","img_perfil":null,"link":"\\/ver_tarea\\/8"}', NULL, '2017-04-01 02:27:52', '2017-04-01 02:27:52'),
('c419607f-7085-4883-bc2c-04001f98a280', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":3,"nombre":"Silvia","cargo":"Ejecutiva de cuentas","descripcion":"Silvia cre\\u00f3 la Tarea: Pauta Tennis de campo","created_at":"2017-03-31 20:54:38","img_perfil":null,"link":"\\/ver_tarea\\/3"}', NULL, '2017-04-01 01:54:38', '2017-04-01 01:54:38'),
('c541000f-8356-4852-b405-495ab6162a5d', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":6,"nombre":"Silvia","cargo":"Ejecutiva de cuentas","descripcion":"Silvia cre\\u00f3 la Tarea: Pauta Descuento Droguer\\u00edas - Pieza HOY 10% de descuento","created_at":"2017-03-31 21:12:33","img_perfil":null,"link":"\\/ver_tarea\\/6"}', NULL, '2017-04-01 02:12:33', '2017-04-01 02:12:33'),
('d17ed0b7-6876-4cc4-b027-ce6234a21c3e', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":7,"nombre":"Silvia","cargo":"Ejecutiva de cuentas","descripcion":"Silvia cre\\u00f3 la Tarea: Pauta Descuento Droguer\\u00edas - Gif que Anuncie descuento 15 de abril","created_at":"2017-03-31 21:25:38","img_perfil":null,"link":"\\/ver_tarea\\/7"}', NULL, '2017-04-01 02:25:38', '2017-04-01 02:25:38'),
('df970412-bbec-43a5-81c3-9a72f289714a', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":12,"nombre":"Maria Isabel","cargo":"Proyect Owner","descripcion":"Maria Isabel cre\\u00f3 la Tarea: Pauta concierto de la cuna a la jungla - Buga","created_at":"2017-03-31 21:38:59","img_perfil":null,"link":"\\/ver_tarea\\/12"}', NULL, '2017-04-01 02:38:59', '2017-04-01 02:38:59'),
('e4a5cd77-df9e-43a3-b6a5-8c16ec00ef4d', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":19,"nombre":"Silvia","cargo":"Ejecutiva de cuentas","descripcion":"Silvia cre\\u00f3 la Tarea: Pauta cursos Cali Abril Automaquillaje","created_at":"2017-03-31 22:23:46","img_perfil":null,"link":"\\/ver_tarea\\/19"}', NULL, '2017-04-01 03:23:46', '2017-04-01 03:23:46'),
('e6b2f7a3-28a7-4eb0-89b5-dd588ed85310', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":10,"nombre":"Silvia","cargo":"Ejecutiva de cuentas","descripcion":"Silvia cre\\u00f3 la Tarea: Pauta Descuento Droguer\\u00edas - Pieza HOY 10% de descuento","created_at":"2017-03-31 21:31:20","img_perfil":null,"link":"\\/ver_tarea\\/10"}', NULL, '2017-04-01 02:31:20', '2017-04-01 02:31:20'),
('f9a3edd4-d2aa-4d1a-8674-a0fbb6a0c8b5', 'App\\Notifications\\OtCreada', 1, 'App\\User', '{"id_tarea":3,"nombre":"Andrea","cargo":"Ejecutiva de Cuentas","descripcion":"Andrea ha creado una OT con referencia: 1095, nombre : Pauta Concierto de la Cuna a la Jungla y valor: $500,000","created_at":"2017-03-31 21:01:04","img_perfil":null,"link":"\\/ots\\/visualizar\\/3"}', '2017-04-02 08:08:00', '2017-04-01 02:01:04', '2017-04-02 08:08:00'),
('fd041193-eed4-4938-bb3d-6b207183a19e', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":4,"nombre":"Silvia","cargo":"Ejecutiva de cuentas","descripcion":"Silvia cre\\u00f3 la Tarea: Pauta Descuento Droguer\\u00edas - Gif d\\u00edas de descuento por iniciar mes ","created_at":"2017-03-31 21:05:52","img_perfil":null,"link":"\\/ver_tarea\\/4"}', NULL, '2017-04-01 02:05:52', '2017-04-01 02:05:52');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `ots`
--

INSERT INTO `ots` (`id`, `nombre`, `referencia`, `valor`, `fee`, `horas_totales`, `horas_disponibles`, `total_horas_extra`, `observaciones`, `fecha_inicio`, `fecha_final`, `estado`, `clientes_id`, `usuarios_id`, `estados_id`, `created_at`, `updated_at`) VALUES
(1, 'Pauta Descuentos Droguerias', '1093', '510000', 0, '4.00', '2.00', '0.00', '', '2017-03-31 00:00:00', '2017-04-22 00:00:00', 1, 5, 2, 8, '2017-04-01 00:46:54', '2017-04-01 00:46:54'),
(2, 'Pauta Escuelas Deportiva Tennis deCampo', '1096', '400000', 0, '4.00', '0.00', '0.00', 'Amplificación de 1 post de Facebook', '2017-04-03 00:00:00', '2017-04-17 00:00:00', 1, 5, 2, 8, '2017-04-01 01:39:29', '2017-04-01 02:19:06'),
(3, 'Pauta Concierto de la Cuna a la Jungla', '1095', '500000', 0, '4.00', '0.00', '0.00', 'Adjunto solicitud en OT fisica.', '2017-03-31 00:00:00', '2017-04-29 00:00:00', 1, 5, 2, 8, '2017-04-01 02:01:04', '2017-04-01 02:01:04'),
(4, 'Pauta Cursos Abril', '1094', '1850000', 0, '8.00', '0.00', '0.00', '7 amplificaciones de post', '2017-04-05 00:00:00', '2017-05-01 00:00:00', 1, 5, 2, 8, '2017-04-01 03:01:41', '2017-04-01 03:01:41');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `planeacion_fases`
--

INSERT INTO `planeacion_fases` (`id`, `nombre`, `planeacion_tipos_id`, `estado`, `created_at`, `updated_at`) VALUES
(1, 'Levantamiento Requerimientos', 1, 0, '2017-03-31 22:32:19', '2017-03-31 22:32:19'),
(2, 'Desarrollo/Maquetado', 2, 0, '2017-03-31 22:32:19', '2017-03-31 22:32:19'),
(3, 'Calidad y pruebas Desarrollo', 3, 0, '2017-03-31 22:32:19', '2017-03-31 22:32:19'),
(4, 'Publicacion', 4, 0, '2017-03-31 22:32:19', '2017-03-31 22:32:19'),
(5, 'Implementación de Pauta', 5, 0, '2017-04-01 02:42:54', '2017-04-01 02:42:54');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `planeacion_tipos`
--

INSERT INTO `planeacion_tipos` (`id`, `nombre`, `descripcion`, `estado`, `created_at`, `updated_at`) VALUES
(1, 'Planeacion', NULL, 0, '2017-03-31 22:32:19', '2017-03-31 22:32:19'),
(2, 'Desarrollo', NULL, 0, '2017-03-31 22:32:19', '2017-03-31 22:32:19'),
(3, 'Calidad', NULL, 0, '2017-03-31 22:32:19', '2017-03-31 22:32:19'),
(4, 'Publicacion', NULL, 0, '2017-03-31 22:32:19', '2017-03-31 22:32:19'),
(5, 'Paid Media Display - Paid Media Facebook', NULL, 0, '2017-04-01 02:42:08', '2017-04-01 02:42:08');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `requerimientos_ots`
--

CREATE TABLE IF NOT EXISTS `requerimientos_ots` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(55) COLLATE utf8_unicode_ci NOT NULL,
  `horas` decimal(15,2) NOT NULL,
  `areas_id` int(10) unsigned NOT NULL,
  `ots_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `requerimientos_ots_areas_id_foreign` (`areas_id`),
  KEY `requerimientos_ots_ots_id_foreign` (`ots_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `requerimientos_ots`
--

INSERT INTO `requerimientos_ots` (`id`, `nombre`, `horas`, `areas_id`, `ots_id`, `created_at`, `updated_at`) VALUES
(1, 'Realizar 8 amplificaciones de post', '2.00', 5, 1, '2017-04-01 00:46:54', '2017-04-01 00:46:54'),
(2, 'Amplificar post', '4.00', 1, 2, '2017-04-01 01:39:29', '2017-04-01 02:19:06'),
(3, 'Amplificación de 6 Post', '4.00', 5, 3, '2017-04-01 02:01:04', '2017-04-01 02:01:04'),
(4, 'Amplificar post', '4.00', 5, 2, '2017-04-01 02:19:06', '2017-04-01 02:19:06'),
(5, '7 amplificaciones de Post', '8.00', 5, 4, '2017-04-01 03:01:41', '2017-04-01 03:01:41');

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
(4, 4),
(5, 4),
(6, 4),
(7, 4),
(9, 4);

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
  `nombre_tarea` varchar(85) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_entrega_area` datetime DEFAULT NULL,
  `fecha_entrega_cuentas` datetime DEFAULT NULL,
  `descripcion` varchar(2024) COLLATE utf8_unicode_ci NOT NULL,
  `enlaces_externos` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=25 ;

--
-- Volcado de datos para la tabla `tareas`
--

INSERT INTO `tareas` (`id`, `nombre_tarea`, `fecha_entrega_area`, `fecha_entrega_cuentas`, `descripcion`, `enlaces_externos`, `tiempo_estimado`, `tiempo_real`, `tiempo_mapa_cliente`, `fecha_entrega_cliente`, `estados_id`, `areas_id`, `usuarios_id`, `ots_id`, `planeacion_fases_id`, `encargado_id`, `prioridad_id`, `estado_trafico_id`, `comentario_trafico`, `created_at`, `updated_at`) VALUES
(1, 'Pauta Descuento Droguerías - Gif días de descuento por iniciar mes ', NULL, NULL, 'Inverisión Neta: $70.000 el 31 de marzo', '', NULL, NULL, NULL, '2017-04-01 00:00:00', 7, 5, 1, 1, 1, 5, 11, NULL, NULL, '2017-04-01 00:52:49', '2017-04-01 00:52:49'),
(2, 'Pauta Tennis de campo', NULL, NULL, 'Inversión neta $280.000 del 3 al 17 de abril', '', NULL, NULL, '4.00', '2017-04-03 00:00:00', 7, 5, 10, 2, 4, 5, 11, NULL, NULL, '2017-04-01 01:51:06', '2017-04-01 01:51:06'),
(3, 'Pauta Tennis de campo', NULL, NULL, 'Inversión neta $280.000 del 3 al 17 de abril', NULL, NULL, NULL, '4.00', '2017-04-03 00:00:00', 7, 5, 10, 2, 4, 5, 11, NULL, NULL, '2017-04-01 01:54:38', '2017-04-01 01:54:38'),
(4, 'Pauta Descuento Droguerías - Gif días de descuento por iniciar mes ', NULL, NULL, 'Inverisión Neta: $70.000 el 31 de marzo', '', NULL, NULL, NULL, '2017-03-31 00:00:00', 7, 5, 10, 1, 4, 5, 11, NULL, NULL, '2017-04-01 02:05:52', '2017-04-01 02:05:52'),
(5, 'Pauta concierto de la cuna a la jungla - Cali', NULL, NULL, 'Inversión neta:$105.000  pauta del 12 al 29 de abril', '', NULL, NULL, NULL, '2017-04-12 00:00:00', 7, 5, 11, 3, 1, 5, 12, NULL, NULL, '2017-04-01 02:05:54', '2017-04-01 02:05:54'),
(6, 'Pauta Descuento Droguerías - Pieza HOY 10% de descuento', NULL, NULL, 'Pauta Descuento Droguerías - Pieza HOY 10% de descuento', '', NULL, NULL, NULL, '2017-03-31 00:00:00', 7, 5, 10, 1, 4, 5, 11, NULL, NULL, '2017-04-01 02:12:33', '2017-04-01 02:12:33'),
(7, 'Pauta Descuento Droguerías - Gif que Anuncie descuento 15 de abril', NULL, NULL, 'Inverisión Neta: $49.000 el 6 y 7 de abril', '', NULL, NULL, NULL, '2017-04-06 00:00:00', 7, 5, 10, 1, 4, 5, 11, NULL, NULL, '2017-04-01 02:25:38', '2017-04-01 02:25:38'),
(8, 'Pauta Descuento Droguerías - Pieza HOY 10% de descuento', NULL, NULL, 'Inverisión Neta: $35.000, pauta solo el 8 de abril', NULL, NULL, NULL, NULL, '2017-04-08 00:00:00', 7, 5, 10, 1, 4, 5, 11, NULL, NULL, '2017-04-01 02:27:52', '2017-04-01 02:27:52'),
(9, 'Pauta Descuento Droguerías - Gif que Anuncie descuento 15 de abril', NULL, NULL, 'Inversión Neta: $35.000, el 13 y 14 de abril. ', '', NULL, NULL, NULL, '2017-04-13 00:00:00', 7, 5, 10, 1, 4, 5, 12, NULL, NULL, '2017-04-01 02:30:14', '2017-04-01 02:30:14'),
(10, 'Pauta Descuento Droguerías - Pieza HOY 10% de descuento', NULL, NULL, 'Inverisión Neta: $35.000 para pauta solo el 15 de abril', NULL, NULL, NULL, NULL, '2017-04-15 00:00:00', 7, 5, 10, 1, 4, 5, 12, NULL, NULL, '2017-04-01 02:31:20', '2017-04-01 02:31:20'),
(11, 'Pauta Descuento Droguerías - Gif que Anuncie descuento este 15 de abril)', NULL, NULL, 'Inverisión Neta: $49.000 el 20 y 21 de abril', NULL, NULL, NULL, NULL, '2017-04-20 00:00:00', 7, 5, 10, 1, 4, 5, 12, NULL, NULL, '2017-04-01 02:32:19', '2017-04-01 02:32:19'),
(12, 'Pauta concierto de la cuna a la jungla - Buga', NULL, NULL, 'Inversión neta: $70.000  pauta del 12 al 29 de abril.', '', NULL, NULL, NULL, '2017-04-12 00:00:00', 7, 5, 1, 3, 4, 5, 13, NULL, NULL, '2017-04-01 02:38:59', '2017-04-01 02:38:59'),
(13, 'Pauta concierto de la cuna a la jungla - Tuluá', NULL, NULL, 'Inversión neta: $70.000  pauta del 12 al 29 de abril.', '', NULL, NULL, NULL, '2017-04-12 00:00:00', 7, 5, 1, 3, 5, 5, 13, NULL, NULL, '2017-04-01 02:46:27', '2017-04-01 02:46:27'),
(14, 'Pauta concierto de la cuna a la jungla - Cartago', NULL, NULL, 'Inversión neta: $70.000  pauta del 12 al 29 de abril', NULL, NULL, NULL, NULL, '2017-04-12 00:00:00', 7, 5, 1, 3, 5, 5, 12, NULL, NULL, '2017-04-01 02:48:12', '2017-04-01 02:48:12'),
(15, 'Pauta Descuento Droguerías - Pieza HOY 10% de descuento', NULL, NULL, 'Inverisión Neta: $35.000 para pauta solo el 22 de abril', NULL, NULL, NULL, NULL, '2017-04-22 00:00:00', 7, 5, 10, 1, 4, 5, 12, NULL, NULL, '2017-04-01 02:49:54', '2017-04-01 02:49:54'),
(16, 'Informe Resultados Pauta descuentos Droguerìas', NULL, NULL, 'Informe Resultados Pauta descuentos Droguerías', NULL, NULL, NULL, NULL, '2017-04-25 00:00:00', 7, 5, 10, 1, 4, 5, 12, NULL, NULL, '2017-04-01 02:50:50', '2017-04-01 02:50:50'),
(17, 'Pauta concierto de la cuna a la jungla - Buenaventura', NULL, NULL, 'Inversión neta:$35.000  pauta del 12 al 29 de abril', NULL, NULL, NULL, NULL, '2017-04-12 00:00:00', 7, 5, 1, 3, 5, 5, 12, NULL, NULL, '2017-04-01 02:51:06', '2017-04-01 02:51:06'),
(18, 'Pauta cursos Cali Abril - Preparación a base de cafe', NULL, NULL, 'Fecha de pauta:10 al 24 de abril\nInversión:$140.000 \nCiudad de pauta :  Cali\nPublico objetivos: mujeres y hombres jóvenes con niños entre 25 y 45 años.', '', NULL, NULL, NULL, '2017-04-10 00:00:00', 7, 5, 10, 4, 5, 5, 11, NULL, NULL, '2017-04-01 03:22:20', '2017-04-01 03:22:20'),
(19, 'Pauta cursos Cali Abril Automaquillaje', NULL, NULL, 'Fecha de pauta: 5 al 17 de abril\nInversión de pauta:$175.000', NULL, NULL, NULL, NULL, '2017-04-05 00:00:00', 7, 5, 10, 4, 5, 5, 11, NULL, NULL, '2017-04-01 03:23:46', '2017-04-01 03:23:46'),
(20, 'Pauta cursos Cali Abril Decoración y extensión de uñas', NULL, NULL, 'Fecha de pauta: 24 de abril  al 4 de mayo\nInversión de pauta:$175.000', NULL, NULL, NULL, NULL, '2017-04-24 00:00:00', 7, 5, 10, 4, 5, 5, 11, NULL, NULL, '2017-04-01 03:25:34', '2017-04-01 03:25:34'),
(21, 'Pauta cursos Cali Abril Decoración de fiestas temáticas', NULL, NULL, 'MB: Fecha de pauta:17 al 30 de abril\nInversión:189.000', NULL, NULL, NULL, NULL, '2017-04-17 00:00:00', 7, 5, 10, 4, 5, 5, 11, NULL, NULL, '2017-04-01 03:26:18', '2017-04-01 03:26:18'),
(22, 'Pauta cursos Cali Abril - Excel avanzado, oficce básico, tablas dinámicas', NULL, NULL, 'Fecha de pauta: 25 de abril a 6 de mayo\nInversión:$280.000', NULL, NULL, NULL, NULL, '2017-04-25 00:00:00', 7, 5, 10, 4, 5, 5, 12, NULL, NULL, '2017-04-01 03:28:57', '2017-04-01 03:28:57'),
(23, 'Pauta cursos Cali Abril - Secretariado sistematizado contable', NULL, NULL, 'Fecha de pauta: 1  al 21 de mayo \nInversión:$126.000', NULL, NULL, NULL, NULL, '2017-05-01 00:00:00', 7, 5, 10, 4, 5, 5, 12, NULL, NULL, '2017-04-01 03:30:01', '2017-04-01 03:30:01'),
(24, 'Pauta cursos Cali Abril - Cocina mexicana', NULL, NULL, 'Fecha de pauta:1 a 11 de mayo\nInversión: $210.000', NULL, NULL, NULL, NULL, '2017-05-01 00:00:00', 7, 5, 10, 4, 5, 5, 12, NULL, NULL, '2017-04-01 03:30:47', '2017-04-01 03:30:47');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `tiempos_x_area`
--

INSERT INTO `tiempos_x_area` (`id`, `tiempo_estimado_ot`, `tiempo_real`, `tiempo_extra`, `ots_id`, `areas_id`, `created_at`, `updated_at`) VALUES
(1, '2.00', '0.00', '0.00', 1, 5, '2017-04-01 00:46:54', '2017-04-01 00:46:54'),
(2, '4.00', '0.00', '0.00', 2, 1, '2017-04-01 01:39:29', '2017-04-01 02:19:06'),
(3, '4.00', '0.00', '0.00', 3, 5, '2017-04-01 02:01:04', '2017-04-01 02:01:04'),
(4, '4.00', '0.00', '0.00', 2, 5, '2017-04-01 02:19:06', '2017-04-01 02:19:06'),
(5, '8.00', '0.00', '0.00', 4, 5, '2017-04-01 03:01:41', '2017-04-01 03:01:41');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `tipos_compras`
--

INSERT INTO `tipos_compras` (`id`, `nombre`, `estado`, `created_at`, `updated_at`) VALUES
(1, 'Pauta', 1, '2017-03-31 22:32:19', '2017-03-31 22:32:19'),
(2, 'Hosting', 1, '2017-03-31 22:32:19', '2017-03-31 22:32:19'),
(3, 'Plugin', 1, '2017-03-31 22:32:19', '2017-03-31 22:32:19'),
(4, 'B. Imagenes', 1, '2017-03-31 22:32:19', '2017-03-31 22:32:19');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=12 ;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `nombre`, `apellido`, `cargo`, `telefono`, `email`, `estado`, `horas_disponible`, `horas_gastadas`, `api_token`, `password`, `remember_token`, `fecha_nacimiento`, `img_perfil`, `roles_id`, `areas_id`, `created_at`, `updated_at`) VALUES
(1, 'Maria Isabel', 'Himalaya', 'Proyect Owner', '1111111', 'miastorquiza@himalayada.com', 1, '120.00', '0.00', '3NgB9hKrA53Bwg7Vy8x29NVhTwFys0g7dsJsslZqRRr1SmsNInvqSmV11r3i', '$2y$10$iN7ULC2BxHSC7a5wbaQVtuKMASp2lRQURxd3drktnVGAqPLmnQS0u', 'zdN9KeodXzIQBe4Nw6AIlnvJ1IWKoFeDpNpPDPk01u9KSiYe492CeizIPe6c', '2017-01-01', NULL, 1, 6, '2017-03-31 22:32:19', '2017-04-03 01:39:49'),
(2, 'Marcela ', 'Benavides', 'Ejecutiva de cuenta', '3799189', 'mbenavides@himalayada.com', 1, '160.00', '0.00', 'ERwuAYETA9EUs0rMgsMlsbIwRPZ2Pf2yqyMD69T7iSiTeIRgb8Tg7wofCdpv', '$2y$10$2SolpOvJWaSYVgMQodzOPuzJOpAejhsydBthHX98f6MJxGIISmxAq', 'bhShAMT0WfrIxIb8lSNUBoSSf5vaUpGSP6fi0MmY5Wse4HObbf1wHpwyQhGG', '1989-01-12', NULL, 3, 6, '2017-04-01 00:06:37', '2017-04-01 00:06:37'),
(3, ' Maria Andrea', 'Ramirez', 'New Bussines', '3799180', 'mramirez@himalayada.com', 1, '160.00', '0.00', 'Q7rxu2DcDoryMNJ60wGTx60wYJhzOk51tWk87thqIKEllsS6ufFPcnknjDda', '$2y$10$BCkvGoqlTWd6hpoHmmGwkOX8xX3Ets1xYwTN.xY9T7pvR1Ol5E85C', 'S5LySw4VsLZOy2aUmlKAg4kratqWhXkoCZlPc9avqTowyZqNn0Lbrtw3JcLf', '1995-04-13', NULL, 3, 6, '2017-04-01 00:09:29', '2017-04-01 00:09:29'),
(4, 'Jose', 'Díaz', 'Director Creativo', '3799180', 'jdiaz@himalayada.com', 1, '160.00', '0.00', 'GwbXB4sqIiOUuxOL1dStShj0vcdIF2AKKY281QOUcm38H1xrwTHdWM45J23A', '$2y$10$qrJtAjAmZMq.QSYaYsuxzezTqK/JmgRnEAeSramLboJtInRzVFQj2', 'cW32l4QlfGD05OiDua55X97VSC4dDe90bWH4ViQACER0JDYV3Nx40gMzEV6d', '1996-12-11', NULL, 4, 1, '2017-04-01 00:11:52', '2017-04-01 00:11:52'),
(5, 'Nestor', 'Sepúlveda', 'SEM Performance Manager', '3799180', 'nsepuelveda@himalayada.com', 1, '160.00', '0.00', 'RuvvNWFbO0DvZIbQuMgwTcrbN08FvfaWN9JAX5tTIXfOaOHOVi3ehxpoXQrf', '$2y$10$raWLNMqz3JW3gTu2lpeZ4.P96UWoIC4pNXlWuGop9yBbe7ieMtRWq', 'flj9IxJPfKvmjkG52B8dYi0XSiUQpFOAaxHL2R2GFZSxEaL19eWZWyC3yis2', '1997-02-14', NULL, 4, 5, '2017-04-01 00:14:24', '2017-04-01 00:14:24'),
(6, 'Luisa Fernanda', 'Carvajal', 'Encargada de Desarrollo', '3799180', 'lfcarvajal@himalayada.com', 1, '160.00', '0.00', 'bCtuZG3leZWgvpx7pBZCAtabkQnhDeZd5CbyZhOkYOMLAf7mbfhF0NL4zt2V', '$2y$10$2O2JgFd1F5.SH.unCjtMB.I1F9Vq8hp61EgzjWEc8cnHzewwXT6lG', '97pA63U782YqAKbFcP9KeEKoTECxFziM1nWen0I0opbngkwt0hDA6B7vR73q', '1997-08-05', NULL, 4, 3, '2017-04-01 00:16:07', '2017-04-01 00:16:07'),
(7, 'Leonardo', 'Rodriguez Mora', 'Encargado de Contenido Escrito', '3799180', 'lrodriguez@himalayada.com', 1, '160.00', '0.00', '8jPsmaUhBsSTKe325wtCC6N5JQhkCCm8gQMn6ge5s1oQxdPAYCKc4rwmGt4J', '$2y$10$.p8Ikli/PiMGEzNYsCkXTe1lL9RIVwQVKu/b/opkn/AKUd5zJ9Xeu', 'DYsJNoCgMgXKnHYHI3SfHGafvmDqjzdq8zdhPyvB1iPSGtQLxLCiwKAlRv5A', '1996-08-06', NULL, 4, 4, '2017-04-01 00:18:46', '2017-04-01 00:18:46'),
(8, 'Desarrollo', 'Himalaya', 'Tester', '', 'soporte@himalayada.com', 2, '0.00', '0.00', 'wFIbQsjOHYrgFPq1DHu3UkEmItjvxEBYrDuBcMTvOVnQXwdU2GxPP1NhEjMI', '$2y$10$PHrpsY5IWOevdO8fu2zjF.tFEHBdYV3tcAxmKqgPah8f0PMEUCmX.', 'woJdzmR4Q6zwBU5yQQWcftLXgXdzQk4BdziSE0hl381Vikc8fomYwaN0PFWL', '1999-01-01', NULL, 2, 3, '2017-04-01 00:20:29', '2017-04-03 17:46:22'),
(9, 'Andres Fabian', 'Mabesoy Jimenez', 'Encargado de Diseño', '3799180', 'afmabesoy@himalayada.com', 1, '160.00', '0.00', 'W5mQJidqz3LufqDiuW0kTRlMGeBpOqLBC6n4YCpFP6GSGdiDEYJqC1AWxI4h', '$2y$10$ScofXNXbRDoTVCEZC80dquuJXmLy8XOSVlUVx.LZOP0BZAZFUA6GG', 'NymtGRzTOh8YCkuGFsuMYEOjmIOpS3YoFFlLNohzCWYayzJFWG21RJeQb2qd', '1996-04-18', NULL, 4, 2, '2017-04-01 00:21:13', '2017-04-01 00:21:13'),
(10, 'Silvia', 'Salamanca', 'Ejecutiva de cuentas', '39057069', 'ssalamanca@himalayada.com', 1, '160.00', '0.00', '89lN0Tdo9WSxKOhYATwGiZWLfX4HltT9OeVOgCtQifD8IsHXlSh2pWbulLWg', '$2y$10$Spb8Hb1Nq2INVSDkvYi1S.1vPNamZrWCpv4dVAkApY8Tuewsk.bpG', '0jNzVnVznsj40chtfmE3ECqvFrBpLPS1dRrAcDWMOVsueF2BrkEJwrGRniUH', '1986-10-07', NULL, 3, 6, '2017-04-01 00:29:41', '2017-04-01 04:02:04'),
(11, 'Andrea', 'Martinez Satizabal', 'Ejecutiva de Cuentas', '3799180', 'bamartinez@himalayada.com', 1, '160.00', '0.00', 'HUymwZan0aN6aBEFVVvajMHfU9WfyUXeBO82WU8alkG9ITgWY0aEyEhf9jzq', '$2y$10$4W50sYVU6WmVqP6cCRu.G.QNg0ROL2LEil.LDz4tatZVGLUe.mirC', 'o3xAcVYkdPmGB5xjzU3M1TkuCJAEoQPGMoEECAo2Yor6KyKfg1RApCXEpZzq', '1987-11-19', NULL, 3, 6, '2017-04-01 01:49:57', '2017-04-02 08:15:11');

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
