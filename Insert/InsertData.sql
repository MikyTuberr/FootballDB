USE FDB;

--------------------- Sezon -------------------

-- Wypełnianie tabeli Sezon

INSERT INTO Sezon 
	(Data_rozpoczecia, Data_zakonczenia) 
VALUES
    --- 0 ---
	('2003-07-20', '2004-05-29'),
	('2004-07-28', '2005-05-26'),
	('2005-07-24', '2006-05-13'),
	('2006-07-28', '2007-05-26'),
	('2007-07-27', '2008-05-10'),
	--- 5 ---
	('2008-08-08', '2009-05-30'),
	('2009-07-31', '2010-05-15'),
	('2010-08-06', '2011-05-29'),
	('2011-07-30', '2012-05-06'),
	('2012-08-17', '2013-06-02'),
	--- 10 ---
	('2013-07-19', '2014-06-01'),
	('2014-07-18', '2015-06-07'),
	('2015-07-17', '2016-05-15'),
	('2016-07-15', '2017-06-04'),
	('2017-07-14', '2018-05-20'),
	--- 15 ---
	('2018-07-20', '2019-05-19'),
	('2019-07-19', '2020-07-19'),
	('2020-08-21', '2021-05-16'),
	('2021-07-23', '2022-05-22'),
	('2022-07-15', '2023-05-27');
	--- 20 ---


--------------------- Nazwy_Klubow -------------------

INSERT INTO Nazwa_Klubu 
	(ID_nazwy_klubu, Nazwa_klubu)
VALUES
    --- 0 ---
	(1,'Legia Warszawa'),
	(2,'Lech Poznań'),
	(3,'Wisła Kraków'),
	(4,'Śląsk Wrocław'),
	(5,'Jagiellonia Białystok'),
	--- 5 ---
	(6,'Lechia Gdańsk'),
	(7,'Pogoń Szczecin'),
	(8,'Górnik Zabrze'),
	(9,'Arka Gdynia'),
	(10,'Raków Częstochowa'),
	--- 10 ---
	(11,'Polonia Warszawa'),
	(12,'Warta Poznań'),
	(13,'Cracovia Kraków'),
	(14,'Piast Wrocław'),
	(15,'Podlaski Białystok'),
	--- 15 ---
	(16,'Gedania Gdańsk'),
	(17,'Arkonia Szczecin'),
	(18,'Sparta Zabrze'),
	(19,'Bałtyk Gdynia'),
	(20,'Skra Częstochowa');
	--- 20 ---
--------------------- Miasta -------------------

INSERT INTO Miasto 
	(ID_miasta, Miasto)
VALUES
    --- 0 ---
	(1,'Warszawa'),
	(2,'Poznań'),
	(3,'Kraków'),
	(4,'Wrocław'),
	(5,'Białystok'),
	--- 5 ---
	(6,'Gdańsk'),
	(7,'Szczecin'),
	(8,'Zabrze'),
	(9,'Gdynia'),
	(10,'Częstochowa');
	--- 10 ---

--------------------- Klub_Sportowy -------------------

INSERT INTO Klub_Sportowy
	(ID_nazwy_klubu, ID_miasta, Nazwa_stadionu, Pojemnosc_stadionu)
