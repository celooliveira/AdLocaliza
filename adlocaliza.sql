-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 17-Fev-2015 às 01:18
-- Versão do servidor: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `adlocaliza`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `igreja`
--

CREATE TABLE IF NOT EXISTS `igreja` (
`id` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `descricao` varchar(100) DEFAULT NULL,
  `endereco` varchar(150) DEFAULT NULL,
  `cep` varchar(10) DEFAULT NULL,
  `bairro` varchar(80) DEFAULT NULL,
  `cidade` varchar(150) DEFAULT NULL,
  `uf` varchar(2) DEFAULT NULL,
  `telefone` varchar(45) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `responsavel` varchar(200) DEFAULT NULL,
  `idpagamento` varchar(200) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `igreja`
--

INSERT INTO `igreja` (`id`, `nome`, `descricao`, `endereco`, `cep`, `bairro`, `cidade`, `uf`, `telefone`, `email`, `responsavel`, `idpagamento`) VALUES
(1, 'Igreja Sede', 'AD Sede', 'Rua Nove de marco, 150', '89200000', 'Centro', 'Joinville', 'SC', '545454', 'AD@com.com', 'Teste', 'jhjghjgh'),
(2, 'fgdfgdgdgd', 'jkgg', 'nkjhjhg', 'hjkhjhg', 'kjhjkguyf', 'ghftyt', 'hh', 'gguyf', 'jkghjggfdd', 'iuiuuyt', 'ghghfh'),
(3, 'fgdfgdgdgd', 'jkgg', 'nkjhjhg', 'hjkhjhg', 'kjhjkguyf', 'ghftyt', 'hh', 'gguyf', 'jkghjggfdd', 'iuiuuyt', 'ghghfh'),
(4, 'Igreja Sede', 'AD Sede', 'Rua Nove de marco, 150', '89200000', 'Centro', 'Joinville', 'SC', '545454', 'AD@com.com', 'Teste', 'jhjghjgh'),
(5, 'Igreja Central', 'Igreja Centro', 'Rua 15 de Novembro, 150', '89214604', 'Centro', 'Joinville', 'SC', '456', 'adcentro@gmail.com', 'Teste', 'sdfsdfs'),
(6, 'Igreja Central', 'Igreja Centro', 'Rua 15 de Novembro, 150', '89214604', 'Centro', 'Joinville', 'SC', '456', 'adcentro@gmail.com', 'Teste', 'sdfsdfs'),
(7, 'Igreja Central', 'Igreja Centro', 'Rua 15 de Novembro, 150', '89214604', 'Centro', 'Joinville', 'SC', '456', 'adcentro@gmail.com', 'Teste', 'sdfsdfs'),
(8, 'Igreja Bairro', 'AD Bairro', 'Av Getulio Vargas, 1800', '89546666', 'Anita Garibaldi', 'Joinville', 'SC', '64723627', 'ad@gmail.com', 'Teste', 'skjhjfsadfsd');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `igreja`
--
ALTER TABLE `igreja`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `igreja`
--
ALTER TABLE `igreja`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
