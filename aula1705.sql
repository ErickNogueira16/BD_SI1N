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
