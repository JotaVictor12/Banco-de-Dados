CREATE DATABASE ODS3_Hospital;
USE ODS3_Hospital;

CREATE TABLE Bloco (ID_Bloco INT, nome VARCHAR(7),
PRIMARY KEY (ID_Bloco));

CREATE TABLE Departamento (ID_Departamento int, nome varchar(40), ID_Bloco int,
PRIMARY KEY (ID_Departamento),
FOREIGN KEY (ID_Bloco) REFERENCES Bloco (ID_Bloco));

CREATE TABLE Funcionario (ID_funcionario int, nome varchar (40), CPF VARCHAR(20), Endereço varchar(40), telefone VARCHAR(15), Cargo varchar(40), Tipo INT, ID_Departamento INT, horario_de_atendimento VARCHAR(15),
PRIMARY KEY (ID_funcionario),
FOREIGN KEY (ID_Departamento) REFERENCES Departamento (ID_Departamento));

create table Grupo_de_risco (ID_Grupo int, nome varchar(40), Descrição VARCHAR(100),
primary key (ID_Grupo));

CREATE TABLE Paciente (ID_Paciente int, nome varchar(40), CPF VARCHAR(20), Data_de_Nascimento date, Endereco varchar(40), Tellefone varchar(15), ID_Grupo int,
primary key (ID_Paciente),
foreign key (ID_Grupo) REFERENCES Grupo_de_risco (ID_Grupo));

create table Exame (ID_Exame int, ID_Funcionario int, ID_Paciente int, Data_hora datetime,Nome VARCHAR(40), Descrição VARCHAR(100), resultado varchar(40),
primary key (ID_Exame),
foreign key (ID_Funcionario) REFERENCES Funcionario (ID_Funcionario),
foreign key (ID_Paciente) REFERENCES Paciente (ID_Paciente));

create table Doenca (ID_Doenca int, nome varchar(40), CID varchar (40), Sintoma VARCHAR (100),
primary key (ID_Doenca));

create table Medicamento (ID_Medicamento INT, nome varchar(40), fabricante varchar(40), Tarja varchar(10),
primary key (ID_Medicamento));

create table Consulta (ID_Consulta int, ID_Funcionario int, ID_Paciente int, Data_hora datetime, Diagnostico varchar(40), ID_Doenca int,
primary key (ID_Consulta),
foreign key (ID_Funcionario) REFERENCES Funcionario (ID_Funcionario),
foreign key (ID_Paciente) REFERENCES Paciente (ID_Paciente),
foreign key (ID_Doenca) REFERENCES Doenca (ID_Doenca));

create table Receita (ID_Receita INT, ID_Consulta INT, Data_Emissao DATE, Posologia VARCHAR(100), ID_Medicamento INT,
primary key (ID_Receita),
FOREIGN KEY (ID_Consulta) REFERENCES consulta (ID_Consulta),
FOREIGN KEY (ID_Medicamento) REFERENCES medicamento (ID_Medicamento));

