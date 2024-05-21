USE FDB
GO

CREATE VIEW NajlepszyPilkarz AS
WITH ZestawienieZawodnikow AS (
    SELECT
        Pozycja.Pozycja,
        Czlonek_Klubu.Imie,
        Czlonek_Klubu.Nazwisko,
        MAX(Statystyki_Zawodnika.Liczba_goli) AS MaxLiczbaGoli,
        MAX(Statystyki_Zawodnika.Liczba_asyst) AS MaxLiczbaAsyst
    FROM
        Zawodnik
    JOIN
        Czlonek_Klubu ON Zawodnik.ID_czlonka = Czlonek_Klubu.ID_czlonka
    JOIN
        Pozycja ON Zawodnik.ID_pozycji = Pozycja.ID_pozycji
    JOIN
        Statystyki_Zawodnika ON Zawodnik.ID_czlonka = Statystyki_Zawodnika.ID_czlonka
    GROUP BY
        Pozycja.Pozycja,
        Czlonek_Klubu.Imie,
        Czlonek_Klubu.Nazwisko
)
SELECT
    Pozycja,
    Imie,
    Nazwisko,
    2 * MaxLiczbaGoli + MaxLiczbaAsyst AS Punkty
FROM
    ZestawienieZawodnikow
