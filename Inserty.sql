INSERT INTO Menu (ID, Nazwa, Opis)
VALUES (1, 'Śniadanie', 'Zestaw śniadaniowy');

INSERT INTO Menu (ID, Nazwa, Opis)
VALUES (2, 'Obiad', 'Danie główne');

INSERT INTO Menu (ID, Nazwa, Opis)
VALUES (3, 'Kolacja', 'Lekkie danie');

INSERT INTO Menu (ID, Nazwa, Opis)
VALUES (4, 'Desery', 'Wspaniałe słodkości');

--------------------------------------

INSERT INTO Wlasciciel (ID, Imie, Nazwisko, Email, Numer_telefonu, PESEL)
VALUES (1, 'Jan', 'Kowalski', 'jan@example.com', '+483456789', '98765675421');

INSERT INTO Wlasciciel (ID, Imie, Nazwisko, Email, Numer_telefonu, PESEL)
VALUES (2, 'Anna', 'Nowak', 'anna@example.com', '+487654321', '98789654210');

INSERT INTO Wlasciciel (ID, Imie, Nazwisko, Email, Numer_telefonu, PESEL)
VALUES (3, 'Marcin', 'Wójcik', 'marcin@example.com', '+485666777', '67652438719');

INSERT INTO Wlasciciel (ID, Imie, Nazwisko, Email, Numer_telefonu, PESEL)
VALUES (4, 'Katarzyna', 'Lis', 'katarzyna@example.com', '+481222333', '12342345678');

--------------------------------------

INSERT INTO Sklep (ID, Nazwa, Adres, Numer_telefonu, Wlasciciel_ID, Menu_ID)
VALUES (1, 'Sklep spożywczy', 'ul. Handlowa 1', '111222333', 1, 1);

INSERT INTO Sklep (ID, Nazwa, Adres, Numer_telefonu, Wlasciciel_ID, Menu_ID)
VALUES (2, 'Restauracja Smakosz', 'ul. Gastronomiczna 2', '444555666', 2, 2);

INSERT INTO Sklep (ID, Nazwa, Adres, Numer_telefonu, Wlasciciel_ID, Menu_ID)
VALUES (3, 'Pizzeria Bella', 'ul. Włoska 3', '777888999', 3, 2);

INSERT INTO Sklep (ID, Nazwa, Adres, Numer_telefonu, Wlasciciel_ID, Menu_ID)
VALUES (4, 'Cukiernia Słodki Raj', 'ul. Cukiernicza 4', '123456789', 4, 4);

--------------------------------------

INSERT INTO Stanowisko (ID, Pensja, Opis)
VALUES (1, '3000', 'Sprzedawca');

INSERT INTO Stanowisko (ID, Pensja, Opis)
VALUES (2, '4000', 'Kucharz');

INSERT INTO Stanowisko (ID, Pensja, Opis)
VALUES (3, '5000', 'Szef kuchni');

--------------------------------------

INSERT INTO Pracownik (ID, Imie, Nazwisko, Stanowisko_ID, Sklep_ID, PESEL)
VALUES (1, 'Adam', 'Nowak', 1, 1, '66654251217');

INSERT INTO Pracownik (ID, Imie, Nazwisko, Stanowisko_ID, Sklep_ID, PESEL)
VALUES (2, 'Ewa', 'Kowalska', 2, 2, '87890025142');

INSERT INTO Pracownik (ID, Imie, Nazwisko, Stanowisko_ID, Sklep_ID, PESEL)
VALUES (3, 'Tomasz', 'Wójcik', 2, 3, '87656754213');

INSERT INTO Pracownik (ID, Imie, Nazwisko, Stanowisko_ID, Sklep_ID, PESEL)
VALUES (4, 'Magda', 'Lis', 3, 4, '87652222152');

--------------------------------------

INSERT INTO Produkt (ID, Nazwa, Cena)
VALUES (1, 'Chleb', 3.50);

INSERT INTO Produkt (ID, Nazwa, Cena)
VALUES (2, 'Bulka z kremem', 12.99);

INSERT INTO Produkt (ID, Nazwa, Cena)
VALUES (3, 'Pizza Margherita', 15.00);

INSERT INTO Produkt (ID, Nazwa, Cena)
VALUES (4, 'Ciasto czekoladowe', 8.50);

--------------------------------------

INSERT INTO Skladniki (ID, Nazwa)
VALUES (1, 'Mąka');

INSERT INTO Skladniki (ID, Nazwa)
VALUES (2, 'Sól');

