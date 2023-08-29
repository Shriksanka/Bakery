-- tables
-- Table: Klient
CREATE TABLE Klient (
    ID number(*)  NOT NULL,
    Imie varchar2(255)  NOT NULL,
    Nazwisko varchar2(255)  NOT NULL,
    Adres varchar2(255)  NOT NULL,
    Numer_telefonu varchar2(255)  NOT NULL,
    CONSTRAINT Klient_pk PRIMARY KEY (ID)
) ;

-- Table: Menu
CREATE TABLE Menu (
    ID number(*)  NOT NULL,
    Nazwa varchar2(255)  NOT NULL,
    Opis varchar2(255)  NOT NULL,
    CONSTRAINT Menu_pk PRIMARY KEY (ID)
) ;

-- Table: Menu_Produkt
CREATE TABLE Menu_Produkt (
    Menu_ID number(*)  NOT NULL,
    Produkt_ID number(*)  NOT NULL,
    CONSTRAINT Menu_Produkt_pk PRIMARY KEY (Menu_ID,Produkt_ID)
) ;

-- Table: Pracownik
CREATE TABLE Pracownik (
    ID number(*)  NOT NULL,
    Imie varchar2(255)  NOT NULL,
    Nazwisko varchar2(255)  NOT NULL,
    Stanowisko_ID number(*)  NOT NULL,
    Sklep_ID number(*)  NOT NULL,
    PESEL varchar2(11)  NOT NULL,
    CONSTRAINT Pracownik_pk PRIMARY KEY (ID)
) ;

-- Table: Produkt
CREATE TABLE Produkt (
    ID number(*)  NOT NULL,
    Nazwa varchar2(255)  NOT NULL,
    Cena number(10,2)  NOT NULL,
    CONSTRAINT Produkt_pk PRIMARY KEY (ID)
) ;

-- Table: Produkt_Skladniki
CREATE TABLE Produkt_Skladniki (
    Produkt_ID number(*)  NOT NULL,
    Skladniki_ID number(*)  NOT NULL,
    CONSTRAINT Produkt_Skladniki_pk PRIMARY KEY (Produkt_ID,Skladniki_ID)
) ;

-- Table: Skladniki
CREATE TABLE Skladniki (
    ID number(*)  NOT NULL,
    Nazwa varchar2(255)  NOT NULL,
    CONSTRAINT Skladniki_pk PRIMARY KEY (ID)
) ;

-- Table: Sklep
CREATE TABLE Sklep (
    ID number(*)  NOT NULL,
    Nazwa varchar2(255)  NOT NULL,
    Adres varchar2(255)  NOT NULL,
    Numer_telefonu varchar2(255)  NOT NULL,
    Wlasciciel_ID number(*)  NOT NULL,
    Menu_ID number(*)  NOT NULL,
    CONSTRAINT Sklep_pk PRIMARY KEY (ID)
) ;

-- Table: Sklep_Produkt
CREATE TABLE Sklep_Produkt (
    Sklep_ID number(*)  NOT NULL,
    Produkt_ID number(*)  NOT NULL,
    Ilosc_pr number(*)  NOT NULL,
    Dostepnosc integer  NOT NULL,
    CONSTRAINT Sklep_Produkt_pk PRIMARY KEY (Sklep_ID,Produkt_ID)
) ;

-- Table: Stanowisko
CREATE TABLE Stanowisko (
    ID number(*)  NOT NULL,
    Pensja varchar2(255)  NOT NULL,
    Opis varchar2(255)  NOT NULL,
    CONSTRAINT Stanowisko_pk PRIMARY KEY (ID)
) ;

-- Table: Status
CREATE TABLE Status (
    ID number(*)  NOT NULL,
    Opis varchar2(255)  NOT NULL,
    CONSTRAINT Status_pk PRIMARY KEY (ID)
) ;

-- Table: Wlasciciel
CREATE TABLE Wlasciciel (
    ID number(*)  NOT NULL,
    Imie varchar2(255)  NOT NULL,
    Nazwisko varchar2(255)  NOT NULL,
    Email varchar2(255)  NOT NULL,
    Numer_telefonu varchar2(255)  NOT NULL,
    PESEL varchar2(11) NOT NULL,
    CONSTRAINT Wlasciciel_pk PRIMARY KEY (ID)
) ;

