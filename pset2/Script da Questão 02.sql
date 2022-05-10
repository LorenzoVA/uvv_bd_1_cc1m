select avg(f.salario) media_salarial, f.sexo
from elmasri.funcionario f
group by f.sexo;
