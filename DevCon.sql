-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           5.5.5-10.1.16-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win32
-- HeidiSQL Versão:              8.3.0.4694
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Copiando estrutura do banco de dados para xxx
CREATE DATABASE IF NOT EXISTS `xxx` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `xxx`;


-- Copiando estrutura para tabela xxx.apartamento
CREATE TABLE IF NOT EXISTS `apartamento` (
  `idAp` int(11) NOT NULL AUTO_INCREMENT,
  `bloco` varchar(50) DEFAULT NULL,
  `andar` varchar(50) DEFAULT NULL,
  `numero` int(11) DEFAULT NULL,
  PRIMARY KEY (`idAp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Exportação de dados foi desmarcado.


-- Copiando estrutura para tabela xxx.condomino
CREATE TABLE IF NOT EXISTS `condomino` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Exportação de dados foi desmarcado.


-- Copiando estrutura para tabela xxx.cond_ap
CREATE TABLE IF NOT EXISTS `cond_ap` (
  `idCondAp` int(11) NOT NULL AUTO_INCREMENT,
  `idCond` int(11) DEFAULT NULL,
  `idAp` int(11) DEFAULT NULL,
  PRIMARY KEY (`idCondAp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Exportação de dados foi desmarcado.


-- Copiando estrutura para tabela xxx.funcionario
CREATE TABLE IF NOT EXISTS `funcionario` (
  `id_func` int(11) NOT NULL,
  `nome_func` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_func`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Exportação de dados foi desmarcado.


-- Copiando estrutura para tabela xxx.pessoas
CREATE TABLE IF NOT EXISTS `pessoas` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  `cpf` varchar(255) DEFAULT NULL,
  `tipo` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Exportação de dados foi desmarcado.


-- Copiando estrutura para tabela xxx.usuarios
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  `login` varchar(255) DEFAULT NULL,
  `senha` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `tipo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Exportação de dados foi desmarcado.


-- Copiando estrutura para tabela xxx.usuarios_pessoas
CREATE TABLE IF NOT EXISTS `usuarios_pessoas` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `idPessoa` bigint(20) DEFAULT NULL,
  `idUsuario` bigint(20) DEFAULT NULL,
  `observacao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_PES_USU_ID` (`idPessoa`),
  KEY `FK_USU_PES_ID` (`idUsuario`),
  CONSTRAINT `FK_PES_USU_ID` FOREIGN KEY (`idPessoa`) REFERENCES `pessoas` (`id`),
  CONSTRAINT `FK_USU_PES_ID` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Exportação de dados foi desmarcado.


-- Copiando estrutura para trigger xxx.deleteAp
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `deleteAp` BEFORE DELETE ON `apartamento` FOR EACH ROW BEGIN
DELETE FROM cond_ap WHERE cond_ap.idAp=OLD.idAp; 
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;


-- Copiando estrutura para trigger xxx.deleteCond
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `deleteCond` BEFORE UPDATE ON `condomino` FOR EACH ROW BEGIN
DELETE FROM cond_ap
WHERE  cond_ap.idCond=OLD.id;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
