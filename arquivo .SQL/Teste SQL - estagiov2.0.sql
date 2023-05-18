--
-- Feito no MySQL usando o Docker por Rodrigo de Oliveira dos Santos
--

-- criando a database 
create database estagio;

-- qual banco vamos usar
use estagio;

-- criando a tabela Pessoas
create table Pessoas(
PessoaID int not null auto_increment primary key,
Nome varchar(40) not null,
Idade int(255) not null,
EnderecoID int(65)not null 
);

-- criando a tabela Enderecos
create table Enderecos(
ID int not null auto_increment primary key,
Rua varchar(40) not null,
Numero int(255) not null,
Cidade varchar(40)not null,
Estado varchar(40)not null,
Pais varchar(40)not null
);

-- adicionando a foreign key
alter table Pessoas
add foreign key (EnderecoID)
references Enderecos(ID);

-- teste
alter table Enderecos
add foreign key (ID)
references Pessoas(EnderecoID);

-- inserindo os valores na tabela Enderecos com ID
INSERT INTO `Enderecos` ( ID, Rua, Numero, Cidade, Estado, Pais) VALUES
(65,'Jardim Belo', 08151010, 'Rio Preto', 'GO', 'Brasil');

INSERT INTO `Enderecos` ( Rua, Numero, Cidade, Estado, Pais) VALUES
('Jardim nazare', 08151000, 'Sao Paulo', 'SP', 'Brasil');

-- trazendo todos os dados da tabela Endereco
SELECT * FROM estagio.Enderecos;

--------------------------------------------------------------------------------------------------------------------------------------------------------------

-- inserindo os valores na tabela Pessoas sem passar o PessoaID
INSERT INTO `Pessoas` (Nome, Idade, EnderecoID) VALUES
('Danilo', 23, 1);

-- inserindo os valores na tabela Pessoas 
INSERT INTO `Pessoas` (PessoaID ,Nome, Idade, EnderecoID) VALUES
(123 ,'Rodrigo', 23, 65);

-- trazendo todos os dados da tabela Pessoas
SELECT * FROM estagio.Pessoas;
--------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Alterando Campo
UPDATE  Pessoas 
SET Idade= 20  
WHERE PessoaID= 123;

--------------------------------------------------------------------------------------------------------------------------------------------------------------

-- trazendo os campos: nome, idade, rua, número, cidade, estado e país pelo o PessoaID
SELECT  Pessoas.PessoaID ,Pessoas.Nome, Pessoas.Idade, Enderecos.Rua, Enderecos.Numero, Enderecos.Cidade, Enderecos.Estado, Enderecos.Pais 
from Pessoas join Enderecos on Enderecos.ID = Pessoas.EnderecoID
where PessoaID = 123;

-- teste
SELECT * from Pessoas join Enderecos
where PessoaID = 123;
