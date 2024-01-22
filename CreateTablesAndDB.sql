USE FDB
GO

-- Funkcja sprawdzajaca poprawnosc lanuchu znakow
CREATE FUNCTION IS_CHAR(@string NVARCHAR(100))
RETURNS BIT AS
BEGIN
    DECLARE @isChar BIT = 1;
    
    IF (
        @string COLLATE Latin1_General_CS_AS LIKE '%[a-zA-ZąćęłńóśźżĄĆĘŁŃÓŚŹŻ]%[- ]%[a-zA-ZąćęłńóśźżĄĆĘŁŃÓŚŹŻ]%'
        AND @string NOT LIKE '%[- ]%[- ]%'
        AND @string NOT LIKE '-%'
        AND @string NOT LIKE '%-'
        AND @string NOT LIKE ' %'
        AND @string NOT LIKE '% '
		OR @string COLLATE Latin1_General_CS_AS LIKE '%[a-zA-ZąćęłńóśźżĄĆĘŁŃÓŚŹŻ][a-zA-ZąćęłńóśźżĄĆĘŁŃÓŚŹŻ]%'
    )
        SET @isChar = 1
    ELSE
        SET @isChar = 0;

    RETURN @isChar;
END
GO

-- Funkcja parsujaca wynik meczu
CREATE FUNCTION IS_RESULT(@string NVARCHAR(5))
RETURNS BIT AS
BEGIN
    DECLARE @isChar BIT = 1;
    
    IF (
        @string LIKE '[0-9]:[0-9]'
    )
        SET @isChar = 1;
    ELSE
        SET @isChar = 0;

    RETURN @isChar;
END
GO

-- Funkcja parsujaca daty
CREATE FUNCTION CHECK_DATA (@data_b DATE, @data_e DATE)
RETURNS BIT AS
BEGIN
    DECLARE @Result BIT;

    IF (@data_e IS NULL OR @data_b IS NULL)
        SET @Result = 1 
    ELSE IF (@data_b <= @data_e) 
        SET @Result = 1;
    ELSE
        BEGIN
            SET @Result = 0;
            RETURN @Result;
        END

    RETURN @Result;
END
GO

-- Tworzenie tabeli Sezon
CREATE TABLE Sezon (
    Numer_edycji INT IDENTITY(69, 1) PRIMARY KEY CHECK (Numer_edycji > 0 AND Numer_edycji <= 105),
    Data_rozpoczecia DATE NOT NULL UNIQUE,
    Data_zakonczenia DATE UNIQUE,
    CONSTRAINT Check_Data_Season
        CHECK (
            DATEDIFF(YEAR, Data_rozpoczecia, Data_zakonczenia) = 1
            AND DBO.CHECK_DATA(Data_rozpoczecia, Data_zakonczenia) = 1
        )
);

-- Tworzenie tabeli slownikowej Nazwy_Klubow
CREATE TABLE Nazwa_Klubu (
	ID_nazwy_klubu INT PRIMARY KEY CHECK (ID_nazwy_klubu>0),
	Nazwa_klubu NVARCHAR(42) NOT NULL UNIQUE CHECK (DBO.IS_CHAR(Nazwa_klubu) = 1)
);

-- Tworzenie tabeli slownikowej Miasta
CREATE TABLE Miasto (
    ID_miasta INT PRIMARY KEY CHECK (ID_miasta>0),
	Miasto NVARCHAR(32) NOT NULL UNIQUE CHECK (DBO.IS_CHAR(Miasto) = 1)
);

-- Tworzenie tabeli Klub_Sportowy
CREATE TABLE Klub_Sportowy (
    ID_nazwy_klubu INT NOT NULL FOREIGN KEY REFERENCES Nazwa_Klubu(ID_nazwy_klubu),
    ID_miasta INT NOT NULL FOREIGN KEY REFERENCES Miasto(ID_miasta) ON UPDATE CASCADE ON DELETE CASCADE,
    Nazwa_stadionu NVARCHAR(80) NOT NULL CHECK (DBO.IS_CHAR(Nazwa_stadionu) = 1),
    Pojemnosc_stadionu INT NOT NULL CHECK (Pojemnosc_stadionu >= 0 AND Pojemnosc_stadionu <= 58500)
);

