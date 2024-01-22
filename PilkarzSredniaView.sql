CREATE VIEW PilkarzSrednia AS
SELECT
	Czlonek_Klubu.ID_czlonka,
	Uczestnictwo_w_Sezonie.ID_Nazwy_klubu,
    Czlonek_Klubu.Imie,
    Czlonek_Klubu.Nazwisko,
	Pozycja.Pozycja,
    Uczestnictwo_w_Sezonie.Numer_edycji,
    AVG(Statystyki_Zawodnika.Liczba_goli) AS Srednia_goli_w_sezonie
FROM
    Zawodnik
JOIN
    Czlonek_Klubu ON Zawodnik.ID_czlonka = Czlonek_Klubu.ID_czlonka
JOIN
    Kontrakt_Zawodnika ON Zawodnik.ID_czlonka = Kontrakt_Zawodnika.ID_czlonka
JOIN
    Pozycja ON Zawodnik.ID_pozycji = Pozycja.ID_pozycji
JOIN
    Uczestnictwo_w_Sezonie ON Kontrakt_Zawodnika.ID_Nazwy_klubu = Uczestnictwo_w_Sezonie.ID_Nazwy_klubu
JOIN
    Statystyki_Zawodnika ON Zawodnik.ID_czlonka = Statystyki_Zawodnika.ID_czlonka
JOIN
    Mecz ON Statystyki_Zawodnika.ID_meczu = Mecz.ID_meczu
    AND Uczestnictwo_w_Sezonie.Numer_edycji = Mecz.Numer_edycji
WHERE
    Zawodnik.ID_czlonka = 16
GROUP BY
	Czlonek_Klubu.ID_czlonka,
	Uczestnictwo_w_Sezonie.ID_Nazwy_klubu,
    Czlonek_Klubu.Imie,
    Czlonek_Klubu.Nazwisko,
	Pozycja.Pozycja,
    Uczestnictwo_w_Sezonie.Numer_edycji
