-- https://github.com/VitorDelapria/Banco-de-Dados-1

DROP TABLE IF EXISTS PESSOA, CLIENTE, INSTRUTOR, FAXINEIRO, RECEPCIONISTA, FORNECEDOR, INSTRUI, TREINO, PAGAMENTO, PAGAR, EQUIPAMENTO, FORNECE, SERVICO, POSSUI, FORNECE_;

CREATE TABLE PESSOA
(

	id INTEGER,
    
    email VARCHAR (80),
    
    endereco VARCHAR (80),
    
    nome VARCHAR (80),
    
    PRIMARY KEY (id)

);

CREATE TABLE CLIENTE 
(

	idCliente INTEGER,
    
    rg CHAR (20),

	telefone CHAR (20),
    
    sexo CHAR (10),

	PRIMARY KEY (idCLiente),

	FOREIGN KEY (idCliente) REFERENCES PESSOA (id)

);

CREATE TABLE INSTRUTOR
(
	
    idInstrutor INTEGER,

	telefone CHAR (20),
    
    aptidao CHAR (50),
    
    horario CHAR (20),

	PRIMARY KEY (idInstrutor),

	FOREIGN KEY (idInstrutor) REFERENCES PESSOA (id)

);

CREATE TABLE FAXINEIRO
(
	
    idFaxineiro INTEGER,

	telefone CHAR (20),
    
    rg CHAR (20),
    
    horario CHAR (20),

	PRIMARY KEY (idFaxineiro),

	FOREIGN KEY (idFaxineiro) REFERENCES PESSOA (id)

);

CREATE TABLE RECEPCIONISTA
(

	idRecepcionista INTEGER,
    
    telefone CHAR (20),
    
    rg CHAR (20),
    
    horario CHAR (20),

	PRIMARY KEY (idRecepcionista),

	FOREIGN KEY (idRecepcionista) REFERENCES PESSOA (id)

);

CREATE TABLE FORNECEDOR
(

	idFornecedor INTEGER,
	
	telefone CHAR (20),
    
    rg CHAR (20),
    
    cpf CHAR (20),

	PRIMARY KEY (idFornecedor),

	FOREIGN KEY (idFornecedor) REFERENCES PESSOA (id)

);

CREATE TABLE INSTRUI
(

	idClien INTEGER,
    
    idIns INTEGER,
    
    PRIMARY KEY (idClien, idIns),
    
    FOREIGN KEY (idClien) REFERENCES CLIENTE (idCliente),
    
    FOREIGN KEY (idIns) REFERENCES INSTRUTOR (idInstrutor)

);

CREATE TABLE TREINO 
(

	id INTEGER,
    
    tipo CHAR (20),
    
    nome CHAR (20),
    
    PRIMARY KEY (id)

);

CREATE TABLE FORNECE_
(

	idCli INTEGER, 
    
    idRec INTEGER, 
    
    idTre INTEGER,
    
    PRIMARY KEY (idCli, idRec, idTre),
    
    FOREIGN KEY (idCli) REFERENCES CLIENTE (idCliente),
    
    FOREIGN KEY (idRec) REFERENCES RECEPCIONISTA (idRecepcionista)

);

CREATE TABLE PAGAMENTO
(

	data_ CHAR (20),
    
    mensalidadeCliente REAL,
    
    pagamentoFuncionario REAL,
    
    PRIMARY KEY (data_)
);

CREATE TABLE PAGAR
(

	idCli INTEGER,

	idIns INTEGER,
    
    idFax INTEGER,
    
    idRec INTEGER,
    
    dataPa CHAR (20),
    
    PRIMARY KEY (idCli, idIns, idFax, idRec, dataPa),
    
    FOREIGN KEY (idCli) REFERENCES CLIENTE (idCliente),
    
    FOREIGN KEY (IdIns) REFERENCES INSTRUTOR (idInstrutor),
    
    FOREIGN KEY (idFax) REFERENCES FAXINEIRO (idFaxineiro),
    
    FOREIGN KEY (idRec) REFERENCES RECEPCIONISTA (idRecepcionista),
    
    FOREIGN KEY (dataPa) REFERENCES PAGAMENTO (data_)

);

CREATE TABLE EQUIPAMENTO
(

	id INTEGER,
    
    tipo CHAR (20),
    
    peso FLOAT,
    
    nome CHAR (50),
    
    PRIMARY KEY (id)

);

CREATE TABLE FORNECE
(

	idEqui INTEGER,
    
    idFor INTEGER,
    
    PRIMARY KEY (idEqui, idFor),
    
    FOREIGN KEY (idEqui) REFERENCES EQUIPAMENTO (id),
    
    FOREIGN KEY (idFor) REFERENCES FORNECEDOR (idFornecedor)

);

