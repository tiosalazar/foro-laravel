-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-02-2017 a las 14:12:17
-- Versión del servidor: 10.1.10-MariaDB
-- Versión de PHP: 5.6.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `foro_2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `areas`
--

CREATE TABLE `areas` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `extencion_tel` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `horas_consumidas` decimal(15,3) NOT NULL DEFAULT '0.000',
  `estado` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `areas`
--

INSERT INTO `areas` (`id`, `nombre`, `extencion_tel`, `horas_consumidas`, `estado`, `created_at`, `updated_at`) VALUES
(1, 'Creatividad', '0551', '0.000', 1, '2017-02-23 02:57:16', '2017-02-23 02:57:16'),
(2, 'Diseño', '0581', '22.000', 1, '2017-02-23 02:57:16', '2017-02-23 03:44:31'),
(3, 'Desarrollo', '81', '0.000', 1, '2017-02-23 02:57:16', '2017-02-23 02:57:16'),
(4, 'Contenidos', '0281', '0.000', 1, '2017-02-23 02:57:16', '2017-02-23 02:57:16'),
(5, 'Digital Performance', '0581', '0.000', 1, '2017-02-23 02:57:16', '2017-02-23 02:57:16'),
(6, 'Cuentas', '0581', '0.000', 1, '2017-02-23 02:57:16', '2017-02-23 02:57:16'),
(7, 'Soporte', '07881', '0.000', 1, '2017-02-23 02:57:16', '2017-02-23 02:57:16');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `nit` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(115) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telefono` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nombre_contacto` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `estado` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `nombre`, `nit`, `email`, `telefono`, `nombre_contacto`, `estado`, `created_at`, `updated_at`) VALUES
(1, 'Electrojaponesa', '12345678', NULL, NULL, 'Victoria', 1, '2017-02-23 02:57:16', '2017-02-23 02:57:16'),
(2, 'Adeinco', '12345678', NULL, NULL, 'Pablo', 1, '2017-02-23 02:57:16', '2017-02-23 02:57:16'),
(3, 'Calzatodo', '12345678', NULL, NULL, 'Santiago', 1, '2017-02-23 02:57:16', '2017-02-23 02:57:16'),
(4, 'Himalaya', '87654321', NULL, NULL, 'M. Isabel', 1, '2017-02-23 02:57:16', '2017-02-23 02:57:16'),
(5, 'Pastas la Muñeca', '25472-6', 'contacto@lamuneca.com', '8280365', 'Brian Steven Caldas', 1, '2017-02-23 03:11:11', '2017-02-23 03:11:11'),
(6, 'Comfandi - Corporativo', '124676879898909', '', '', 'Juliana García', 1, '2017-02-23 18:51:23', '2017-02-23 18:51:23'),
(7, 'Comfandi - Vallempresa365', '2739275940568', '', '', 'Juliana García', 1, '2017-02-23 18:54:00', '2017-02-23 18:54:00'),
(8, 'Comfandi - Centro de Empleo', '30480956956677', '', '', 'Juliana García', 1, '2017-02-23 18:54:44', '2017-02-23 18:54:44');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios`
--

