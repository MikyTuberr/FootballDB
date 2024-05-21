USE FDB;
GO

SELECT * FROM Pozycja WHERE ID_pozycji = 3;
SELECT * FROM Zawodnik WHERE ID_pozycji = 3;
SELECT * FROM Stanowisko WHERE ID_stanowiska = 1;
SELECT * FROM Trener WHERE ID_stanowiska = 1;

UPDATE Pozycja 
SET
	ID_pozycji = 44
WHERE ID_pozycji = 3;

UPDATE Stanowisko
SET 
	ID_stanowiska = 22
WHERE ID_stanowiska = 1;

SELECT * FROM Pozycja WHERE ID_pozycji = 44;
SELECT * FROM Zawodnik WHERE ID_pozycji = 44;
SELECT * FROM Stanowisko WHERE ID_stanowiska = 22;
SELECT * FROM Trener WHERE ID_stanowiska = 22;