CREATE TABLE SERVICO
(

	id INTEGER,
    
    tipo CHAR (20),
    
    cargaHoraria CHAR (30),
    
    PRIMARY KEY (id)

);

CREATE TABLE POSSUI
(

	idIns INTEGER,
    
    idFax INTEGER,
    
    idRec INTEGER,
    
    idSer INTEGER,
    
    PRIMARY KEY (idIns, idFax, idRec, idSer),
    
    FOREIGN KEY (idIns) REFERENCES INSTRUTOR (idInstrutor),
    
    FOREIGN KEY (idFax) REFERENCES FAXINEIRO (idFaxineiro),
    
    FOREIGN KEY (idRec) REFERENCES RECEPCIONISTA (idRecepcionista),
    
    FOREIGN KEY (idSer) REFERENCES SERVICO (id)

);

SELECT * FROM PESSOA;

INSERT INTO PESSOA(id, email, endereco, nome) VALUES (10, 'pedro@gmail.com', 'Rua-Teste1', 'Pedro Albert'),  (20, 'zeze@gmail.com', 'Rua-Teste2', 'Zezinho Irineu'), (30, 'matheus@gmail.com', 'Rua-Teste3', 'Matheus Afonso'), (40, 'Lilian@gmail.com', 'Rua-Teste3', 'Lilian Afonso'), (50, 'Debora@gmail.com', 'Rua-Teste5', 'Debora Assis'), (60, 'Willian@gmail.com', 'Rua-Teste6', 'Willian Sorocaba'), (70, 'Jozias@gmail.com', 'Rua-Teste7', 'Jozias Nascimento'), (80, 'geremias@gmail.com', 'Rua-Teste8', 'Geremias da Silva'), (90, 'Geronimo@gmail.com', 'Rua-Teste9', 'Geronimo Qualli'), (100, 'rosana@gmail.com', 'Rua-Teste10', 'Rosana D; Aparecida');
INSERT INTO CLIENTE(idCliente, rg, telefone, sexo) VALUES (10, '123456', '(40)9986-6266', 'Masculino'),  (20, '4654565', '(40)9565-6523', 'Masculino'), (30, '6651416', '(40)9656-8956', 'Masculino'), (40, '8562623', '(40)8926-9895', 'Feminino'), (50, '323266', '(40)8926-5654', 'Feminino'), (60, '67963456', '(40)9856-9966', 'Masculino'), (70, '9532311', '(41)9536-7812', 'Masculino'), (80, '94956626', '(41)9866-2212', 'Masculino'), (90, '55323232', '(42)8946-1111', 'Masculino'), (100, '215536312', '(42)9995-5233', 'Feminino');
INSERT INTO INSTRUTOR(idInstrutor, telefone, aptidao, horario) VALUES (10, '(40)9896-9696', 'Educação Física', '7:00 ás 12:00'),  (20, '(40)6565-6566', 'Educação Física', '7:00 ás 12:00'), (30,'(40)6565-6566', 'Educação Física', '7:00 ás 12:00'), (40,'(40)6565-6566', 'Educação Física', '7:00 ás 12:00'), (50,'(40)6565-6566', 'Educação Física', '7:00 ás 12:00'), (60,'(40)6565-6566', 'Educação Física', '7:00 ás 12:00'), (70,'(40)6565-6566', 'Educação Física', '7:00 ás 12:00'), (80, '(40)6565-6566', 'Educação Física', '7:00 ás 12:00'), (90, '(40)6565-6566', 'Educação Física', '7:00 ás 12:00'), (100,'(40)6565-6566', 'Educação Física', '7:00 ás 12:00');
INSERT INTO FAXINEIRO(idFaxineiro, telefone, rg, horario) VALUES (10, '(40)9454-2214', '8583833932', '7:00 ás 12:00'),  (20, '(40)5454-5464', '2384292301', '7:00 ás 12:00'), (30,'(40)3223-1232', '12839123940', '7:00 ás 12:00'), (40,'(40)6785-6566', '010100101233', '7:00 ás 12:00'), (50,'(40)9898-6566', '023210320233', '7:00 ás 12:00'), (60,'(40)6565-6566', '4858384848', '7:00 ás 12:00'), (70,'(40)1111-6566', '222302043', '7:00 ás 12:00'), (80, '(40)6565-6566', '9938393939', '7:00 ás 12:00'), (90, '(41)8888-9999', '2342332556', '7:00 ás 12:00'), (100,'(43)5555-6566', '8488484848', '7:00 ás 12:00');
INSERT INTO RECEPCIONISTA(idRecepcionista, telefone, rg, horario) VALUES (10, '(45)9233-2323', '545445544555', '7:00 ás 12:00'),  (20, '(45)5454-5464', '99494949449', '7:00 ás 12:00'), (30,'(44)3223-1112', '1111111110', '7:00 ás 12:00'), (40,'(45)9865-6566', '000000202', '7:00 ás 12:00'), (50,'(45)8898-6566', '526565656565', '7:00 ás 12:00'), (60,'(45)2265-6566', '51515151515', '7:00 ás 12:00'), (70,'(45)9991-6566', '62323232323', '7:00 ás 12:00'), (80, '(45)8899-6566', '2222222222233', '7:00 ás 12:00'), (90, '(46)7886-9999', '111100011010', '7:00 ás 12:00'), (100,'(45)3333-6566', '12121211121', '7:00 ás 12:00');
INSERT INTO FORNECEDOR(idFornecedor, telefone, rg, cpf) VALUES (10, '(47)9233-2323', '888889999999', '222222222222'),  (20, '(47)5454-5464', '2121212121211', '333333333333333'), (30,'(47)3223-1112', '3333333555555', '5555555555555'), (40,'(45)9865-6566', '000000202', '4444444455555555'), (50,'(45)1898-6566', '484545484544', '41111111444'), (60,'(45)2265-6566', '27772722727', '66666666444'), (70,'(45)1191-6566', '5484848484848', '88888888888'), (80, '(45)3399-6566', '12121212115', '7777744477'), (90, '(46)1186-9999', '84865562213', '2232323232323'), (100,'(45)1133-6566', '5151132323258', '25252525525252');
INSERT INTO INSTRUI(idClien, idIns) VALUES (10, 100),  (20, 90), (30, 80), (40, 70), (50, 60), (60, 50), (70, 40), (80, 30), (90, 20), (100, 10);
INSERT INTO TREINO(id, tipo, nome) VALUES (201, 'Bicepes', 'SUPINO'),  (202, 'Panturrilha', 'LEG PRESS'), (203, 'Panturrilha', 'AGACHAMENTO HACK'), (204, 'Panturrilha', 'EXTENSORA'), (205, 'Coxa', 'ADUTORA'), (206, 'COXA', 'ABDUTORA'), (207, 'Abdomem', 'ABD Reto'), (208, 'Tricepes', 'TRICEPS CROSS'), (209, 'Bicepes', 'Rosca Direta'), (210, 'Ombro', 'Elevação Lateral');
INSERT INTO FORNECE_(idCli, idRec, idTre) VALUES (10, 100, 201),  (20, 90, 202), (30, 80, 203), (40, 70, 204), (50, 60, 205), (60, 50, 206), (70, 40, 207), (80, 30, 208), (90, 20, 209), (100, 10, 210);
INSERT INTO PAGAMENTO(data_, mensalidadeCliente, pagamentoFuncionario) VALUES (10/01/2022, 100.00, 2000.00),  (10/02/2022, 100.00, 2000.00), (10/03/2022, 100.00, 2000.00), (10/04/2022, 100.00, 2000.00), (10/05/2022, 100.00, 2000.00), (10/06/2022, 100.00, 2000.00), (10/07/2022, 200.00, 2000.00), (10/08/2022, 100.00, 2000.00), (10/09/2022, 100.00, 2000.00), (10/10/2022, 100.00, 2000.00);
INSERT INTO PAGAR(idCli, idIns, idFax, idRec, dataPa) VALUES (10, 100, 10, 100, 10/01/2022),  (20, 90, 20, 90, 10/02/2022), (30, 80, 30, 80, 10/03/2022), (40, 70, 40, 70, 10/04/2022), (50, 60, 50, 60, 10/05/2022), (60, 50, 60, 50, 10/06/2022), (70, 40, 70, 40, 10/07/2022), (80, 30, 80, 30, 10/08/2022), (90, 20, 90, 20, 10/09/2022), (100, 10, 100, 10, 10/10/2022);
INSERT INTO EQUIPAMENTO(id, tipo, peso, nome) VALUES (201, 'Bicepes', 10.0,'SUPINO'),  (202, 'Panturrilha', 80.0, 'LEG PRESS'), (203, 'Panturrilha', 5.0, 'AGACHAMENTO HACK'), (204, 'Panturrilha', 20.0, 'EXTENSORA'), (205, 'Coxa',30.0, 'ADUTORA'), (206, 'COXA', 30.0, 'ABDUTORA'), (207, 'Abdomem', 0.0, 'ABD Reto'), (208, 'Tricepes',55.0, 'TRICEPS CROSS'), (209, 'Bicepes',20.0, 'Rosca Direta'), (210, 'Ombro',20.0, 'Elevação Lateral');
INSERT INTO FORNECE(idEqui, idFor) VALUES (201, 10),  (202, 20), (203, 100), (204, 30), (205, 40), (206, 50), (207, 60), (208, 70), (209, 80), (210, 90);
INSERT INTO SERVICO(id, tipo, cargaHoraria) VALUES (301, 'Limpeza', '8 horas'),  (302, 'Instruir', '8 horas'), (303, 'Recepcionar', '8 horas'), (304, 'Limpeza', '8 horas'), (305, 'Recepcionar', '8 horas'), (306, 'Instruir', '8 horas'), (307, 'Instruir', '8 horas'), (308, 'Instruir', '8 horas'), (309, 'Instruir', '8 horas'), (310, 'Instruir', '8 horas');
INSERT INTO POSSUI(idIns, idFax, idRec, idSer) VALUES (10, 100, 10, 301),  (20, 90, 20, 302), (30, 80, 30, 303), (40, 70, 40, 304), (50, 60, 50, 305), (60, 50, 60, 306), (70, 40, 70, 307), (80, 30, 80, 308), (90, 20, 90, 309), (100, 10, 100, 310);


 -- consultas

