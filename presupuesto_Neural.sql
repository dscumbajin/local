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
  `nivel` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`codigoCliente`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla presupuestos.clientes: 1 rows
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` (`codigoCliente`, `nombreCliente`, `mailCliente`, `estadoCliente`, `password`, `token_`, `nivel`) VALUES
	('admin', 'admin', 'sistemas2@bateriasecuador.com', _binary 0x31, '$2y$10$MPVHzZ2ZPOWmtUUGCq3RXu31OTB.jo7M9LZ7PmPQYmgETSNn19ejO', NULL, 0);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;

-- Volcando estructura para tabla presupuestos.listalinea
DROP TABLE IF EXISTS `listalinea`;
CREATE TABLE IF NOT EXISTS `listalinea` (
  `codigoLinea` varchar(50) NOT NULL DEFAULT '0',
  `nombreLinea` varchar(50) NOT NULL,
  `estadoLinea` binary(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`codigoLinea`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla presupuestos.listalinea: 142 rows
/*!40000 ALTER TABLE `listalinea` DISABLE KEYS */;
INSERT INTO `listalinea` (`codigoLinea`, `nombreLinea`, `estadoLinea`) VALUES
	('118', 'PP ENSAMBLE BATERIAS SECAS RUBIX (exp)', _binary 0x31),
	('117', 'PP ENSAMBLE BATERIAS SECAS RUBIX', _binary 0x31),
	('110', 'PP ENSAMBLE BATERIAS SECAS GM ', _binary 0x31),
	('11', 'MANO DE OBRA', _binary 0x31),
	('100', 'MATERIAL DE EMPAQUE', _binary 0x31),
	('10', 'MATERIALES', _binary 0x31),
	('6', 'MERCADEO', _binary 0x31),
	('5', 'RECICLADOS', _binary 0x31),
	('4', 'ACCESORIOS', _binary 0x31),
	('2', 'SETS Y ACCESORIOS', _binary 0x31),
	('1', 'BATERIAS', _binary 0x31),
	('119', 'PP ENSAMBLE BATERIAS SECAS Q PARTS', _binary 0x31),
	('12', 'INVENTARIO', _binary 0x31),
	('121', 'PP ENSAMBLE BATERIAS SECAS HELLA', _binary 0x31),
	('122', 'PP ENSAMBLE BATERIAS SECAS KOOR', _binary 0x31),
	('13', 'OTROS FINANCIEROS', _binary 0x31),
	('14', 'BATERIAS BOSCH', _binary 0x31),
	('15', 'BATERIAS MAC', _binary 0x31),
	('16', 'BATERIAS EXIWILL', _binary 0x31),
	('17', 'BATERIAS JCI TERM', _binary 0x31),
	('18', 'BATERIAS JCI SECAS', _binary 0x31),
	('19', 'BATERIAS ECUADOR JCI', _binary 0x31),
	('204', 'PT FABRICADO BATERIAS JCI', _binary 0x31),
	('205', 'PT FABRICADO BATERIAS ETNA ', _binary 0x31),
	('207', 'PT FABRICADO BATERIAS ECUADOR ETNA', _binary 0x31),
	('208', 'PT FABRICADO BATERIAS ECUADOR  ENERSYSTEM', _binary 0x31),
	('21', 'MAQUINARIA', _binary 0x31),
	('210', 'PT FABRICADO BATERIAS ENERSYSTEM', _binary 0x31),
	('211', 'PT FABRICADO BATERIAS ECUADOR GM', _binary 0x31),
	('223', 'PP ANTISULFATANTE', _binary 0x31),
	('29', 'MATERIA PRIMA.', _binary 0x31),
	('30', 'ACTIVO', _binary 0x31),
	('302', 'COMERCIAL MAC', _binary 0x31),
	('303', 'COMERCIAL MAC SILVER ', _binary 0x31),
	('304', 'COMERCIAL MAC VARTA', _binary 0x31),
	('305', 'COMERCIAL MAC GOLD', _binary 0x31),
	('306', 'COMERCIAL MAC PMV GOLD', _binary 0x31),
	('307', 'COMERCIAL MAC PMV SILVER ', _binary 0x31),
	('31', 'INVENTARIO DE OPERACION', _binary 0x31),
	('310', 'PT CARGADORES', _binary 0x31),
	('313', 'COMERCIAL SET ', _binary 0x31),
	('314', 'COMERCIAL DURACELL', _binary 0x31),
	('316', 'COMERCIAL CICLO PROFUNDO', _binary 0x31),
	('32', 'BATERIAS SECAS', _binary 0x31),
	('33', 'BATERIAS PF', _binary 0x31),
	('34', 'MATERIALES PRODUCIDOS', _binary 0x31),
	('35', 'MP PRODUCIDA', _binary 0x31),
	('36', 'AGUA DESMINERALIZADA', _binary 0x31),
	('37', 'BATERIAS DE MOTO', _binary 0x31),
	('39', 'BATERIAS CHATARRA', _binary 0x31),
	('43', 'MATERIA PRIMA RECICLADOS', _binary 0x31),
	('44', 'SCRAP', _binary 0x31),
	('45', 'CARGADORES', _binary 0x31),
	('46', 'ANTISULFATANTES', _binary 0x31),
	('48', 'ELECTROLITO', _binary 0x31),
	('49', 'REFINACION PLOMO 3%', _binary 0x31),
	('50', 'REFINACION PLOMO PURO', _binary 0x31),
	('51', 'OXIDACION', _binary 0x31),
	('52', 'REJILLAS', _binary 0x31),
	('53', 'PLACAS', _binary 0x31),
	('54', 'ENSAMBLAJE', _binary 0x31),
	('55', 'CARGA Y ACABADO', _binary 0x31),
	('56', 'SUMINISTROS', _binary 0x31),
	('58', 'REFINACION PLOMO REJILLAS 1.9%', _binary 0x31),
	('59', 'REFINACION PLOMO CALCIO', _binary 0x31),
	('60', 'RECICLAJE PLOMO CRUDO', _binary 0x31),
	('601', 'SUMINISTROS Y REPUESTOS (OLD)', _binary 0x31),
	('61', 'RECICLAJE REF.  PLOMO ANTIMONIO', _binary 0x31),
	('62', 'RECICLAJE REF.  PLOMO COBRE', _binary 0x31),
	('63', 'RECICLAJE REF.  PLOMO ESTANIO', _binary 0x31),
	('64', 'CENIZA', _binary 0x31),
	('65', 'CENIZA CALCIO', _binary 0x31),
	('70', 'REFINACION PREALEACION  ANTIMONIO', _binary 0x31),
	('76', 'ARTICULOS PROMOCIONALES', _binary 0x31),
	('77', 'REFINACION PLOMO CICLO PROFUNDO POSITIVO', _binary 0x31),
	('78', 'REFINACION PLOMO CICLO PROFUNDO NEGATIVO', _binary 0x31),
	('79', 'GASTOS', _binary 0x31),
	('80', 'BATERIAS JCI MERCADERIAS GOLD', _binary 0x31),
	('81', 'TRITURADO.', _binary 0x31),
	('82', 'BATERIAS JCI MERCADERIAS VARTA', _binary 0x31),
	('83', 'BATERIAS JCI MERCADERIAS SILVER', _binary 0x31),
	('84', 'BATERIAS JCI MERCADERIAS PMV', _binary 0x31),
	('3', 'NOTAS DE DEBITO', _binary 0x30),
	('7', 'NO FACTURABLES', _binary 0x30),
	('101', 'MATERIA PRIMA', _binary 0x30),
	('102', 'PP SCRAP', _binary 0x30),
	('103', 'PP RECICLADORA RECICLAJE', _binary 0x30),
	('104', 'PP OXIDADORA', _binary 0x30),
	('105', 'PP REJILLAS ', _binary 0x30),
	('106', 'PP PLACAS', _binary 0x30),
	('107', 'PP ENSAMBLE BATERIAS SECAS ', _binary 0x30),
	('108', 'TRITURADO', _binary 0x30),
	('109', 'MP BAT CHATARRA NOTA DE CREDITO', _binary 0x30),
	('111', 'PP RECICLADORA REFINACION', _binary 0x30),
	('112', 'YESO', _binary 0x30),
	('113', 'PP ENSAMBLE BATERIAS SECAS PRUEBAS', _binary 0x30),
	('114', 'PP PLACAS PRUEBAS', _binary 0x30),
	('115', 'PP REJILLAS PRUEBAS', _binary 0x30),
	('116', 'PP ENSAMBLE BATERIAS SECAS VELKO', _binary 0x30),
	('120', 'PP ADAPTADOR DE PLOMO', _binary 0x30),
	('123', 'PP TRITURADORA', _binary 0x30),
	('124', 'PP RECICLADORA REFINACION (exp)', _binary 0x30),
	('125', 'MP BAT CHATARRA GARANTIA ECUADOR', _binary 0x30),
	('126', 'MP BAT CHATARRA GARANTIA RUBIX', _binary 0x30),
	('127', 'MP BAT CHATARRA GARANTIA HELLA', _binary 0x30),
	('128', 'MP BAT CHATARRA GARANTIA ECU JCI', _binary 0x30),
	('129', 'PP POLIPROPILENO TRITURADO (exp)', _binary 0x30),
	('130', 'PP SEMITERMINADAS CARGADAS', _binary 0x30),
	('131', 'PP PREPARADO DE CORCHO', _binary 0x30),
	('201', 'PT BATERIAS ECUADOR', _binary 0x30),
	('202', 'PT BATERIAS PRUEBAS', _binary 0x30),
	('203', 'PT BATERIAS ECUADOR PF', _binary 0x30),
	('206', 'PT ECUADOR JCI ', _binary 0x30),
	('212', 'PT BATERIAS VELKO (exp)', _binary 0x30),
	('213', 'PT BATERIAS RUBIX', _binary 0x30),
	('214', 'PT BATERIAS RUBIX (exp)', _binary 0x30),
	('215', 'PT BATERIAS Q PARTS (exp)', _binary 0x30),
	('216', 'PT BATERIAS HELLA (exp)', _binary 0x30),
	('217', 'PT BATERIAS KOOR (exp)', _binary 0x30),
	('218', 'PT BATERIAS HELLA', _binary 0x30),
	('219', 'PT BATERIAS RUBIX PF', _binary 0x30),
	('220', 'PT AGUA DESMINERALIZADA', _binary 0x30),
	('221', 'PT BATERIAS ELEKTRA', _binary 0x30),
	('222', 'PT BATERIAS MOTOREX', _binary 0x30),
	('224', 'PT BATERIAS MARCAS BLANCAS', _binary 0x30),
	('225', 'PT BATERIAS MARCAS BLANCAS (exp)', _binary 0x30),
	('226', 'PP SEMITERMINADAS CARGADAS PRUEBAS', _binary 0x30),
	('250', 'PT ANTISULFATANTES', _binary 0x30),
	('301', 'COMERCIAL BOSCH', _binary 0x30),
	('308', 'COMERCIAL BATERIAS DE MOTO', _binary 0x30),
	('309', 'COMERCIAL ACCESORIOS', _binary 0x30),
	('311', 'COMERCIAL ELECTROLITO', _binary 0x30),
	('312', 'COMERCIAL ARTICULOS PROMOCIONALES ', _binary 0x30),
	('315', 'PLUMAS HELLA', _binary 0x30),
	('317', 'COMERCIAL MARKETING', _binary 0x30),
	('318', 'COMERCIAL SERVICIOS', _binary 0x30),
	('319', 'MANUFACTURA SERVICIOS', _binary 0x30),
	('401', 'GASTOS COSTOS Y SERVICIOS ', _binary 0x30),
	('402', 'DESCUENTOS ESPECIALES', _binary 0x30),
	('47', 'NOTAS DE CREDITO (GENERAL)', _binary 0x30),
	('501', 'PROPIEDAD PLANTA EQUIPO ', _binary 0x30),
	('602', 'SUMINISTROS Y REPUESTOS', _binary 0x30);
/*!40000 ALTER TABLE `listalinea` ENABLE KEYS */;

-- Volcando estructura para tabla presupuestos.presupuesto
DROP TABLE IF EXISTS `presupuesto`;
CREATE TABLE IF NOT EXISTS `presupuesto` (
  `codigoPresupuesto` int(11) NOT NULL AUTO_INCREMENT,
  `fechaPresupuesto` date NOT NULL,
  `cantidadMesPresupuesto` double NOT NULL DEFAULT 0,
  `presupuestoMes` double NOT NULL DEFAULT 0,
  `cantidadPromos` int(11) NOT NULL DEFAULT 0,
  `cantidadGarantias` int(11) NOT NULL DEFAULT 0,
  `cantidadTotal` int(11) NOT NULL DEFAULT 0,
  `status` binary(1) NOT NULL DEFAULT '1',
  `codigoVendedor` varchar(50) NOT NULL,
  `codigoLinea` varchar(50) NOT NULL,
  PRIMARY KEY (`codigoPresupuesto`),
  KEY `FK_presupuesto_vendedor` (`codigoVendedor`),
  KEY `FK_presupuesto_listalinea` (`codigoLinea`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla presupuestos.presupuesto: 21 rows
/*!40000 ALTER TABLE `presupuesto` DISABLE KEYS */;
INSERT INTO `presupuesto` (`codigoPresupuesto`, `fechaPresupuesto`, `cantidadMesPresupuesto`, `presupuestoMes`, `cantidadPromos`, `cantidadGarantias`, `cantidadTotal`, `status`, `codigoVendedor`, `codigoLinea`) VALUES
	(3, '2020-01-01', 536.97, 10000.8, 10, 10, 557, _binary 0x31, '18', '201'),
	(4, '2021-02-01', 534.39, 53856.8, 0, 0, 0, _binary 0x31, '18', '201'),
	(5, '2020-01-01', 536.97, 10000.8, 0, 0, 0, _binary 0x31, '18', '201'),
	(6, '2020-01-01', 536.97, 10000.8, 0, 0, 0, _binary 0x31, '18', '201'),
	(7, '2020-01-01', 536.97, 10000.8, 0, 0, 0, _binary 0x31, '18', '201'),
	(8, '2020-01-01', 536.97, 10000.8, 0, 0, 0, _binary 0x31, '18', '201'),
	(9, '2020-01-01', 536.97, 10000.8, 0, 0, 0, _binary 0x31, '18', '201'),
	(10, '2020-01-01', 536.97, 10000.8, 0, 0, 0, _binary 0x31, '18', '201'),
	(11, '2020-01-01', 536.97, 10000.8, 0, 0, 0, _binary 0x31, '18', '201'),
	(12, '2020-01-01', 536.97, 10000.8, 0, 0, 0, _binary 0x31, '18', '201'),
	(13, '2020-01-01', 536.97, 10000.8, 0, 0, 0, _binary 0x31, '18', '201'),
	(14, '2020-01-01', 536.97, 10000.8, 0, 0, 0, _binary 0x31, '18', '201'),
	(15, '2020-01-01', 536.97, 10000.8, 20, 20, 578, _binary 0x31, '18', '201'),
	(16, '2020-01-01', 536.97, 10000.8, 0, 0, 0, _binary 0x31, '18', '201'),
	(17, '2020-01-01', 536.97, 10000.8, 0, 0, 0, _binary 0x31, '18', '201'),
	(18, '2020-01-01', 536.97, 10000.8, 0, 0, 0, _binary 0x31, '18', '201'),
	(19, '2020-01-01', 536.97, 10000.8, 0, 0, 0, _binary 0x31, '18', '201'),
	(20, '2020-01-01', 536.97, 10000.8, 0, 0, 0, _binary 0x31, '18', '201'),
	(21, '2020-01-01', 536.97, 10000.8, 0, 0, 0, _binary 0x31, '18', '201'),
	(22, '2020-01-01', 536.97, 10000.8, 0, 0, 0, _binary 0x31, '18', '201'),
	(23, '2020-01-01', 536.97, 10000.8, 0, 0, 0, _binary 0x31, '18', '201');
/*!40000 ALTER TABLE `presupuesto` ENABLE KEYS */;

-- Volcando estructura para tabla presupuestos.vendedor
DROP TABLE IF EXISTS `vendedor`;
CREATE TABLE IF NOT EXISTS `vendedor` (
  `codigoVendedor` varchar(50) NOT NULL DEFAULT '0',
  `nombreVendedor` varchar(200) NOT NULL DEFAULT '',
  `estadoVendedor` binary(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`codigoVendedor`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla presupuestos.vendedor: 120 rows
/*!40000 ALTER TABLE `vendedor` DISABLE KEYS */;
INSERT INTO `vendedor` (`codigoVendedor`, `nombreVendedor`, `estadoVendedor`) VALUES
	('15', '30 FACTURADORA CUENCA', _binary 0x31),
	('18', '10 FACTURADORA OCCIDENTAL', _binary 0x31),
	('25', '20 FACTURADORA GUAYAQUIL', _binary 0x31),
	('28', 'EMPLEADOS', _binary 0x31),
	('36', '210 FACTURACION AMBATO', _binary 0x31),
	('40', 'CTAS CLAVES NORTE', _binary 0x31),
	('50', '100 FACTURACION SUR', _binary 0x31),
	('51', '140 FACTURACION TUMBACO 1', _binary 0x31),
	('52', '160 FACTURACION SAN RAFAEL 1', _binary 0x31),
	('58', '270 FACTURACION GYE CENTRO', _binary 0x31),
	('59', 'VENDEDOR IBARRA TULCAN', _binary 0x31),
	('62', '70 FACTURACION UIO NORTE', _binary 0x31),
	('63', 'VENDEDOR STO DGO ESMERALDAS', _binary 0x31),
	('65', 'VENDEDOR MANABI', _binary 0x31),
	('66', 'CLIENTES SEG 5', _binary 0x31),
	('67', '240 FACTURACION STO DOMINGO 1', _binary 0x31),
	('68', '40 FACTURACION CARAPUNGO 1', _binary 0x31),
	('70', '220 FACTURACION IBARRA', _binary 0x31),
	('71', 'VENTA DOMICILIO OCCIDENTAL', _binary 0x31),
	('75', 'VENDEDOR CUENCA', _binary 0x31),
	('79', 'CALLCENTER INSTITUCIONAL', _binary 0x31),
	('80', 'CALLCENTER DISTRIBUIDORES', _binary 0x31),
	('82', 'VENDEDOR COCA LAGO AGRIO', _binary 0x31),
	('83', '150 FACTURACION TUMBACO 2', _binary 0x31),
	('85', '130 FACTURACION GUAMANI', _binary 0x31),
	('88', '60 FACTURACION OFELIA', _binary 0x31),
	('89', '90 FACTURACION VILLAFLORA', _binary 0x31),
	('90', '180 FACTURACION SANGOLQUI', _binary 0x31),
	('91', '80 FACTURACION INCA', _binary 0x31),
	('92', '260 FACTURACION ESMERALDAS', _binary 0x31),
	('93', 'CTAS CLAVES SUR', _binary 0x31),
	('94', '50 FACTURACION CARAPUNGO 2', _binary 0x31),
	('96', '190 FACTURACION MACHACHI ', _binary 0x31),
	('97', '110 FACTURACION MARISCAL', _binary 0x31),
	('98', '120 FACTURACION QUITUMBE', _binary 0x31),
	('100', 'FABRIBAT CIA LTDA', _binary 0x31),
	('102', '200 FACTURACION QUINCHE', _binary 0x31),
	('103', 'SISTEMAS IT', _binary 0x31),
	('104', 'CALLCENTER DISTRIBUIDORES GYE', _binary 0x31),
	('106', 'NEURAL', _binary 0x31),
	('107', 'NEURAL1', _binary 0x31),
	('108', 'NEURAL2', _binary 0x31),
	('110', 'GIOVANNI HEREDIA', _binary 0x31),
	('130', '280 FACTURACION MANTA', _binary 0x31),
	('150', 'VENTA DOMICILIO GUAYAQUIL', _binary 0x31),
	('180', '300 FACTURACION LAGO AGRIO', _binary 0x31),
	('190', 'VENTA DIRECTA ', _binary 0x31),
	('210', 'SUPERMERCADOS', _binary 0x31),
	('220', 'VENDEDOR GUAYAQUIL', _binary 0x31),
	('310', '310 FACTURACION RIOBAMBA', _binary 0x31),
	('0', 'FACTURADOR PLANTA', _binary 0x30),
	('1', 'GONZALO TORRES', _binary 0x30),
	('2', 'JUAN FERNANDO YEPEZ', _binary 0x30),
	('3', 'ANGELA CONSTANTE', _binary 0x30),
	('4', 'GERARDO NOROÑA', _binary 0x30),
	('5', 'EDWIN PERALTA', _binary 0x30),
	('6', 'MARCELO REYES', _binary 0x30),
	('7', 'DORIS RIVERA', _binary 0x30),
	('8', 'GEOVANY BALTAZARI', _binary 0x30),
	('9', 'RICHARD GAIBOR', _binary 0x30),
	('10', 'OSCAR LOOR', _binary 0x30),
	('11', 'HECTOR PADILLA', _binary 0x30),
	('12', 'RICARDO PILACUAN', _binary 0x30),
	('13', 'DEISY SANTILLAN', _binary 0x30),
	('14', 'GINSON MERINO', _binary 0x30),
	('16', 'ALVARO TERAN', _binary 0x30),
	('17', 'EDWIN SALAZAR', _binary 0x30),
	('19', 'PABLO VASQUEZ', _binary 0x30),
	('20', 'RUBEN SALGADO', _binary 0x30),
	('21', 'GUSTAVO LEON', _binary 0x30),
	('22', 'JOEL VIZHÑAY', _binary 0x30),
	('23', 'JHONNY REYES', _binary 0x30),
	('24', 'GEN VALENCIA', _binary 0x30),
	('26', 'JULIO CESAR MUÑOZ', _binary 0x30),
	('27', 'CARLOS DEL ROSARIO', _binary 0x30),
	('29', 'LORENA AGUILAR', _binary 0x30),
	('30', 'CLEBER VELASQUEZ', _binary 0x30),
	('31', 'CARLOS CAMPUZANO', _binary 0x30),
	('32', 'DANNY HARO', _binary 0x30),
	('33', 'TATIANA LOPEZ', _binary 0x30),
	('34', 'LUIS OLIVO', _binary 0x30),
	('35', 'CRISTINA BERNAL', _binary 0x30),
	('37', 'JUAN CARLOS JIMENEZ', _binary 0x30),
	('41', 'GEOVANNY CALDERON', _binary 0x30),
	('42', 'VENDEDOR EL ORO', _binary 0x30),
	('43', 'MARIO LALAMA', _binary 0x30),
	('44', 'HUGO CHAVEZ', _binary 0x30),
	('45', 'HENRY CUNALATA', _binary 0x30),
	('46', 'ANDRES BOADA', _binary 0x30),
	('47', 'VENDEDOR LOS RIOS', _binary 0x30),
	('48', 'POS1 OCCIDENTAL', _binary 0x30),
	('53', 'P. COMPRAS PUBLICAS GYE', _binary 0x30),
	('54', 'P. COMPRAS PUBLICAS UIO', _binary 0x30),
	('55', 'FACTURACION GYE NORTE', _binary 0x30),
	('56', 'FACTURACION GYE DURAN', _binary 0x30),
	('57', 'FACTURACION CUE SUR', _binary 0x30),
	('60', 'LUIS MEDIAVILLA', _binary 0x30),
	('61', 'DANIEL QUERIDO', _binary 0x30),
	('69', 'FACTURACION GYE CENTRO 2', _binary 0x30),
	('72', 'SERV. DOMC. MOTORIZADO 1', _binary 0x30),
	('73', 'WILLIAM MUÑOZ', _binary 0x30),
	('74', 'JAVIER PAZMIÑO', _binary 0x30),
	('76', 'VENDEDOR ZONA CENTRAL', _binary 0x30),
	('77', 'FRANCISCO ZAMBRANO', _binary 0x30),
	('78', 'CARLOS GALARRAGA', _binary 0x30),
	('81', 'RUTA ORIENTE', _binary 0x30),
	('84', '170 FACTURACION SAN RAFAEL 2', _binary 0x30),
	('86', 'FACTURACION  LATACUNGA  EXP', _binary 0x30),
	('87', 'MICHAEL HUFF', _binary 0x30),
	('95', '250 FACTURACION STO DOMINGO 2', _binary 0x30),
	('99', 'LEGAL-DR. RAUL RODRIGUEZ', _binary 0x30),
	('101', 'VENDEDOR LATACUNGA RIOBAMBA', _binary 0x30),
	('105', 'PROVEEDORES', _binary 0x30),
	('109', 'WILLIAMS QUINGA', _binary 0x30),
	('120', 'GABRIELA MENDOZA', _binary 0x30),
	('140', '230 FACTURACION LATACUNGA', _binary 0x30),
	('160', 'CESAR MORAN', _binary 0x30),
	('170', '290 FACTURACION PORTOVIEJO', _binary 0x30),
	('200', 'PASIVOS', _binary 0x30),
	('221', 'FACTURADOR MATRIZ', _binary 0x30);
/*!40000 ALTER TABLE `vendedor` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
