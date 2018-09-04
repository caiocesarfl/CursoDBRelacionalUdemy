# Criando as tableas

CREATE TABLE CLIENTE (
 idCliente INT PRIMARY KEY AUTO_INCREMENT,
 nome varchar(30) NOT NULL,
 sexo ENUM ('M','F') NOT NULL,
 email varchar(50) UNIQUE,
 CPF varchar (15) UNIQUE
 );

CREATE TABLE ENDERECO (
idEndereco INT PRIMARY KEY AUTO_INCREMENT,
rua varchar(15) NOT NULL,
num int NOT NULL,
idClienteEndereco INT, 
FOREIGN KEY (idClienteEndereco)
REFERENCES CLIENTE(idCliente)
);



CREATE TABLE TELEFONE (
idTelefone INT PRIMARY KEY AUTO_INCREMENT,
ddd varchar(2),
numero varchar (9),
idClienteTelefone INT,
FOREIGN KEY (idClienteTelefone)
REFERENCES cliente (idCliente)
);

CREATE TABLE VENDEDOR (
idVendedor INT PRIMARY KEY AUTO_INCREMENT,
nome varchar (30),
valor FLOAT (10,2)
);

#Inserindo valores
insert into cliente values (2, "Fernanda", 'F', 'fernanda@lemaf.ufla.br','43866040506');
insert into cliente values (3, "Luisa", 'F', 'luisa.f@gmail.com','485945545955');
insert into telefone values (1,'37','999051374',1);
insert into telefone values (2,'37','31841374',1);
insert into telefone values (3, '35','995458595',2)
insert into telefone values (3, '31','995453395',3)	
insert into endereco values (1,'av dr jaci',290,1);
insert into endereco values (2,'av turfa',1297,1);

#seleção com inner join
SELECT nome, ddd, numero
FROM CLIENTE
INNER JOIN TELEFONE 
ON idCliente = idClienteTelefone;

SELECT nome, ddd, numero
FROM CLIENTE as C, ENDERECO as E
WHERE C.idCliente = E.idClienteEndereco;


select C.nome, T.numero
FROM cliente C
INNER JOIN telefone T
on idCliente = idClienteTelefone
INNER JOIN endereco E
on idCliente = idClienteEndereco
where E.num=100; 

#criando views 
CREATE VIEW relatorio as 
select C.nome, C.email, E.rua, E.num 
FROM CLIENTE C
INNER JOIN endereco E
on idCliente = idClienteEndereco


#criando procedure
CREATE PROCEDURE CONTA (NUM1 int, NUM2 int) 
BEGIN
  select num1 + num2 as "conta";
END 
$

CREATE PROCEDURE cad_cliente (p_nome varchar(10), p_sexo ENUM('M','F'), p_email varchar (30), p_cpf char(15)) 
BEGIN
insert into cliente values (null, p_nome, p_sexo, p_email, p_cpf);
END
$

call cad_cliente ("Fabiana", 'F','fab_pereira@gmail.com','119157036389'); 



