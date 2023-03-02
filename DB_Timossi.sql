DROP DATABASE IF EXISTS DB_Timossi

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
    Nome varchar(100) NOT NULL,
)

CREATE TABLE Luoghi(
    IDLuogo int NOT NULL PRIMARY KEY,
    Nome varchar(100),
    IDProvincia int,
    FOREIGN KEY (IDProvincia) REFERENCES Province(IDProvincia),
);

CREATE TABLE Opere(
    IDOpera int NOT NULL PRIMARY KEY, 
	Descrizione varchar(200), 
	Anno int, 
    IDMateriale int NOT NULL,
	IDCollezione int,
    IDLuogo int,
    FOREIGN KEY (IDMateriale) REFERENCES Materiali(IDMateriale),
    FOREIGN KEY (IDCollezione) REFERENCES Collezioni(IDCollezione),
    FOREIGN KEY (IDLuogo) REFERENCES Luoghi(IDLuogo),
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
INSERT INTO Collezioni VALUES (7,'Oi diàlogoi');
INSERT INTO Collezioni VALUES (8,'Flussi');

INSERT INTO Materiali VALUES (1, 'Marmo');
INSERT INTO Materiali VALUES (2, 'PVC e basalto');
INSERT INTO Materiali VALUES (3, 'PVC e pietra');
INSERT INTO Materiali VALUES (4, 'PVC e marmo perlato di Sicilia');
INSERT INTO Materiali VALUES (5, 'PVC e materiali non pregiati di edilizia');
INSERT INTO Materiali VALUES (6, 'PVC');

INSERT INTO Opere VALUES (1,'Installazione ambientale presso le Cave Michelangelo',2016,1,1,2);
INSERT INTO Opere VALUES (2,'Pagina (Peso leggero)',2021,2,2,1);
INSERT INTO Opere VALUES (3,'Pagina a caduta',2022,3,2,NULL);
INSERT INTO Opere VALUES (4,'Pagina con grembo',2022,3,2,3);
INSERT INTO Opere VALUES (5,'Tubi in PVC e marmo perlato di Sicilia',2021,4,3,4);
INSERT INTO Opere VALUES (6,'Installazione ambientale',2018,5,4,5);
INSERT INTO Opere VALUES (7,'Pietre nere per il Lago Sofia',2018,5,4,6);
INSERT INTO Opere VALUES (8,'Mercato Prenestina Togliatti',2014,6,6,7);
INSERT INTO Opere VALUES (9,'Galleria Interno 14',2014,6,6,8);
INSERT INTO Opere VALUES (10,'Dittico',2015,6,7,9);
INSERT INTO Opere VALUES (11,'Veduta d''insieme',2015,6,7,9);
INSERT INTO Opere VALUES (12,'Allestimento',2013,6,8,10);

-- Begin COMPITO PER GIOVEDÍ 09/02/2023
CREATE TABLE Aste(
    IDAsta int IDENTITY(1,1) PRIMARY KEY,
    IDOpera int NOT NULL,
    Stato varchar(200),
    Base int,
    Data Date,
    PuntataMax int,

    FOREIGN KEY (IDOpera) REFERENCES Opere(IDOpera)
);

CREATE TABLE Utenti(
    Email varchar(100) PRIMARY KEY,
    Password varchar(100),
    Saldo int,
    Username varchar(20) UNIQUE,
);

CREATE TABLE PartecipazioneAste(
    IDAsta int,
    EmailUtente varchar(100),
    Puntata int,

    PRIMARY KEY (IDAsta, EmailUtente, Puntata),

    FOREIGN KEY (IDAsta) REFERENCES Aste(IDAsta),
    FOREIGN KEY (EmailUtente) REFERENCES Utenti(Email)
);

CREATE TABLE OpereAcquistate(
    EmailUtente varchar(100),
    IDOpera int,

    PRIMARY KEY (IDOpera),

    FOREIGN KEY (IDOpera) REFERENCES Opere(IDOpera),
    FOREIGN KEY (EmailUtente) REFERENCES Utenti(Email)
);

INSERT INTO Aste(IDOpera, Stato, Base, Data, PuntataMax) VALUES (1, 'Aperta', 2000, '2023-02-8', NULL);
INSERT INTO Aste(IDOpera, Stato, Base, Data, PuntataMax) VALUES (2, 'In Corso', 4000, '2023-02-10', NULL);
INSERT INTO Aste(IDOpera, Stato, Base, Data, PuntataMax) VALUES (3, 'Chiusa', 7000, '2023-02-8', NULL);
INSERT INTO Aste(IDOpera, Stato, Base, Data, PuntataMax) VALUES (4, 'Aperta', 10000, '2023-02-12', NULL);
INSERT INTO Aste(IDOpera, Stato, Base, Data, PuntataMax) VALUES (5, 'In Corso', 1000, '2023-01-10', NULL);
INSERT INTO Aste(IDOpera, Stato, Base, Data, PuntataMax) VALUES (6, 'Chiusa', 700, '2023-01-31', NULL);

INSERT INTO Utenti(Email, Password, Saldo, Username) VALUES ('nicholas.magi.stud@ispascalcomandini.it', 'aste2023!', 20000, 'Nickolausen');
INSERT INTO Utenti(Email, Password, Saldo, Username) VALUES ('luca.chiarabaglio.stud@ispascalcomandini.it', 'matematika77', 30000, 'nickgau');
INSERT INTO Utenti(Email, Password, Saldo, Username) VALUES ('tommaso.sardelli.stud@ispascalcomandini.it', 'london92', 70000, 'Tommyplayer21');
INSERT INTO Utenti(Email, Password, Saldo, Username) VALUES ('riccardo.barducci.stud@ispascalcomandini.it', 'lowkey', 10000, 'blackbardu');

INSERT INTO PartecipazioneAste(IDAsta, EmailUtente, Puntata) VALUES (1, 'nicholas.magi.stud@ispascalcomandini.it', 3000);
INSERT INTO PartecipazioneAste(IDAsta, EmailUtente, Puntata) VALUES (1, 'nicholas.magi.stud@ispascalcomandini.it', 4000);
INSERT INTO PartecipazioneAste(IDAsta, EmailUtente, Puntata) VALUES (1, 'nicholas.magi.stud@ispascalcomandini.it', 5000);
INSERT INTO PartecipazioneAste(IDAsta, EmailUtente, Puntata) VALUES (2, 'luca.chiarabaglio.stud@ispascalcomandini.it', 10000);
INSERT INTO PartecipazioneAste(IDAsta, EmailUtente, Puntata) VALUES (2, 'tommaso.sardelli.stud@ispascalcomandini.it', 11000);
INSERT INTO PartecipazioneAste(IDAsta, EmailUtente, Puntata) VALUES (3, 'riccardo.barducci.stud@ispascalcomandini.it', 10000);

INSERT INTO OpereAcquistate(EmailUtente, IDOpera) VALUES('nicholas.magi.stud@ispascalcomandini.it', 7);
INSERT INTO OpereAcquistate(EmailUtente, IDOpera) VALUES('nicholas.magi.stud@ispascalcomandini.it', 8);
INSERT INTO OpereAcquistate(EmailUtente, IDOpera) VALUES('nicholas.magi.stud@ispascalcomandini.it', 9);
INSERT INTO OpereAcquistate(EmailUtente, IDOpera) VALUES('riccardo.barducci.stud@ispascalcomandini.it', 12);
-- End COMPITO PER GIOVEDÍ 09/02/2023
