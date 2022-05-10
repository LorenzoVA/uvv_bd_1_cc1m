select concat(f.primeiro_nome, ' ', f.nome_meio, ' ', f.ultimo_nome) nome_funcionario, age(current_date, data_nascimento) idade, 
concat(f.salario) salario, round(
case when f.salario < 35000 then f.salario * 1.2
else f.salario * 1.15
end, 2) reajuste_salarial
from elmasri.funcionario f
order by idade;