VALUES
    --- 0 ---
	(1, 1, 'Stadion Miejski Legii Warszawa im. Marszałka J. Piłsudskiego', 31103),
	(2, 2, 'Enea Stadion', 42837),
	(3, 3, 'Stadion Henryka Reymana', 33130),
	(4, 4, 'Tarczyński Arena', 45105),
	(5, 5, 'Stadion Miejski w Białymstoku', 22373),
	--- 5 ---
	(6, 6, 'Polsat Plus Arena Gdańsk', 41620),
	(7, 7, 'Stadion Miejski im. Floriana Krygiera', 21163),
	(8, 8, 'Arena Zabrze', 31871),
	(9, 9, 'Stadion Miejski Arka Gdynia', 15139),
	(10, 10, 'Miejski Stadion Piłkarski RKS Raków Częstochowa', 5500),
	--- 10 ---
	(1, 1, 'Stadion Polonii Warszawa', 15300),
	(2, 2, 'Stadion Miejski', 4906),
	(3, 3, 'Stadion Józefa Piłsudskiego', 15000),
	(4, 4, 'Stadion Piasta', 4398),
	(5, 5, 'Stadion Podlasia', 3500),
	--- 15 ---
	(6, 6, 'Stadion Gedanii', 3000),
	(7, 7, 'Stadion Arkonii', 5000),
	(8, 8, 'Stadion Sparty', 8500),
	(9, 9, 'Stadion Bałtyku', 2425),
	(10, 10, 'Stadion Skry', 5400);
	--- 20 ---

--------------------- Uczestnictwo_w_Sezonie -------------------

INSERT INTO Uczestnictwo_w_Sezonie
	(ID_nazwy_klubu, Numer_edycji)
VALUES
    --- 0 ---
	(1, 88),
	(2, 86),
	(3, 83),
	(4, 87),
	(5, 70),
	--- 5 ---
	(6, 75),
	(7, 78),
	(8, 72),
	(9, 77),
	(10, 80),
	--- 10 ---
	(11, 82),
	(12, 69),
	(13, 83),
	(14, 83),
	(15, 79),
	--- 15 ---
	(16, 74),
	(17, 77),
	(18, 85),
	(19, 86),
	(20, 88);
	--- 20 ---

--------------------- Mecz -------------------

-- Wypełnianie tabeli Mecz

INSERT INTO Mecz
	(Data_meczu, Wynik, Kolejka, ID_Gospodarza, ID_Gosca, Numer_edycji)
VALUES
    --- 0 ---
	('2004-03-15', '2:1', 1, 1, 2, 70),
	('2004-04-22', '1:3', 1, 3, 4, 70),
	('2004-05-10', '3:3', 1, 5, 6, 70),
	('2004-07-03', '0:5', 1, 7, 8, 70),
	('2005-09-08', '1:2', 2, 2, 4, 71),
	--- 5 ---
	('2005-01-25', '2:3', 2, 6, 8, 71),
	('2005-04-12', '0:1', 2, 1, 3, 71),
	('2005-06-20', '3:2', 2, 5, 7, 71),
	('2005-09-05', '4:0', 2, 4, 8, 71),
	('2006-02-18', '4:4', 3, 2, 6, 72),
	--- 10 ---
	('2006-05-07', '0:1', 3, 1, 3, 72),
	('2006-07-24', '1:2', 3, 7, 5, 72),
	('2006-10-15', '3:0', 3, 4, 6, 72),
	('2007-01-02', '2:1', 3, 8, 2, 73),
	('2008-02-18', '2:2', 4, 2, 6, 74),
	--- 15 ---
	('2008-04-08', '0:0', 4, 1, 7, 74),
	('2008-07-19', '1:1', 4, 3, 6, 74),
	('2009-10-09', '2:0', 4, 5, 8, 75),
	('2010-01-03', '3:1', 4, 2, 4, 76),
	('2011-04-08', '0:0', 5, 1, 7, 77);
	--- 20 ---

--------------------- Czlonek_Klubu -------------------

-- Wypełnianie tabeli Czlonek_Klubu

INSERT INTO Czlonek_Klubu
    (Imie, Nazwisko, Data_urodzenia, Miejsce_urodzenia)
