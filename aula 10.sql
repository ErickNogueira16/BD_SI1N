-- Passo 1: Criar a base de dados:
create database if not exists prova_si1n;

-- Passo 2: Carregar a base de dados criada para uso
use prova_si1n;

-- Passo 3: Criar as tabelas sem chave estrangeira:
create table if not exists aluno(
matricula int primary key,
nome varchar(100) not null,
data_nasc date not null);

create table if not exists professor(
num_id int primary key,
nome varchar(100) not null,
especializacao varchar(100) not null);

create table if not exists curso(
cod_curso int primary key,
nome varchar(100) not null,
duracao varchar(100) not null);

-- Passo 4: Criar as tabelas com chave estrangeira:
create table if not exists disciplina(
cod_disciplina int primary key,
nome varchar(100) not null,
carga_horaria varchar(100) not null,
codigo_curso int not null,
constraint cur_dis foreign key(codigo_curso) references curso(cod_curso));

-- Passo 5: Criar as entidades associativas, se houver:
create table if not exists alunos_disciplinas(
matricula int,
codigo_disc int,
primary key(matricula, codigo_disc),
foreign key(matricula) references aluno(matricula),
foreign key(codigo_disc) references disciplina(codigo_disciplina));

create table if not exists alunos_cursos(
matricula int,
codigo_curso int,
primary key(matricula, codigo_curso),
foreign key(matricula) references aluno(matricula),
foreign key(codigo_curso) references curso(cod_curso));

create table if not exists cursos_professor(
codigo_curso int,
id_professor int,
primary key(codigo_curso, id_professor),
foreign key(codigo_curso) references curso(cod_curso),
foreign key(id_professor) references professor(num_id));