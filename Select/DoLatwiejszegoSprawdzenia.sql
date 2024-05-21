USE FDB
GO

-- Redakcja chce napisaæ artyku³ na temat œrednich wynagrodzeñ pi³karzy. 
-- Przygotuj zestawienie œrednich wynagrodzeñ pi³karzy oraz 
-- ró¿nicy wynagrodzeñ pi³karzy od œredniej.
-- 6
SELECT
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
ORDER BY
    Roznica_od_sredniej DESC;



-- Redakcja chce wydaæ artyku³ na temat sredniej liczby 
-- goli w sezonie Y, strzelonych przez pi³karza X.
-- Sporz¹dŸ zestawienie œredniej liczby goli strzelanych przez pi³karza X,
-- na mecz w sezonie Y.
-- 5
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
ORDER BY
    Srednia_goli_w_sezonie DESC;


-- Pewien dziennikarz sportowy przeprowadza badania dotycz¹ce najlepszych pi³karzy 
-- bie¿¹cego sezonu. Potrzebujê on nazwiska najlepszych zawodników z ka¿dej 
-- pozycji. Podaj imiona i nazwiska zawodników, którzy ma najwiêcej zdobytych goli
-- oraz asyst. Kwestionariusz powinien zawieraæ po jednym zawodniku z ka¿dej 
-- pozycji (punkty = 2*gole + asysty).
-- 5/6
;WITH ZestawienieZawodnikow AS (
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
ORDER BY
    Punkty DESC;


--Redakcja zamierza stworzyæ zestawienie graczy, którym koñczy siê kontrakt w 
--bie¿¹cym roku. Sporz¹dŸ zestawienie pi³karzy, którzy koñcz¹ siê w 
--tym roku kontrakty. Zestawienie powinno zawieraæ imiona i nazwiska zawodników, 
--nazwê klubu, w którym pracuj¹ oraz ich wynagrodzenie. Dane musz¹ byæ posortowane 
--malej¹co ze wzglêdu na wynagrodzenie pracownika
-- 3
SELECT
    Czlonek_Klubu.Imie,
    Czlonek_Klubu.Nazwisko,
    Kontrakt_Zawodnika.Wynagrodzenie,
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
ORDER BY
    Kontrakt_Zawodnika.Wynagrodzenie DESC;


-- Redakcja chce przygotowaæ ranking top 10 najlepiej zarabiaj¹cych zawodników.
-- Sporz¹dŸ zestawienie 10 najlepiej zarabiaj¹cych zawodników (malej¹co).
-- 6
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
ORDER BY
    Wynagrodzenie DESC


--Dziennikarz dostaje zlecenie napisania artyku³u o statystykach pi³karza XYZ. 
--Sporz¹dŸ zestawieni ostatnich statystyk, zawodnika XYZ.
-- 3
SELECT TOP 10
    Mecz.Data_meczu,
    Mecz.Wynik,
    Statystyki_Zawodnika.Liczba_goli,
    Statystyki_Zawodnika.Liczba_asyst
FROM
    Statystyki_Zawodnika
JOIN
    Mecz ON Statystyki_Zawodnika.ID_meczu = Mecz.ID_meczu
WHERE
    Statystyki_Zawodnika.ID_czlonka = 16  
ORDER BY
    Mecz.Data_meczu DESC;

-- Redakcja pisze artyku³ na temat sezonu o numerze edycji 70.
-- Potrzebuj¹ informacji o dacie pierwszego oraz ostatniego meczu, 
-- oraz o iloœci rozegranych meczów w ci¹gu ca³ego sezonu.
-- Przygotuj zestawienie iloœci meczów w sezonie numer 70.
--4
SELECT
    Sezon.Numer_edycji,
    COUNT(Mecz.ID_meczu) AS Liczba_meczy,
    MIN(Mecz.Data_meczu) AS Data_pierwszego_meczu,
    MAX(Mecz.Data_meczu) AS Data_ostatniego_meczu
FROM
    Mecz
JOIN
    Sezon ON Mecz.Numer_edycji = Sezon.Numer_edycji
WHERE
    Sezon.Numer_edycji = 70
GROUP BY
    Sezon.Numer_edycji;