INSERT INTO Skladniki (ID, Nazwa)
VALUES (3, 'Pomidor');

INSERT INTO Skladniki (ID, Nazwa)
VALUES (4, 'Ser');

INSERT INTO Skladniki (ID, Nazwa)
VALUES  (5, 'Czekolada');

--------------------------------------

INSERT INTO Produkt_Skladniki (Produkt_ID, Skladniki_ID)
VALUES (1, 1);

INSERT INTO Produkt_Skladniki (Produkt_ID, Skladniki_ID)
VALUES (2, 2);

INSERT INTO Produkt_Skladniki (Produkt_ID, Skladniki_ID)
VALUES (3, 3);

INSERT INTO Produkt_Skladniki (Produkt_ID, Skladniki_ID)
VALUES (3, 4);

--------------------------------------

INSERT INTO Klient (ID, Imie, Nazwisko, Adres, Numer_telefonu)
VALUES (1, 'Jan', 'Kowalski', 'ul. Kwiatowa 1', '+483456789');

INSERT INTO Klient (ID, Imie, Nazwisko, Adres, Numer_telefonu)
VALUES (2, 'Anna', 'Nowak', 'ul. Ogrodowa 2', '+487654321');

INSERT INTO Klient (ID, Imie, Nazwisko, Adres, Numer_telefonu)
VALUES (3, 'Marcin', 'Wójcik', 'ul. Słoneczna 3', '+485666777');

INSERT INTO Klient (ID, Imie, Nazwisko, Adres, Numer_telefonu)
VALUES (4, 'Katarzyna', 'Lis', 'ul. Lipowa 4', '+481222333');

--------------------------------------

INSERT INTO Status (ID, Opis)
VALUES (1, 'Zrealizowano');

INSERT INTO Status (ID, Opis)
VALUES (2, 'W trakcie');

INSERT INTO Status (ID, Opis)
VALUES (3, 'Anuluwano');

--------------------------------------

INSERT INTO Zamowienie (ID, Data_zamowienia, Klient_ID, Status_ID)
VALUES (1, TO_DATE('2023-06-10', 'YYYY-MM-DD'), 1, 1);

INSERT INTO Zamowienie (ID, Data_zamowienia, Klient_ID, Status_ID)
VALUES (2, TO_DATE('2023-06-11', 'YYYY-MM-DD'), 2, 2);

INSERT INTO Zamowienie (ID, Data_zamowienia, Klient_ID, Status_ID)
VALUES (3, TO_DATE('2023-06-12', 'YYYY-MM-DD'), 1, 3);

INSERT INTO Zamowienie (ID, Data_zamowienia, Klient_ID, Status_ID)
VALUES (4, TO_DATE('2023-06-13', 'YYYY-MM-DD'), 3, 2);

--------------------------------------

INSERT INTO Zamowienie_Produktow (Produkt_ID, Zamowienie_ID, Ilosc_produktu)
VALUES (1, 1, '20');

INSERT INTO Zamowienie_Produktow (Produkt_ID, Zamowienie_ID, Ilosc_produktu)
VALUES (2, 2, '10');

INSERT INTO Zamowienie_Produktow (Produkt_ID, Zamowienie_ID, Ilosc_produktu)
VALUES (3, 3, '30');

INSERT INTO Zamowienie_Produktow (Produkt_ID, Zamowienie_ID, Ilosc_produktu)
VALUES (4, 4, '20');

--------------------------------------

INSERT INTO Menu_Produkt (Menu_ID, Produkt_ID)
VALUES (1, 1);

INSERT INTO Menu_Produkt (Menu_ID, Produkt_ID)
VALUES (2, 2);

INSERT INTO Menu_Produkt (Menu_ID, Produkt_ID)
VALUES (2, 3);

INSERT INTO Menu_Produkt (Menu_ID, Produkt_ID)
VALUES (4, 4);

--------------------------------------

INSERT INTO Sklep_Produkt (Sklep_ID, Produkt_ID, Ilosc_pr, Dostepnosc)
VALUES (1, 1, '50', 1);

INSERT INTO Sklep_Produkt (Sklep_ID, Produkt_ID, Ilosc_pr, Dostepnosc)
VALUES (2, 2, '0', 0);

INSERT INTO Sklep_Produkt (Sklep_ID, Produkt_ID, Ilosc_pr, Dostepnosc)
VALUES (3, 3, '25', 1);

INSERT INTO Sklep_Produkt (Sklep_ID, Produkt_ID, Ilosc_pr, Dostepnosc)
VALUES (4, 4, '22', 1);
