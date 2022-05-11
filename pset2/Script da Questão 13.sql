select concat(f.primeiro_nome, ' ', f.nome_meio, ' ', f.ultimo_nome) nome_funcionario, age(current_date, f.data_nascimento) idade_funcionario, f.sexo sexo_funcionario,
concat(d.nome_dependente, ' ', f.ultimo_nome) nome_dependente, age(current_date, d.data_nascimento) idade_dependente, d.sexo sexo_dependente 
from elmasri.funcionario f, elmasri.dependente d
where f.cpf = d.cpf_funcionario
order by f.data_nascimento asc, d.data_nascimento asc;