-- Tworzenie tabeli Uczestnictwo_w_Seazonie
CREATE TABLE Uczestnictwo_w_Sezonie (
    ID_nazwy_klubu INT NOT NULL FOREIGN KEY REFERENCES Nazwa_Klubu(ID_nazwy_klubu),
    Numer_edycji INT NOT NULL FOREIGN KEY REFERENCES Sezon(Numer_edycji),
    PRIMARY KEY (ID_nazwy_klubu, Numer_edycji)
);

-- Tworzenie tabeli Mecz
CREATE TABLE Mecz (
    ID_meczu INT IDENTITY(1,1) PRIMARY KEY,
    Data_meczu DATE NOT NULL,
    Wynik NVARCHAR(5) NOT NULL CHECK (DBO.IS_RESULT(Wynik) = 1),
    Kolejka INT NOT NULL CHECK (Kolejka > 0 AND Kolejka <= 40),
    ID_gospodarza INT FOREIGN KEY REFERENCES Nazwa_Klubu(ID_nazwy_klubu),
    ID_gosca INT FOREIGN KEY REFERENCES Nazwa_Klubu(ID_nazwy_klubu),
    Numer_edycji INT NOT NULL FOREIGN KEY REFERENCES Sezon(Numer_edycji)
);

-- Tworzenie tabeli Czlonek_Klubu
CREATE TABLE Czlonek_Klubu (
    ID_czlonka INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    Imie NVARCHAR(20) NOT NULL CHECK (DBO.IS_CHAR(Imie) = 1),
    Nazwisko NVARCHAR(30) NOT NULL CHECK (DBO.IS_CHAR(Nazwisko) = 1),
    Data_urodzenia DATE NOT NULL,
    Miejsce_urodzenia NVARCHAR(80) NOT NULL CHECK (DBO.IS_CHAR(Miejsce_urodzenia) = 1)
);

-- Tworzenie tabeli slownikowej Pozycje
CREATE TABLE Pozycja (
	ID_pozycji INT PRIMARY KEY CHECK (ID_pozycji>0),
	Pozycja NVARCHAR(20) NOT NULL UNIQUE CHECK (DBO.IS_CHAR(Pozycja) = 1)
);


-- Tworzenie tabeli Zawodnik
CREATE TABLE Zawodnik (
    ID_pozycji INT NOT NULL FOREIGN KEY REFERENCES Pozycja(ID_pozycji) ON UPDATE CASCADE ON DELETE CASCADE,
    Numer_na_koszulce INT NOT NULL CHECK (Numer_na_koszulce >= 1 AND Numer_na_koszulce <= 99),
    ID_czlonka INT PRIMARY KEY REFERENCES Czlonek_Klubu(ID_czlonka)
);


CREATE TABLE Statystyki_Zawodnika (
    ID_czlonka INT NOT NULL FOREIGN KEY REFERENCES Zawodnik(ID_czlonka) ON UPDATE CASCADE ON DELETE CASCADE,
    ID_meczu INT NOT NULL FOREIGN KEY REFERENCES Mecz(ID_meczu) ON UPDATE CASCADE ON DELETE CASCADE,
    Liczba_goli INT NOT NULL CHECK (Liczba_goli >= 0 AND Liczba_goli <= 10),
    Liczba_asyst INT NOT NULL CHECK (Liczba_asyst >= 0 AND Liczba_asyst <= 10),
    PRIMARY KEY (ID_czlonka, ID_meczu),
);

