USE FDB
GO

SELECT * 
FROM SrednieWynagrodzenia
ORDER BY Roznica_od_sredniej DESC;

SELECT *
FROM PilkarzSrednia
ORDER BY Srednia_goli_w_sezonie DESC;

SELECT *
FROM NajlepszyPilkarz
ORDER BY Punkty DESC;

SELECT *
FROM KoniecKontraktu
ORDER BY Wynagrodzenie DESC;

SELECT *
FROM Top10Wynagrodzen
ORDER BY Wynagrodzenie DESC;

SELECT *
FROM StatystykiPilkarza
ORDER BY Data_meczu DESC;

SELECT *
FROM WidokSezonu
ORDER BY Numer_edycji DESC;
