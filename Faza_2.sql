-- Zapytania łączące przynajmniej dwie tabele poprzez JOIN
-- Łączenie tabeli "Zamowienie" z tabelą "Klient" po ID klienta
SELECT *
FROM Zamowienie
JOIN Klient ON Zamowienie.Klient_ID = Klient.ID;
-- Łączenie tabeli "Sklep" z tabelą "Wlasciciel" po ID właściciela
SELECT *
FROM Sklep
JOIN Wlasciciel ON Sklep.Wlasciciel_ID = Wlasciciel.ID;

-- Zapytania z funkcjami agregującymi
-- Suma cen wszystkich produktów
SELECT SUM(Cena) AS Suma_cen_produktow
FROM Produkt;

-- Średnia cena produktów w sklepie o nazwie "Restauracja Smakosz"
SELECT AVG(Produkt.Cena) AS Srednia_cena
FROM Produkt
JOIN Sklep_Produkt ON Produkt.ID = Sklep_Produkt.Produkt_ID
JOIN Sklep ON Sklep.ID = Sklep_Produkt.Sklep_ID
WHERE Sklep.Nazwa = 'Restauracja Smakosz';


-- Zapytania z podzapytaniem
-- Wyświetlanie klientów, którzy złożyli zamówienia
SELECT Imie, Nazwisko
FROM Klient
WHERE ID IN (SELECT Klient_ID FROM Zamowienie);

-- Wyświetlanie produktów, które są dostępne w sklepie "Sklep ID = 1"
SELECT Nazwa
FROM Produkt
WHERE ID IN (SELECT Produkt_ID FROM Sklep_Produkt WHERE Sklep_ID = 1);

-- Wyświetlanie pracowników, którzy pracują w sklepach zarządzanych przez "Jan Kowalski"
SELECT Imie, Nazwisko
FROM Pracownik
WHERE Sklep_ID IN (SELECT ID FROM Sklep WHERE Wlasciciel_ID = (SELECT ID FROM Wlasciciel WHERE Imie = 'Jan' AND Nazwisko = 'Kowalski'));


-- Zapytania z podzapytaniem skorelowanym
-- Wyświetlanie wszystkich klientów i ich liczby zamowien
SELECT Imie, Nazwisko, (
    SELECT COUNT(ID)
    FROM Zamowienie
    WHERE Zamowienie.Klient_ID = Klient.ID
    ) AS Liczba_Zamowien
FROM Klient
ORDER BY Liczba_Zamowien DESC;
