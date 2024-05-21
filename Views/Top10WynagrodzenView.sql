USE FDB
GO

CREATE VIEW Top10Wynagrodzen AS
SELECT TOP 10
    Pozycja.Pozycja,
    Czlonek_Klubu.Imie,
    Czlonek_Klubu.Nazwisko,
    Kontrakt_Zawodnika.Wynagrodzenie,
    PozycjeSrednie.Srednie_wynagrodzenie_na_tej_pozycji,
    (Kontrakt_Zawodnika.Wynagrodzenie - PozycjeSrednie.Srednie_wynagrodzenie_na_tej_pozycji) AS Roznica_od_sredniej
FROM
    Zawodnik
JOIN
    Czlonek_Klubu ON Zawodnik.ID_czlonka = Czlonek_Klubu.ID_czlonka
JOIN
    Kontrakt_Zawodnika ON Zawodnik.ID_czlonka = Kontrakt_Zawodnika.ID_czlonka
JOIN
    Pozycja ON Zawodnik.ID_pozycji = Pozycja.ID_pozycji
JOIN
    (
        SELECT
            Pozycja.ID_pozycji,
            AVG(Kontrakt_Zawodnika.Wynagrodzenie) AS Srednie_wynagrodzenie_na_tej_pozycji
        FROM
            Zawodnik
        JOIN
            Pozycja ON Zawodnik.ID_pozycji = Pozycja.ID_pozycji
        JOIN
            Kontrakt_Zawodnika ON Zawodnik.ID_czlonka = Kontrakt_Zawodnika.ID_czlonka
        GROUP BY
            Pozycja.ID_pozycji
    ) AS PozycjeSrednie ON Pozycja.ID_pozycji = PozycjeSrednie.ID_pozycji