-- Table: Zamowienie
CREATE TABLE Zamowienie (
    ID number(*)  NOT NULL,
    Data_zamowienia date  NOT NULL,
    Klient_ID number(*)  NOT NULL,
    Status_ID number(*)  NOT NULL,
    CONSTRAINT Zamowienie_pk PRIMARY KEY (ID)
) ;

-- Table: Zamowienie_Produktow
CREATE TABLE Zamowienie_Produktow (
    Produkt_ID number(*)  NOT NULL,
    Zamowienie_ID number(*)  NOT NULL,
    Ilosc_produktu varchar2(255)  NOT NULL,
    CONSTRAINT Zamowienie_Produktow_pk PRIMARY KEY (Produkt_ID,Zamowienie_ID)
) ;

-- foreign keys
-- Reference: Menu_Produkt_Menu (table: Menu_Produkt)
ALTER TABLE Menu_Produkt ADD CONSTRAINT Menu_Produkt_Menu
    FOREIGN KEY (Menu_ID)
    REFERENCES Menu (ID);

-- Reference: Menu_Produkt_Produkt (table: Menu_Produkt)
ALTER TABLE Menu_Produkt ADD CONSTRAINT Menu_Produkt_Produkt
    FOREIGN KEY (Produkt_ID)
    REFERENCES Produkt (ID);

-- Reference: Pracownik_Sklep (table: Pracownik)
ALTER TABLE Pracownik ADD CONSTRAINT Pracownik_Sklep
    FOREIGN KEY (Sklep_ID)
    REFERENCES Sklep (ID);

-- Reference: Pracownik_Stanowisko (table: Pracownik)
ALTER TABLE Pracownik ADD CONSTRAINT Pracownik_Stanowisko
    FOREIGN KEY (Stanowisko_ID)
    REFERENCES Stanowisko (ID);

-- Reference: Produkt_Skladniki_Produkt (table: Produkt_Skladniki)
ALTER TABLE Produkt_Skladniki ADD CONSTRAINT Produkt_Skladniki_Produkt
    FOREIGN KEY (Produkt_ID)
    REFERENCES Produkt (ID);

-- Reference: Produkt_Skladniki_Skladniki (table: Produkt_Skladniki)
ALTER TABLE Produkt_Skladniki ADD CONSTRAINT Produkt_Skladniki_Skladniki
    FOREIGN KEY (Skladniki_ID)
    REFERENCES Skladniki (ID);

-- Reference: Sklep_Menu (table: Sklep)
ALTER TABLE Sklep ADD CONSTRAINT Sklep_Menu
    FOREIGN KEY (Menu_ID)
    REFERENCES Menu (ID);

-- Reference: Sklep_Produkt_Produkt (table: Sklep_Produkt)
ALTER TABLE Sklep_Produkt ADD CONSTRAINT Sklep_Produkt_Produkt
    FOREIGN KEY (Produkt_ID)
    REFERENCES Produkt (ID);

-- Reference: Sklep_Produkt_Sklep (table: Sklep_Produkt)
ALTER TABLE Sklep_Produkt ADD CONSTRAINT Sklep_Produkt_Sklep
    FOREIGN KEY (Sklep_ID)
    REFERENCES Sklep (ID);

-- Reference: Sklep_Wlasciciel (table: Sklep)
ALTER TABLE Sklep ADD CONSTRAINT Sklep_Wlasciciel
    FOREIGN KEY (Wlasciciel_ID)
    REFERENCES Wlasciciel (ID);

-- Reference: Zamowienie_Klient (table: Zamowienie)
ALTER TABLE Zamowienie ADD CONSTRAINT Zamowienie_Klient
    FOREIGN KEY (Klient_ID)
    REFERENCES Klient (ID);

-- Reference: Zamowienie_Produktow_Produkt (table: Zamowienie_Produktow)
ALTER TABLE Zamowienie_Produktow ADD CONSTRAINT Zamowienie_Produktow_Produkt
    FOREIGN KEY (Produkt_ID)
    REFERENCES Produkt (ID);

-- Reference: Zamowienie_Produktow_Zamowienie (table: Zamowienie_Produktow)
ALTER TABLE Zamowienie_Produktow ADD CONSTRAINT Zamowienie_Produktow_Zamowienie
    FOREIGN KEY (Zamowienie_ID)
    REFERENCES Zamowienie (ID);

-- Reference: Zamowienie_Status (table: Zamowienie)
ALTER TABLE Zamowienie ADD CONSTRAINT Zamowienie_Status
    FOREIGN KEY (Status_ID)
    REFERENCES Status (ID);
