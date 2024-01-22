USE FDB
GO

CREATE VIEW StatystykiPilkarza AS
SELECT TOP 10
    Mecz.Data_meczu AS Data_meczu,
    Mecz.Wynik,
    Statystyki_Zawodnika.Liczba_goli,
    Statystyki_Zawodnika.Liczba_asyst
FROM
    Statystyki_Zawodnika
JOIN
    Mecz ON Statystyki_Zawodnika.ID_meczu = Mecz.ID_meczu
WHERE
    Statystyki_Zawodnika.ID_czlonka = 16  