VALUES
    --- 0 ---
    ('Jan', 'Kowalski', '1995-03-15', 'Warszawa'),
    ('Michał', 'Nowak', '1992-08-28', 'Poznań'),
    ('Piotr', 'Lewandowski', '1990-01-10', 'Kraków'),
    ('Kamil', 'Wójcik', '1988-06-05', 'Wrocław'),
    ('Mateusz', 'Jagielski', '1993-04-20', 'Białystok'),
    --- 5 ---
    ('Krzysztof', 'Adamczyk', '1986-09-12', 'Gdańsk'),
    ('Marek', 'Szymański', '1989-01-30', 'Szczecin'),
    ('Tomasz', 'Kaczmarek', '1994-06-18', 'Zabrze'),
    ('Damian', 'Duda', '1987-12-03', 'Gdynia'),
    ('Patryk', 'Głowacki', '1990-08-25', 'Częstochowa'),
    --- 10 ---
    ('Kacper', 'Pawlak', '1991-03-07', 'Bydgoszcz'),
    ('Bartosz', 'Kowalczyk', '1988-10-15', 'Lublin'),
    ('Sebastian', 'Witkowski', '1992-04-22', 'Katowice'),
    ('Dominik', 'Baranowski', '1995-11-08', 'Płock'),
    ('Błażej', 'Lis', '1989-07-01', 'Olsztyn'),
    --- 15 ---
    ('Adrian', 'Mazurek', '1993-02-14', 'Rzeszów'),
    ('Daniel', 'Czech', '1985-09-28', 'Opole'),
    ('Marcin', 'Sawicki', '1990-04-10', 'Suwałki'),
    ('Jakub', 'Woźniak', '1987-12-17', 'Bielsko-Biała'),
    ('Rafał', 'Nowak', '1994-05-23', 'Kielce'),
	--- 20 ---
    ('Kacper', 'Zając', '1992-09-05', 'Zakopane'),
    ('Tomasz', 'Klimek', '1988-07-12', 'Głogów'),
    ('Dominik', 'Sobczyk', '1990-04-28', 'Koszalin'),
    ('Piotr', 'Włodarczyk', '1987-11-18', 'Rybnik'),
    ('Kamil', 'Szulc', '1986-03-03', 'Tarnów'),
	--- 25 ---
    ('Patryk', 'Dąbrowski', '1989-05-22', 'Elbląg'),
    ('Grzegorz', 'Kowal', '1991-01-19', 'Radom'),
    ('Marcin', 'Michalak', '1988-02-15', 'Kalisz'),
    ('Daniel', 'Kowalewski', '1994-08-07', 'Słupsk'),
    ('Łukasz', 'Lipiński', '1986-10-25', 'Zamość'),
    --- 30 ---
    ('Mikołaj', 'Wójcicki', '1989-12-22', 'Legnica'),
    ('Paweł', 'Zawada', '1987-04-17', 'Bielsko-Biała'),
    ('Radosław', 'Pietrzak', '1992-11-10', 'Gdynia'),
    ('Bartłomiej', 'Kaczorowski', '1990-06-14', 'Opole'),
    ('Kamil', 'Zieliński', '1988-03-10', 'Suwałki'),
	--- 35 ---
    ('Adam', 'Majewski', '1993-05-17', 'Bydgoszcz'),
    ('Karol', 'Kaczor', '1985-08-10', 'Lublin'),
    ('Michał', 'Kowalik', '1991-02-28', 'Kielce'),
    ('Paweł', 'Marczak', '1994-09-15', 'Rzeszów'),
    ('Szymon', 'Lisowski', '1986-12-23', 'Olsztyn'),
	--- 40 ---
    ('Piotr', 'Zieliński', '1988-09-03', 'Zakopane'),
    ('Tomasz', 'Sokołowski', '1990-07-11', 'Głogów'),
    ('Mateusz', 'Mazurek', '1989-04-27', 'Koszalin'),
    ('Damian', 'Kowalczyk', '1987-11-17', 'Rybnik'),
    ('Szymon', 'Szymański', '1986-03-02', 'Tarnów'),
	--- 45 ---
    ('Kamil', 'Majewski', '1991-05-21', 'Elbląg'),
    ('Grzegorz', 'Krawczyk', '1988-01-18', 'Radom'),
    ('Artur', 'Michalak', '1985-02-14', 'Kalisz'),
    ('Jan', 'Kowalewski', '1994-08-06', 'Słupsk'),
    ('Robert', 'Lipiński', '1986-10-24', 'Zamość'),
	--- 50 ---
    ('Piotr', 'Kowalczyk', '1974-05-16', 'Warszawa'),
    ('Wojciech', 'Sikora', '1979-09-28', 'Poznań'),
    ('Andrzej', 'Kaczor', '1977-02-10', 'Kraków'),
    ('Marek', 'Nowakowski', '1975-06-25', 'Wrocław'),
    ('Robert', 'Jaworski', '1980-04-20', 'Białystok'),
    --- 55 ---
    ('Marcin', 'Kozłowski', '1972-09-12', 'Gdańsk'),
    ('Łukasz', 'Adamczyk', '1975-01-30', 'Szczecin'),
    ('Krzysztof', 'Zawadzki', '1980-06-18', 'Zabrze'),
    ('Dariusz', 'Wójcik', '1977-12-03', 'Gdynia'),
    ('Artur', 'Głowacki', '1980-08-25', 'Częstochowa');
    --- 60 ---

