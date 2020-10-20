-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 19-Out-2020 às 19:26
-- Versão do servidor: 10.4.14-MariaDB
-- versão do PHP: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `empresa`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `departamento`
--

CREATE TABLE `departamento` (
  `codigo` int(11) NOT NULL,
  `nome` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `departamento`
--

INSERT INTO `departamento` (`codigo`, `nome`) VALUES
(1, 'RH'),
(2, 'TI'),
(3, 'Financeiro');

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionario`
--

CREATE TABLE `funcionario` (
  `codigo` int(11) NOT NULL,
  `nome` varchar(200) NOT NULL,
  `salario` decimal(20,2) NOT NULL,
  `codigo_departamento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `funcionario`
--

INSERT INTO `funcionario` (`codigo`, `nome`, `salario`, `codigo_departamento`) VALUES
(1, 'João Silva', '2000.00', 1),
(2, 'Maria Pereira', '3000.00', 2),
(3, 'José Peres', '4000.00', 2),
(4, 'Tereza Cristina', '3000.00', 3),
(5, 'Francisco José', '1500.00', 3);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`codigo`);

--
-- Índices para tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `FK_DEPARTAMENTO` (`codigo_departamento`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `departamento`
--
ALTER TABLE `departamento`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `funcionario`
--
ALTER TABLE `funcionario`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD CONSTRAINT `FK_DEPARTAMENTO` FOREIGN KEY (`codigo_departamento`) REFERENCES `departamento` (`codigo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

Prova Final

Resposta Letra A e B -

CREATE DATABASE empresa;
USE empresa;
CREATE TABLE DEPARTAMENTO (
    codigo INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR (200) NOT NULL
    );    
CREATE TABLE FUNCIONARIO (
    codigo INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR (200) NOT NULL,
    salario DECIMAL (20, 2) NOT NULL,
    codigo_departamento INT NOT NULL,
    CONSTRAINT FK_DEPARTAMENTO FOREIGN KEY (codigo_departamento) REFERENCES DEPARTAMENTO (codigo)
);    

INSERT INTO DEPARTAMENTO (nome) VALUES
    ('RH'),
    ('TI'),
    ('Financeiro');
  

INSERT INTO FUNCIONARIO (nome, salario, codigo_departamento) VALUES
    ('João Silva', '2000,00', '1'),
    ('Maria Pereira', '3000,00', '2'),
    ('José Peres', '4000,00', '2'),
    ('Tereza Cristina', '3000,00', '3'),
    ('Francisco José', '1500,00', '3');	
 

Resposta Letra C - 

UPDATE FUNCIONARIO SET salario = '5000,00' WHERE codigo = 3;


Resposta Letra D -

SELECT d.nome, COUNT(f.codigo_departamento) AS qtd_funcionários, 
IFNULL(SUM(f.salario), 0) AS soma_salário
	FROM DEPARTAMENTO AS d
	LEFT JOIN FUNCIONARIO AS f 
	ON f.codigo_departamento = d.codigo
	GROUP BY d.nome;


Resposta Letra E -

DELETE FROM FUNCIONARIO WHERE codigo = 5;
