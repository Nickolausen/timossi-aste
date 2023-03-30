DROP DATABASE IF EXISTS DB_Timossi
GO

CREATE DATABASE DB_Timossi
GO

USE DB_Timossi
GO

CREATE TABLE Collezioni(
    IDCollezione int NOT NULL PRIMARY KEY,
    Nome varchar(100)
);

CREATE TABLE Materiali(
    IDMateriale int NOT NULL PRIMARY KEY,
    Descrizione varchar(200)
);

CREATE TABLE Province(
    IDProvincia int NOT NULL PRIMARY KEY,
    Nome varchar(100) NOT NULL
);

CREATE TABLE Luoghi(
    IDLuogo int NOT NULL PRIMARY KEY,
    Nome varchar(100),
    IDProvincia int,
    FOREIGN KEY (IDProvincia) REFERENCES Province(IDProvincia)
);

CREATE TABLE Opere(
  IDOpera int NOT NULL PRIMARY KEY,
	Titolo varchar(100),
	Descrizione varchar(300), 
	Anno int, 
  IDMateriale int NOT NULL,
	IDCollezione int,
    IDLuogo int,
    FOREIGN KEY (IDMateriale) REFERENCES Materiali(IDMateriale),
    FOREIGN KEY (IDCollezione) REFERENCES Collezioni(IDCollezione),
    FOREIGN KEY (IDLuogo) REFERENCES Luoghi(IDLuogo)
);


CREATE TABLE Utente(
    IDUtente int primary key,
    Nome varchar(20) NOT NULL,
    Cognome varchar(20) NOT NULL,
    DataDiNascita date NOT NULL,
    Email varchar(50) NOT NULL,
    Telefono varchar(15) NOT NULL,
    Password varchar(30) NOT NULL
);


Create Table Aste(
    IDAsta int NOT NULL PRIMARY KEY,
    IDOpera int NOT NULL,
    Scadenza date NOT NULL,
    BaseAsta int NOT NULL,
    Stato int DEFAULT(0) CHECK((Stato >= 0) AND (Stato <= 2))/* 0 = In arrivo, 1 = Aperta, 2 = Conclusa */,
    FOREIGN KEY(IDOpera) REFERENCES Opere(IDOpera)
);

CREATE TABLE Offerte(
    IDOfferta int PRIMARY KEY,
    IDAsta int,
    IDUtente int,
    Importo int,
    Data date,
    FOREIGN KEY(IDAsta) REFERENCES Aste(IDAsta),
    FOREIGN KEY(IDUtente) REFERENCES Utente(IDUtente)
);


INSERT INTO Province VALUES (1,'Roma');
INSERT INTO Province VALUES (2,'Massa-Carrara');
INSERT INTO Province VALUES (3,'Grosseto');
INSERT INTO Province VALUES (4,'Trapani');
INSERT INTO Province VALUES (5,'Teramo');
INSERT INTO Province VALUES (6,'Napoli');

INSERT INTO Luoghi VALUES (1,'Collezione Privata',1);
INSERT INTO Luoghi VALUES (2,'Carrara',2);
INSERT INTO Luoghi VALUES (3,'Monastero di Siloe',3);
INSERT INTO Luoghi VALUES (4,'Fondazione Orestiadi, Gibellina',4);
INSERT INTO Luoghi VALUES (5,'Lago ex-Snia',1);
INSERT INTO Luoghi VALUES (6,'Ghiacciaio del Calderone, Comune di Pietracamela',5);
INSERT INTO Luoghi VALUES (7,'Mercato rionale Palmiro Togliatti',1);
INSERT INTO Luoghi VALUES (8,'Galleria Interno 14',1);
INSERT INTO Luoghi VALUES (9,'Centro di Sarro',1);
INSERT INTO Luoghi VALUES (10,'Palazzo Orsini, Gravina',6);

