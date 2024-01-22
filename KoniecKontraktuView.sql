USE FDB
GO

CREATE VIEW KoniecKontraktu AS
SELECT
    Czlonek_Klubu.Imie,
    Czlonek_Klubu.Nazwisko,
    Kontrakt_Zawodnika.Wynagrodzenie AS Wynagrodzenie,
    Nazwa_klubu.Nazwa_klubu,
	Kontrakt_Zawodnika.Data_rozpoczecia,
	Kontrakt_Zawodnika.Data_zakonczenia
FROM
    Zawodnik
JOIN
    Czlonek_Klubu ON Zawodnik.ID_czlonka = Czlonek_Klubu.ID_czlonka
JOIN
    Kontrakt_Zawodnika ON Zawodnik.ID_czlonka = Kontrakt_Zawodnika.ID_czlonka
JOIN
    Nazwa_klubu ON Kontrakt_Zawodnika.ID_nazwy_klubu = Nazwa_klubu.ID_nazwy_klubu
WHERE
    YEAR(Kontrakt_Zawodnika.Data_zakonczenia) = YEAR(GETDATE())
