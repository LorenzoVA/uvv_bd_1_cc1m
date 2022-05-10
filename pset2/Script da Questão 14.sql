select d.nome_departamento departamento, count(f.numero_departamento) quantidade_de_funcionarios
from elmasri.funcionario f
inner join elmasri.departamento d
on f.numero_departamento = d.numero_departamento
group by d.nome_departamento;