-- 1 - 1 LISTE OS CLIENTES QUE POSSUEM INTRUSTOR

SELECT P.id, P.nome
FROM PESSOA P, CLIENTE C, INSTRUTOR I
WHERE P.id = C.idCliente AND P.id = I.idInstrutor AND P.id IN (SELECT IC.idClien 
															   FROM INSTRUI IC
                                                               WHERE IC.idClien = C.idCliente 
                                                                     AND IC.idIns = I.idInstrutor
															   );
                                                               
-- 2 - Liste carga horaria dos Faxineiro 

SELECT S.cargaHoraria
FROM SERVICO S
WHERE S.cargaHoraria IN (SELECT P.id
						 FROM PESSOA P, FAXINEIRO F
						 WHERE P.id = F.idFaxineiro);
                         
-- 3 - Liste o Id dos Funcionarios da Academia

SELECT P.id 
FROM PESSOA P, CLIENTE C, INSTRUTOR I, FAXINEIRO F, RECEPCIONISTA R
WHERE P.id = C.idCliente AND P.id = I.idInstrutor AND P.id = C.idCliente AND R.idRecepcionista 
AND C.idCliente NOT IN (SELECT C2.idCliente
						FROM CLIENTE C2
                        WHERE P.id = C2.idCliente);
                        
