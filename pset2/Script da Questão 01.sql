select avg(f.salario) as media_salarial, d.nome_departamento
from elmasri.funcionario f
inner join elmasri.departamento d
on d.numero_departamento = f.numero_departamento
group by d.nome_departamento;
