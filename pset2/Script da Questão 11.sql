select concat(f.primeiro_nome, ' ', f.nome_meio, ' ', f.ultimo_nome) nome_funcionario, p.nome_projeto projeto,
case when t.horas > 0 then concat(t.horas * 50) end total_recebido
from elmasri.funcionario f
inner join elmasri.trabalha_em t
on f.cpf = t.cpf_funcionario
inner join elmasri.projeto p
on t.numero_projeto = p.numero_projeto;