-- 4 - Liste o treino em que Cliente faz bicipes ou Panturrilha.

SELECT T.nome
FROM TREINO T, FORNECE_ F, CLIENTE C
WHERE C.idCliente = F.idCli AND T.id = F.idTre AND T.tipo = 'Bicepes'
UNION
SELECT T.nome
FROM TREINO T, FORNECE_ F, CLIENTE C
WHERE C.idCliente = F.idCli AND T.id = F.idTre AND T.tipo = 'Panturrilha';

-- 5 Liste a maior mensalidade dos Clientes

SELECT P.mensalidadeCliente
FROM PAGAMENTO P, PAGAR PG
WHERE P.data_ = PG.dataPa AND PG.idCLi >= ALL (SELECT PG2.idCli
												FROM CLIENTE C, PAGAR PG2
                                                WHERE C.idCliente = PG2.idCli);

-- 6 - Liste o menor pagamento de um Instrutor

SELECT P.pagamentoFuncionario
FROM PAGAMENTO P, PAGAR PG
WHERE P.data_ = PG.dataPa AND PG.idCLi < ALL (SELECT PG2.idCli
												FROM INSTRUTOR I, PAGAR PG2
                                                WHERE I.idInstrutor = PG2.idCli);

-- 7 -Liste o nome das pessoas em q a segunda letra é 'e' ou a ultima é 'a';

SELECT P.nome
FROM PESSOA P
WHERE P.nome LIKE '_e%' 
UNION
SELECT P.nome
FROM PESSOA P
WHERE P.nome LIKE '%a'; 

-- 8 - Liste o nome dos treinos sem repetição, fornecidos a um cliente.

SELECT DISTINCT T.nome
FROM CLIENTE C, FORNECE_ F, TREINO T
WHERE T.id = F.idTre AND EXISTS (SELECT C.idCliente 
								 FROM CLIENTE C
                                 WHERE C.idCliente = F.idCli);

-- 9 - Liste o nome do Equipamento do Fornecedor de maior peso

SELECT E.nome
FROM EQUIPAMENTO E
WHERE E.peso > ALL (SELECT E.peso
					 FROM FORNECEDOR F, FORNECE FE
					 WHERE idFor = F.idFornecedor AND E.id = FE.idEqui);
                     
-- 10 - Liste os Clientes que não possuiem um Instrutor

SELECT P.id, P.nome
FROM PESSOA P, CLIENTE C, INSTRUTOR I
WHERE P.id = C.idCliente AND P.id = I.idInstrutor AND P.id NOT IN (SELECT IC.idClien 
															   FROM INSTRUI IC
                                                               WHERE IC.idClien = C.idCliente 
                                                                     AND IC.idIns = I.idInstrutor
															   );
