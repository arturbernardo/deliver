-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 09-Out-2015 às 04:21
-- Versão do servidor: 5.6.16
-- PHP Version: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `deliver`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE IF NOT EXISTS `cliente` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) COLLATE utf8_bin NOT NULL,
  `senha` varchar(255) COLLATE utf8_bin NOT NULL,
  `login` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedido`
--

CREATE TABLE IF NOT EXISTS `pedido` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cliente` int(11) NOT NULL,
  `distancia` decimal(10,2) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `coleta` varchar(255) COLLATE utf8_bin NOT NULL,
  `entrega` varchar(255) COLLATE utf8_bin NOT NULL,
  `veiculo` int(11) DEFAULT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=9 ;

--
-- Extraindo dados da tabela `pedido`
--

INSERT INTO `pedido` (`id`, `cliente`, `distancia`, `valor`, `coleta`, `entrega`, `veiculo`, `data`) VALUES
(1, 1, '1.00', '1.00', '1', '1', 1, '2015-10-03 23:32:16'),
(2, 1, '1.00', '1.00', 'Porto Alegre Dona Inocência', 'Porto alegre Praia de Belas', NULL, '2015-10-07 00:43:35'),
(3, 1, '1.00', '1.00', 'Porto Alegre Dona Inocência', 'Porto alegre Praia de Belas', NULL, '2015-10-07 00:55:40'),
(4, 1, '1.00', '1.00', 'Porto Alegre Dona Inocência', 'Porto alegre Praia de Belas', NULL, '2015-10-07 00:57:29'),
(5, 1, '1.00', '1.00', 'Porto Alegre Dona Inocência', 'Porto alegre Praia de Belas', NULL, '2015-10-07 01:00:13'),
(6, 1, '8.00', '8.00', 'Porto Alegre Dona Inocência', 'Porto alegre Praia de Belas', NULL, '2015-10-07 16:56:42'),
(7, 1, '8.40', '8.40', 'Porto Alegre Dona Inocência', 'Porto alegre Praia de Belas', NULL, '2015-10-07 17:03:21'),
(8, 1, '8.40', '8.40', 'Porto Alegre Dona Inocência', 'Porto alegre Praia de Belas', NULL, '2015-10-09 00:41:45');

-- --------------------------------------------------------

--
-- Estrutura da tabela `veiculo`
--

CREATE TABLE IF NOT EXISTS `veiculo` (
  `id` int(11) NOT NULL,
  `condutor` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `tipo` int(11) NOT NULL,
  `longitude` float DEFAULT NULL,
  `latitude` float DEFAULT NULL,
  `dataUltimaPosicao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `volume`
--

CREATE TABLE IF NOT EXISTS `volume` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) COLLATE utf8_bin NOT NULL,
  `valor` decimal(10,0) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=4 ;

--
-- Extraindo dados da tabela `volume`
--

INSERT INTO `volume` (`id`, `nome`, `valor`) VALUES
(1, 'Moto', '1'),
(2, 'Carro Utilitário', '2'),
(3, 'Utilirário', '3');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
