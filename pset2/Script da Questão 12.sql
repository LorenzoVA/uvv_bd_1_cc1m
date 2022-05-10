select d.nome_departamento departamento, p.nome_projeto projeto, f.primeiro_nome funcionario, concat(t.horas) horas_de_trabalho
from elmasri.funcionario f 
inner join elmasri.departamento d
on f.numero_departamento = d.numero_departamento
inner join elmasri.projeto p
on d.numero_departamento = p.numero_departamento
inner join elmasri.trabalha_em t
on p.numero_projeto = t.numero_projeto
where t.horas != 0;