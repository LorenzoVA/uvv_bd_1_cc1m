-- uvv.funcionario definition

CREATE TABLE `funcionario` (
  `cpf` char(11) NOT NULL COMMENT 'CPF do funcionário',
  `primeiro_nome` varchar(15) DEFAULT NULL COMMENT 'Primeiro nome do funcionário',
  `nome_meio` char(1) DEFAULT NULL COMMENT 'Nome do meio do funcionário',
  `ultimo_nome` varchar(15) DEFAULT NULL COMMENT 'Último nome do funcionário',
  `data_nascimento` date DEFAULT NULL COMMENT 'Data de nascimento do funcionário',
  `endereco` varchar(50) DEFAULT NULL COMMENT 'Endereço do funcionário',
  `sexo` char(1) DEFAULT NULL COMMENT 'Sexo do funcionário',
  `salario` decimal(10,2) DEFAULT NULL COMMENT 'Salário do funcionário',
  `cpf_supervisor` char(11) DEFAULT NULL COMMENT 'CPF do supervisor do funcionário',
  `numero_departamento` int(11) DEFAULT NULL COMMENT 'Número do departamento do funcionário',
  PRIMARY KEY (`cpf`),
  CONSTRAINT `CONSTRAINT_1` CHECK (`salario` >= 0),
  CONSTRAINT `CONSTRAINT_2` CHECK (`numero_departamento` > 0)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabela funcionário';

-- uvv.departamento definition

CREATE TABLE `departamento` (
  `numero_departamento` int(11) NOT NULL COMMENT 'Número do departamento',
  `nome_departamento` varchar(15) DEFAULT NULL COMMENT 'Nome do departamento',
  `cpf_gerente` char(11) DEFAULT NULL COMMENT 'CPF do gerente',
  `data_inicio_gerente` date DEFAULT NULL COMMENT 'Data de início do gerente',
  PRIMARY KEY (`numero_departamento`),
  UNIQUE KEY `departamento_idx` (`nome_departamento`),
  KEY `funcionario_departamento_fk` (`cpf_gerente`),
  CONSTRAINT `funcionario_departamento_fk` FOREIGN KEY (`cpf_gerente`) REFERENCES `funcionario` (`cpf`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `CONSTRAINT_1` CHECK (`numero_departamento` > 0)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabela departamento';

-- uvv.localizacoes_departamento definition

CREATE TABLE `localizacoes_departamento` (
  `numero_departamento` int(11) NOT NULL COMMENT 'Número do departamento',
  `local` varchar(15) NOT NULL COMMENT 'Local do departamento',
  PRIMARY KEY (`numero_departamento`,`local`),
  CONSTRAINT `departamento_localizacoes_departamento_fk` FOREIGN KEY (`numero_departamento`) REFERENCES `departamento` (`numero_departamento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `CONSTRAINT_1` CHECK (`numero_departamento` > 0)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabela localização do departamento';

-- uvv.projeto definition

CREATE TABLE `projeto` (
  `numero_projeto` int(11) NOT NULL COMMENT 'Número do projeto',
  `nome_projeto` varchar(20) DEFAULT NULL COMMENT 'Nome do projeto',
  `local_projeto` varchar(15) DEFAULT NULL COMMENT 'Local do projeto',
  `numero_departamento` int(11) DEFAULT NULL COMMENT 'Número do departamento',
  PRIMARY KEY (`numero_projeto`),
  UNIQUE KEY `projeto_idx` (`nome_projeto`),
  KEY `departamento_projeto_fk` (`numero_departamento`),
  CONSTRAINT `departamento_projeto_fk` FOREIGN KEY (`numero_departamento`) REFERENCES `departamento` (`numero_departamento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `CONSTRAINT_1` CHECK (`numero_projeto` > 0),
  CONSTRAINT `CONSTRAINT_2` CHECK (`numero_departamento` > 0)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabela projeto';

-- uvv.dependente definition

CREATE TABLE `dependente` (
  `cpf_funcionario` char(11) NOT NULL COMMENT 'CPF do funcionário',
  `nome_dependente` varchar(15) NOT NULL COMMENT 'Nome do dependente',
  `sexo` char(1) DEFAULT NULL COMMENT 'Sexo do dependente',
  `data_nascimento` date DEFAULT NULL COMMENT 'Data de nascimento do dependente',
  `parentesco` varchar(15) DEFAULT NULL COMMENT 'Parentesco do dependente com o funcionário',
  PRIMARY KEY (`cpf_funcionario`,`nome_dependente`),
  CONSTRAINT `funcionario_dependente_fk` FOREIGN KEY (`cpf_funcionario`) REFERENCES `funcionario` (`cpf`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabela dependente';

-- uvv.trabalha_em definition

CREATE TABLE `trabalha_em` (
  `cpf_funcionario` char(11) NOT NULL COMMENT 'CPF do funcionário',
  `numero_projeto` int(11) NOT NULL COMMENT 'Número do projeto',
  `horas` decimal(3,1) DEFAULT NULL COMMENT 'Horas trabalhadas',
  PRIMARY KEY (`cpf_funcionario`,`numero_projeto`),
  KEY `projeto_trabalha_em_fk` (`numero_projeto`),
  CONSTRAINT `funcionario_trabalha_em_fk` FOREIGN KEY (`cpf_funcionario`) REFERENCES `funcionario` (`cpf`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `projeto_trabalha_em_fk` FOREIGN KEY (`numero_projeto`) REFERENCES `projeto` (`numero_projeto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `CONSTRAINT_1` CHECK (`numero_projeto` > 0),
  CONSTRAINT `CONSTRAINT_2` CHECK (`horas` >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabela trabalha em';