--------------------- Pozycje -------------------

INSERT INTO Pozycja 
	(ID_pozycji, Pozycja) 
VALUES 
	--- 0 ---
	(1,'Bramkarz'),
	(2,'Środkowy Obrońca'),
	(3,'Prawy Obrońca'),
	(4,'Lewy obrońca'),
	(5,'Defensywny Pomocnik'),
	--- 5 ---
	(6,'Środkowy Pomocnik'),
	(7,'Ofensywny Pomocnik'),
	(8,'Lewy Pomocnik'),
	(9,'Prawy Pomocnik'),
	(10,'Cofnięty Napastnik'),
	--- 10 ---
	(11,'Środkowy Napastnik'),
	(12,'Prawy Napastnik'),
	(13,'Lewy Napastnik'),
	(14,'Prawy Skrzydłowy'),
	(15,'Lewy Skrzydłowy');
	--- 15 ---

--------------------- Zawodnik -------------------

-- Wypełnianie tabeli Zawodnik

INSERT INTO Zawodnik 
	(ID_pozycji, Numer_na_koszulce, ID_czlonka)
VALUES 
	--- 0 ---
	(1, 10, 1),
	(2, 7, 2),
	(10, 15, 3),
	(15, 22, 4),
	(3, 5, 5),
	--- 5 ---
	(7, 1, 6),
	(7, 33, 7),
	(8, 8, 8),
	(9, 14, 9),
	(1, 3, 10),
	--- 10 ---
	(11, 20, 11),
	(3, 17, 12),
	(7, 19, 13),
	(15, 29, 14),
	(15, 9, 15),
	--- 15 ---
	(11, 6, 16),
	(2, 17, 17),
	(2, 13, 18),
	(4, 4, 19),
	(13, 12, 20);
	--- 20 ---

--------------------- Statystyki_Zawodnika -------------------

INSERT INTO Statystyki_Zawodnika 
	(ID_czlonka, ID_meczu, Liczba_goli, Liczba_asyst)
VALUES 
	--- 0 ---
	(1, 1, 2, 1),
	(2, 2, 0, 3),
	(3, 3, 1, 2),
	(4, 4, 0, 1),
	(5, 5, 3, 0),
	--- 5 ---
	(6, 6, 1, 1),
	(7, 7, 0, 2),
	(8, 8, 2, 0),
	(9, 9, 1, 1),
	(10, 10, 0, 2),
	--- 10 ---
	(11, 11, 2, 0),
	(12, 12, 0, 1),
	(13, 13, 1, 1),
	(14, 14, 3, 0),
	(15, 15, 0, 2),
	--- 15 ---
	(16, 15, 1, 0),
	(16, 14, 0, 0),
	(16, 13, 0, 0),
	(16, 12, 0, 2),
	(16, 11, 0, 1),
	(16, 16, 2, 0),
	(17, 17, 1, 1),
	(18, 18, 0, 2),
	(19, 19, 2, 0),
	(20, 20, 1, 1);
	--- 20 ---

