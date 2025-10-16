-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-10-2025 a las 20:22:34
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
-- Base de datos: `soporte_tecnico`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias_equipo`
--

CREATE TABLE `categorias_equipo` (
  `id_categoria` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias_equipo`
--

INSERT INTO `categorias_equipo` (`id_categoria`, `nombre`, `descripcion`) VALUES
(1, 'Laptop', 'Computadoras portátiles de diferentes marcas'),
(2, 'Desktop', 'Computadoras de escritorio'),
(3, 'Servidor', 'Servidores empresariales'),
(4, 'Impresora', 'Equipos de impresión'),
(5, 'Red', 'Equipos de networking'),
(6, 'Periféricos', 'Dispositivos adicionales');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `direccion` text DEFAULT NULL,
  `fecha_registro` date DEFAULT curdate()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `nombre`, `email`, `telefono`, `direccion`, `fecha_registro`) VALUES
(1, 'Ana García', 'ana.garcia@email.com', '600123456', 'Calle Principal 123, Madrid', '2025-10-16'),
(2, 'Carlos López', 'carlos.lopez@email.com', '600234567', 'Avenida Central 45, Barcelona', '2025-10-16'),
(3, 'María Rodríguez', 'maria.rodriguez@email.com', '600345678', 'Plaza Mayor 67, Valencia', '2025-10-16'),
(4, 'Javier Martínez', 'javier.martinez@email.com', '600456789', 'Calle Secundaria 89, Sevilla', '2025-10-16'),
(5, 'Laura Fernández', 'laura.fernandez@email.com', '600567890', 'Avenida Norte 12, Bilbao', '2025-10-16'),
(6, 'David Sánchez', 'david.sanchez@email.com', '600678901', 'Calle Este 34, Málaga', '2025-10-16'),
(7, 'Elena Pérez', 'elena.perez@email.com', '600789012', 'Plaza Sur 56, Zaragoza', '2025-10-16'),
(8, 'Miguel Torres', 'miguel.torres@email.com', '600890123', 'Avenida Oeste 78, Murcia', '2025-10-16'),
(9, 'Sofía Ramírez', 'sofia.ramirez@email.com', '600901234', 'Calle Central 90, Palma', '2025-10-16'),
(10, 'Daniel Castro', 'daniel.castro@email.com', '601012345', 'Paseo Marítimo 23, Las Palmas', '2025-10-16');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `id_empleado` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `especialidad` varchar(100) DEFAULT NULL,
  `email` varchar(150) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`id_empleado`, `nombre`, `especialidad`, `email`, `telefono`, `activo`) VALUES
