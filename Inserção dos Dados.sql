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
    
    horario CHAR (10),

	PRIMARY KEY (idInstrutor),

	FOREIGN KEY (idInstrutor) REFERENCES PESSOA (id)

);

CREATE TABLE FAXINEIRO
(
	
    idFaxineiro INTEGER,

	telefone CHAR (20),
    
    rg CHAR (20),
    
    horario CHAR (10),

	PRIMARY KEY (idFaxineiro),

	FOREIGN KEY (idFaxineiro) REFERENCES PESSOA (id)

);

CREATE TABLE RECEPCIONISTA
(

	idRecepcionista INTEGER,
    
    telefone CHAR (20),
    
    rg CHAR (20),
    
    horario CHAR (10),

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

	data_ DATE,
    
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
    
    dataPa DATE,
    
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

INSERT INTO PESSOA(id, email, endereco, nome) VALUES (10, 'pedro@gmail.com', 'Rua-Teste1', 'Pedro Albert'),  (20, 'zeze@gmail.com', 'Rua-Teste2', 'Zezinho Irineu'), (30, 'matheus@gmail.com', 'Rua-Teste3', 'Matheus Afonso'), (40, 'Lilian@gmail.com', 'Rua-Teste3', 'Lilian Afonso'), (50, 'Debora@gmail.com', 'Rua-Teste5', 'Debora Assis'), (60, 'Willian@gmail.com', 'Rua-Teste6', 'Willian Sorocaba'), (70, 'Jozias@gmail.com', 'Rua-Teste7', 'Jozias Nascimento'), (80, 'geremias@gmail.com', 'Rua-Teste8', 'Geremias da Silva'), (90, 'Geronimo@gmail.com', 'Rua-Teste9', 'Geronimo Qualli'), (100, 'rosana@gmail.com', 'Rua-Teste10', 'Rosana D; Aparecida');
INSERT INTO CLIENTE(idCliente, rg, telefone, sexo) VALUES (10, '123456', '(40)9986-6266', 'Masculino'),  (20, '4654565', '(40)9565-6523', 'Masculino'), (30, '6651416', '(40)9656-8956', 'Masculino'), (40, '8562623', '(40)8926-9895', 'Feminino'), (50, '323266', '(40)8926-5654', 'Feminino'), (60, '67963456', '(40)9856-9966', 'Masculino'), (70, '9532311', '(41)9536-7812', 'Masculino'), (80, '94956626', '(41)9866-2212', 'Masculino'), (90, '55323232', '(42)8946-1111', 'Masculino'), (100, '215536312', '(42)9995-5233', 'Feminino');
INSERT INTO INSTRUTOR(idInstrutor, telefone, aptidao, horario) VALUES (101, '(40)9896-9696', 'Educação Física', '7:00 ás 12:00'),  (102, '(40)6565-6566', 'Educação Física', '7:00 ás 12:00'), (103,'(40)6565-6566', 'Educação Física', '7:00 ás 12:00'), (104,'(40)6565-6566', 'Educação Física', '7:00 ás 12:00'), (105,'(40)6565-6566', 'Educação Física', '7:00 ás 12:00'), (106,'(40)6565-6566', 'Educação Física', '7:00 ás 12:00'), (107,'(40)6565-6566', 'Educação Física', '7:00 ás 12:00'), (108, '(40)6565-6566', 'Educação Física', '7:00 ás 12:00'), (109, '(40)6565-6566', 'Educação Física', '7:00 ás 12:00'), (110,'(40)6565-6566', 'Educação Física', '7:00 ás 12:00');
INSERT INTO FAXINEIRO(idFaxineiro, telefone, rg, horario) VALUES (111, '(40)9454-2214', '8583833932', '7:00 ás 12:00'),  (112, '(40)5454-5464', '2384292301', '7:00 ás 12:00'), (113,'(40)3223-1232', '12839123940', '7:00 ás 12:00'), (114,'(40)6785-6566', '010100101233', '7:00 ás 12:00'), (115,'(40)9898-6566', '023210320233', '7:00 ás 12:00'), (116,'(40)6565-6566', '4858384848', '7:00 ás 12:00'), (117,'(40)1111-6566', '222302043', '7:00 ás 12:00'), (118, '(40)6565-6566', '9938393939', '7:00 ás 12:00'), (119, '(41)8888-9999', '2342332556', '7:00 ás 12:00'), (120,'(43)5555-6566', '8488484848', '7:00 ás 12:00');
INSERT INTO RECEPCIONISTA(idRecepcionista, telefone, rg, horario) VALUES (121, '(45)9233-2323', '545445544555', '7:00 ás 12:00'),  (122, '(45)5454-5464', '99494949449', '7:00 ás 12:00'), (123,'(44)3223-1112', '1111111110', '7:00 ás 12:00'), (124,'(45)9865-6566', '000000202', '7:00 ás 12:00'), (125,'(45)8898-6566', '526565656565', '7:00 ás 12:00'), (126,'(45)2265-6566', '51515151515', '7:00 ás 12:00'), (127,'(45)9991-6566', '62323232323', '7:00 ás 12:00'), (128, '(45)8899-6566', '2222222222233', '7:00 ás 12:00'), (129, '(46)7886-9999', '111100011010', '7:00 ás 12:00'), (130,'(45)3333-6566', '12121211121', '7:00 ás 12:00');
INSERT INTO FORNECEDOR(idFornecedor, telefone, rg, cpf) VALUES (131, '(47)9233-2323', '888889999999', '222222222222'),  (132, '(47)5454-5464', '2121212121211', '333333333333333'), (133,'(47)3223-1112', '3333333555555', '5555555555555'), (134,'(45)9865-6566', '000000202', '4444444455555555'), (135,'(45)1898-6566', '484545484544', '41111111444'), (136,'(45)2265-6566', '27772722727', '66666666444'), (137,'(45)1191-6566', '5484848484848', '88888888888'), (138, '(45)3399-6566', '12121212115', '7777744477'), (139, '(46)1186-9999', '84865562213', '2232323232323'), (140,'(45)1133-6566', '5151132323258', '25252525525252');
INSERT INTO INSTRUI(idClien, idIns) VALUES (10, 101),  (20, 102), (30, 103), (40, 104), (40, 104), (50, 105), (60, 106), (70, 107), (80, 108), (90, 109), (100, 110);
INSERT INTO TREINO(id, tipo, nome) VALUES (201, 'Bicepes', 'SUPINO'),  (202, 'Panturrilha', 'LEG PRESS'), (203, 'Panturrilha', 'AGACHAMENTO HACK'), (204, 'Panturrilha', 'EXTENSORA'), (205, 'Coxa', 'ADUTORA'), (206, 'COXA', 'ABDUTORA'), (207, 'Abdomem', 'ABD Reto'), (208, 'Tricepes', 'TRICEPS CROSS'), (209, 'Bicepes', 'Rosca Direta'), (210, 'Ombro', 'Elevação Lateral');
INSERT INTO FORNECE_(idCli, idRec, idTre) VALUES (10, 121, 201),  (20, 122, 202), (30, 123, 203), (40, 124, 204), (50, 125, 205), (60, 126, 206), (70, 127, 207), (80, 128, 208), (90, 129, 209), (100, 130, 210);
INSERT INTO PAGAMENTO(data_, mensalidadeCliente, pagamentoFuncionario) VALUES (10/01/2022, 100.00, 2000.00),  (10/02/2022, 100.00, 2000.00), (10/03/2022, 100.00, 2000.00), (10/04/2022, 100.00, 2000.00), (10/05/2022, 100.00, 2000.00), (10/06/2022, 100.00, 2000.00), (10/07/2022, 100.00, 2000.00), (10/08/2022, 100.00, 2000.00), (10/09/2022, 100.00, 2000.00), (10/10/2022, 100.00, 2000.00);
INSERT INTO PAGAR(idCli, idIns, idFax, idRec, dataPa) VALUES (10, 101, 111, 121, 10/01/2022),  (20, 102, 112, 122, 10/02/2022), (30, 103, 113, 123, 10/03/2022), (40, 104, 114, 124, 10/04/2022), (50, 105, 115, 125, 10/05/2022), (60, 106, 116, 126, 10/06/2022), (70, 107, 117, 127, 10/07/2022), (80, 108, 118, 128, 10/08/2022), (90, 109, 119, 129, 10/09/2022), (100, 110, 120, 130, 10/10/2022);
INSERT INTO EQUIPAMENTO(id, tipo, peso, nome) VALUES (201, 'Bicepes', 10.0,'SUPINO'),  (202, 'Panturrilha', 80.0, 'LEG PRESS'), (203, 'Panturrilha', 5.0, 'AGACHAMENTO HACK'), (204, 'Panturrilha', 20.0, 'EXTENSORA'), (205, 'Coxa',30.0, 'ADUTORA'), (206, 'COXA', 30.0, 'ABDUTORA'), (207, 'Abdomem', 0.0, 'ABD Reto'), (208, 'Tricepes',55.0, 'TRICEPS CROSS'), (209, 'Bicepes',20.0, 'Rosca Direta'), (210, 'Ombro',20.0, 'Elevação Lateral');
INSERT INTO FORNECE(idEqui, idFor) VALUES (201, 131),  (202, 132), (203, 133), (204, 134), (205, 135), (206, 136), (207, 137), (208, 138), (209, 139), (210, 140);
INSERT INTO SERVICO(id, tipo, cargaHoraria, nome) VALUES (301, 'Limpeza', '8 horas'),  (302, 'Instruir', '8 horas'), (303, 'Recepcionar', '8 horas'), (304, 'Limpeza', '8 horas'), (305, 'Recepcionar', '8 horas'), (306, 'Instruir', '8 horas'), (307, 'Instruir', '8 horas'), (308, 'Instruir', '8 horas'), (309, 'Instruir', '8 horas'), (310, 'Instruir', '8 horas');
INSERT INTO POSSUI(idIns, idFax, idRec, idSer) VALUES (101, 111, 121, 301),  (102, 112, 122, 302), (103, 113, 123, 303), (104, 114, 124, 304), (105, 115, 125, 305), (106, 116, 126, 306), (107, 117, 127, 307), (108, 118, 128, 308), (109, 119, 129, 309), (110, 120, 130, 310);


 


