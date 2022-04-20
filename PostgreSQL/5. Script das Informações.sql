INSERT INTO elmasri.funcionario (cpf,primeiro_nome,nome_meio,ultimo_nome,data_nascimento,endereco,sexo,salario,cpf_supervisor,numero_departamento) VALUES
	 ('98765432168','Jennifer','D','Souza','1946-06-20','Av.Arthur de Lima, 54 , Santo André , SP','f',43000.00,'88866555576',4),
	 ('66688444476','Ronaldo','K','Lima','1962-09-15','Rua Rebouças, 65, Piracicaba, SP','m',38000.00,'33344555587',5),
	 ('45345345376','Joice','A','Leite','1972-07-31','Av.Lucas Obes, 74 , São Paulo, SP','f',25000.00,'33344555587',5),
	 ('98798798733','André','V','Pereira','1969-03-29','Rua Timbira, 35, São Paulo, SP','m',25000.00,'98765432168',4),
	 ('12345678966','João','B','Silva','1965-01-09','Rua das Flores, 751, São Paulo, SP','m',30000.00,'33344555587',5),
	 ('33344555587','Fernando','T','Wong','1955-12-08','Rua da Lapa, 34, São Paulo, SP','m',40000.00,'88866555576',5),
	 ('88866555576','Jorge','E','Brito','1937-11-10','Rua do Horto, 35, São Paulo','m',55000.00,NULL,1),
	 ('99988777767','Alice','J','Zelaya','1968-01-19','Rua Souza Lima, 35, Curitiba, PR','f',25000.00,'98765432168',4);

INSERT INTO elmasri.departamento (numero_departamento,nome_departamento,cpf_gerente,data_inicio_gerente) VALUES
	 (4,'Admininstração','98765432168','1995-01-01'),
	 (1,'Matriz','88866555576','1981-06-19'),
	 (5,'Pesquisa','33344555587','1988-05-22');
	 
INSERT INTO elmasri.localizacoes_departamento ("local",numero_departamento) VALUES
	 ('São Paulo',1),
	 ('Mauá',4),
	 ('Santo André',5),
	 ('Itu',5),
	 ('Sao Paulo',5);
	 
INSERT INTO elmasri.projeto (numero_projeto,nome_projeto,local_projeto,numero_departamento) VALUES
	 (1,'ProdutoX','Santo André',5),
	 (2,'ProdutoY','Itu',5),
	 (3,'ProdutoZ','São Paulo',5),
	 (10,'Informatização','Mauá',4),
	 (20,'Reorganização','Sao Paulo',1),
	 (30,'Novos Benefícios','Mauá',4);

INSERT INTO elmasri.dependente (cpf_funcionario,nome_dependente,sexo,data_nascimento,parentesco) VALUES
	 ('33344555587','Alicia','f','1986-04-05','Filha'),
	 ('33344555587','Tiago','m','1983-10-25','Filho'),
	 ('33344555587','Janaína','f','1958-05-03','Esposa'),
	 ('98765432168','Antonio','m','1942-02-28','Marido'),
	 ('12345678966','Michael','m','1988-01-04','Filho'),
	 ('12345678966','Alícia','f','1988-12-30','Filha'),
	 ('12345678966','Elizabeth','f','1967-05-05','Esposa');

INSERT INTO elmasri.trabalha_em (cpf_funcionario,numero_projeto,horas) VALUES
	 ('12345678966',1,32.5),
	 ('12345678966',2,7.5),
	 ('66688444476',3,40.0),
	 ('45345345376',1,20.0),
	 ('45345345376',2,20.0),
	 ('33344555587',2,10.0),
	 ('33344555587',3,10.0),
	 ('33344555587',10,10.0),
	 ('33344555587',20,10.0),
	 ('99988777767',30,30.0);
INSERT INTO elmasri.trabalha_em (cpf_funcionario,numero_projeto,horas) VALUES
	 ('99988777767',10,10.0),
	 ('98798798733',10,35.0),
	 ('98798798733',30,5.0),
	 ('98765432168',30,20.0),
	 ('98765432168',20,15.0),
	 ('88866555576',20,NULL);
