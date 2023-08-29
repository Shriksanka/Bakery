-- BEFORE INSERT dla tabeli "Klient". Trigger ten będzie sprawdzał, czy numer telefonu klienta jest unikalny przed dodaniem nowego klienta
CREATE OR REPLACE TRIGGER Trigger_Klient_Before_Insert
BEFORE INSERT ON Klient
FOR EACH ROW
DECLARE
    PhoneExists NUMBER;
BEGIN
    SELECT COUNT(*) INTO PhoneExists
    FROM Klient
    WHERE Numer_telefonu = :NEW.Numer_telefonu;

    IF PhoneExists > 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Klient o podanym numerze telefonu już istnieje.');
    END IF;
END;

-- 1 BEFORE INSERT
INSERT INTO Klient (ID, Imie, Nazwisko, Adres, Numer_telefonu)
VALUES (5, 'Jan', 'Kowalski', 'ul. Przykładowa 123', '+483456789');

-- Trigger BEFORE UPDATE dla tabeli "Produkt" - Sprawdzanie, czy nowa cena produktu nie jest niższa od dotychczasowej
CREATE OR REPLACE TRIGGER Trigger_Produkt_Before_Update
BEFORE UPDATE ON Produkt
FOR EACH ROW
BEGIN
    IF :NEW.Cena < :OLD.Cena THEN
        RAISE_APPLICATION_ERROR(-20002, 'Nowa cena nie może być niższa od dotychczasowej.');
    END IF;
END;

-- 2 BEFORE UPDATE
UPDATE Produkt
SET Cena = 2.99
WHERE ID = 1;

-- Trigger AFTER DELETE dla tabeli "Zamowienie" - Wyswietlanie informacji o usunietym zamowieniu
CREATE OR REPLACE TRIGGER Trigger_Zamowienie_After_Delete
AFTER DELETE ON Zamowienie
FOR EACH ROW
BEGIN

    DELETE FROM Zamowienie_Produktow
    WHERE Zamowienie_ID = :OLD.ID;

    DBMS_OUTPUT.PUT_LINE('Usunięto zamówienie o ID ' || :OLD.ID);
    DBMS_OUTPUT.PUT_LINE('Data zamówienia: ' || TO_CHAR(:OLD.Data_zamowienia, 'YYYY-MM-DD'));
    DBMS_OUTPUT.PUT_LINE('Klient ID: ' || :OLD.Klient_ID);
    DBMS_OUTPUT.PUT_LINE('Status: ' || :OLD.Status_ID);
END;

-- 3 AFTER DELETE
DELETE FROM Zamowienie
WHERE ID = 1;


-- Trigger AFTER INSERT dla tabeli "Skladniki" - Aktualizacja tabeli "Produkt_Skladniki" po dodaniu nowego składnika
CREATE OR REPLACE TRIGGER Trigger_o_najwazniejszym_produkcie
AFTER INSERT ON Skladniki
FOR EACH ROW
BEGIN
    INSERT INTO Produkt_Skladniki (Produkt_ID, Skladniki_ID)
    SELECT ID, :NEW.ID
    FROM Produkt;
END;

-- 4 AFTER INSERT
INSERT INTO Skladniki (ID, Nazwa)
VALUES (6, 'Mleko');

