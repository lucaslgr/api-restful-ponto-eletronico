--
-- Database: `batponto`
--
CREATE DATABASE IF NOT EXISTS `batponto` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `batponto`;

-- --------------------------------------------------------

--
-- Table structure for table `acessos`
--

CREATE TABLE `acessos` (
  `id` int(11) UNSIGNED NOT NULL,
  `uid` varchar(20) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `horario` datetime NOT NULL,
  `id_status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `acessos`
--

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

-- --------------------------------------------------------

--
-- Table structure for table `acesso_status`
--

CREATE TABLE `acesso_status` (
  `id` int(10) UNSIGNED NOT NULL,
  `tipo` varchar(20) CHARACTER SET utf8 NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `acesso_status`
--

INSERT INTO `acesso_status` (`id`, `tipo`) VALUES
(1, 'Entrada'),
(2, 'Saída');

-- --------------------------------------------------------

--
-- Table structure for table `cargos`
--

CREATE TABLE `cargos` (
  `id` int(11) UNSIGNED NOT NULL,
  `nome` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cargos`
--

INSERT INTO `cargos` (`id`, `nome`) VALUES
(1, 'presidente(a)'),
(2, 'vice presidente(a)'),
(3, 'diretor(a)'),
(4, 'acessor'),
(5, 'trainee');

-- --------------------------------------------------------

--
-- Table structure for table `departamentos`
--

CREATE TABLE `departamentos` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `departamentos`
--

INSERT INTO `departamentos` (`id`, `nome`) VALUES
(1, 'projetos'),
(2, 'financeiro'),
(3, 'gestão de pessoas'),
(4, 'marketing'),
(5, 'diretoria');

-- --------------------------------------------------------

--
-- Table structure for table `membros`
--

CREATE TABLE `membros` (
  `id` int(11) UNSIGNED NOT NULL,
  `nome` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `id_cargo` tinyint(5) NOT NULL DEFAULT 0,
  `email` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `id_departamento` tinyint(5) UNSIGNED NOT NULL,
  `senha` varchar(100) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `membros`
--

INSERT INTO `membros` (`id`, `nome`, `id_cargo`, `email`, `id_departamento`, `senha`) VALUES
(5, 'Lukas', 1, 'l@gmail.com.br', 3, '$2y$10$Da/R9J/9j7hKbZ9TlgUBu.awaTXmOnOt1bZ7tzlDgtgnri2DUv5BS'),
(7, 'Karine', 1, 'k@gmail.com', 2, '$2y$10$E0rbeuJSww/yhkdZcFV/susejVsVgb9KVbvW.u3aSgWptFtM8WkSC'),
(8, 'Melo', 1, 'm@gmail.com', 2, '$2y$10$1OQeCupv6HPb28bHJENLW.CCK70iNj/ZuITANdPOAROGnUjqKyFn2'),
(10, 'Melo Lins', 1, 'me@gmail.com', 2, '$2y$10$UYcLap9C/9BWCG1KfUK6NegIO8lda2KJwRdcIWTGGYWF7tAtkkANe');

-- --------------------------------------------------------

--
-- Table structure for table `tags_cadastradas`
--

CREATE TABLE `tags_cadastradas` (
  `uid` varchar(20) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `id_membro` int(10) UNSIGNED DEFAULT NULL,
  `id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tipo` varchar(20) CHARACTER SET utf8 DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tags_cadastradas`
--

INSERT INTO `tags_cadastradas` (`uid`, `id_membro`, `id`, `tipo`) VALUES
('4a2cd73', 1, 4, '0'),
('c9c3ef97', 2, 5, '0'),
('76348fc', 3, 6, '0');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `acessos`
--
ALTER TABLE `acessos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `acesso_status`
--
ALTER TABLE `acesso_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cargos`
--
ALTER TABLE `cargos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departamentos`
--
ALTER TABLE `departamentos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `membros`
--
ALTER TABLE `membros`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `tags_cadastradas`
--
ALTER TABLE `tags_cadastradas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uid` (`uid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `acessos`
--
ALTER TABLE `acessos`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `acesso_status`
--
ALTER TABLE `acesso_status`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cargos`
--
ALTER TABLE `cargos`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `departamentos`
--
ALTER TABLE `departamentos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `membros`
--
ALTER TABLE `membros`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
