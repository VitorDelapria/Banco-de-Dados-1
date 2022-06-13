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

	rg CHAR (20),

	telefone CHAR (20),

	idCliente INTEGER,
    
    sexo CHAR (10),

	PRIMARY KEY (idCLiente),

	FOREIGN KEY (idCliente) REFERENCES PESSOA (id)

);

CREATE TABLE INSTRUTOR
(

	telefone CHAR (20),
    
    aptidao CHAR (50),
    
    horario CHAR (10),
    
    idInstrutor INTEGER,

	PRIMARY KEY (idInstrutor),

	FOREIGN KEY (idInstrutor) REFERENCES PESSOA (id)

);

CREATE TABLE FAXINEIRO
(

	telefone CHAR (20),
    
    rg CHAR (20),
    
    horario CHAR (10),
    
    idFaxineiro INTEGER,

	PRIMARY KEY (idFaxineiro),

	FOREIGN KEY (idFaxineiro) REFERENCES PESSOA (id)

);

CREATE TABLE RECEPCIONISTA
(

	telefone CHAR (20),
    
    rg CHAR (20),
    
    horario CHAR (10),
    
    idRecepcionista INTEGER,

	PRIMARY KEY (idRecepcionista),

	FOREIGN KEY (idRecepcionista) REFERENCES PESSOA (id)

);

CREATE TABLE FORNECEDOR
(

	telefone CHAR (20),
    
    rg CHAR (20),
    
    cpf CHAR (20),
    
    idFornecedor INTEGER,

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
    
    cargaHoraria CHAR (30),
    
    tipo CHAR (20),
    
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