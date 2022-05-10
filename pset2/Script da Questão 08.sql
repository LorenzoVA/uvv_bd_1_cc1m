select  concat (primeiro_nome, ' ', nome_meio, ' ', ultimo_nome) as nome_funcionario, horas, nome_departamento, nome_projeto
from elmasri.funcionario
right join elmasri.departamento on funcionario.numero_departamento = departamento.numero_departamento
right join elmasri.trabalha_em on funcionario.cpf = trabalha_em.cpf_funcionario
right join elmasri.projeto on projeto.numero_projeto = trabalha_em.numero_projeto
order by nome_funcionario asc;
