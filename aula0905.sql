USE BDEX1_HOSPITAL;

#COMANDOS DE INSERÇÃO
INSERT INTO PACIENTES (CPF_PACIENTE, NOME, DATA_NASC, TELEFONE, EMAIL) VALUES
('12345678900', 'João da Silva', '1980-01-01', '(11) 9999-9999', 'joao.silva@email.com'),
('98765432101', 'Maria Oliveira', '1990-02-02', '(21) 8888-8888', 'maria.oliveira@email.com'),
('00012345678', 'Carlos Santos', '2000-03-03', '(31) 7777-7777', 'carlos.santos@email.com'),
('11122233344', 'Ana Souza', '2010-04-04', '(41) 6666-6666', 'ana.souza@email.com'),
('22233344455', 'Pedro Pereira', '2020-05-05', '(51) 5555-5555', 'pedro.pereira@email.com');

INSERT INTO DEPARTAMENTOS (COD_ESPECIALIDADE, NOME_ESPECIALIDADE) VALUES
(1, 'Cardiologia'),
(2, 'Pediatria'),
(3, 'Oftalmologia'),
(4, 'Neurologia'),
(5, 'Ortopedia');

INSERT INTO MEDICOS (CRM, UF, NOME, EMAIL, TELEFONE, DEPTO_COD_ESPEC) VALUES
(12345, 'SP', 'Dr. Alberto Souza', 'alberto.souza@medico.com', '(19) 9988-7766', 1),
(54321, 'RJ', 'Dra. Beatriz Santos', 'beatriz.santos@medico.com', '(22) 9876-5544', 2),
(98765, 'MG', 'Dr. Carlos Silva', 'carlos.silva@medico.com', '(31) 9765-4322', 3),
(32105, 'BA', 'Dra. Daniela Oliveira', 'daniela.oliveira@medico.com', '(71) 9654-3211', 5),
(76543, 'RS', 'Dr. Eduardo Pereira', 'eduardo.pereira@medico.com', '(53) 9543-2100', 1);

INSERT INTO CONSULTAS (ID_CONSULTA, ANAMNESE, DATA_CONS, HORA_CONS, CRM, UF, CPF_PACIENTE) VALUES
(1, 'Dor de cabeça persistente há 3 dias', '2024-04-25', '10:00:00', 12345, 'SP', '12345678900'),
(2, 'Febre e tosse há 2 dias', '2024-04-26', '14:00:00', 54321, 'RJ', '98765432101'),
(3, 'Consulta de rotina', '2024-04-27', '09:00:00', 98765, 'MG', '00012345678'),
(4, 'Exame oftalmológico', '2024-04-28', '11:30:00', 32105, 'BA', '11122233344'),
(5, 'Retorno ortopédico', '2024-04-29', '15:00:00', 76543, 'RS', '22233344455');

#COMANDOS DE UPDATE
UPDATE PACIENTES SET TELEFONE = '(12) 3333-3333' WHERE CPF_PACIENTE = '12345678900';
UPDATE PACIENTES SET EMAIL = 'ana.souza@novoemail.com' WHERE CPF_PACIENTE = '11122233344';

UPDATE DEPARTAMENTOS SET NOME_ESPECIALIDADE = 'Clínica Médica' WHERE COD_ESPECIALIDADE = 1;
UPDATE DEPARTAMENTOS SET NOME_ESPECIALIDADE = 'Oftalmologista' WHERE COD_ESPECIALIDADE = 3;

UPDATE MEDICOS SET EMAIL = 'beatriz.santos@novomedico.com' WHERE CRM = 54321 AND UF = 'RJ';
UPDATE MEDICOS SET DEPTO_COD_ESPEC = 4 WHERE CRM = 98765;

UPDATE CONSULTAS SET HORA_CONS = '10:30:00' WHERE ID_CONSULTA = 1;
UPDATE CONSULTAS SET ANAMNESE = 'Paciente refere dor abdominal intensa' WHERE ID_CONSULTA = 3;

#COMANDO DE DELETE

SET FOREIGN_KEY_CHECKS = 0; #USADO APENAS PARA FINS DE APRENDIZADO - LIBERA AS RESTRIÇÕES DE CHAVE ESTRANGEIRA

DELETE FROM PACIENTES WHERE CPF_PACIENTE = '00012345678';
DELETE FROM PACIENTES WHERE CPF_PACIENTE = '22233344455';

DELETE FROM DEPARTAMENTOS WHERE COD_ESPECIALIDADE = 2;
DELETE FROM DEPARTAMENTOS WHERE COD_ESPECIALIDADE = 4;

DELETE FROM CONSULTAS WHERE ID_CONSULTA = 2;
DELETE FROM CONSULTAS WHERE ID_CONSULTA = 4;

DELETE FROM MEDICOS WHERE CRM = 12345 AND UF = 'SP';
DELETE FROM MEDICOS WHERE CRM = 98765;


/*select
	nome, TIMESTAMPDIFF(year ,data_nasc, curdate()) as idade
from pacientes
order by idade desc

select 
	d.nome_especialidade, count(*)
from pacientes p
join consultas c on c.cpf_paciente = p.cpf_paciente
join medicos m on m.crm = c.crm and m.uf = c.uf
join departamentos d on d.cod_especialidade = m.depto_cod_espec
group by d.nome_especialidade
    
select avg(timestampdiff(year, data_nasc, curdate())) as age
from pacientes*/

/*select d.nome_especialidade, count(*) as qdt
from pacientes p
join consultas c on c.cpf_paciente = p.cpf_paciente
join medicos m on m.crm = c.crm and m.uf = c.uf
join departamentos d on d.cod_especialidade = m.depto_cod_espec
group by d.nome_especialidade

select avg(timestampdiff(year, data_nasc, curdate())) as age, d.nome_especialidade
from pacientes p
join consultas c on c.cpf_paciente = p.cpf_paciente
join medicos m on m.crm = c.crm and m.uf = c.uf
join departamentos d on d.cod_especialidade = m.depto_cod_espec
group by d.nome_especialidade*/

