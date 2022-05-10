select d.nome_departamento departamento, concat(round(avg(f.salario), 2)) media_salarial
from elmasri.funcionario f
inner join elmasri.departamento d
on d.numero_departamento = f.numero_departamento
group by d.nome_departamento;