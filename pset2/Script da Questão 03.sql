select nome_departamento, concat(f.primeiro_nome, ' ', f.nome_meio, ' ', f.ultimo_nome) funcionario, data_nascimento, age(current_date, data_nascimento) as idade , salario
from elmasri.departamento d
inner join elmasri.funcionario f
on  d.numero_departamento = f.numero_departamento
order by nome_departamento ASC;
