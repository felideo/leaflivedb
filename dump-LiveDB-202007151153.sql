-- MySQL dump 10.13  Distrib 5.7.30, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: LiveDB
-- ------------------------------------------------------
-- Server version	5.7.30-0ubuntu0.18.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `arquivo`
--

DROP TABLE IF EXISTS `arquivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `arquivo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hash` varchar(32) NOT NULL,
  `nome` varchar(128) NOT NULL,
  `endereco` varchar(256) NOT NULL,
  `tamanho` decimal(10,0) NOT NULL,
  `extensao` varchar(16) NOT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arquivo`
--

LOCK TABLES `arquivo` WRITE;
/*!40000 ALTER TABLE `arquivo` DISABLE KEYS */;
INSERT INTO `arquivo` VALUES (1,'b27beb6b712337afb6e312e5389328ab','unnamed','uploads/imagens/b27beb6b712337afb6e312e5389328ab.jpg',0,'.jpg',1),(2,'5e893d8850a2f9c5ba9689f419f9ace3','unnamed','uploads/imagens/5e893d8850a2f9c5ba9689f419f9ace3.jpg',0,'.jpg',1);
/*!40000 ALTER TABLE `arquivo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autor`
--

DROP TABLE IF EXISTS `autor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `autor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(256) NOT NULL,
  `email` varchar(256) DEFAULT NULL,
  `link` varchar(256) DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autor`
--

LOCK TABLES `autor` WRITE;
/*!40000 ALTER TABLE `autor` DISABLE KEYS */;
/*!40000 ALTER TABLE `autor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blame_cadastro_organismo`
--

DROP TABLE IF EXISTS `blame_cadastro_organismo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blame_cadastro_organismo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario_cadastro` int(11) DEFAULT NULL,
  `id_usuario_aprovacao` int(11) DEFAULT NULL,
  `data_cadastro` datetime NOT NULL,
  `data_aprovacao` datetime DEFAULT NULL,
  `operacao` varchar(128) NOT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `id_usuario_cadastro` (`id_usuario_cadastro`),
  KEY `id_usuario_aprovacao` (`id_usuario_aprovacao`),
  CONSTRAINT `blame_cadastro_organismo_ibfk_1` FOREIGN KEY (`id_usuario_cadastro`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `blame_cadastro_organismo_ibfk_2` FOREIGN KEY (`id_usuario_aprovacao`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blame_cadastro_organismo`
--

LOCK TABLES `blame_cadastro_organismo` WRITE;
/*!40000 ALTER TABLE `blame_cadastro_organismo` DISABLE KEYS */;
/*!40000 ALTER TABLE `blame_cadastro_organismo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classificacao`
--

DROP TABLE IF EXISTS `classificacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classificacao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(128) NOT NULL,
  `id_classificacao` int(11) DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `id_classificacao` (`id_classificacao`),
  CONSTRAINT `classificacao_ibfk_1` FOREIGN KEY (`id_classificacao`) REFERENCES `classificacao` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classificacao`
--

LOCK TABLES `classificacao` WRITE;
/*!40000 ALTER TABLE `classificacao` DISABLE KEYS */;
INSERT INTO `classificacao` VALUES (1,'Reino',NULL,1),(2,'Filo',1,1),(3,'Classe',2,1),(4,'Ordem',3,1),(5,'Familia',4,1),(6,'Genero',5,1),(7,'Especie',6,1),(8,'Subespecie',7,1);
/*!40000 ALTER TABLE `classificacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hierarquia`
--

DROP TABLE IF EXISTS `hierarquia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hierarquia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(64) NOT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hierarquia`
--

LOCK TABLES `hierarquia` WRITE;
/*!40000 ALTER TABLE `hierarquia` DISABLE KEYS */;
INSERT INTO `hierarquia` VALUES (1,'Administrador',1),(2,'Usuario Front',1);
/*!40000 ALTER TABLE `hierarquia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hierarquia_relaciona_permissao`
--

DROP TABLE IF EXISTS `hierarquia_relaciona_permissao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hierarquia_relaciona_permissao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_hierarquia` int(11) NOT NULL,
  `id_permissao` int(11) NOT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `id_hierarquia` (`id_hierarquia`),
  KEY `id_permissao` (`id_permissao`),
  CONSTRAINT `hierarquia_relaciona_permissao_ibfk_1` FOREIGN KEY (`id_hierarquia`) REFERENCES `hierarquia` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `hierarquia_relaciona_permissao_ibfk_2` FOREIGN KEY (`id_permissao`) REFERENCES `permissao` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hierarquia_relaciona_permissao`
--

LOCK TABLES `hierarquia_relaciona_permissao` WRITE;
/*!40000 ALTER TABLE `hierarquia_relaciona_permissao` DISABLE KEYS */;
INSERT INTO `hierarquia_relaciona_permissao` VALUES (1,2,41,0),(2,2,42,0),(3,2,43,0),(4,1,5,1),(5,1,6,1),(6,1,7,1),(7,1,8,1),(8,1,17,1),(9,1,18,1),(10,1,19,1),(11,1,20,1),(12,1,21,1),(13,1,22,1),(14,1,23,1),(15,1,24,1),(16,1,25,1),(17,1,26,1),(18,1,27,1),(19,1,28,1),(20,1,29,1),(21,1,30,1),(22,1,31,1),(23,1,32,1),(24,1,33,1),(25,1,34,1),(26,1,35,1),(27,1,36,1),(28,1,37,1),(29,1,38,1),(30,1,39,1),(31,1,40,1),(32,1,41,1),(33,1,42,1),(34,1,43,1),(35,1,44,1),(36,1,45,1),(37,1,46,1),(38,1,47,1),(39,1,48,1),(40,1,49,1),(41,1,50,1),(42,1,51,1),(43,1,52,1);
/*!40000 ALTER TABLE `hierarquia_relaciona_permissao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `idioma`
--

DROP TABLE IF EXISTS `idioma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idioma` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idioma` varchar(64) NOT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `idioma`
--

LOCK TABLES `idioma` WRITE;
/*!40000 ALTER TABLE `idioma` DISABLE KEYS */;
INSERT INTO `idioma` VALUES (1,'Portugues',1);
/*!40000 ALTER TABLE `idioma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modulo`
--

DROP TABLE IF EXISTS `modulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modulo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `modulo` varchar(64) NOT NULL,
  `nome` varchar(64) NOT NULL,
  `id_submenu` int(11) DEFAULT NULL,
  `hierarquia` int(11) NOT NULL,
  `icone` varchar(64) NOT NULL DEFAULT 'fa-angle-right',
  `oculto` tinyint(1) NOT NULL DEFAULT '0',
  `ordem` int(11) NOT NULL DEFAULT '1000',
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `id_submenu` (`id_submenu`),
  CONSTRAINT `modulo_ibfk_1` FOREIGN KEY (`id_submenu`) REFERENCES `submenu` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modulo`
--

LOCK TABLES `modulo` WRITE;
/*!40000 ALTER TABLE `modulo` DISABLE KEYS */;
INSERT INTO `modulo` VALUES (1,'modulo','Modulos',1,0,'fa-check-square-o',0,1000,1),(2,'usuario','Usuarios',NULL,1,'fa-users',0,1000,1),(3,'configuracao','Configurações',1,0,'fa-arrows-h',0,1000,1),(4,'submenu','Submenus',1,0,'fa-sitemap',0,1000,1),(5,'hierarquia','Hierarquias',NULL,1,'fa-sitemap',0,10000,1),(6,'trabalho','Trabalhos',NULL,1,'fa-book',0,3000,1),(7,'autor','Autores',NULL,1,'fa-user',0,2000,1),(8,'classificacao','Classificações',NULL,1,'fa-list-ul',0,1000,1),(9,'idioma','Idiomas',NULL,1,'fa-language',0,1000,1),(10,'nome_popular','Nomes Populares',NULL,1,'fa-chevron-right ',0,1000,1),(11,'organismo','Organismos',NULL,1,'fa-leaf',0,1000,1),(12,'palavra_chave','Palavras Chave',NULL,1,'fa-chain',0,1000,1),(13,'taxon','Taxonomias',NULL,1,'fa-sitemap',0,1000,1);
/*!40000 ALTER TABLE `modulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nome_popular`
--

DROP TABLE IF EXISTS `nome_popular`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nome_popular` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(128) NOT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nome_popular`
--

LOCK TABLES `nome_popular` WRITE;
/*!40000 ALTER TABLE `nome_popular` DISABLE KEYS */;
INSERT INTO `nome_popular` VALUES (1,'pau-brasil',1),(2,'pau-de-pernambuco',1),(3,'arabutã',1),(4,'ibirapiranga',1),(5,'ibirapitá',1),(6,'ibirapitanga',1),(7,'orabutã',1),(8,'pau-de-tinta',1),(9,'pau-pernambuco',1),(10,'pau-rosado',1);
/*!40000 ALTER TABLE `nome_popular` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organismo`
--

DROP TABLE IF EXISTS `organismo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organismo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(256) NOT NULL,
  `organismo` varchar(1024) DEFAULT NULL,
  `numero_petalas` int(11) NOT NULL,
  `numero_estames` int(11) NOT NULL,
  `posicao_ovario` varchar(64) NOT NULL,
  `forma_folha` varchar(128) NOT NULL DEFAULT '0',
  `descricao` text NOT NULL,
  `id_last_taxon` int(11) NOT NULL,
  `localizador` text NOT NULL,
  `aprovado` tinyint(1) NOT NULL DEFAULT '0',
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `id_last_taxon` (`id_last_taxon`),
  CONSTRAINT `organismo_ibfk_1` FOREIGN KEY (`id_last_taxon`) REFERENCES `taxon` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organismo`
--

LOCK TABLES `organismo` WRITE;
/*!40000 ALTER TABLE `organismo` DISABLE KEYS */;
INSERT INTO `organismo` VALUES (1,'echinata','',4,4,'???','digitiforme','A árvore alcança entre dez e quinze metros de altura e possui tronco reto, com casca cor cinza-escuro, coberta de acúleos, especialmente nos ramos mais jovens.\r\n\r\nAs folhas são compostas bipinadas, de cor verde médio, brilhantes.\r\n\r\nAs flores nascem em racemos eretos próximo ao ápice dos ramos. Possuem quatro pétalas amarelas e uma menor vermelha, muito aromáticas; no centro, encontram-se dez estames e um pistilo com ovário súpero alongado.\r\n\r\nOs frutos são vagens cobertas por longos e afiados espinhos, que devem protegê-los de pássaros indesejáveis, pois estes comeriam os frutos. Contém de uma a cinco sementes discoides, de cor marrom. A torção do legume, ao liberar as sementes, ajuda a aumentar a distância da dispersão. ',8,'-2-3-4-5-6-7-8-',0,1);
/*!40000 ALTER TABLE `organismo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organismo_relaciona_imagem`
--

DROP TABLE IF EXISTS `organismo_relaciona_imagem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organismo_relaciona_imagem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_arquivo` int(11) NOT NULL,
  `id_organismo` int(11) NOT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `id_organismo` (`id_organismo`),
  KEY `id_arquivo` (`id_arquivo`),
  CONSTRAINT `organismo_relaciona_imagem_ibfk_1` FOREIGN KEY (`id_organismo`) REFERENCES `organismo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `organismo_relaciona_imagem_ibfk_2` FOREIGN KEY (`id_arquivo`) REFERENCES `arquivo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organismo_relaciona_imagem`
--

LOCK TABLES `organismo_relaciona_imagem` WRITE;
/*!40000 ALTER TABLE `organismo_relaciona_imagem` DISABLE KEYS */;
INSERT INTO `organismo_relaciona_imagem` VALUES (1,2,1,1);
/*!40000 ALTER TABLE `organismo_relaciona_imagem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organismo_relaciona_nome_popular`
--

DROP TABLE IF EXISTS `organismo_relaciona_nome_popular`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organismo_relaciona_nome_popular` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_organismo` int(11) NOT NULL,
  `id_nome_popular` int(11) NOT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `id_organismo` (`id_organismo`),
  KEY `id_nome_popular` (`id_nome_popular`),
  CONSTRAINT `organismo_relaciona_nome_popular_ibfk_1` FOREIGN KEY (`id_organismo`) REFERENCES `organismo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `organismo_relaciona_nome_popular_ibfk_2` FOREIGN KEY (`id_nome_popular`) REFERENCES `nome_popular` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organismo_relaciona_nome_popular`
--

LOCK TABLES `organismo_relaciona_nome_popular` WRITE;
/*!40000 ALTER TABLE `organismo_relaciona_nome_popular` DISABLE KEYS */;
INSERT INTO `organismo_relaciona_nome_popular` VALUES (1,1,1,1),(2,1,2,1),(3,1,3,1),(4,1,6,1),(5,1,4,1),(6,1,5,1),(7,1,7,1),(8,1,8,1),(9,1,9,1),(10,1,10,1);
/*!40000 ALTER TABLE `organismo_relaciona_nome_popular` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organismo_relaciona_trabalho`
--

DROP TABLE IF EXISTS `organismo_relaciona_trabalho`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organismo_relaciona_trabalho` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_organismo` int(11) NOT NULL,
  `id_trabalho` int(11) NOT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `id_trabalho` (`id_trabalho`),
  KEY `id_organismo` (`id_organismo`),
  CONSTRAINT `organismo_relaciona_trabalho_ibfk_1` FOREIGN KEY (`id_trabalho`) REFERENCES `trabalho` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `organismo_relaciona_trabalho_ibfk_2` FOREIGN KEY (`id_organismo`) REFERENCES `organismo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organismo_relaciona_trabalho`
--

LOCK TABLES `organismo_relaciona_trabalho` WRITE;
/*!40000 ALTER TABLE `organismo_relaciona_trabalho` DISABLE KEYS */;
/*!40000 ALTER TABLE `organismo_relaciona_trabalho` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organismo_trabalho_autor`
--

DROP TABLE IF EXISTS `organismo_trabalho_autor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organismo_trabalho_autor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_organismo` int(11) NOT NULL,
  `id_trabalho` int(11) NOT NULL,
  `id_autor` int(11) NOT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `id_organismo` (`id_organismo`),
  KEY `id_trabalho` (`id_trabalho`),
  KEY `id_autor` (`id_autor`),
  CONSTRAINT `organismo_trabalho_autor_ibfk_1` FOREIGN KEY (`id_organismo`) REFERENCES `organismo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `organismo_trabalho_autor_ibfk_2` FOREIGN KEY (`id_trabalho`) REFERENCES `trabalho` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `organismo_trabalho_autor_ibfk_3` FOREIGN KEY (`id_autor`) REFERENCES `autor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organismo_trabalho_autor`
--

LOCK TABLES `organismo_trabalho_autor` WRITE;
/*!40000 ALTER TABLE `organismo_trabalho_autor` DISABLE KEYS */;
/*!40000 ALTER TABLE `organismo_trabalho_autor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `palavra_chave`
--

DROP TABLE IF EXISTS `palavra_chave`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `palavra_chave` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `palavra_chave` varchar(128) NOT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `palavra_chave`
--

LOCK TABLES `palavra_chave` WRITE;
/*!40000 ALTER TABLE `palavra_chave` DISABLE KEYS */;
/*!40000 ALTER TABLE `palavra_chave` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissao`
--

DROP TABLE IF EXISTS `permissao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_modulo` int(11) NOT NULL,
  `permissao` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_modulo` (`id_modulo`),
  CONSTRAINT `permissao_ibfk_1` FOREIGN KEY (`id_modulo`) REFERENCES `modulo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissao`
--

LOCK TABLES `permissao` WRITE;
/*!40000 ALTER TABLE `permissao` DISABLE KEYS */;
INSERT INTO `permissao` VALUES (1,1,'modulo_criar'),(2,1,'modulo_visualizar'),(3,1,'modulo_editar'),(4,1,'modulo_deletar'),(5,2,'usuario_criar'),(6,2,'usuario_visualizar'),(7,2,'usuario_editar'),(8,2,'usuario_deletar'),(9,3,'configuracao_criar'),(10,3,'configuracao_visualizar'),(11,3,'configuracao_editar'),(12,3,'configuracao_deletar'),(13,4,'submenu_criar'),(14,4,'submenu_visualizar'),(15,4,'submenu_editar'),(16,4,'submenu_deletar'),(17,5,'hierarquia_criar'),(18,5,'hierarquia_visualizar'),(19,5,'hierarquia_editar'),(20,5,'hierarquia_deletar'),(21,6,'trabalho_criar'),(22,6,'trabalho_visualizar'),(23,6,'trabalho_editar'),(24,6,'trabalho_deletar'),(25,7,'autor_criar'),(26,7,'autor_visualizar'),(27,7,'autor_editar'),(28,7,'autor_deletar'),(29,8,'clasificacao_criar'),(30,8,'clasificacao_visualizar'),(31,8,'clasificacao_editar'),(32,8,'clasificacao_deletar'),(33,9,'idioma_criar'),(34,9,'idioma_visualizar'),(35,9,'idioma_editar'),(36,9,'idioma_deletar'),(37,10,'nome_popular_criar'),(38,10,'nome_popular_visualizar'),(39,10,'nome_popular_editar'),(40,10,'nome_popular_deletar'),(41,11,'organismo_criar'),(42,11,'organismo_visualizar'),(43,11,'organismo_editar'),(44,11,'organismo_deletar'),(45,12,'palavra_chave_criar'),(46,12,'palavra_chave_visualizar'),(47,12,'palavra_chave_editar'),(48,12,'palavra_chave_deletar'),(49,13,'taxon_criar'),(50,13,'taxon_visualizar'),(51,13,'taxon_editar'),(52,13,'taxon_deletar');
/*!40000 ALTER TABLE `permissao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pessoa`
--

DROP TABLE IF EXISTS `pessoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pessoa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `pronome` varchar(64) DEFAULT NULL,
  `nome` varchar(64) NOT NULL,
  `sobrenome` varchar(256) NOT NULL,
  `instituicao` varchar(512) NOT NULL,
  `atuacao` text NOT NULL,
  `lattes` text,
  `grau` text NOT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `pessoa_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoa`
--

LOCK TABLES `pessoa` WRITE;
/*!40000 ALTER TABLE `pessoa` DISABLE KEYS */;
/*!40000 ALTER TABLE `pessoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posicao_geografica`
--

DROP TABLE IF EXISTS `posicao_geografica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posicao_geografica` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `latitude` decimal(12,4) NOT NULL,
  `longitude` decimal(12,4) NOT NULL,
  `id_organismo` int(11) NOT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `id_organismo` (`id_organismo`),
  CONSTRAINT `posicao_geografica_ibfk_1` FOREIGN KEY (`id_organismo`) REFERENCES `organismo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posicao_geografica`
--

LOCK TABLES `posicao_geografica` WRITE;
/*!40000 ALTER TABLE `posicao_geografica` DISABLE KEYS */;
/*!40000 ALTER TABLE `posicao_geografica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submenu`
--

DROP TABLE IF EXISTS `submenu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submenu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(64) NOT NULL,
  `icone` varchar(64) NOT NULL DEFAULT 'fa-angle-right',
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  `nome_exibicao` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submenu`
--

LOCK TABLES `submenu` WRITE;
/*!40000 ALTER TABLE `submenu` DISABLE KEYS */;
INSERT INTO `submenu` VALUES (1,'desenvolvedor','fa-github',1,'Desenvolvedor');
/*!40000 ALTER TABLE `submenu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxon`
--

DROP TABLE IF EXISTS `taxon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(128) NOT NULL,
  `id_classificacao` int(11) NOT NULL,
  `id_taxon` int(11) DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `id_classificacao` (`id_classificacao`),
  KEY `id_taxonomia` (`id_taxon`),
  CONSTRAINT `taxon_ibfk_1` FOREIGN KEY (`id_classificacao`) REFERENCES `classificacao` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `taxon_ibfk_2` FOREIGN KEY (`id_taxon`) REFERENCES `taxon` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxon`
--

LOCK TABLES `taxon` WRITE;
/*!40000 ALTER TABLE `taxon` DISABLE KEYS */;
INSERT INTO `taxon` VALUES (2,'Plantae',1,NULL,1),(3,'Magnoliophyta',2,2,1),(4,'Magnoliopsida',3,3,1),(5,'Fabales',4,4,1),(6,'Fabaceae',5,5,1),(7,'Paubrasilia',6,6,1),(8,'echinata',7,7,1);
/*!40000 ALTER TABLE `taxon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trabalho`
--

DROP TABLE IF EXISTS `trabalho`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trabalho` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` text NOT NULL,
  `ano` int(4) NOT NULL,
  `resumo` text NOT NULL,
  `link_trabalho` text,
  `id_arquivo` int(11) DEFAULT NULL,
  `id_idioma` int(11) NOT NULL,
  `id_autor` int(11) NOT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `id_arquivo` (`id_arquivo`),
  KEY `id_idioma` (`id_idioma`),
  KEY `id_autor` (`id_autor`),
  CONSTRAINT `trabalho_ibfk_1` FOREIGN KEY (`id_arquivo`) REFERENCES `arquivo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `trabalho_ibfk_2` FOREIGN KEY (`id_idioma`) REFERENCES `idioma` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `trabalho_ibfk_3` FOREIGN KEY (`id_autor`) REFERENCES `autor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trabalho`
--

LOCK TABLES `trabalho` WRITE;
/*!40000 ALTER TABLE `trabalho` DISABLE KEYS */;
/*!40000 ALTER TABLE `trabalho` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trabalho_relaciona_palavra_chave`
--

DROP TABLE IF EXISTS `trabalho_relaciona_palavra_chave`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trabalho_relaciona_palavra_chave` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_trabalho` int(11) NOT NULL,
  `id_palavra_chave` int(11) NOT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `id_trabalho` (`id_trabalho`),
  KEY `id_palavra_chave` (`id_palavra_chave`),
  CONSTRAINT `trabalho_relaciona_palavra_chave_ibfk_1` FOREIGN KEY (`id_trabalho`) REFERENCES `trabalho` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `trabalho_relaciona_palavra_chave_ibfk_2` FOREIGN KEY (`id_palavra_chave`) REFERENCES `palavra_chave` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trabalho_relaciona_palavra_chave`
--

LOCK TABLES `trabalho_relaciona_palavra_chave` WRITE;
/*!40000 ALTER TABLE `trabalho_relaciona_palavra_chave` DISABLE KEYS */;
/*!40000 ALTER TABLE `trabalho_relaciona_palavra_chave` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(256) NOT NULL,
  `senha` varchar(64) NOT NULL,
  `hierarquia` int(11) DEFAULT NULL,
  `super_admin` tinyint(1) NOT NULL DEFAULT '0',
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `hierarquia` (`hierarquia`),
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`hierarquia`) REFERENCES `hierarquia` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `usuario_ibfk_2` FOREIGN KEY (`hierarquia`) REFERENCES `hierarquia` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'felideo@gmail.com','6b4a064ec21f3f3fc458531f678f4135',NULL,1,1),(2,'jorge.rodolfo.beingolea@gmail.com','6b4a064ec21f3f3fc458531f678f4135',1,0,1);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'LiveDB'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-15 11:54:32
