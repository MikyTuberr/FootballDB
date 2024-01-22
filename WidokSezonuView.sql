USE FDB
GO

CREATE VIEW WidokSezonu AS
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


