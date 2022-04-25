-- Table: elmasri.funcionario

-- DROP TABLE IF EXISTS elmasri.funcionario;

CREATE TABLE IF NOT EXISTS elmasri.funcionario
(
    cpf character(11) COLLATE pg_catalog."default" NOT NULL,
    primeiro_nome character varying(15) COLLATE pg_catalog."default" NOT NULL,
    nome_meio character(1) COLLATE pg_catalog."default",
    ultimo_nome character varying(15) COLLATE pg_catalog."default" NOT NULL,
    data_nascimento date,
    endereco character varying(50) COLLATE pg_catalog."default",
    sexo character(1) COLLATE pg_catalog."default",
    salario numeric(10,2),
    cpf_supervisor character(11) COLLATE pg_catalog."default",
    numero_departamento integer NOT NULL,
    CONSTRAINT funcionario_pkey PRIMARY KEY (cpf),
    CONSTRAINT m_ou_f CHECK (sexo = ANY (ARRAY['m'::bpchar, 'f'::bpchar]))
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS elmasri.funcionario
    OWNER to lorenzo;

COMMENT ON TABLE elmasri.funcionario
    IS 'Tabela funcionário';

COMMENT ON COLUMN elmasri.funcionario.cpf
    IS 'CPF do funcionário';

COMMENT ON COLUMN elmasri.funcionario.primeiro_nome
    IS 'Primeiro nome do funcionário';

COMMENT ON COLUMN elmasri.funcionario.nome_meio
    IS 'Nome do meio do funcionário';

COMMENT ON COLUMN elmasri.funcionario.ultimo_nome
    IS 'Último nome do funcionário';

COMMENT ON COLUMN elmasri.funcionario.data_nascimento
    IS 'Data de nascimento do Funcionário';

COMMENT ON COLUMN elmasri.funcionario.endereco
    IS 'Endereço do funcionário';

COMMENT ON COLUMN elmasri.funcionario.sexo
    IS 'Sexo do funcionário';

COMMENT ON COLUMN elmasri.funcionario.salario
    IS 'Salário do funcionário';

COMMENT ON COLUMN elmasri.funcionario.cpf_supervisor
    IS 'CPF do supervisor do funcionário';

COMMENT ON COLUMN elmasri.funcionario.numero_departamento
    IS 'Numero do departamento do funcionário';
COMMENT ON CONSTRAINT funcionario_pkey ON elmasri.funcionario
    IS 'Chave Primária';

COMMENT ON CONSTRAINT m_ou_f ON elmasri.funcionario
    IS 'Regra para ter apenas os dois caracteres';

-- Table: elmasri.departamento

-- DROP TABLE IF EXISTS elmasri.departamento;

CREATE TABLE IF NOT EXISTS elmasri.departamento
(
    numero_departamento integer NOT NULL,
    nome_departamento character varying(15) COLLATE pg_catalog."default" NOT NULL,
    cpf_gerente character(11) COLLATE pg_catalog."default" NOT NULL,
    data_inicio_gerente date,
    CONSTRAINT departamento_pkey PRIMARY KEY (numero_departamento),
    CONSTRAINT departamento_nome_departamento_key UNIQUE (nome_departamento),
    CONSTRAINT fk_cpf_gerente FOREIGN KEY (cpf_gerente)
        REFERENCES elmasri.funcionario (cpf) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS elmasri.departamento
    OWNER to lorenzo;

COMMENT ON TABLE elmasri.departamento
    IS 'Tabela departamento';

COMMENT ON COLUMN elmasri.departamento.numero_departamento
    IS 'Número do departamento';

COMMENT ON COLUMN elmasri.departamento.nome_departamento
    IS 'Nome do departamento';

COMMENT ON COLUMN elmasri.departamento.cpf_gerente
    IS 'CPF do gerente';

COMMENT ON COLUMN elmasri.departamento.data_inicio_gerente
    IS 'Data do início do gerente';
COMMENT ON CONSTRAINT departamento_pkey ON elmasri.departamento
    IS 'Chave primária departamento';

COMMENT ON CONSTRAINT departamento_nome_departamento_key ON elmasri.departamento
    IS 'Chave única do nome do departamento';
    
-- Table: elmasri.localizacoes_departamento

-- DROP TABLE IF EXISTS elmasri.localizacoes_departamento;

CREATE TABLE IF NOT EXISTS elmasri.localizacoes_departamento
(
    local character varying(15) COLLATE pg_catalog."default" NOT NULL,
    numero_departamento integer NOT NULL,
    CONSTRAINT localizacoes_departamento_pkey PRIMARY KEY (local),
    CONSTRAINT fk_numero_departamento FOREIGN KEY (numero_departamento)
        REFERENCES elmasri.departamento (numero_departamento) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS elmasri.localizacoes_departamento
    OWNER to lorenzo;

COMMENT ON TABLE elmasri.localizacoes_departamento
    IS 'Tabela localizações do departamento';

COMMENT ON COLUMN elmasri.localizacoes_departamento.local
    IS 'Local do departamento';

COMMENT ON COLUMN elmasri.localizacoes_departamento.numero_departamento
    IS 'Número do departamento';
COMMENT ON CONSTRAINT localizacoes_departamento_pkey ON elmasri.localizacoes_departamento
    IS 'Chave primária localização do departamento';

COMMENT ON CONSTRAINT fk_numero_departamento ON elmasri.localizacoes_departamento
    IS 'Chave estrangeira número do departamento';
    
-- Table: elmasri.projeto

-- DROP TABLE IF EXISTS elmasri.projeto;

CREATE TABLE IF NOT EXISTS elmasri.projeto
(
    numero_projeto integer NOT NULL,
    nome_projeto character varying(20) COLLATE pg_catalog."default" NOT NULL,
    local_projeto character varying(15) COLLATE pg_catalog."default",
    numero_departamento integer NOT NULL,
    CONSTRAINT projeto_pkey PRIMARY KEY (numero_projeto),
    CONSTRAINT projeto_nome_projeto_key UNIQUE (nome_projeto),
    CONSTRAINT fk_numero_departamento FOREIGN KEY (numero_departamento)
        REFERENCES elmasri.departamento (numero_departamento) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS elmasri.projeto
    OWNER to lorenzo;

COMMENT ON TABLE elmasri.projeto
    IS 'Tabela projeto';

COMMENT ON COLUMN elmasri.projeto.numero_projeto
    IS 'Número do projeto';

COMMENT ON COLUMN elmasri.projeto.nome_projeto
    IS 'Nome do projeto';

COMMENT ON COLUMN elmasri.projeto.local_projeto
    IS 'Local do projeto';

COMMENT ON COLUMN elmasri.projeto.numero_departamento
    IS 'Número do departamento';
COMMENT ON CONSTRAINT projeto_pkey ON elmasri.projeto
    IS 'Chave primária projeto';

COMMENT ON CONSTRAINT projeto_nome_projeto_key ON elmasri.projeto
    IS 'Chave única nome do projeto';

COMMENT ON CONSTRAINT fk_numero_departamento ON elmasri.projeto
    IS 'Chave estrangeira  número do departamento';

-- Table: elmasri.dependente

-- DROP TABLE IF EXISTS elmasri.dependente;

CREATE TABLE IF NOT EXISTS elmasri.dependente
(
    cpf_funcionario character(11) COLLATE pg_catalog."default" NOT NULL,
    nome_dependente character varying(15) COLLATE pg_catalog."default" NOT NULL,
    sexo character(1) COLLATE pg_catalog."default",
    data_nascimento date,
    parentesco character varying(15) COLLATE pg_catalog."default",
    CONSTRAINT dependente_pkey PRIMARY KEY (nome_dependente),
    CONSTRAINT fk_cpf_funcionario FOREIGN KEY (cpf_funcionario)
        REFERENCES elmasri.funcionario (cpf) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT m_ou_f CHECK (sexo = ANY (ARRAY['m'::bpchar, 'f'::bpchar]))
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS elmasri.dependente
    OWNER to lorenzo;

COMMENT ON TABLE elmasri.dependente
    IS 'Tabela dependente';

COMMENT ON COLUMN elmasri.dependente.cpf_funcionario
    IS 'CPF do funcionário';

COMMENT ON COLUMN elmasri.dependente.nome_dependente
    IS 'Nome do dependente';

COMMENT ON COLUMN elmasri.dependente.sexo
    IS 'Sexo do dependente';

COMMENT ON COLUMN elmasri.dependente.data_nascimento
    IS 'Data de nascimento do dependente';

COMMENT ON COLUMN elmasri.dependente.parentesco
    IS 'Parentesco do dependente com o funcionário';
COMMENT ON CONSTRAINT dependente_pkey ON elmasri.dependente
    IS 'Chave primária dependente';

COMMENT ON CONSTRAINT fk_cpf_funcionario ON elmasri.dependente
    IS 'Chave estrangeira CPF do funcionário';

COMMENT ON CONSTRAINT m_ou_f ON elmasri.dependente
    IS 'Regra de caractere';

-- Table: elmasri.trabalha_em

-- DROP TABLE IF EXISTS elmasri.trabalha_em;

CREATE TABLE IF NOT EXISTS elmasri.trabalha_em
(
    cpf_funcionario character(11) COLLATE pg_catalog."default" NOT NULL,
    numero_projeto integer NOT NULL,
    horas numeric(3,1),
    CONSTRAINT trabalha_em_cpf_funcionario_fkey FOREIGN KEY (cpf_funcionario)
        REFERENCES elmasri.funcionario (cpf) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT trabalha_em_numero_projeto_fkey FOREIGN KEY (numero_projeto)
        REFERENCES elmasri.projeto (numero_projeto) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS elmasri.trabalha_em
    OWNER to lorenzo;

COMMENT ON TABLE elmasri.trabalha_em
    IS 'Tabela trabalha em';

COMMENT ON COLUMN elmasri.trabalha_em.cpf_funcionario
    IS 'CPF do funcionário';

COMMENT ON COLUMN elmasri.trabalha_em.numero_projeto
    IS 'Número do projeto';

COMMENT ON COLUMN elmasri.trabalha_em.horas
    IS 'Horas';

COMMENT ON CONSTRAINT trabalha_em_cpf_funcionario_fkey ON elmasri.trabalha_em
    IS 'Chave estrangeira CPF do funcionário';
COMMENT ON CONSTRAINT trabalha_em_numero_projeto_fkey ON elmasri.trabalha_em
    IS 'Chave estrangeira número do projeto';
