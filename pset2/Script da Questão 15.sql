select concat(f.primeiro_nome, ' ', f.nome_meio, ' ', f.ultimo_nome) funcionario, f.numero_departamento, nome_projeto
from elmasri.funcionario f
inner join elmasri.projeto p
on f.numero_departamento = p.numero_departamento
order by f.numero_departamento asc;
