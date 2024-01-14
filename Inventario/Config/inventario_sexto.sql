-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 14, 2024 at 09:04 PM
-- Server version: 5.7.24
-- PHP Version: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inventario_sexto`
--

-- --------------------------------------------------------

--
-- Table structure for table `productos`
--

CREATE TABLE `productos` (
  `ProductoId` int(11) NOT NULL,
  `Nombre` text NOT NULL,
  `Precio` decimal(8,2) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `FechaIngreso` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `productos`
--

INSERT INTO `productos` (`ProductoId`, `Nombre`, `Precio`, `Cantidad`, `FechaIngreso`) VALUES
(1, 'Jabón Esencia', '1.30', 5, '2022-01-24');

-- --------------------------------------------------------

--
-- Table structure for table `proveedores`
--

CREATE TABLE `proveedores` (
  `ProveedorId` int(11) NOT NULL,
  `Nombres` text NOT NULL,
  `Telefono` text NOT NULL,
  `Correo` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `proveedores`
--

INSERT INTO `proveedores` (`ProveedorId`, `Nombres`, `Telefono`, `Correo`) VALUES
(1, 'Carmen Méndez', '0980040932', 'cmmc@gmail.com\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `stocks`
--

CREATE TABLE `stocks` (
  `StockId` int(11) NOT NULL,
  `ProductoId` int(11) NOT NULL,
  `ProveedorId` int(11) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `Precio_Venta` decimal(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stocks`
--

INSERT INTO `stocks` (`StockId`, `ProductoId`, `ProveedorId`, `Cantidad`, `Precio_Venta`) VALUES
(1, 1, 1, 2, '2.60');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`ProductoId`);

--
-- Indexes for table `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`ProveedorId`);

--
-- Indexes for table `stocks`
--
ALTER TABLE `stocks`
  ADD PRIMARY KEY (`StockId`),
  ADD KEY `Proveedor_Stock` (`ProveedorId`),
  ADD KEY `ProductoId` (`ProductoId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `productos`
--
ALTER TABLE `productos`
  MODIFY `ProductoId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `ProveedorId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `stocks`
--
ALTER TABLE `stocks`
  MODIFY `StockId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `stocks`
--
ALTER TABLE `stocks`
  ADD CONSTRAINT `ProductoId` FOREIGN KEY (`ProductoId`) REFERENCES `productos` (`ProductoId`),
  ADD CONSTRAINT `Proveedor_Stock` FOREIGN KEY (`ProveedorId`) REFERENCES `proveedores` (`ProveedorId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
