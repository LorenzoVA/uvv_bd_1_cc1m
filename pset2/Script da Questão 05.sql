select d.nome_departamento departamento,
case when d.cpf_gerente = f.cpf then primeiro_nome end gerente,
case when d.cpf_gerente != f.cpf then primeiro_nome end funcionario, concat (f.salario) salario
from elmasri.funcionario f
inner join elmasri.departamento d
on f.numero_departamento = d.numero_departamento
order by d.nome_departamento asc, f.salario desc;