INSERT INTO Collezioni VALUES (1,'Illusione');
INSERT INTO Collezioni VALUES (2,'Pagine');
INSERT INTO Collezioni VALUES (3,'Contraccolpi');
INSERT INTO Collezioni VALUES (4,'Spilli');
INSERT INTO Collezioni VALUES (5,'In memoria');
INSERT INTO Collezioni VALUES (6,'Voci');
INSERT INTO Collezioni VALUES (7,'Oi diālogoi');
INSERT INTO Collezioni VALUES (8,'Flussi');

INSERT INTO Materiali VALUES (1, 'Marmo');
INSERT INTO Materiali VALUES (2, 'PVC e basalto');
INSERT INTO Materiali VALUES (3, 'PVC e pietra');
INSERT INTO Materiali VALUES (4, 'PVC e marmo perlato di Sicilia');
INSERT INTO Materiali VALUES (5, 'PVC e materiali non pregiati di edilizia');
INSERT INTO Materiali VALUES (6, 'PVC');

INSERT INTO Opere VALUES (1,'opera 1','Installazione ambientale presso le Cave Michelangelo',2016,1,1,2);
INSERT INTO Opere VALUES (2,'opera 2','Pagina (Peso leggero)',2021,2,2,1);
INSERT INTO Opere VALUES (3,'opera 3','Pagina a caduta',2022,3,2,NULL);
INSERT INTO Opere VALUES (4,'opera 4','Pagina con grembo',2022,3,2,3);
INSERT INTO Opere VALUES (5,'opera 5','Tubi in PVC e marmo perlato di Sicilia',2021,4,3,4);
INSERT INTO Opere VALUES (6,'opera 6','Installazione ambientale',2018,5,4,5);
INSERT INTO Opere VALUES (7,'opera 7','Pietre nere per il Lago Sofia',2018,5,4,6);
INSERT INTO Opere VALUES (8,'opera 8','Mercato Prenestina Togliatti',2014,6,6,7);
INSERT INTO Opere VALUES (9,'opera 9','Galleria Interno 14',2014,6,6,8);
INSERT INTO Opere VALUES (10,'opera 10','Dittico',2015,6,7,9);
INSERT INTO Opere VALUES (11,'opera 11','Veduta d''insieme',2015,6,7,9);
INSERT INTO Opere VALUES (12,'opera 12','Allestimento',2013,6,8,10);


INSERT INTO Utente(IDUtente, Nome, Cognome, DataDiNascita, Email, Telefono,Password)
VALUES ('101','Mario', 'Rossi', '1980-01-01', 'mario.rossi@email.com', '1234567890','1234567890');

INSERT INTO Utente(IDUtente, Nome, Cognome, DataDiNascita, Email, Telefono,Password)
VALUES ('102','Luigi', 'Bianchi', '1985-03-20', 'luigi.bianchi@email.com', '2345678901','1234567890');

INSERT INTO Utente (IDUtente, Nome, Cognome, DataDiNascita, Email, Telefono,Password)
VALUES ('103','Giovanni', 'Verdi', '1990-05-10', 'giovanni.verdi@email.com', '3456789012','1234567890');




Insert INTO Aste VALUES (1, 2, '2023-02-14', 200, 1);
Insert INTO Aste VALUES (2, 1, '2023-02-14', 200, 1);
Insert INTO Aste VALUES (3, 5, '2023-03-01', 400, 1);
Insert INTO Aste VALUES (4, 4, '2023-02-19', 500, 1);
Insert INTO Aste VALUES (5, 8, '2023-02-27', 1000, 0);
Insert INTO Aste VALUES (6, 6, '2023-02-11', 800, 1);
Insert INTO Aste VALUES (7, 10, '2023-03-04', 200, 0);


INSERT INTO Offerte VALUES (1, 1, 101, 900, '2023-03-30');
INSERT INTO Offerte VALUES (2, 1, 102, 920, '2023-04-2');
INSERT INTO Offerte VALUES (3, 1, 101, 1100, '2023-04-3');