CREATE TABLE `comentarios` (
  `id` int(10) UNSIGNED NOT NULL,
  `comentarios` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `usuarios_comentario_id` int(10) UNSIGNED NOT NULL,
  `tareas_id` int(10) UNSIGNED NOT NULL,
  `estados_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `comentarios`
--

INSERT INTO `comentarios` (`id`, `comentarios`, `usuarios_comentario_id`, `tareas_id`, `estados_id`, `created_at`, `updated_at`) VALUES
(1, 'No estaba completa la ruta del servidor', 6, 2, 4, '2017-02-23 03:21:49', '2017-02-23 03:21:49'),
(2, 'Trabaja pues perrito', 5, 1, 3, '2017-02-23 03:21:50', '2017-02-23 03:21:50'),
(3, 'Esto esta mal !!', 7, 1, 5, '2017-02-23 03:25:00', '2017-02-23 03:25:00'),
(4, 'Ehh que trabajes omeee !!', 5, 1, 3, '2017-02-23 03:29:40', '2017-02-23 03:29:40'),
(5, 'Ehh que trabajes omeee !!', 5, 1, 3, '2017-02-23 03:30:47', '2017-02-23 03:30:47'),
(6, 'Esta tarea queda realizada', 7, 1, 2, '2017-02-23 03:31:51', '2017-02-23 03:31:51'),
(7, 'Esta tarea queda realizada', 7, 1, 2, '2017-02-23 03:32:00', '2017-02-23 03:32:00'),
(8, '', 7, 1, 2, '2017-02-23 03:32:49', '2017-02-23 03:32:49'),
(9, '', 7, 1, 2, '2017-02-23 03:32:56', '2017-02-23 03:32:56'),
(10, '', 7, 1, 5, '2017-02-23 03:33:02', '2017-02-23 03:33:02'),
(11, 'lero lero !!', 5, 1, NULL, '2017-02-23 03:37:50', '2017-02-23 03:37:50'),
(12, 'fgdfgdf', 5, 1, 1, '2017-02-23 03:38:31', '2017-02-23 03:38:31'),
(13, 'Joder hace eso rápido !!', 5, 3, 3, '2017-02-23 03:40:15', '2017-02-23 03:40:15'),
(14, 'Queda tarea realizada', 7, 3, 2, '2017-02-23 03:41:27', '2017-02-23 03:41:27'),
(15, 'Esta todo en ok', 3, 1, NULL, '2017-02-23 03:42:20', '2017-02-23 03:42:20'),
(16, 'DSO quedo tarea OK', 5, 3, 1, '2017-02-23 03:44:31', '2017-02-23 03:44:31'),
(17, 'Se paso a programado', 6, 4, 3, '2017-02-23 03:45:00', '2017-02-23 03:45:00'),
(18, 'Subile a las horitas pues !!', 5, 4, NULL, '2017-02-23 03:46:02', '2017-02-23 03:46:02'),
(19, 'Se pasa a Programado', 1, 5, NULL, '2017-02-24 00:16:53', '2017-02-24 00:16:53');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras_ots`
--

CREATE TABLE `compras_ots` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(110) COLLATE utf8_unicode_ci DEFAULT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `provedor` varchar(110) COLLATE utf8_unicode_ci NOT NULL,
  `valor` varchar(110) COLLATE utf8_unicode_ci NOT NULL,
  `ots_id` int(10) UNSIGNED NOT NULL,
  `areas_id` int(10) UNSIGNED NOT NULL,
  `tipos_compras_id` int(10) UNSIGNED NOT NULL,
  `divisas_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `compras_ots`
--

INSERT INTO `compras_ots` (`id`, `nombre`, `descripcion`, `provedor`, `valor`, `ots_id`, `areas_id`, `tipos_compras_id`, `divisas_id`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Hosting para subir la landing', 'HostDime', '200000', 1, 3, 2, 1, '2017-02-23 03:14:47', '2017-02-23 03:14:47');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `divisas`
--

CREATE TABLE `divisas` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `tasa_conversion` decimal(6,4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `divisas`
--

INSERT INTO `divisas` (`id`, `nombre`, `tasa_conversion`, `created_at`, `updated_at`) VALUES
(1, 'Pesos', NULL, '2017-02-23 02:57:16', '2017-02-23 02:57:16'),
(2, 'Dolares', NULL, '2017-02-23 02:57:16', '2017-02-23 02:57:16'),
(3, 'Euros', NULL, '2017-02-23 02:57:16', '2017-02-23 02:57:16');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados`
--

CREATE TABLE `estados` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `tipos_estados_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `estados`
--

INSERT INTO `estados` (`id`, `nombre`, `tipos_estados_id`, `created_at`, `updated_at`) VALUES
(1, 'OK', 1, '2017-02-23 02:57:16', '2017-02-23 02:57:16'),
(2, 'Realizado', 1, '2017-02-23 02:57:16', '2017-02-23 02:57:16'),
(3, 'Programado', 1, '2017-02-23 02:57:17', '2017-02-23 02:57:17'),
(4, 'Atención Cuentas', 1, '2017-02-23 02:57:17', '2017-02-23 02:57:17'),
(5, 'Atención Área', 1, '2017-02-23 02:57:17', '2017-02-23 02:57:17'),
(6, 'Espera', 1, '2017-02-23 02:57:17', '2017-02-23 02:57:17'),
(7, 'Pendiente', 1, '2017-02-23 02:57:17', '2017-02-23 02:57:17'),
(8, 'On Going', 2, '2017-02-23 02:57:17', '2017-02-23 02:57:17'),
(9, 'En espera', 2, '2017-02-23 02:57:17', '2017-02-23 02:57:17'),
(10, 'Alta', 3, '2017-02-23 02:57:17', '2017-02-23 02:57:17'),
(11, 'Media', 3, '2017-02-23 02:57:17', '2017-02-23 02:57:17'),
(12, 'Baja', 3, '2017-02-23 02:57:17', '2017-02-23 02:57:17');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados_x_roles`
--

CREATE TABLE `estados_x_roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `estados_id` int(10) UNSIGNED NOT NULL,
  `roles_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
(8, 1, 2),
(9, 2, 2),
(10, 3, 2),
(11, 4, 2),
(12, 5, 2),
(13, 6, 2),
(14, 7, 2),
(15, 5, 3),
(16, 6, 3),
(17, 7, 3),
(18, 1, 4),
(19, 2, 4),
(20, 3, 4),
(21, 4, 4),
(22, 2, 5),
(23, 5, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historicos_ots`
--

CREATE TABLE `historicos_ots` (
  `id` int(10) UNSIGNED NOT NULL,
  `ots_id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `referencia` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `valor` varchar(55) COLLATE utf8_unicode_ci NOT NULL,
  `fee` tinyint(4) NOT NULL,
  `horas_totales` decimal(5,2) NOT NULL,
  `horas_disponibles` decimal(5,2) NOT NULL,
  `total_horas_extra` decimal(5,2) DEFAULT NULL,
  `observaciones` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `requerimientos_ot` varchar(2050) COLLATE utf8_unicode_ci NOT NULL,
  `compras_ot` varchar(2050) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_inicio` datetime NOT NULL,
  `fecha_final` datetime NOT NULL,
  `clientes_id` int(10) UNSIGNED NOT NULL,
  `usuarios_id` int(10) UNSIGNED NOT NULL,
  `estados_id` int(10) UNSIGNED NOT NULL,
  `editor_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historico_tareas`
--

CREATE TABLE `historico_tareas` (
  `id` int(10) UNSIGNED NOT NULL,
  `tiempo_estimado` decimal(5,3) DEFAULT NULL,
  `tiempo_real` decimal(5,3) DEFAULT NULL,
  `comentarios_id` int(11) NOT NULL,
  `encargado_id` int(11) DEFAULT NULL,
  `estados_id` int(11) DEFAULT NULL,
  `usuarios_id` int(10) UNSIGNED NOT NULL,
  `tareas_id` int(10) UNSIGNED NOT NULL,
  `editor_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `historico_tareas`
--

INSERT INTO `historico_tareas` (`id`, `tiempo_estimado`, `tiempo_real`, `comentarios_id`, `encargado_id`, `estados_id`, `usuarios_id`, `tareas_id`, `editor_id`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, 1, 3, 4, 3, 2, 6, '2017-02-23 03:21:50', '2017-02-23 03:21:50'),
(2, '10.000', NULL, 2, 7, 3, 3, 1, 5, '2017-02-23 03:21:51', '2017-02-23 03:21:51'),
(3, '10.000', NULL, 3, 5, 5, 3, 1, 7, '2017-02-23 03:25:01', '2017-02-23 03:25:01'),
(4, '10.000', NULL, 4, 5, 3, 3, 1, 5, '2017-02-23 03:29:40', '2017-02-23 03:29:40'),
(5, '10.000', NULL, 5, 7, 3, 3, 1, 5, '2017-02-23 03:30:48', '2017-02-23 03:30:48'),
(6, '10.000', '8.000', 8, 7, 2, 3, 1, 7, '2017-02-23 03:32:49', '2017-02-23 03:32:49'),
(7, '10.000', '8.000', 9, 7, 2, 3, 1, 7, '2017-02-23 03:32:56', '2017-02-23 03:32:56'),
(8, '10.000', '8.000', 10, 7, 2, 3, 1, 7, '2017-02-23 03:33:02', '2017-02-23 03:33:02'),
(9, '10.000', '8.000', 11, 7, 2, 3, 1, 5, '2017-02-23 03:37:50', '2017-02-23 03:37:50'),
(10, '10.000', '8.000', 12, 7, 1, 3, 1, 5, '2017-02-23 03:38:31', '2017-02-23 03:38:31'),
(11, '15.000', NULL, 13, 7, 3, 3, 3, 5, '2017-02-23 03:40:16', '2017-02-23 03:40:16'),
(12, '15.000', '14.000', 14, 7, 2, 3, 3, 7, '2017-02-23 03:41:27', '2017-02-23 03:41:27'),
(13, '10.000', '8.000', 15, 7, 1, 3, 1, 3, '2017-02-23 03:42:20', '2017-02-23 03:42:20'),
(14, '15.000', '14.000', 16, 7, 1, 3, 3, 5, '2017-02-23 03:44:32', '2017-02-23 03:44:32'),
(15, '16.000', NULL, 17, 8, 3, 3, 4, 6, '2017-02-23 03:45:01', '2017-02-23 03:45:01'),
(16, '16.000', NULL, 18, 8, 3, 3, 4, 5, '2017-02-23 03:46:02', '2017-02-23 03:46:02'),
(17, NULL, NULL, 19, 6, 7, 1, 5, 1, '2017-02-24 00:16:53', '2017-02-24 00:16:53');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(170, '2014_10_12_000000_create_users_table', 1),
(171, '2014_10_12_100000_create_password_resets_table', 1),
(172, '2017_01_20_185313_create_tipos_estados_table', 1),
(173, '2017_01_20_185339_create_trafico_tareas_table', 1),
(174, '2017_01_20_185353_create_estados_table', 1),
(175, '2017_01_20_185403_create_clientes_table', 1),
(176, '2017_01_20_185416_create_areas_table', 1),
(177, '2017_01_20_185450_create_ots_table', 1),
(178, '2017_01_20_185547_create_tiempos_x_area_table', 1),
(179, '2017_01_20_185556_create_tareas_table', 1),
(180, '2017_01_20_185609_create_comentarios_table', 1),
(181, '2017_01_20_185630_create_historico_tareas_table', 1),
(182, '2017_01_20_185655_create_historico_ots_table', 1),
(183, '2017_01_20_185728_create_tipos_compras_table', 1),
(184, '2017_01_20_185739_create_divisas_table', 1),
(185, '2017_01_20_185749_create_compras_ots_table', 1),
(186, '2017_01_30_225156_tipos_planeacion', 1),
(187, '2017_01_30_225224_fases_planeacion', 1),
(188, '2017_02_02_180636_entrust_setup_tables', 1),
(189, '2017_02_02_223414_create_requerimientos_ots', 1),
(190, '2017_02_15_032207_create_notifications_table', 1),
(191, '2017_02_21_170755_estados_x_roles_table', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `notifiable_id` int(10) UNSIGNED NOT NULL,
  `notifiable_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_id`, `notifiable_type`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('07833198-b8a8-48bc-ab6b-edfd47619f8f', 'App\\Notifications\\TareaProgramada', 5, 'App\\User', '{"id_tarea":1,"nombre":"Coordinador 1","cargo":"Coordinador Dise\\u00f1o","descripcion":"Coordinador 1 ha programado la Tarea: Dise\\u00f1o de la landing page","created_at":"2017-02-22 22:29:40","img_perfil":"\\/images\\/avatars\\/Coordinador1_5.png","link":"\\/ver_tarea\\/1"}', '2017-02-23 03:30:00', '2017-02-23 03:29:40', '2017-02-23 03:30:00'),
('09324ba8-89f5-48e0-af5c-d6450d86a71e', 'App\\Notifications\\TareaCreada', 6, 'App\\User', '{"id_tarea":2,"nombre":"Ejecutiva 1","cargo":"Ejecutiva","descripcion":"Ejecutiva 1 cre\\u00f3 la Tarea: Maquetado de la web","created_at":"2017-02-22 22:20:38","img_perfil":"\\/images\\/avatars\\/Ejecutiva1_3.png","link":"\\/ver_tarea\\/2"}', '2017-02-23 03:20:50', '2017-02-23 03:20:38', '2017-02-23 03:20:50'),
('165bc46e-5009-4ee6-9aed-37e1de7e502a', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":3,"nombre":"Ejecutiva 1","cargo":"Ejecutiva","descripcion":"Ejecutiva 1 cre\\u00f3 la Tarea: Calidad de la pagina web en dise\\u00f1o","created_at":"2017-02-22 22:34:45","img_perfil":"\\/images\\/avatars\\/Ejecutiva1_3.png","link":"\\/ver_tarea\\/3"}', '2017-02-23 03:40:24', '2017-02-23 03:34:45', '2017-02-23 03:40:24'),
('17995202-2081-4f45-b56d-25b6764859b6', 'App\\Notifications\\TareaProgramada', 7, 'App\\User', '{"id_tarea":1,"nombre":"Coordinador 1","cargo":"Coordinador Dise\\u00f1o","descripcion":"Coordinador 1 ha programado la Tarea: Dise\\u00f1o de la landing page","created_at":"2017-02-22 22:21:51","img_perfil":"\\/images\\/avatars\\/Coordinador1_5.png","link":"\\/ver_tarea\\/1"}', '2017-02-23 03:22:00', '2017-02-23 03:21:51', '2017-02-23 03:22:00'),
('1b74cca1-f7d8-46c9-a7d5-6580fa844c39', 'App\\Notifications\\TareaAtencionArea', 5, 'App\\User', '{"id_tarea":1,"nombre":"Colaborador 1","cargo":"Colaborador Dise\\u00f1o","descripcion":"Colaborador 1 ha devuelto la Tarea: Dise\\u00f1o de la landing pagea Atenci\\u00f3n \\u00c1rea","created_at":"2017-02-22 22:25:01","img_perfil":"\\/images\\/avatars\\/Colaborador1_7.png","link":"\\/ver_tarea\\/1"}', '2017-02-23 03:25:44', '2017-02-23 03:25:01', '2017-02-23 03:25:44'),
('3057ca96-63bb-4b74-b2d6-7b35a39f3934', 'App\\Notifications\\OtExcedeTiempo', 3, 'App\\User', '{"id_tarea":1,"nombre":"Colaborador 1","cargo":"Colaborador Dise\\u00f1o","descripcion":"Pagina Adeinco ha excedido el tiempo asignado para el \\u00c1rea","created_at":"2017-02-22 22:41:27","img_perfil":"\\/images\\/avatars\\/Colaborador1_7.png","link":"\\/ots\\/visualizar\\/1"}', '2017-02-23 03:41:38', '2017-02-23 03:41:27', '2017-02-23 03:41:38'),
('39599dea-d6c2-4177-a69f-a7a831b86f75', 'App\\Notifications\\OtCreada', 1, 'App\\User', '{"id_tarea":1,"nombre":"Ejecutiva 1","cargo":"Ejecutiva","descripcion":"Ejecutiva 1 ha creado una OT con referencia: 123456, nombre : Pagina Adeinco y valor: 2000000","created_at":"2017-02-22 22:14:47","img_perfil":"\\/images\\/avatars\\/Ejecutiva1_3.png","link":"\\/ots\\/visualizar\\/1"}', '2017-02-23 03:15:15', '2017-02-23 03:14:47', '2017-02-23 03:15:15'),
('48ec222a-6fc2-40fe-8dd2-cfcebfa1858d', 'App\\Notifications\\TareaProgramada', 7, 'App\\User', '{"id_tarea":1,"nombre":"Coordinador 1","cargo":"Coordinador Dise\\u00f1o","descripcion":"Coordinador 1 ha programado la Tarea: Dise\\u00f1o de la landing page","created_at":"2017-02-22 22:30:48","img_perfil":"\\/images\\/avatars\\/Coordinador1_5.png","link":"\\/ver_tarea\\/1"}', '2017-02-23 03:31:26', '2017-02-23 03:30:48', '2017-02-23 03:31:26'),
('5019a863-d931-4be1-8306-1906d5c0433e', 'App\\Notifications\\TareaAtencionCuentas', 3, 'App\\User', '{"id_tarea":2,"nombre":"Coordinador 2","cargo":"Coordinador Desarrollo","descripcion":"Coordinador 2 ha devuelto la Tarea: Maquetado de la weba Atenci\\u00f3n Cuentas","created_at":"2017-02-22 22:21:50","img_perfil":null,"link":"\\/ver_tarea\\/2"}', '2017-02-23 03:22:00', '2017-02-23 03:21:50', '2017-02-23 03:22:00'),
('56e978b6-b9ee-468c-af7b-cda7da24eb36', 'App\\Notifications\\TareaRealizada', 5, 'App\\User', '{"id_tarea":3,"nombre":"Colaborador 1","cargo":"Colaborador Dise\\u00f1o","descripcion":"Colaborador 1 ha realizado la Tarea: Calidad de la pagina web en dise\\u00f1oen 14 Hrs","created_at":"2017-02-22 22:41:27","img_perfil":"\\/images\\/avatars\\/Colaborador1_7.png","link":"\\/ver_tarea\\/3"}', '2017-02-23 03:41:41', '2017-02-23 03:41:27', '2017-02-23 03:41:41'),
('5fbeb3c2-feb5-4c1b-8879-953b2ae65097', 'App\\Notifications\\OtCreada', 1, 'App\\User', '{"id_tarea":3,"nombre":"Maria Isabel","cargo":"Proyect Owner","descripcion":"Maria Isabel ha creado una OT con referencia: 0987-2, nombre : Fee de Acompa\\u00f1amiento de Agencia V365 y valor: 8500000","created_at":"2017-02-23 15:10:21","img_perfil":null,"link":"\\/ots\\/visualizar\\/3"}', NULL, '2017-02-23 20:10:21', '2017-02-23 20:10:21'),
('709f118b-731e-466b-8dc2-d50876c07528', 'App\\Notifications\\OtCreada', 1, 'App\\User', '{"id_tarea":4,"nombre":"Maria Isabel","cargo":"Proyect Owner","descripcion":"Maria Isabel ha creado una OT con referencia: 0987-3, nombre : Fee Acompa\\u00f1amiento de Agencia - CE y valor: 5000000","created_at":"2017-02-23 15:14:39","img_perfil":null,"link":"\\/ots\\/visualizar\\/4"}', NULL, '2017-02-23 20:14:39', '2017-02-23 20:14:39'),
('8017adc6-59e9-4723-84dc-f405075d03e7', 'App\\Notifications\\TareaCreada', 6, 'App\\User', '{"id_tarea":4,"nombre":"Ejecutiva 1","cargo":"Ejecutiva","descripcion":"Ejecutiva 1 cre\\u00f3 la Tarea: Calidad del desarrollo de la landing","created_at":"2017-02-22 22:37:35","img_perfil":"\\/images\\/avatars\\/Ejecutiva1_3.png","link":"\\/ver_tarea\\/4"}', '2017-02-23 03:37:55', '2017-02-23 03:37:35', '2017-02-23 03:37:55'),
('80bb2f35-b855-4653-bb0c-60caa85674c9', 'App\\Notifications\\TareaProgramada', 7, 'App\\User', '{"id_tarea":3,"nombre":"Coordinador 1","cargo":"Coordinador Dise\\u00f1o","descripcion":"Coordinador 1 ha programado la Tarea: Calidad de la pagina web en dise\\u00f1o","created_at":"2017-02-22 22:40:16","img_perfil":"\\/images\\/avatars\\/Coordinador1_5.png","link":"\\/ver_tarea\\/3"}', '2017-02-23 03:40:24', '2017-02-23 03:40:16', '2017-02-23 03:40:24'),
('8d186cea-fbd1-41e8-b27a-d7224d632922', 'App\\Notifications\\TareaCreada', 5, 'App\\User', '{"id_tarea":1,"nombre":"Ejecutiva 1","cargo":"Ejecutiva","descripcion":"Ejecutiva 1 cre\\u00f3 la Tarea: Dise\\u00f1o de la landing page","created_at":"2017-02-22 22:17:46","img_perfil":"\\/images\\/avatars\\/Ejecutiva1_3.png","link":"\\/ver_tarea\\/1"}', '2017-02-23 03:17:59', '2017-02-23 03:17:46', '2017-02-23 03:17:59'),
('9e6d1328-e73f-4ad9-9a61-2ddea8053904', 'App\\Notifications\\TareaOk', 3, 'App\\User', '{"id_tarea":1,"nombre":"Colaborador 1","cargo":"Colaborador Dise\\u00f1o","descripcion":"Colaborador 1 revis\\u00f3 la Tarea: Dise\\u00f1o de la landing page y actualiz\\u00f3 el estado a OK","created_at":"2017-02-22 22:38:31","img_perfil":"\\/images\\/avatars\\/Colaborador1_7.png","link":"\\/ver_tarea\\/1"}', '2017-02-23 03:41:38', '2017-02-23 03:38:31', '2017-02-23 03:41:38'),
('ac3c122f-465f-4cb6-8fe9-a947073dc276', 'App\\Notifications\\TareaCreada', 6, 'App\\User', '{"id_tarea":5,"nombre":"Maria Isabel","cargo":"Proyect Owner","descripcion":"Maria Isabel cre\\u00f3 la Tarea: Maquetado de Lp","created_at":"2017-02-23 19:08:39","img_perfil":null,"link":"\\/ver_tarea\\/5"}', NULL, '2017-02-24 00:08:39', '2017-02-24 00:08:39'),
('c0e76034-0d09-4cb7-9b6d-6983b412381d', 'App\\Notifications\\TareaProgramada', 8, 'App\\User', '{"id_tarea":4,"nombre":"Coordinador 2","cargo":"Coordinador Desarrollo","descripcion":"Coordinador 2 ha programado la Tarea: Calidad del desarrollo de la landing","created_at":"2017-02-22 22:45:01","img_perfil":null,"link":"\\/ver_tarea\\/4"}', NULL, '2017-02-23 03:45:01', '2017-02-23 03:45:01'),
('c7eaa88b-190e-40e5-b7c7-4d42b48aaaf4', 'App\\Notifications\\OtTiempoExtra', 1, 'App\\User', '{"id_tarea":1,"nombre":"Ejecutiva 1","cargo":"Ejecutiva","descripcion":"Ejecutiva 1 ha solicitado 10 adicionales para el area de Dise\\u00f1o ","created_at":"2017-02-22 22:56:22","img_perfil":"\\/images\\/avatars\\/Ejecutiva1_3.png","link":"\\/ots\\/visualizar\\/1"}', NULL, '2017-02-23 03:56:22', '2017-02-23 03:56:22'),
('ce872609-9341-4768-b2fd-dae699fd14c5', 'App\\Notifications\\TareaOk', 3, 'App\\User', '{"id_tarea":3,"nombre":"Colaborador 1","cargo":"Colaborador Dise\\u00f1o","descripcion":"Colaborador 1 revis\\u00f3 la Tarea: Calidad de la pagina web en dise\\u00f1o y actualiz\\u00f3 el estado a OK","created_at":"2017-02-22 22:44:32","img_perfil":"\\/images\\/avatars\\/Colaborador1_7.png","link":"\\/ver_tarea\\/3"}', '2017-02-23 03:44:43', '2017-02-23 03:44:32', '2017-02-23 03:44:43'),
('dfb31614-361d-4075-b463-7d32ecceea90', 'App\\Notifications\\OtCreada', 1, 'App\\User', '{"id_tarea":2,"nombre":"Maria Isabel","cargo":"Proyect Owner","descripcion":"Maria Isabel ha creado una OT con referencia: 0987-1, nombre : Fee de Acompa\\u00f1amiento de Agencia y valor: 13000000","created_at":"2017-02-23 14:43:01","img_perfil":null,"link":"\\/ots\\/visualizar\\/2"}', NULL, '2017-02-23 19:43:01', '2017-02-23 19:43:01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ots`
--

CREATE TABLE `ots` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(115) COLLATE utf8_unicode_ci NOT NULL,
  `referencia` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `valor` varchar(55) COLLATE utf8_unicode_ci NOT NULL,
  `fee` tinyint(4) NOT NULL,
  `horas_totales` decimal(15,2) NOT NULL,
  `horas_disponibles` decimal(15,2) NOT NULL,
  `total_horas_extra` decimal(15,2) DEFAULT NULL,
  `observaciones` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fecha_inicio` datetime NOT NULL,
  `fecha_final` datetime NOT NULL,
  `clientes_id` int(10) UNSIGNED NOT NULL,
  `usuarios_id` int(10) UNSIGNED NOT NULL,
  `estados_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `ots`
--

INSERT INTO `ots` (`id`, `nombre`, `referencia`, `valor`, `fee`, `horas_totales`, `horas_disponibles`, `total_horas_extra`, `observaciones`, `fecha_inicio`, `fecha_final`, `clientes_id`, `usuarios_id`, `estados_id`, `created_at`, `updated_at`) VALUES
(1, 'Pagina Adeinco', '123456', '2000000', 1, '40.00', '0.00', '0.00', 'Esta es la Ot creada para pastas la muñeca', '2017-02-23 00:00:00', '2017-02-28 00:00:00', 2, 3, 8, '2017-02-23 03:14:47', '2017-02-23 03:14:47'),
(2, 'Fee de Acompañamiento de Agencia', '0987-1', '13000000', 1, '680.00', '0.00', '0.00', '', '2017-03-01 00:00:00', '2017-02-28 00:00:00', 6, 3, 8, '2017-02-23 19:42:59', '2017-02-23 19:42:59'),
(3, 'Fee de Acompañamiento de Agencia V365', '0987-2', '8500000', 1, '160.00', '0.00', '0.00', '', '2017-03-01 00:00:00', '2017-03-31 00:00:00', 7, 3, 8, '2017-02-23 20:10:20', '2017-02-23 20:10:20'),
(4, 'Fee Acompañamiento de Agencia - CE', '0987-3', '5000000', 1, '160.00', '0.00', '0.00', '', '2017-03-01 00:00:00', '2017-03-31 00:00:00', 8, 3, 8, '2017-02-23 20:14:39', '2017-02-23 20:14:39');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'ver_ots', 'Ver OTS', 'Puede Ver', '2017-02-23 02:57:16', '2017-02-23 02:57:16'),
(2, 'crear_ots', 'Crear OTS', 'Puede Crear', '2017-02-23 02:57:16', '2017-02-23 02:57:16'),
(3, 'editar_ots', 'Editar OTS', 'Puede Editar', '2017-02-23 02:57:16', '2017-02-23 02:57:16'),
(4, 'ver_clientes', 'Ver Clientes', 'Puede Ver', '2017-02-23 02:57:16', '2017-02-23 02:57:16'),
(5, 'crear_clientes', 'Crear Clientes', 'Puede Crear', '2017-02-23 02:57:16', '2017-02-23 02:57:16'),
(6, 'editar_clientes', 'Editar Clientes', 'Puede Editar', '2017-02-23 02:57:16', '2017-02-23 02:57:16'),
(7, 'ver_listado_usuarios', 'Ver Listado de Usuarios', 'Puede Ver', '2017-02-23 02:57:16', '2017-02-23 02:57:16'),
(8, 'crear_usuarios', 'Crear Usuarios', 'Puede Crear', '2017-02-23 02:57:16', '2017-02-23 02:57:16'),
(9, 'editar_usuarios', 'Editar Usuarios', 'Puede Editar', '2017-02-23 02:57:16', '2017-02-23 02:57:16'),
(10, 'ver_foro_creatividad', 'Ver Foro de Creatividad', 'Puede Ver', '2017-02-23 02:57:16', '2017-02-23 02:57:16'),
(11, 'ver_foro_diseno', 'Ver Foro de Diseño', 'Puede Ver', '2017-02-23 02:57:16', '2017-02-23 02:57:16'),
(12, 'ver_foro_desarrollo', 'Ver Foro de Desarrollo', 'Puede Ver', '2017-02-23 02:57:16', '2017-02-23 02:57:16'),
(13, 'ver_foro_contenidos', 'Ver Foro de Contenidos', 'Puede Ver', '2017-02-23 02:57:16', '2017-02-23 02:57:16'),
(14, 'ver_foro_digital', 'Ver Foro de Digital', 'Puede Ver', '2017-02-23 02:57:16', '2017-02-23 02:57:16'),
(15, 'ver_foro_soporte', 'Ver Foro de Soporte', 'Puede Ver', '2017-02-23 02:57:16', '2017-02-23 02:57:16'),
(16, 'ver_foro_colaborador', 'Ver Foro Colaborador', 'Muestra el foro dependiendo del area del colaborador', '2017-02-23 02:57:16', '2017-02-23 02:57:16'),
(17, 'ver_listado_areas', 'Ver Areas', 'Puede Ver', '2017-02-23 02:57:16', '2017-02-23 02:57:16'),
(18, 'crear_areas', 'Crear Areas', 'Puede crear', '2017-02-23 02:57:16', '2017-02-23 02:57:16'),
(19, 'editar_areas', 'Editar Areas', 'Puede Editar', '2017-02-23 02:57:16', '2017-02-23 02:57:16'),
(20, 'crear_tareas', 'Crear Tareas', 'Puede crear', '2017-02-23 02:57:16', '2017-02-23 02:57:16'),
(21, 'editar_tareas', 'Editar Tareas', 'Puede Editar', '2017-02-23 02:57:16', '2017-02-23 02:57:16'),
(22, 'ver_roles', 'Ver y editar Roles', 'Puede crear y editar los Roles de la Aplicación', '2017-02-23 02:57:16', '2017-02-23 02:57:16'),
(23, 'ver_trafico', 'Tráfico', 'Puede ver la vista de trafico', '2017-02-23 02:57:16', '2017-02-23 02:57:16');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(2, 1),
(2, 2),
(2, 3),
(3, 1),
(3, 2),
(4, 1),
(4, 2),
(4, 3),
(4, 4),
(5, 1),
(5, 2),
(5, 3),
(6, 1),
(6, 2),
(6, 3),
(7, 1),
(7, 2),
(8, 1),
(8, 2),
(9, 1),
(9, 2),
(10, 1),
(10, 2),
(10, 3),
(10, 4),
(11, 1),
(11, 2),
(11, 3),
(11, 4),
(12, 1),
(12, 2),
(12, 3),
(12, 4),
(13, 1),
(13, 2),
(13, 3),
(13, 4),
(14, 1),
(14, 2),
(14, 3),
(14, 4),
(15, 1),
(15, 2),
(15, 3),
(15, 4),
(16, 1),
(16, 2),
(16, 5),
(17, 1),
(17, 2),
(17, 3),
(17, 4),
(17, 5),
(18, 1),
(18, 2),
(19, 1),
(19, 2),
(20, 1),
(20, 2),
(20, 3),
(21, 1),
(21, 2),
(21, 4),
(21, 5),
(22, 1),
(22, 2),
(23, 1),
(23, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planeacion_fases`
--

CREATE TABLE `planeacion_fases` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(85) COLLATE utf8_unicode_ci NOT NULL,
  `planeacion_tipos_id` int(10) UNSIGNED NOT NULL,
  `estado` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `planeacion_fases`
--

INSERT INTO `planeacion_fases` (`id`, `nombre`, `planeacion_tipos_id`, `estado`, `created_at`, `updated_at`) VALUES
(1, 'Levantamiento Requerimientos', 1, 0, '2017-02-23 02:57:17', '2017-02-23 02:57:17'),
(2, 'Desarrollo/Maquetado', 2, 0, '2017-02-23 02:57:17', '2017-02-23 02:57:17'),
(3, 'Calidad y pruebas Desarrollo', 3, 0, '2017-02-23 02:57:17', '2017-02-23 02:57:17'),
(4, 'Publicacion', 4, 0, '2017-02-23 02:57:17', '2017-02-23 02:57:17');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planeacion_tipos`
--

CREATE TABLE `planeacion_tipos` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(85) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `estado` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `planeacion_tipos`
--

INSERT INTO `planeacion_tipos` (`id`, `nombre`, `descripcion`, `estado`, `created_at`, `updated_at`) VALUES
(1, 'Planeacion', NULL, 0, '2017-02-23 02:57:17', '2017-02-23 02:57:17'),
(2, 'Desarrollo', NULL, 0, '2017-02-23 02:57:17', '2017-02-23 02:57:17'),
(3, 'Calidad', NULL, 0, '2017-02-23 02:57:17', '2017-02-23 02:57:17'),
(4, 'Publicacion', NULL, 0, '2017-02-23 02:57:17', '2017-02-23 02:57:17');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `requerimientos_ots`
--

CREATE TABLE `requerimientos_ots` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `horas` decimal(5,2) NOT NULL,
  `areas_id` int(10) UNSIGNED NOT NULL,
  `ots_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `requerimientos_ots`
--

INSERT INTO `requerimientos_ots` (`id`, `nombre`, `horas`, `areas_id`, `ots_id`, `created_at`, `updated_at`) VALUES
(1, 'Diseño web', '20.00', 2, 1, '2017-02-23 03:14:47', '2017-02-23 03:14:47'),
(2, 'Desarrollo maquetado', '20.00', 3, 1, '2017-02-23 03:14:47', '2017-02-23 03:14:47'),
(3, 'Estrategia o Campaña mensual', '12.00', 1, 2, '2017-02-23 19:42:59', '2017-02-23 19:42:59'),
(4, 'Diseñador In House', '240.00', 2, 2, '2017-02-23 19:42:59', '2017-02-23 19:42:59'),
(5, 'Desarrollador', '48.00', 3, 2, '2017-02-23 19:42:59', '2017-02-23 19:42:59'),
(6, 'Community Manager', '160.00', 4, 2, '2017-02-23 19:42:59', '2017-02-23 19:42:59'),
(7, 'Content Manager', '160.00', 4, 2, '2017-02-23 19:42:59', '2017-02-23 19:42:59'),
(8, 'Analista Digital', '44.00', 5, 2, '2017-02-23 19:42:59', '2017-02-23 19:42:59'),
(9, 'Acompañamiento a la Cuenta', '16.00', 6, 2, '2017-02-23 19:42:59', '2017-02-23 19:42:59'),
(10, 'Diseñador medio tiempo', '80.00', 2, 3, '2017-02-23 20:10:20', '2017-02-23 20:10:20'),
(11, 'Community Manager', '40.00', 4, 3, '2017-02-23 20:10:20', '2017-02-23 20:10:20'),
(12, 'Content Manager', '40.00', 4, 3, '2017-02-23 20:10:20', '2017-02-23 20:10:20'),
(13, 'Diseñador medio tiempo', '80.00', 2, 4, '2017-02-23 20:14:39', '2017-02-23 20:14:39'),
(14, 'Community Manager', '40.00', 4, 4, '2017-02-23 20:14:39', '2017-02-23 20:14:39'),
(15, 'Content Manager', '40.00', 4, 4, '2017-02-23 20:14:39', '2017-02-23 20:14:39');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'owner', 'Proyect Owner', 'Usuario con todos los privilegios de la aplicación', '2017-02-23 02:57:16', '2017-02-23 02:57:16'),
(2, 'desarrollo', 'Test Profile', 'Usuario con Privilegios para poder testear la Aplicación', '2017-02-23 02:57:16', '2017-02-23 02:57:16'),
(3, 'cuentas', 'Cuentas', 'Usuario con algunos permisos especiales, pero con restricciones', '2017-02-23 02:57:16', '2017-02-23 02:57:16'),
(4, 'coordinador', 'Coordinador', 'Usuario con los permisos de asignar tareas', '2017-02-23 02:57:16', '2017-02-23 02:57:16'),
(5, 'colaborador', 'Colaborador', 'Usuario sin permisos, solo puede cambiar estados de tareas', '2017-02-23 02:57:16', '2017-02-23 02:57:16');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `role_user`
--

CREATE TABLE `role_user` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `role_user`
--

INSERT INTO `role_user` (`user_id`, `role_id`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 3),
(5, 4),
(6, 4),
(7, 5),
(8, 5),
(9, 2),
(10, 5),
(11, 5),
(12, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tareas`
--

CREATE TABLE `tareas` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre_tarea` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_entrega_area` datetime DEFAULT NULL,
  `fecha_entrega_cuentas` datetime DEFAULT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enlaces_externos` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tiempo_estimado` decimal(5,3) DEFAULT NULL,
  `tiempo_real` decimal(5,3) DEFAULT NULL,
  `tiempo_mapa_cliente` decimal(15,3) DEFAULT NULL,
  `fecha_entrega_cliente` datetime DEFAULT NULL,
  `estados_id` int(10) UNSIGNED NOT NULL,
  `areas_id` int(10) UNSIGNED NOT NULL,
  `usuarios_id` int(10) UNSIGNED NOT NULL,
  `ots_id` int(10) UNSIGNED NOT NULL,
  `planeacion_fases_id` int(10) UNSIGNED NOT NULL,
  `encargado_id` int(11) DEFAULT NULL,
  `prioridad_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `tareas`
--

INSERT INTO `tareas` (`id`, `nombre_tarea`, `fecha_entrega_area`, `fecha_entrega_cuentas`, `descripcion`, `enlaces_externos`, `tiempo_estimado`, `tiempo_real`, `tiempo_mapa_cliente`, `fecha_entrega_cliente`, `estados_id`, `areas_id`, `usuarios_id`, `ots_id`, `planeacion_fases_id`, `encargado_id`, `prioridad_id`, `created_at`, `updated_at`) VALUES
(1, 'Diseño de la landing page', '2017-02-23 00:00:00', '2017-02-24 00:00:00', 'Ya pagaron por todo', 'Server/archivos/despiece', '10.000', '8.000', '20.000', '2017-02-23 00:00:00', 1, 2, 3, 1, 1, 7, 10, '2017-02-23 03:17:46', '2017-02-23 03:38:31'),
(2, 'Maquetado de la web', NULL, NULL, 'ya se realizo el pago del maquetado', '/Server/desíece/archivo.rar', NULL, NULL, '20.000', '2017-02-27 00:00:00', 4, 3, 3, 1, 2, 3, 11, '2017-02-23 03:20:38', '2017-02-23 03:21:49'),
(3, 'Calidad de la pagina web en diseño', '2017-02-23 00:00:00', '2017-02-28 00:00:00', 'Por favor realizar la calidad de la landing page', '', '15.000', '14.000', '20.000', '2017-02-23 00:00:00', 1, 2, 3, 1, 3, 7, 12, '2017-02-23 03:34:45', '2017-02-23 03:44:31'),
(4, 'Calidad del desarrollo de la landing', '2017-02-23 00:00:00', '2017-02-24 00:00:00', 'Realizar la calidad del maquetado', NULL, '16.000', NULL, '15.000', '2017-02-27 00:00:00', 3, 3, 3, 1, 3, 8, 11, '2017-02-23 03:37:34', '2017-02-23 03:45:00'),
(5, 'Maquetado de Lp', NULL, NULL, 'Se debe maquetar esta landing page.', '', NULL, NULL, '16.000', '2017-03-15 00:00:00', 7, 3, 1, 2, 2, 6, 11, '2017-02-24 00:08:39', '2017-02-24 00:08:39');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiempos_x_area`
--

CREATE TABLE `tiempos_x_area` (
  `id` int(10) UNSIGNED NOT NULL,
  `tiempo_estimado_jefe` decimal(5,2) DEFAULT NULL,
  `tiempo_estimado_ot` decimal(5,2) NOT NULL,
  `tiempo_real` decimal(5,2) DEFAULT NULL,
  `tiempo_extra` decimal(5,2) NOT NULL DEFAULT '0.00',
  `ots_id` int(10) UNSIGNED NOT NULL,
  `areas_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `tiempos_x_area`
--

INSERT INTO `tiempos_x_area` (`id`, `tiempo_estimado_jefe`, `tiempo_estimado_ot`, `tiempo_real`, `tiempo_extra`, `ots_id`, `areas_id`, `created_at`, `updated_at`) VALUES
(1, NULL, '20.00', '30.00', '0.00', 1, 2, '2017-02-23 03:14:47', '2017-02-23 03:41:27'),
(2, NULL, '20.00', NULL, '0.00', 1, 3, '2017-02-23 03:14:47', '2017-02-23 03:14:47'),
(3, NULL, '12.00', NULL, '0.00', 2, 1, '2017-02-23 19:42:59', '2017-02-23 19:42:59'),
(4, NULL, '240.00', NULL, '0.00', 2, 2, '2017-02-23 19:42:59', '2017-02-23 19:42:59'),
(5, NULL, '48.00', NULL, '0.00', 2, 3, '2017-02-23 19:42:59', '2017-02-23 19:42:59'),
(6, NULL, '320.00', NULL, '0.00', 2, 4, '2017-02-23 19:42:59', '2017-02-23 19:42:59'),
(7, NULL, '44.00', NULL, '0.00', 2, 5, '2017-02-23 19:42:59', '2017-02-23 19:42:59'),
(8, NULL, '16.00', NULL, '0.00', 2, 6, '2017-02-23 19:42:59', '2017-02-23 19:42:59'),
(9, NULL, '80.00', NULL, '0.00', 3, 2, '2017-02-23 20:10:20', '2017-02-23 20:10:20'),
(10, NULL, '80.00', NULL, '0.00', 3, 4, '2017-02-23 20:10:20', '2017-02-23 20:10:20'),
(11, NULL, '80.00', NULL, '0.00', 4, 2, '2017-02-23 20:14:39', '2017-02-23 20:14:39'),
(12, NULL, '80.00', NULL, '0.00', 4, 4, '2017-02-23 20:14:39', '2017-02-23 20:14:39');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_compras`
--

CREATE TABLE `tipos_compras` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `tipos_compras`
--

INSERT INTO `tipos_compras` (`id`, `nombre`, `created_at`, `updated_at`) VALUES
(1, 'Pauta', '2017-02-23 02:57:17', '2017-02-23 02:57:17'),
(2, 'Hosting', '2017-02-23 02:57:17', '2017-02-23 02:57:17'),
(3, 'Plugin', '2017-02-23 02:57:17', '2017-02-23 02:57:17'),
(4, 'B. Imagenes', '2017-02-23 02:57:17', '2017-02-23 02:57:17');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_estados`
--

CREATE TABLE `tipos_estados` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `tipos_estados`
--

INSERT INTO `tipos_estados` (`id`, `nombre`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, 'Estados Tareas', NULL, '2017-02-23 02:57:16', '2017-02-23 02:57:16'),
(2, 'Estados OT', NULL, '2017-02-23 02:57:16', '2017-02-23 02:57:16'),
(3, 'Prioridad Tarea', NULL, '2017-02-23 02:57:16', '2017-02-23 02:57:16');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trafico_tareas`
--

CREATE TABLE `trafico_tareas` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre_tarea` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_entrega_estimada` datetime DEFAULT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enlaces_externos` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tiempo_estimado` decimal(5,3) DEFAULT NULL,
  `tiempo_real` decimal(5,3) DEFAULT NULL,
  `fecha_entrega_cliente` datetime NOT NULL,
  `estados_id` int(11) DEFAULT NULL,
  `areas_id` int(11) DEFAULT NULL,
  `usuarios_id` int(11) DEFAULT NULL,
  `ots_id` int(11) DEFAULT NULL,
  `roles_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `apellido` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `cargo` varchar(55) COLLATE utf8_unicode_ci NOT NULL,
  `telefono` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(85) COLLATE utf8_unicode_ci NOT NULL,
  `estado` tinyint(4) NOT NULL DEFAULT '1',
  `horas_disponible` decimal(15,2) NOT NULL,
  `horas_gastadas` decimal(15,2) NOT NULL DEFAULT '0.00',
  `api_token` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fecha_nacimiento` date NOT NULL,
  `img_perfil` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `roles_id` int(10) UNSIGNED NOT NULL,
  `areas_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `nombre`, `apellido`, `cargo`, `telefono`, `email`, `estado`, `horas_disponible`, `horas_gastadas`, `api_token`, `password`, `remember_token`, `fecha_nacimiento`, `img_perfil`, `roles_id`, `areas_id`, `created_at`, `updated_at`) VALUES
(1, 'Maria Isabel', 'Himalaya', 'Proyect Owner', '1111111', 'owner@himalayada.com', 1, '120.00', '0.00', 'CSehLDtBfN7FHo0uu6tvXuhRkASHJNN0l9IrfRvkQwj9X8qeMRbSh5R36Q5v', '$2y$10$lfVPsPgKJ2UB/KlvTu/jOukCtlyMM9ItCeXVJPWcm34YwNh0hMboG', 'c5MpWGbyU9Ry4jWyMpB1VJ8irdurqT2n8ULfHVgMCeXK9fzFDAgaTvTnJwRE', '2017-01-01', NULL, 1, 6, '2017-02-23 02:57:16', '2017-02-23 19:07:59'),
(2, 'Desarrollo', 'Himalaya', 'Tester', '1111111', 'desarrollo@himalayada.com', 1, '0.00', '0.00', '9NvFVbi0HgkyA8LESFl5SR9GFeD5MLFdgNU8zC0ChxsHE1z7nb85wBWYX0k9', '$2y$10$hEv6LQyxtw6zGGNtbwmv6uFv6K07Pbv7q4Lf6EAwRDBvGjdktqT1.', NULL, '2017-01-01', NULL, 2, 3, '2017-02-23 02:57:16', '2017-02-23 20:30:20'),
(3, 'Ejecutiva 1', 'Himalaya', 'Ejecutiva', '22222222', 'ejecutiva@himalayada.com', 1, '1.00', '0.00', 'OVtda0ou1JrthDQ0Zrdfj1gEc6cJnoEGgvv0qQu1u7uB0y9NqAVc0ezBr7uV', '$2y$10$lfVPsPgKJ2UB/KlvTu/jOukCtlyMM9ItCeXVJPWcm34YwNh0hMboG', 'gXrr9zjHRxXdIpGMmyNP5JyDBiVmIEr7DwI8IxYq6zTyvSRMLpjGnoCgqxDQ', '2017-01-01', '/images/avatars/Ejecutiva1_3.png', 3, 6, '2017-02-23 02:57:16', '2017-02-23 03:05:54'),
(4, 'Ejecutiva 2', 'Himalaya 2', 'Ejecutiva 2', '445548751', 'ejecutiva2@himalayada.com', 1, '40.00', '0.00', 'qnLy7lFlqDidG9ihqkM5uwnnjCbmv8472NeyTLqsRinFZn0mZuoKDQrs4BJJ', '$2y$10$lfVPsPgKJ2UB/KlvTu/jOukCtlyMM9ItCeXVJPWcm34YwNh0hMboG', NULL, '2017-01-01', NULL, 3, 6, '2017-02-23 02:57:16', '2017-02-23 02:57:16'),
(5, 'Coordinador 1', 'Himalaya', 'Coordinador Diseño', '22222222', 'coordinador1@himalayada.com', 1, '1.00', '0.00', 'X1z1lPtd3ze2QuCrUdHIse1uFe1uV1MckEGUOL5DHzazApQrHc6Ydx01heUg', '$2y$10$lfVPsPgKJ2UB/KlvTu/jOukCtlyMM9ItCeXVJPWcm34YwNh0hMboG', 'qeFgqOpTT1KSyHwkjPcq0rihgvJEJReDkfCVkriQBK27L4YCifGKvrNfoXeP', '2017-01-01', '/images/avatars/Coordinador1_5.png', 4, 2, '2017-02-23 02:57:16', '2017-02-23 21:14:54'),
(6, 'Coordinador 2', 'Area Desarrollo', 'Coordinador Desarrollo', '22222222', 'coordinador2@himalayada.com', 1, '0.00', '0.00', 'NWsRTSwQhJGurTXKJLaYjnR4YwueCHTYmfnO1rx6QAe1dlkvgX8pTZHS36IT', '$2y$10$3BtWY0keOWHQNw51W9CJjuc5A3ja2z11foLK2rBxOYUQgomG6RM4e', NULL, '2017-01-01', NULL, 4, 3, '2017-02-23 02:57:16', '2017-02-23 20:29:12'),
(7, 'Colaborador 1', 'Himalaya', 'Colaborador Diseño', '22222222', 'colaborador1@himalayada.com', 1, '1.00', '14.00', 'fDZGeJxJWHyepDwcFWI6tQ3m5NRHRvz46t1DH7VlWrxitYQ95saQlRTlhoVb', '$2y$10$lfVPsPgKJ2UB/KlvTu/jOukCtlyMM9ItCeXVJPWcm34YwNh0hMboG', NULL, '2017-01-01', '/images/avatars/Colaborador1_7.png', 5, 2, '2017-02-23 02:57:16', '2017-02-23 03:44:31'),
(8, 'Colaborador 2', 'Himalaya', 'Colaborador Desarrollo', '22222222', 'colaborador2@himalayada.com', 1, '0.00', '0.00', 'jrfC9z8jFfbPUGn5t4M62RCI9KRM9mTNotNDXc4QNOU62B6J263KkSbTtzSp', '$2y$10$2I03ImAjMwCJUiBm0AOeDepwNvLk9dKAMdUCw2R6KOfLcfEZAqsTG', NULL, '2017-01-01', NULL, 5, 3, '2017-02-23 02:57:16', '2017-02-23 20:29:59'),
(9, 'Luisa Fernanda ', 'Carvajal', 'Coordinadora de Desarrollo', '3799180', 'lfcarvajal@himalayada.com', 1, '160.00', '0.00', 'z3akYxYV2CZhbeuwqIx0jJqSbxIpgJmc571prWLZWwqxgXv0CcGSERFSutPA', '$2y$10$cZ4.066dB1kT1XQfxuDWIOk0LmUuDZOAI8Abpb4D7yFWWyl7MQzJK', 'uvXxKduHG5syQUl6HAuhYHZpH8hP5GLmLA3tDMj7vyO1fJ1f93WBJEyANv6w', '1992-01-12', NULL, 2, 3, '2017-02-23 18:20:10', '2017-02-23 18:20:10'),
(10, 'Álvaro Jose', 'Borrero Cardenas', 'Desarrollador ', '3799180', 'aborrero@himalayada.com', 1, '160.00', '0.00', 'DkLUMoBTNBHTJ8CIV3c9LDwXUHPDiNUJu9JRi5HAb5v5zjsJHNXv4JihaZVY', '$2y$10$ZAcotzwyc3QZEatbRd5JrurV/NSiPbWvDwZO4bdUqOeFa.DdYzMDu', 'alDSXhdxwnyht3mE4h3czxhnl6X5wBKJIe9dlDs09eFMreQkoCI9Ug6ybUDJ', '1991-10-14', NULL, 5, 3, '2017-02-23 18:28:45', '2017-02-23 18:30:42'),
(11, 'David ', 'Salazar Ocampo', 'Desarrollador', '3799180', 'dsalazar@himalayada.com', 1, '160.00', '0.00', 'gmSJlcJeR9fB3Y5JLGrtxjRnTdNO2aRucd5x5Ah2sySv2SEW8wY80d2iBKgq', '$2y$10$Ut5RpO9GZL5R28onKdZp1ODzZaSKqHqURi4BJ0yPPHPpxdWUtmvIi', 'ZLAWmFtPiZrj7mJVIM9o6OR3As3CWgadX4IkqmYY9zoBIfbMFaVb5E9ZcOar', '1995-07-18', NULL, 5, 3, '2017-02-23 18:33:05', '2017-02-23 18:33:05'),
(12, 'Brian steven', 'Caldas Cambindo', 'Desarrollador', '3799180', 'bcaldas@himalayada.com', 1, '160.00', '0.00', 'Nvmp3a9rmOYH8Tuw5xpqmcBHV0VK7uAW0fC3aEnNiKOQWOVdiTWtlsmGKGKB', '$2y$10$Pw7AsW.tAPc2yfyLCZIEKOZCGGpDmlDp.N4eWr.OM/rCzLq7AQXNW', 'yHOhpwYbQNsPScgQKyqgnlbgu05UMt8b8whZIX19f72RDmPUkTl0IgM0Rwvq', '1993-01-23', NULL, 5, 3, '2017-02-23 18:39:14', '2017-02-23 18:39:14');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `areas`
--
ALTER TABLE `areas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `compras_ots`
--
ALTER TABLE `compras_ots`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `divisas`
--
ALTER TABLE `divisas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `estados`
--
ALTER TABLE `estados`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `estados_x_roles`
--
ALTER TABLE `estados_x_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `historicos_ots`
--
ALTER TABLE `historicos_ots`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `historico_tareas`
--
ALTER TABLE `historico_tareas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_id_notifiable_type_index` (`notifiable_id`,`notifiable_type`);

--
-- Indices de la tabla `ots`
--
ALTER TABLE `ots`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indices de la tabla `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_unique` (`name`);

--
-- Indices de la tabla `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_role_id_foreign` (`role_id`);

--
-- Indices de la tabla `planeacion_fases`
--
ALTER TABLE `planeacion_fases`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `planeacion_tipos`
--
ALTER TABLE `planeacion_tipos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `requerimientos_ots`
--
ALTER TABLE `requerimientos_ots`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indices de la tabla `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `role_user_role_id_foreign` (`role_id`);

--
-- Indices de la tabla `tareas`
--
ALTER TABLE `tareas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tiempos_x_area`
--
ALTER TABLE `tiempos_x_area`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipos_compras`
--
ALTER TABLE `tipos_compras`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipos_estados`
--
ALTER TABLE `tipos_estados`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `trafico_tareas`
--
ALTER TABLE `trafico_tareas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_api_token_unique` (`api_token`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `areas`
--
ALTER TABLE `areas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT de la tabla `compras_ots`
--
ALTER TABLE `compras_ots`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `divisas`
--
ALTER TABLE `divisas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `estados`
--
ALTER TABLE `estados`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT de la tabla `estados_x_roles`
--
ALTER TABLE `estados_x_roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT de la tabla `historicos_ots`
--
ALTER TABLE `historicos_ots`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `historico_tareas`
--
ALTER TABLE `historico_tareas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=192;
--
-- AUTO_INCREMENT de la tabla `ots`
--
ALTER TABLE `ots`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT de la tabla `planeacion_fases`
--
ALTER TABLE `planeacion_fases`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `planeacion_tipos`
--
ALTER TABLE `planeacion_tipos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `requerimientos_ots`
--
ALTER TABLE `requerimientos_ots`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `tareas`
--
ALTER TABLE `tareas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `tiempos_x_area`
--
ALTER TABLE `tiempos_x_area`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT de la tabla `tipos_compras`
--
ALTER TABLE `tipos_compras`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `tipos_estados`
--
ALTER TABLE `tipos_estados`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `trafico_tareas`
--
ALTER TABLE `trafico_tareas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
