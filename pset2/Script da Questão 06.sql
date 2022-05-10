select concat(f.primeiro_nome, ' ', f.nome_meio, ' ', f.ultimo_nome) nome_funcionario, f.cpf, numero_departamento, concat(d.nome_dependente, ' ', f.ultimo_nome) nome_dependente, age(current_date,d.data_nascimento) idade_dependente, 
case d.sexo when 'm' then 'masculino' when 'f' then 'feminino' end sexo
from elmasri.funcionario f
inner join elmasri.dependente d
on f.cpf = d.cpf_funcionario;
