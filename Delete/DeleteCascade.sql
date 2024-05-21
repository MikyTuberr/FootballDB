USE FDB;
GO

SELECT * FROM Nazwa_Klubu WHERE ID_nazwy_klubu = 1;
SELECT * FROM Klub_Sportowy WHERE ID_nazwy_klubu = 1;;
SELECT * FROM Uczestnictwo_w_Sezonie WHERE ID_nazwy_klubu = 1;
SELECT * FROM Kontrakt_Trenera WHERE ID_nazwy_klubu = 1;
SELECT * FROM Kontrakt_Zawodnika WHERE ID_nazwy_klubu = 1;
SELECT * FROM Kadencja_Prezesa WHERE ID_nazwy_klubu = 1;
SELECT * FROM Mecz WHERE ID_gospodarza = 1;
SELECT * FROM Mecz WHERE ID_gosca = 1;
SELECT * FROM Pozycja WHERE ID_pozycji = 4;
SELECT * FROM Zawodnik WHERE ID_pozycji = 4;
SELECT * FROM Stanowisko WHERE ID_stanowiska = 7;
SELECT * FROM Trener WHERE ID_stanowiska = 7;

DELETE 
FROM 
	Nazwa_Klubu
WHERE ID_nazwy_klubu = 1;

DELETE
FROM
	Pozycja 
WHERE ID_pozycji = 4;

DELETE
FROM
	Stanowisko
WHERE ID_stanowiska = 7;

SELECT * FROM Nazwa_Klubu WHERE ID_nazwy_klubu = 1;
SELECT * FROM Klub_Sportowy WHERE ID_nazwy_klubu = 1;
SELECT * FROM Uczestnictwo_w_Sezonie WHERE ID_nazwy_klubu = 1;
SELECT * FROM Kontrakt_Trenera WHERE ID_nazwy_klubu = 1;
SELECT * FROM Kontrakt_Zawodnika WHERE ID_nazwy_klubu = 1;
SELECT * FROM Kadencja_Prezesa WHERE ID_nazwy_klubu = 1;
SELECT * FROM Mecz WHERE ID_gospodarza = 1;
SELECT * FROM Mecz WHERE ID_gosca = 1;
SELECT * FROM Pozycja WHERE ID_pozycji = 4;
SELECT * FROM Zawodnik WHERE ID_pozycji = 4;
SELECT * FROM Stanowisko WHERE ID_stanowiska = 7;
SELECT * FROM Trener WHERE ID_stanowiska = 7;
