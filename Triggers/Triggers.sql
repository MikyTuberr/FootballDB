USE FDB;
GO

-- Trigger do rêcznego obs³ugiwania aktualizacji kaskadowej rekordow tabel powiazanych z Nazwy_Klubow
/*CREATE TRIGGER TR_Update_Nazwy_Klubow_Update
ON Nazwy_Klubow
INSTEAD OF UPDATE 
AS
BEGIN
    SET NOCOUNT ON;

	 -- SprawdŸ, czy ID_nazwy_klubu zosta³o zaktualizowane
    IF UPDATE(ID_nazwy_klubu)
    BEGIN

    -- Aktualizacja tabel powi¹zanych
    UPDATE KS
    SET 
		KS.ID_nazwy_klubu = I.ID_nazwy_klubu
    FROM Klub_Sportowy KS
	 INNER JOIN 
		INSERTED I ON KS.ID_nazwy_klubu = I.ID_nazwy_klubu;

    UPDATE Uczestnictwo_w_Sezonie
    SET ID_nazwy_klubu = inserted.ID_nazwy_klubu
    FROM Uczestnictwo_w_Sezonie
    INNER JOIN inserted ON Uczestnictwo_w_Sezonie.ID_nazwy_klubu = inserted.ID_nazwy_klubu;

    UPDATE Kontrakt_Trenera
    SET ID_nazwy_klubu = inserted.ID_nazwy_klubu
    FROM Kontrakt_Trenera
    INNER JOIN inserted ON Kontrakt_Trenera.ID_nazwy_klubu = inserted.ID_nazwy_klubu;

	UPDATE Kontrakt_Zawodnika
    SET ID_nazwy_klubu = inserted.ID_nazwy_klubu
    FROM Kontrakt_Zawodnika
    INNER JOIN inserted ON Kontrakt_Zawodnika.ID_nazwy_klubu = inserted.ID_nazwy_klubu;

	UPDATE Kadencja_Prezesa
    SET ID_nazwy_klubu = inserted.ID_nazwy_klubu
    FROM Kadencja_Prezesa
    INNER JOIN inserted ON Kadencja_Prezesa.ID_nazwy_klubu = inserted.ID_nazwy_klubu;

    UPDATE Mecz
    SET 
        ID_Gosca = inserted.ID_nazwy_klubu
    FROM 
        Mecz
    INNER JOIN 
        inserted ON Mecz.ID_Gosca = inserted.ID_nazwy_klubu;

    UPDATE Mecz
    SET 
        ID_Gospodarza = inserted.ID_nazwy_klubu
    FROM 
        Mecz
    INNER JOIN 
        inserted ON Mecz.ID_Gospodarza = inserted.ID_nazwy_klubu;

	UPDATE Nazwy_Klubow
    SET 
		ID_nazwy_klubu = inserted.ID_nazwy_klubu
    FROM 
		Nazwy_Klubow
	INNER JOIN 
		inserted ON Nazwy_Klubow.ID_nazwy_klubu = inserted.ID_nazwy_klubu;

	END;
END;
GO*/


-- Trigger do recznego obslugiwania usuwania kaskadowego rekordow tabel powiazanych z Nazwy_Klubow
CREATE TRIGGER Trigger_Nazwa_Klubu_Delete
ON Nazwa_Klubu 
INSTEAD OF DELETE
AS 
BEGIN
    SET NOCOUNT ON;

	 -- Usuwanie z tabel powiazanych z Nazwy_Klubow
    DELETE FROM Klub_Sportowy
    WHERE ID_nazwy_klubu IN (SELECT ID_nazwy_klubu FROM DELETED);

    DELETE FROM Uczestnictwo_w_Sezonie
    WHERE ID_nazwy_klubu IN (SELECT ID_nazwy_klubu FROM DELETED);

    DELETE FROM Kontrakt_Trenera
    WHERE ID_nazwy_klubu IN (SELECT ID_nazwy_klubu FROM DELETED);

	DELETE FROM Kontrakt_Zawodnika
	WHERE ID_nazwy_klubu IN (SELECT ID_nazwy_klubu FROM DELETED);

    DELETE FROM Kadencja_Prezesa
    WHERE ID_nazwy_klubu IN (SELECT ID_nazwy_klubu FROM DELETED);

    UPDATE M
    SET 
        M.ID_gospodarza = NULL
    FROM 
        Mecz M
    INNER JOIN 
        DELETED D ON D.ID_Nazwy_Klubu = M.ID_gospodarza;

	UPDATE M
    SET 
        M.ID_gosca = NULL
    FROM 
        Mecz M
    INNER JOIN 
        DELETED D ON D.ID_Nazwy_Klubu = M.ID_gosca;

	DELETE FROM Mecz
	WHERE ID_gospodarza IS NULL OR ID_gosca IS NULL;

    -- Usuwanie z Nazwy_Klubow
    DELETE FROM Nazwa_Klubu
    WHERE ID_nazwy_klubu IN (SELECT ID_nazwy_klubu FROM DELETED);

END;
GO
