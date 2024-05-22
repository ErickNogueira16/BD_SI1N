-- Lista 17/05

/*select nome, email from pacientes
where year(data_nasc) > 2000*/

/*select m.nome, d.nome_especialidade from medicos m
join departamentos d on m.depto_cod_espec = d.cod_especialidade*/

/*select p.nome, m.nome, id_consulta, data_cons, hora_cons
from consultas c join pacientes p on p.cpf_paciente = c.cpf_paciente
join medicos m on m.crm = c.crm and m.uf = c.uf*/

/*select p.nome, count(c.cpf_paciente) from consultas c
join pacientes p on p.cpf_paciente = c.cpf_paciente
group by p.nome*/

/*select d.nome_especialidade, c.data_cons from departamentos d
join medicos m on m.depto_cod_espec = d.cod_especialidade
join consultas c on c.crm = m.crm and c.uf = m.uf
where year(data_cons) = 2023;*/

/*select nome_especialidade from departamentos 
order by nome_especialidade asc*/

/*select nome, email from medicos where telefone = ''*/

/*select p.nome from consultas c
join pacientes p on p.cpf_paciente = c.cpf_paciente
join medicos m on m.crm = c.crm and m.uf = c.uf
where depto_cod_espec = 1*/

/*SELECT d.nome_especialidade, AVG(c.cont) 
FROM (
    SELECT crm, uf, COUNT(id_consulta) as cont 
    FROM consultas 
    GROUP BY crm, uf
) c 
JOIN medicos m ON c.crm = m.crm AND c.uf = m.uf 
JOIN departamentos d ON m.depto_cod_espec = d.cod_especialidade 
GROUP BY d.nome_especialidade;*/

/* COUNT(*) FROM PACIENTES 
WHERE TELEFONE IS NOT NULL*/

/*SELECT M.NOME, COUNT(*) AS QUANT
FROM CONSULTAS C
JOIN MEDICOS M ON M.CRM = C.CRM AND M.UF = C.UF
GROUP BY M.NOME
HAVING QUANT > 10*/

/*SELECT P.NOME, MAX(C.DATA_CONS)
FROM CONSULTAS C
JOIN PACIENTES P ON P.CPF_PACIENTE = C.CPF_PACIENTE
GROUP BY P.NOME*/

/*SELECT M.NOME, COUNT(*) AS QUANT
FROM CONSULTAS C
JOIN MEDICOS M ON M.CRM = C.CRM AND M.UF = C.UF
GROUP BY M.NOME*/

/*SELECT P.CPF_PACIENTE, P.NOME, ROUND(COUNT(C.ID_CONSULTA) / (SELECT COUNT(*) FROM CONSULTAS), 2) AS PORCENTAGEM
FROM CONSULTAS C
JOIN PACIENTES P ON P.CPF_PACIENTE = C.CPF_PACIENTE
GROUP BY P.CPF_PACIENTE, P.NOME*/
