-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.4.11-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              10.3.0.5771
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Copiando estrutura para tabela batponto.acessos
CREATE TABLE IF NOT EXISTS `acessos` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` varchar(20) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `horario` datetime NOT NULL,
  `id_status` tinyint(1) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela batponto.acessos: ~11 rows (aproximadamente)
DELETE FROM `acessos`;
/*!40000 ALTER TABLE `acessos` DISABLE KEYS */;
INSERT INTO `acessos` (`id`, `uid`, `horario`, `id_status`) VALUES
	(36, 'c9c3ef97HTTP/1.1', '2020-03-28 15:21:13', 0),
	(37, '4a2cd73HTTP/1.1', '2020-03-28 15:21:24', 0),
	(38, '76348fcHTTP/1.1', '2020-03-28 15:21:56', 0),
	(39, '4a2cd73HTTP/1.1', '2020-03-28 15:24:43', 0),
	(40, 'c9c3ef97HTTP/1.1', '2020-03-28 15:24:46', 0),
	(41, '76348fcHTTP/1.1', '2020-03-28 15:24:48', 0),
	(42, '4a2cd73HTTP/1.1', '2020-03-28 17:04:33', 0),
	(43, '4a2cd73HTTP/1.1', '2020-03-28 17:09:03', 0),
	(44, '4a2cd73HTTP', '2020-04-04 16:42:07', 1),
	(45, '4a2cd73HTTP', '2020-04-04 16:42:15', 1),
	(46, '76348fc', '2020-04-04 17:11:57', 1),
	(47, '76348fc', '2020-04-04 17:12:11', 1),
	(48, '4a2cd73', '2020-04-06 08:18:45', 1),
	(49, '4a2cd73', '2020-04-06 08:19:35', 1);
/*!40000 ALTER TABLE `acessos` ENABLE KEYS */;

-- Copiando estrutura para tabela batponto.acesso_status
CREATE TABLE IF NOT EXISTS `acesso_status` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tipo` varchar(20) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela batponto.acesso_status: ~2 rows (aproximadamente)
DELETE FROM `acesso_status`;
/*!40000 ALTER TABLE `acesso_status` DISABLE KEYS */;
INSERT INTO `acesso_status` (`id`, `tipo`) VALUES
	(1, 'Entrada'),
	(2, 'Saída');
/*!40000 ALTER TABLE `acesso_status` ENABLE KEYS */;

-- Copiando estrutura para tabela batponto.cargos
CREATE TABLE IF NOT EXISTS `cargos` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela batponto.cargos: ~4 rows (aproximadamente)
DELETE FROM `cargos`;
/*!40000 ALTER TABLE `cargos` DISABLE KEYS */;
INSERT INTO `cargos` (`id`, `nome`) VALUES
	(1, 'presidente(a)'),
	(2, 'vice presidente(a)'),
	(3, 'diretor(a)'),
	(4, 'acessor'),
	(5, 'trainee');
/*!40000 ALTER TABLE `cargos` ENABLE KEYS */;

-- Copiando estrutura para tabela batponto.departamentos
CREATE TABLE IF NOT EXISTS `departamentos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela batponto.departamentos: ~4 rows (aproximadamente)
DELETE FROM `departamentos`;
/*!40000 ALTER TABLE `departamentos` DISABLE KEYS */;
INSERT INTO `departamentos` (`id`, `nome`) VALUES
	(1, 'projetos'),
	(2, 'financeiro'),
	(3, 'gestão de pessoas'),
	(4, 'marketing'),
	(5, 'diretoria');
/*!40000 ALTER TABLE `departamentos` ENABLE KEYS */;

-- Copiando estrutura para tabela batponto.membros
CREATE TABLE IF NOT EXISTS `membros` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `id_cargo` tinyint(5) NOT NULL DEFAULT 0,
  `email` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `id_departamento` tinyint(5) unsigned NOT NULL,
  `senha` varchar(100) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela batponto.membros: ~4 rows (aproximadamente)
DELETE FROM `membros`;
/*!40000 ALTER TABLE `membros` DISABLE KEYS */;
INSERT INTO `membros` (`id`, `nome`, `id_cargo`, `email`, `id_departamento`, `senha`) VALUES
	(5, 'Lukas', 1, 'l@gmail.com.br', 3, '$2y$10$Da/R9J/9j7hKbZ9TlgUBu.awaTXmOnOt1bZ7tzlDgtgnri2DUv5BS'),
	(7, 'Karine', 1, 'k@gmail.com', 2, '$2y$10$E0rbeuJSww/yhkdZcFV/susejVsVgb9KVbvW.u3aSgWptFtM8WkSC'),
	(8, 'Melo', 1, 'm@gmail.com', 2, '$2y$10$1OQeCupv6HPb28bHJENLW.CCK70iNj/ZuITANdPOAROGnUjqKyFn2');
/*!40000 ALTER TABLE `membros` ENABLE KEYS */;

-- Copiando estrutura para tabela batponto.tags_cadastradas
CREATE TABLE IF NOT EXISTS `tags_cadastradas` (
  `uid` varchar(20) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `id_membro` int(10) unsigned DEFAULT NULL,
  `id` int(10) unsigned NOT NULL DEFAULT 0,
  `tipo` varchar(20) CHARACTER SET utf8 DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela batponto.tags_cadastradas: ~3 rows (aproximadamente)
DELETE FROM `tags_cadastradas`;
/*!40000 ALTER TABLE `tags_cadastradas` DISABLE KEYS */;
INSERT INTO `tags_cadastradas` (`uid`, `id_membro`, `id`, `tipo`) VALUES
	('4a2cd73', 1, 4, '0'),
	('c9c3ef97', 2, 5, '0'),
	('76348fc', 3, 6, '0');
/*!40000 ALTER TABLE `tags_cadastradas` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
