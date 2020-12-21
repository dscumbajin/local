-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.10-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para presupuestos
DROP DATABASE IF EXISTS `presupuestos`;
CREATE DATABASE IF NOT EXISTS `presupuestos` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `presupuestos`;

-- Volcando estructura para tabla presupuestos.clientes
DROP TABLE IF EXISTS `clientes`;
CREATE TABLE IF NOT EXISTS `clientes` (
  `codigoCliente` varchar(30) NOT NULL,
  `nombreCliente` varchar(200) NOT NULL,
  `mailCliente` varchar(100) NOT NULL,
  `estadoCliente` binary(1) NOT NULL DEFAULT '1',
  `password` varchar(255) DEFAULT '$2y$10$MPVHzZ2ZPOWmtUUGCq3RXu31OTB.jo7M9LZ7PmPQYmgETSNn19ejO',
  `token_` varchar(100) DEFAULT NULL,
  `nivel` varchar(50) NOT NULL DEFAULT 'user',
  PRIMARY KEY (`codigoCliente`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla presupuestos.clientes: 3 rows
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` (`codigoCliente`, `nombreCliente`, `mailCliente`, `estadoCliente`, `password`, `token_`, `nivel`) VALUES
	('admin', 'admin', 'sistemas2@bateriasecuador.com', _binary 0x31, '$2y$10$MPVHzZ2ZPOWmtUUGCq3RXu31OTB.jo7M9LZ7PmPQYmgETSNn19ejO', '33fc54462404f06a061988d8352f6dd7', 'admin'),
	('1234', 'darwin', 'darwincumbajin7@hotmail.com', _binary 0x31, '$2y$10$MPVHzZ2ZPOWmtUUGCq3RXu31OTB.jo7M9LZ7PmPQYmgETSNn19ejO', NULL, 'user'),
	('1722909601001', 'darwin', 'darwincumbajin7@hotmail.com', _binary 0x31, '$2y$10$MPVHzZ2ZPOWmtUUGCq3RXu31OTB.jo7M9LZ7PmPQYmgETSNn19ejO', NULL, 'user');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;

-- Volcando estructura para tabla presupuestos.listalinea
DROP TABLE IF EXISTS `listalinea`;
CREATE TABLE IF NOT EXISTS `listalinea` (
  `codigoLinea` varchar(50) NOT NULL DEFAULT '0',
  `nombreLinea` varchar(50) NOT NULL,
  `estadoLinea` binary(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`codigoLinea`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla presupuestos.listalinea: 12 rows
/*!40000 ALTER TABLE `listalinea` DISABLE KEYS */;
INSERT INTO `listalinea` (`codigoLinea`, `nombreLinea`, `estadoLinea`) VALUES
	('108', 'TRITURADO', _binary 0x31),
	('124', 'RECICLADORA REFINACION (exp)', _binary 0x31),
	('201', 'BATERIAS ECUADOR', _binary 0x31),
	('213', 'BATERIAS RUBIX', _binary 0x31),
	('216', 'BATERIAS HELLA EXPORTACION', _binary 0x31),
	('218', 'BATERIAS HELLA', _binary 0x31),
	('220', 'AGUA DESMINERALIZADA', _binary 0x31),
	('221', 'BATERIAS ELEKTRA', _binary 0x31),
	('222', 'BATERIAS MOTOREX', _binary 0x31),
	('250', 'ANTISULFATANTES', _binary 0x31),
	('301', 'COMERCIAL BOSCH', _binary 0x31),
	('315', 'PLUMAS HELLA', _binary 0x31);
/*!40000 ALTER TABLE `listalinea` ENABLE KEYS */;

-- Volcando estructura para tabla presupuestos.presupuesto
DROP TABLE IF EXISTS `presupuesto`;
CREATE TABLE IF NOT EXISTS `presupuesto` (
  `codigoPresupuesto` int(11) NOT NULL AUTO_INCREMENT,
  `fechaPresupuesto` date NOT NULL,
  `cantidadMesPresupuesto` double NOT NULL DEFAULT 0,
  `presupuestoMes` double NOT NULL DEFAULT 0,
  `cantidadPromos` double NOT NULL DEFAULT 0,
  `cantidadGarantias` double NOT NULL DEFAULT 0,
  `cantidadTotal` double NOT NULL DEFAULT 0,
  `status` binary(1) NOT NULL DEFAULT '1',
  `codigoVendedor` varchar(50) NOT NULL,
  `codigoLinea` varchar(50) NOT NULL,
  PRIMARY KEY (`codigoPresupuesto`),
  KEY `FK_presupuesto_vendedor` (`codigoVendedor`),
  KEY `FK_presupuesto_listalinea` (`codigoLinea`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla presupuestos.presupuesto: 2 rows
/*!40000 ALTER TABLE `presupuesto` DISABLE KEYS */;
INSERT INTO `presupuesto` (`codigoPresupuesto`, `fechaPresupuesto`, `cantidadMesPresupuesto`, `presupuestoMes`, `cantidadPromos`, `cantidadGarantias`, `cantidadTotal`, `status`, `codigoVendedor`, `codigoLinea`) VALUES
	(3, '2020-01-01', 536.97, 10000.8, 1, 1, 538.97, _binary 0x31, '18', '201'),
	(5, '2020-03-01', 10.2, 10.2, 10.2, 10.2, 30.6, _binary 0x31, '18', '108'),
	(6, '2020-03-01', 10.2, 10.2, 10.2, 10.2, 30.6, _binary 0x31, '18', '201'),
	(9, '2020-03-01', 10.2, 10.2, 10.2, 10.2, 30.6, _binary 0x31, '18', '201'),
	(10, '2020-03-01', 10.2, 10.2, 10.2, 10.2, 30.6, _binary 0x31, '18', '201'),
	(11, '2020-03-01', 10.2, 10.2, 10.2, 10.2, 30.6, _binary 0x31, '18', '201'),
	(12, '2020-03-01', 10.2, 10.2, 10.2, 10.2, 30.6, _binary 0x31, '18', '201'),
	(13, '2020-03-01', 10.2, 10.2, 10.2, 10.2, 30.6, _binary 0x31, '18', '201'),
	(14, '2020-03-01', 10.2, 10.2, 10.2, 10.2, 30.6, _binary 0x31, '18', '201'),
	(15, '2020-03-01', 10.2, 10.2, 10.2, 10.2, 30.6, _binary 0x31, '18', '201'),
	(16, '2020-03-01', 10.2, 120, 10.2, 10.2, 30.6, _binary 0x31, '18', '108');
/*!40000 ALTER TABLE `presupuesto` ENABLE KEYS */;

-- Volcando estructura para tabla presupuestos.vendedor
DROP TABLE IF EXISTS `vendedor`;
CREATE TABLE IF NOT EXISTS `vendedor` (
  `codigoVendedor` varchar(50) NOT NULL DEFAULT '0',
  `nombreVendedor` varchar(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`codigoVendedor`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla presupuestos.vendedor: 41 rows
/*!40000 ALTER TABLE `vendedor` DISABLE KEYS */;
INSERT INTO `vendedor` (`codigoVendedor`, `nombreVendedor`) VALUES
	('18', '10 FACTURADORA OCCIDENTAL'),
	('50', '100 FACTURACION SUR'),
	('97', '110 FACTURACION MARISCAL'),
	('85', '130 FACTURACION GUAMANI'),
	('51', '140 FACTURACION TUMBACO 1'),
	('83', '150 FACTURACION TUMBACO 2'),
	('52', '160 FACTURACION SAN RAFAEL 1'),
	('84', '170 FACTURACION SAN RAFAEL 2'),
	('90', '180 FACTURACION SANGOLQUI'),
	('25', '20 FACTURADORA GUAYAQUIL'),
	('102', '200 FACTURACION QUINCHE'),
	('36', '210 FACTURACION AMBATO'),
	('70', '220 FACTURACION IBARRA'),
	('67', '240 FACTURACION STO DOMINGO 1'),
	('92', '260 FACTURACION ESMERALDAS'),
	('58', '270 FACTURACION GYE CENTRO'),
	('130', '280 FACTURACION MANTA'),
	('15', '30 FACTURADORA CUENCA'),
	('68', '40 FACTURACION CARAPUNGO 1'),
	('94', '50 FACTURACION CARAPUNGO 2'),
	('88', '60 FACTURACION OFELIA'),
	('62', '70 FACTURACION UIO NORTE'),
	('91', '80 FACTURACION INCA'),
	('89', '90 FACTURACION VILLAFLORA'),
	('80', 'CALLCENTER DISTRIBUIDORES'),
	('104', 'CALLCENTER DISTRIBUIDORES GYE'),
	('79', 'CALLCENTER INSTITUCIONAL'),
	('66', 'CLIENTES SEG 5'),
	('40', 'CUENTAS CLAVES NORTE'),
	('93', 'CUENTAS CLAVES SUR'),
	('28', 'EMPLEADOS'),
	('100', 'FABRIBAT CIA LTDA'),
	('210', 'SUPERMERCADOS'),
	('82', 'VENDEDOR COCA LAGO AGRIO'),
	('75', 'VENDEDOR CUENCA'),
	('220', 'VENDEDOR GUAYAQUIL'),
	('59', 'VENDEDOR IBARRA TULCAN'),
	('65', 'VENDEDOR MANABI'),
	('63', 'VENDEDOR STO DGO ESMERALDAS'),
	('150', 'VENTA DOMICILIO GUAYAQUIL'),
	('71', 'VENTA DOMICILIO OCCIDENTAL');
/*!40000 ALTER TABLE `vendedor` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
