select d.nome_departamento departamento, p.nome_projeto Projeto, sum(distinct(t.horas)) total_das_horas
from elmasri.trabalha_em t
inner join elmasri.funcionario f
on t.cpf_funcionario = f.cpf
inner join elmasri.departamento d
on f.numero_departamento = d.numero_departamento
inner join elmasri.projeto p
on d.numero_departamento = p.numero_departamento
group by d.nome_departamento, p.nome_projeto;