(1, 'Roberto Jiménez', 'Hardware', 'roberto.jimenez@empresa.com', '610123456', 1),
(2, 'Sara Morales', 'Software', 'sara.morales@empresa.com', '610234567', 1),
(3, 'Pablo Ortega', 'Redes', 'pablo.ortega@empresa.com', '610345678', 1),
(4, 'Carmen Vega', 'Base de Datos', 'carmen.vega@empresa.com', '610456789', 1),
(5, 'Alejandro Ruiz', 'Seguridad', 'alejandro.ruiz@empresa.com', '610567890', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipos`
--

CREATE TABLE `equipos` (
  `id_equipo` int(11) NOT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `id_categoria` int(11) DEFAULT NULL,
  `modelo` varchar(100) DEFAULT NULL,
  `numero_serie` varchar(100) DEFAULT NULL,
  `fecha_compra` date DEFAULT NULL,
  `garantia_hasta` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `equipos`
--

INSERT INTO `equipos` (`id_equipo`, `id_cliente`, `id_categoria`, `modelo`, `numero_serie`, `fecha_compra`, `garantia_hasta`) VALUES
(1, 1, 1, 'Dell Latitude 5490', 'DL5490XYZ123', '2023-01-15', '2025-01-15'),
(2, 2, 1, 'HP EliteBook 840', 'HP840ABC456', '2023-02-20', '2025-02-20'),
(3, 3, 2, 'Dell OptiPlex 7070', 'DO7070DEF789', '2023-03-10', '2025-03-10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `informes_soporte`
--

CREATE TABLE `informes_soporte` (
  `id_informe` int(11) NOT NULL,
  `titulo` varchar(200) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `tipo_informe` enum('Diario','Semanal','Mensual','Anual') DEFAULT NULL,
  `fecha_generacion` datetime DEFAULT current_timestamp(),
  `datos_informe` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`datos_informe`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `id_item` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `categoria` varchar(100) DEFAULT NULL,
  `stock` int(11) DEFAULT 0,
  `stock_minimo` int(11) DEFAULT 5,
  `precio_unitario` decimal(10,2) DEFAULT NULL,
  `ubicacion` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `inventario`
--

INSERT INTO `inventario` (`id_item`, `nombre`, `descripcion`, `categoria`, `stock`, `stock_minimo`, `precio_unitario`, `ubicacion`) VALUES
(1, 'RAM DDR4 8GB', 'Memoria RAM DDR4 8GB 2666MHz', 'Componentes', 25, 5, 45.50, 'Almacen A'),
(2, 'SSD 500GB', 'Disco sólido 500GB SATA', 'Almacenamiento', 15, 3, 89.99, 'Almacen A'),
(3, 'Teclado USB', 'Teclado multimedia USB', 'Periféricos', 30, 10, 25.00, 'Almacen B'),
(4, 'Mouse Inalámbrico', 'Mouse óptico inalámbrico', 'Periféricos', 40, 15, 18.50, 'Almacen B');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `soporte_tickets`
--

CREATE TABLE `soporte_tickets` (
  `id_ticket` int(11) NOT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `id_equipo` int(11) DEFAULT NULL,
  `id_empleado_asignado` int(11) DEFAULT NULL,
  `titulo` varchar(200) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `prioridad` enum('Baja','Media','Alta','Crítica') DEFAULT 'Media',
  `estado` enum('Abierto','En Progreso','Espera Repuesto','Cerrado') DEFAULT 'Abierto',
  `fecha_apertura` datetime DEFAULT current_timestamp(),
  `fecha_cierre` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `soporte_tickets`
--

INSERT INTO `soporte_tickets` (`id_ticket`, `id_cliente`, `id_equipo`, `id_empleado_asignado`, `titulo`, `descripcion`, `prioridad`, `estado`, `fecha_apertura`, `fecha_cierre`) VALUES
(1, 1, 1, 1, 'Problema de rendimiento', 'La laptop se encuentra muy lenta al ejecutar aplicaciones', 'Media', 'En Progreso', '2025-10-16 12:20:42', NULL),
(2, 2, 2, 2, 'Error de software', 'No inicia el sistema operativo, muestra pantalla azul', 'Alta', 'Abierto', '2025-10-16 12:20:42', NULL),
(3, 3, 3, 3, 'Problema de conexión', 'No se conecta a la red corporativa', 'Media', 'Cerrado', '2025-10-16 12:20:42', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ticket_detalles`
--

CREATE TABLE `ticket_detalles` (
  `id_detalle` int(11) NOT NULL,
  `id_ticket` int(11) DEFAULT NULL,
  `id_empleado` int(11) DEFAULT NULL,
  `descripcion` text NOT NULL,
  `fecha_hora` datetime DEFAULT current_timestamp(),
  `horas_trabajadas` decimal(4,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ticket_detalles`
--

INSERT INTO `ticket_detalles` (`id_detalle`, `id_ticket`, `id_empleado`, `descripcion`, `fecha_hora`, `horas_trabajadas`) VALUES
(1, 1, 1, 'Diagnóstico inicial: posible falta de memoria RAM', '2025-10-16 12:20:42', 0.50),
(2, 1, 1, 'Instalada memoria RAM adicional - 8GB DDR4', '2025-10-16 12:20:42', 1.00),
(3, 3, 3, 'Configurada conexión de red y actualizados drivers', '2025-10-16 12:20:42', 1.50);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias_equipo`
--
ALTER TABLE `categorias_equipo`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`id_empleado`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indices de la tabla `equipos`
--
ALTER TABLE `equipos`
  ADD PRIMARY KEY (`id_equipo`),
  ADD UNIQUE KEY `numero_serie` (`numero_serie`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- Indices de la tabla `informes_soporte`
--
ALTER TABLE `informes_soporte`
  ADD PRIMARY KEY (`id_informe`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`id_item`);

--
-- Indices de la tabla `soporte_tickets`
--
ALTER TABLE `soporte_tickets`
  ADD PRIMARY KEY (`id_ticket`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_equipo` (`id_equipo`),
  ADD KEY `id_empleado_asignado` (`id_empleado_asignado`);

--
-- Indices de la tabla `ticket_detalles`
--
ALTER TABLE `ticket_detalles`
  ADD PRIMARY KEY (`id_detalle`),
  ADD KEY `id_ticket` (`id_ticket`),
  ADD KEY `id_empleado` (`id_empleado`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias_equipo`
--
ALTER TABLE `categorias_equipo`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `id_empleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `equipos`
--
ALTER TABLE `equipos`
  MODIFY `id_equipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `informes_soporte`
--
ALTER TABLE `informes_soporte`
  MODIFY `id_informe` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `inventario`
--
ALTER TABLE `inventario`
  MODIFY `id_item` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `soporte_tickets`
--
ALTER TABLE `soporte_tickets`
  MODIFY `id_ticket` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `ticket_detalles`
--
ALTER TABLE `ticket_detalles`
  MODIFY `id_detalle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `equipos`
--
ALTER TABLE `equipos`
  ADD CONSTRAINT `equipos_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`),
  ADD CONSTRAINT `equipos_ibfk_2` FOREIGN KEY (`id_categoria`) REFERENCES `categorias_equipo` (`id_categoria`);

--
-- Filtros para la tabla `soporte_tickets`
--
ALTER TABLE `soporte_tickets`
  ADD CONSTRAINT `soporte_tickets_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`),
  ADD CONSTRAINT `soporte_tickets_ibfk_2` FOREIGN KEY (`id_equipo`) REFERENCES `equipos` (`id_equipo`),
  ADD CONSTRAINT `soporte_tickets_ibfk_3` FOREIGN KEY (`id_empleado_asignado`) REFERENCES `empleados` (`id_empleado`);

--
-- Filtros para la tabla `ticket_detalles`
--
ALTER TABLE `ticket_detalles`
  ADD CONSTRAINT `ticket_detalles_ibfk_1` FOREIGN KEY (`id_ticket`) REFERENCES `soporte_tickets` (`id_ticket`),
  ADD CONSTRAINT `ticket_detalles_ibfk_2` FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id_empleado`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
