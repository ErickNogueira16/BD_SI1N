/*select
	id_voo, data_part, hora_part
from 
	voos
group by 
	id_voo
    
select
	v.id_voo, count(*) as qtd
from 
	passageiros p
join passageiros_reservas pr on pr.passageiro = p.cod_passageiro
join reservas r on r.id_reserva = pr.id_reserva
join voos_reservas vr on vr.id_reserva = r.id_reserva
join voos v on v.id_voo = vr.id_voo and v.assento = vr.assento
group by v.id_voo

select *, preco from produtos
order by preco

select 
	armazem, sum(produto) as quantidade
from
	produtos_armazens
group by armazem

SELECT *, DATA_EVENTO EVENTO FROM EVENTOS
ORDER BY DATA_EVENTO ASC

SELECT E.NOME_EVENTO, COUNT(*) QTD 
FROM ATIVIDADES A 
JOIN EVENTOS E ON E.ID_EVENTO = A.EVENTO_ATV
GROUP BY E.NOME_EVENTO

SELECT AVG(PARTICIPANTES) 
FROM (SELECT COUNT(*) AS PARTICIPANTES
FROM ATIVIDADES
GROUP BY ID_ATIVIDADE) AS BASE;

QUANDO TEM A INFORMAÇÃO QUE JÁ EXISTE NA TABELA, USA JOIN
QUANDO NÃO EXISTE, USA SUBSELECT*/
