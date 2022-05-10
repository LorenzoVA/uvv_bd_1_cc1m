select concat (primeiro_nome, nome_meio, ultimo_nome) nome_funcionario, numero_departamento departamento, salario
from elmasri.funcionario
where exists (select * from elmasri.dependente where funcionario.cpf != dependente.cpf_funcionario);