-- Tworzenie tabeli Kontrakt_Zawodnika
CREATE TABLE Kontrakt_Zawodnika (
    ID_kontraktu_zawodnika INT IDENTITY(1,1) PRIMARY KEY,
	ID_nazwy_klubu INT NOT NULL FOREIGN KEY REFERENCES Nazwa_Klubu(ID_nazwy_klubu),
    ID_czlonka INT NOT NULL FOREIGN KEY REFERENCES Zawodnik(ID_czlonka) ON UPDATE CASCADE ON DELETE CASCADE,
	Wynagrodzenie DECIMAL(10) NOT NULL CHECK (Wynagrodzenie >= 0 AND Wynagrodzenie <= 10000000),
    Data_rozpoczecia DATE NOT NULL,
    Data_zakonczenia DATE NOT NULL ,
	Data_rozwiazania_umowy DATE,
	CONSTRAINT Check_Data_Player CHECK (DBO.CHECK_DATA(Data_rozpoczecia, Data_zakonczenia) = 1 
    AND DBO.CHECK_DATA(Data_rozwiazania_umowy, Data_zakonczenia) = 1)
);

-- Tworzenie tabeli slownikowej Stanowiska
CREATE TABLE Stanowisko (
	ID_stanowiska INT PRIMARY KEY CHECK (ID_stanowiska>0),
	Stanowisko NVARCHAR(31) NOT NULL UNIQUE CHECK (DBO.IS_CHAR(Stanowisko) = 1)
);

-- Tworzenie tabeli Trener
CREATE TABLE Trener (
    ID_czlonka INT PRIMARY KEY REFERENCES Czlonek_Klubu(ID_czlonka) ON UPDATE CASCADE ON DELETE CASCADE,
    ID_Stanowiska INT NOT NULL FOREIGN KEY REFERENCES Stanowisko(ID_stanowiska) ON UPDATE CASCADE ON DELETE CASCADE
);

-- Tworzenie tabeli Kontrakt_Trenera
CREATE TABLE Kontrakt_Trenera (
    ID_kontraktu_trenera INT IDENTITY(1,1) PRIMARY KEY,
    ID_nazwy_klubu INT NOT NULL FOREIGN KEY REFERENCES Nazwa_Klubu(ID_nazwy_klubu),
    ID_czlonka INT NOT NULL FOREIGN KEY REFERENCES Trener(ID_czlonka) ON UPDATE CASCADE ON DELETE CASCADE,
	Wynagrodzenie DECIMAL(10) NOT NULL CHECK (Wynagrodzenie >= 0 AND Wynagrodzenie <= 10000000),
    Data_rozpoczecia DATE NOT NULL,
    Data_zakonczenia DATE NOT NULL,
	Data_rozwiazania_umowy DATE,
	CONSTRAINT Check_Data_Coach CHECK (DBO.CHECK_DATA(Data_rozpoczecia, Data_zakonczenia) = 1 
    AND DBO.CHECK_DATA(Data_rozwiazania_umowy, Data_zakonczenia) = 1)
);

-- Tworzenie tabeli Prezes
CREATE TABLE Prezes (
    ID_czlonka INT PRIMARY KEY REFERENCES Czlonek_Klubu(ID_czlonka)
);

-- Tworzenie tabeli Kadencja_Prezesa
CREATE TABLE Kadencja_Prezesa (
    ID_kadencji INT IDENTITY(1,1) PRIMARY KEY,
    Data_rozpoczecia DATE NOT NULL,
    Data_zakonczenia DATE NOT NULL,
    ID_nazwy_klubu INT NOT NULL FOREIGN KEY REFERENCES Nazwa_Klubu(ID_nazwy_klubu),
    ID_czlonka INT NOT NULL FOREIGN KEY REFERENCES Prezes(ID_czlonka),
	CONSTRAINT Check_Data_President CHECK (DBO.CHECK_DATA(Data_rozpoczecia, Data_zakonczenia) = 1)
);



