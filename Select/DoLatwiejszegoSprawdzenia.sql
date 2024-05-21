USE FDB
GO

-- Redakcja chce napisa� artyku� na temat �rednich wynagrodze� pi�karzy. 
-- Przygotuj zestawienie �rednich wynagrodze� pi�karzy oraz 
-- r�nicy wynagrodze� pi�karzy od �redniej.
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



-- Redakcja chce wyda� artyku� na temat sredniej liczby 
-- goli w sezonie Y, strzelonych przez pi�karza X.
-- Sporz�d� zestawienie �redniej liczby goli strzelanych przez pi�karza X,
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


-- Pewien dziennikarz sportowy przeprowadza badania dotycz�ce najlepszych pi�karzy 
-- bie��cego sezonu. Potrzebuj� on nazwiska najlepszych zawodnik�w z ka�dej 
-- pozycji. Podaj imiona i nazwiska zawodnik�w, kt�rzy ma najwi�cej zdobytych goli
-- oraz asyst. Kwestionariusz powinien zawiera� po jednym zawodniku z ka�dej 
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


--Redakcja zamierza stworzy� zestawienie graczy, kt�rym ko�czy si� kontrakt w 
--bie��cym roku. Sporz�d� zestawienie pi�karzy, kt�rzy ko�cz� si� w 
--tym roku kontrakty. Zestawienie powinno zawiera� imiona i nazwiska zawodnik�w, 
--nazw� klubu, w kt�rym pracuj� oraz ich wynagrodzenie. Dane musz� by� posortowane 
--malej�co ze wzgl�du na wynagrodzenie pracownika
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


-- Redakcja chce przygotowa� ranking top 10 najlepiej zarabiaj�cych zawodnik�w.
-- Sporz�d� zestawienie 10 najlepiej zarabiaj�cych zawodnik�w (malej�co).
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


--Dziennikarz dostaje zlecenie napisania artyku�u o statystykach pi�karza XYZ. 
--Sporz�d� zestawieni ostatnich statystyk, zawodnika XYZ.
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

-- Redakcja pisze artyku� na temat sezonu o numerze edycji 70.
-- Potrzebuj� informacji o dacie pierwszego oraz ostatniego meczu, 
-- oraz o ilo�ci rozegranych mecz�w w ci�gu ca�ego sezonu.
-- Przygotuj zestawienie ilo�ci mecz�w w sezonie numer 70.
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