--------------------- Statystyki_Zawodnika -------------------

INSERT INTO Kontrakt_Zawodnika 
    (ID_nazwy_klubu, ID_czlonka, Wynagrodzenie, Data_rozpoczecia, Data_zakonczenia, Data_rozwiazania_umowy)
VALUES 
	--- 0 ---
    (1, 1, 500000, '2004-01-01', '2008-01-01', NULL),
    (2, 2, 750000, '2005-02-01', '2010-02-20', '2007-02-01'),
    (3, 3, 300000, '2006-03-01', '2010-03-01', NULL),
    (4, 4, 130000, '2007-04-01', '2015-04-01', NULL),
    (5, 5, 900000, '2008-05-01', '2012-05-17', '2010-05-01'),
	--- 5 ---
    (6, 6, 930000, '2009-06-01', '2013-06-01', NULL),
    (7, 7, 550000, '2010-07-01', '2017-07-01', NULL),
    (8, 8, 720000, '2011-08-01', '2016-08-01', NULL),
    (9, 9, 685000, '2019-09-01', '2024-09-01', NULL),
    (10, 10, 643000, '2013-10-01', '2014-10-01', NULL),
	--- 10 ---
    (11, 11, 855000, '2014-11-01', '2016-11-01', NULL),
    (12, 12, 767000, '2020-12-01', '2024-12-01', NULL),
    (13, 13, 958000, '2017-01-01', '2024-01-01', NULL),
    (14, 14, 554000, '2017-02-01', '2020-02-01', NULL),
    (15, 15, 723000, '2018-03-01', '2022-03-03', '2021-03-01'),
	--- 15 ---
    (16, 16, 682000, '2019-04-01', '2025-04-01', NULL),
    (17, 17, 611000, '2020-05-01', '2026-05-01', NULL),
    (18, 18, 812000, '2021-06-01', '2025-06-01', NULL),
    (19, 19, 733000, '2022-07-01', '2030-07-01', NULL),
    (20, 20, 969000, '2023-08-01', '2027-08-01', NULL);
	--- 20 ---


--------------------- Stanowiska -------------------

INSERT INTO Stanowisko 
	(ID_stanowiska, Stanowisko)
VALUES
	--- 0 ---
    (1,'Trener'),
    (2,'Asystent Trenera'),
    (3,'Analityk'),
    (4,'Trener Bramkarzy'),
    (5,'Trener Przygotowania Fizycznego'),
	--- 5 ---
    (6,'Fizjoterapeuta'),
    (7,'Szef Działu Medycznego'),
    (8,'Lekarz'),
    (9,'Dietetyk'),
    (10,'Rzecznik Prasowy');
	--- 10 ---

--------------------- Trener -------------------

INSERT INTO Trener (ID_czlonka, ID_Stanowiska)
VALUES
	--- 0 ---
    (21, 1),  
    (22, 2),  
    (23, 3),  
    (24, 4),  
    (25, 5),  
	--- 5 ---
    (26, 6),  
    (27, 7),  
    (28, 8),  
    (29, 9),  
    (30, 10),
	--- 10 --- 
    (31, 1),
    (32, 2),
    (33, 3),
    (34, 4),
    (35, 5),
	--- 15 ---
    (36, 6),
    (37, 7),
    (38, 8),
    (39, 9),
    (40, 10);
	--- 20 ---

--------------------- Kontrakt_Trenera -------------------

