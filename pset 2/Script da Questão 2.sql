select avg(f.salario) as media_salarial, f.sexo
from elmasri.funcionario f
group by f.sexo;