INSERT INTO Kontrakt_Trenera 
	(ID_nazwy_klubu, ID_czlonka, Wynagrodzenie, Data_rozpoczecia, Data_zakonczenia, Data_rozwiazania_umowy)
VALUES
    --- 0 ---
    (1, 21, 500000, '2020-07-01', '2022-06-30', NULL),
    (2, 22, 450000, '2019-08-15', '2021-08-14', '2021-06-30'),
    (3, 23, 550000, '2021-02-10', '2023-02-09', NULL),
    (4, 24, 480000, '2020-05-20', '2022-05-19', NULL),
    (5, 25, 520000, '2022-01-03', '2024-01-02', NULL),
    --- 5 ---
    (6, 26, 490000, '2018-12-12', '2020-12-11', NULL),
    (7, 27, 510000, '2019-06-25', '2021-06-24', NULL),
    (8, 28, 480000, '2020-08-01', '2022-07-31', NULL),
    (9, 29, 550000, '2021-01-15', '2023-01-14', NULL),
    (10, 30, 500000, '2019-11-10', '2021-11-09', NULL),
    --- 10 ---
    (11, 31, 530000, '2022-03-05', '2024-03-04', NULL),
    (12, 32, 470000, '2020-04-18', '2022-04-17', NULL),
    (13, 33, 520000, '2019-09-22', '2021-09-21', NULL),
    (14, 34, 480000, '2021-04-08', '2023-04-07', NULL),
    (15, 35, 540000, '2020-06-15', '2022-06-14', NULL),
    --- 15 ---
    (16, 36, 490000, '2021-08-20', '2023-08-19', NULL),
    (17, 37, 500000, '2019-10-05', '2021-10-04', NULL),
    (18, 38, 470000, '2020-11-28', '2022-11-27', NULL),
    (19, 39, 510000, '2021-06-10', '2023-06-09', NULL),
    (20, 40, 520000, '2020-02-14', '2022-02-13', NULL);
	--- 20 ---

--------------------- Prezes -------------------

INSERT INTO Prezes 
	(ID_czlonka)
VALUES
    --- 0 ---
    (41), (42), (43), (44), (45),
    --- 5 ---
    (46), (47), (48), (49), (50),
    --- 10 ---
    (51), (52), (53), (54), (55),
    --- 15 ---
    (56), (57), (58), (59), (60);
	--- 20 ---

--------------------- Kadencja_Prezesa -------------------

INSERT INTO Kadencja_Prezesa 
	(Data_rozpoczecia, Data_zakonczenia, ID_nazwy_klubu, ID_czlonka)
VALUES
    --- 0 ---
    ('2003-07-20', '2004-05-29', 1, 41),
    ('2004-07-28', '2005-05-26', 2, 42),
    ('2005-07-24', '2006-05-13', 3, 43),
    ('2006-07-28', '2007-05-26', 4, 44),
    ('2007-07-27', '2008-05-10', 5, 45),
    --- 5 ---
    ('2008-08-08', '2009-05-30', 6, 46),
    ('2009-07-31', '2010-05-15', 7, 47),
    ('2010-08-06', '2011-05-29', 8, 48),
    ('2011-07-30', '2012-05-06', 9, 49),
    ('2012-08-17', '2013-06-02', 10, 50),
    --- 10 ---
    ('2013-07-19', '2014-06-01', 11, 51),
    ('2014-07-18', '2015-06-07', 12, 52),
    ('2015-07-17', '2016-05-15', 13, 53),
    ('2016-07-15', '2017-06-04', 14, 54),
    ('2017-07-14', '2018-05-20', 15, 55),
    --- 15 ---
    ('2018-07-20', '2019-05-19', 16, 56),
    ('2019-07-19', '2020-07-19', 17, 57),
    ('2020-08-21', '2021-05-16', 18, 58),
    ('2021-07-23', '2022-05-22', 19, 59),
    ('2022-07-15', '2023-05-27', 20, 60);
	 --- 20 ---