CREATE DATABASE Plante_ornamentale;
USE Plante_ornamentale;

CREATE TABLE Plante
(id_planta INT PRIMARY KEY,
 denumire VARCHAR(80),
 perioada_de_inflorire VARCHAR(60),
 inaltime VARCHAR(45),
 latime VARCHAR(45)
);

ALTER TABLE Plante ENGINE = InnoDB;

CREATE TABLE Climate
(id_climat INT PRIMARY KEY,
 denumire VARCHAR(70),
 sol VARCHAR(60),
 umiditate VARCHAR(70),
 precipitatii VARCHAR(60),
 lumina_solara VARCHAR(45),
 planta_reprezentativa INT,
 FOREIGN KEY (planta_reprezentativa) REFERENCES Plante(id_planta)
)ENGINE = InnoDB;

CREATE TABLE Radacini
(id_radacina INT PRIMARY KEY,
 tip VARCHAR(60),
 planta_reprezentativa INT,
 FOREIGN KEY (planta_reprezentativa) REFERENCES Plante(id_planta)
)ENGINE = InnoDB;

CREATE TABLE Tulpini
(id_tulp INT PRIMARY KEY,
 tip VARCHAR(60),
 planta_reprezentativa INT,
 FOREIGN KEY (planta_reprezentativa) REFERENCES Plante(id_planta)
)ENGINE = InnoDB;

CREATE TABLE Frunze
(id_frunza INT PRIMARY KEY,
 culoare VARCHAR(50),
 planta_reprezentativa INT,
 FOREIGN KEY (planta_reprezentativa) REFERENCES Plante(id_planta)
)ENGINE = InnoDB;

CREATE TABLE Flori
(culoare VARCHAR(50),
 planta INT,
 PRIMARY KEY (culoare, planta),
 FOREIGN KEY (planta) REFERENCES Plante(id_planta) ON DELETE CASCADE
)ENGINE = InnoDB;

CREATE TABLE Arbori
(id_arbore INT PRIMARY KEY,
 id_planta INT,
 specie VARCHAR(100),
 FOREIGN KEY (id_planta) REFERENCES Plante(id_planta)
)ENGINE = InnoDB;

CREATE TABLE Bujori_arborescenti
(id_bujor INT PRIMARY KEY,
 id_planta INT,
 culoare VARCHAR(45),
 FOREIGN KEY (id_planta) REFERENCES Plante(id_planta)
)ENGINE = InnoDB;

CREATE TABLE Tari
(id_tara INT PRIMARY KEY,
 denumire VARCHAR(100),
 temperatura_medie VARCHAR(30),
 poluare INT,
 climat_specific INT,
 planta_specifica INT,
 FOREIGN KEY (climat_specific) REFERENCES Climate(id_climat),
 FOREIGN KEY (planta_specifica) REFERENCES Plante(id_planta)
)ENGINE = InnoDB;

USE Plante_ornamentale;

INSERT INTO Plante VALUES (1, "Lavanda Dwarf Blue", "iunie-august", "40-60 cm", "30-50 cm");
INSERT INTO Plante VALUES (2, "Clematis Multi Blue", "mai-august", "1.5-3 m", "1-1.5 m");
INSERT INTO Plante VALUES (3, "Glicina (Wisteria Sinesis) Alba", "mai-iunie", "10-15 m", "1.5-2 m");
INSERT INTO Plante VALUES (4, "Azalee japoneză Maruschka", "mai-iunie", "50-80 cm", "80-100 cm");
INSERT INTO Plante VALUES (5, "Vita de Canada", "martie-noiembrie", "10-20 m", "1.5-2 m");
INSERT INTO Plante VALUES (6, "Hibiscus Ardens", "martie-noiembrie", "1.5-2.5 m", "1.5-2 m");
INSERT INTO Plante VALUES (7, "Liliac de vară Black Knight", "iulie-septembrie", "1.5-2 m", "1.5-2 m");
INSERT INTO Plante VALUES (8, "Magnolia Royal Star", "aprilie", "2 m", "2-3 m");
INSERT INTO Plante VALUES (9, "Arțar japonez Orange Dream", "martie-septembrie", "3-6 m", "2-5 m");

INSERT INTO Climate VALUES (1, "Climat subtropical", "Galbene, calcaroase, rosii", "scazuta", "putine", "mare", 7);
UPDATE Climate SET planta_reprezentativa=4 WHERE id_climat=2;

INSERT INTO Climate VALUES (3, "climat temperat-continental", "Cernoziomuri, loess", "medie", "500-800 mm\an", "medie", 1);
INSERT INTO Climate VALUES (4, "Climat rece-temperat", "Permafrost", "mare", "300-400 mm\an", "scazuta", 5);
INSERT INTO Climate VALUES (5, "Climat ecuoatorial", "diverse", "mare", "3000 mm\an", "mare", 8);
INSERT INTO Climate VALUES (6, "Climat subeacuoatorial", "Uscate", "scazuta", "1500 mm\an", "mare", 2);
INSERT INTO Climate VALUES (7, "Climat tropical", "diverse", "medie", "1500 mm\an", "mare", 3);
INSERT INTO Climate VALUES (8, "Climat subartic", "Permafrost", "mare", "200-300 mm\an", "scazuta", 9);

DELETE FROM Plante WHERE id_planta=9;
DELETE FROM Climate WHERE id_climat=8;

INSERT INTO Climate VALUES (8, "Climat subartic", "Permafrost", "mare", "200-300 mm\an", "scazuta", 9);

INSERT INTO Tari VALUES (1, "SUA", "20 grade Celsius", 3, 2, 6);
INSERT INTO Tari Values (2, "Canada", "12 grade Celsius", 2, 4, 5);
INSERT INTO Tari VALUES (3, "Japonia", "16 grade Celsius", 1, 2, 9);
INSERT INTO Tari VALUES (4, "Grecia", "30 grade Celsius", 3, 1, 7);
INSERT INTO Tari VALUES (5, "Japonia", "16 grade Celsius", 1, 2, 4);
INSERT INTO Tari VALUES (6, "China", "20 grade Celsius", 3, 3, 8);
INSERT INTO Tari VALUES (7, "Anglia", "13 grade Celsius", 2, 2, 3);
insert INTO Tari values (8, "SUA", "20 grade Celsius", 3, 2, 2);
insert into Tari Values (9, "Grecia", "30 grade Celsius", 3, 1, 1);

insert into Radacini values (1, "radacina pivotanta", 5);
insert into Radacini values (2, "radacina pivotanta", 8);
insert into Radacini values (3, "radacina ramuroasa", 9);
insert into Radacini values (4, "radacini fasciculate", 1);
insert into Radacini values (5, "radacini pivotante", 6);
insert into Radacini values (6, "radacini ramuroase", 7);
insert into Radacini values (7, "radacini fasciculate", 2);
insert into Radacini values (8, "radacini pivotante", 3);

insert into Tulpini values (1, "suptraterana", 3);
delete from Tulpini where id_tulp=1;
insert into Tulpini values (1, "supaterana", 3);
insert into Tulpini values (2, "subterana", 1);
insert into Tulpini values (3, "supraterana", 8);
insert into Tulpini values (4, "supraterana", 9);
insert into Tulpini values (5, "supterana", 5);
insert into Tulpini values (6, "supraterana", 7);
insert into Tulpini values (7, "supraterana", 2);
insert into Tulpini values (8, "subterana", 6);
insert into Tulpini values (9, "supraterana", 4);

drop table Plante_acvatice;

insert into Frunze values (1, "verde", 2);
insert into Frunze values (2, "rosu", 4);
insert into Frunze values (3, "verde deschis", 6);
insert into Frunze values (4, "galben", 9);
insert into Frunze values (5, "verde inchis", 7);
insert into Frunze values (6, "verde deschis", 3);
insert into Frunze values (7, "verde deschis", 5);

delete from Frunze where id_frunza=7;

insert into Flori values ("violet", 7);
insert into Flori values ("albastru", 6);
insert into Flori values ("alb", 8);
insert into Flori values ("alb", 3);
insert into Flori values ("albastru", 2);
insert into Flori values ("galben", 9);
insert into Flori values ("rosu", 4);

insert into Arbori values (1, 9, "foioase");
insert into Arbori values (2, 7, "oleaceae");

INSERT INTO Bujori_arborescenti values (1, 2, "alb");
insert into Bujor_arborescenti values (2, 1, "violet");
insert into Bujori_arborescenti values (3, 5, "verde");

use Plante_ornamentale;

SELECT * FROM Tulpini INNER JOIN Radacini ON id_tulp=id_radacina;

SELECT culoare, Frunze.id_frunza, tip from Frunze left join Tulpini on (Frunze.id_frunza = Tulpini.id_tulp);

SELECT * FROM TULPINI WHERE tip = "subterana";

SELECT denumire FROM Plante WHERE inaltime="1.5-2 m";

SELECT Arbori.id_arbore, Arbori.specie FROM Arbori UNION ALL SELECT bujori_arborescenti.id_bujor, bujori_arborescenti.culoare from bujori_arborescenti;

SELECT * FROM (SELECT Tulpini.id_tulp, Tulpini.tip FROM Tulpini Union SELECT Frunze.id_frunza, Frunze.culoare FROM Frunze) Tulpini GROUP BY id_tulp HAVING COUNT(*) = 1 ORDER BY id_tulp;

USE Plante_ornamentale;

INSERT INTO Plante VALUES (10, "Cires Japonez plangator roz Kiku-Shidare-Zakura", "aprilie, mai","4-6 m", "250-500 cm");
INSERT INTO Plante values (11, "Molid Argintiu albastru Super Blue", "tot anul", "variat", "variat");
INSERT INTO Plante VALUES (12, "Pin Chilian", "tot anul", "variat", "variat");
INSERT INTO Plante VALUES (13, "Catalpa Nana Globulara", "tot anul", "1.5-3 m", "1.5-3 m");
INSERT INTO Plante VALUES (14, "Bujor hybrid Albert Crousse", "martie,aprilie", "120-300 cm", "120-300 cm");
INSERT INTO Plante VALUES (15, "Bujor hybrid Candy Stripes", "martie,aprilie", "120-300 cm", "120-300 cm");
INSERT INTO Plante VALUES (16, "Bujor hybrid Coral Charm", "martie, aprilie", "120-300 cm", "120-300 cm");
INSERT INTO Plante VALUES (17, "Arborele de Matase Ombrella", "iulie, august", "8-10 m", "600-800 cm");
INSERT INTO Plante VALUES (18, "Artar Norvegian Globular", "aprilie", "5-8 m", "300-400 cm");
INSERT INTO Plante VALUES (19, "Bujor hybrid Elsa Sass", "martie, aprilie", "120-300 cm", "120-300 cm");
INSERT INTO Plante VALUES (20, "Bujor hybrid Felix Crousse", "martie, aprilie", "120-300 cm", "120-300 cm");

INSERT INTO TARI VALUES (10, "Norvegia", "7 grade Celsius", 1, 8, 18);
INSERT INTO tari VALUES (11, "Chile", "15 grade Celsius", 2, 2, 12);
INSERT INTO tari Values (12, "Japonia", "16 grade Celsius", 1, 2, 10);
INSERT INTO Tari Values (13, "SUA", "20 grade Celsius", 3, 2, 13);
INSERT INTO tari Values (14, "China", "20 grade Celsius", 2,2, 14);
INSERT INTO tari Values (15, "China", "20 grade Celsius", 2,2, 15);
INSERT INTO tari Values (16, "China", "20 grade Celsius", 2,2, 16);
INSERT INTO tari Values (17, "SUA", "20 grade Celsius", 2,2, 17);
INSERT INTO tari Values (18, "China", "20 grade Celsius", 2,2, 18);
INSERT INTO tari Values (19, "SUA", "20 grade Celsius", 2,2, 19);
INSERT INTO tari Values (20, "China", "20 grade Celsius", 2,2, 20);

INSERT INTO Climate VALUES (10, "Climat temperat-maritim", "luvisoluri, argiluvisoluri, podzoluri", "mare", "1000 mm\an", "mare", 13);
INSERT INTO Climate VALUES (11, "Climat temperat-maritim", "luvisoluri, argiluvisoluri, podzoluri", "mare", "1000 mm\an", "mare", 10);
INSERT INTO Climate VALUES (12, "Climat temperat-maritim", "luvisoluri, argiluvisoluri, podzoluri", "mare", "1000 mm\an", "mare", 12);
INSERT INTO Climate VALUES (13, "Climat temperat-continetal", "Cernoziomuri, loess", "medie", "500-800 mm\an", "medie", 14);
INSERT INTO Climate VALUES (14, "Climat temperat-continental", "Cernoziomuri, loess", "medie", "500-800 mm\an", "medie", 15);
INSERT INTO Climate VALUES (15, "Climat temperat-continental", "Cernoziomuri, loess", "medie", "500-800 mm\an", "medie", 16);
INSERT INTO Climate VALUES (16, "Climat temperat-continental", "Cernoziomuri, loess", "medie", "500-800 mm\an", "medie", 19);
INSERT INTO Climate VALUES (17, "Climat temperat-continental", "Cernoziomuri, loess", "medie", "500-800 mm\an", "medie", 20);
INSERT INTO Climate VALUES (18, "Climat temperat-maritim", "Luvisoluri, argiluvisoluri, podzsoluri", "mare", "1000 mm\an", "medie", 17);
INSERT INTO Climate VALUES (19, "Climat temperat-continental", "Cernoziomuri, loess", "medie", "500-800 mm\an", "medie", 11);
INSERT INTO Climate VALUES (20, "Climat subartic", "Permafrost", "mare", "200-300 mm\an", "scazuta", 18);

insert into Frunze values (8, "verde", 18);
insert into Frunze values (9, "roz", 10);
insert into Frunze values (10, "verde deschis", 12);
insert into Frunze values (11, "alb", 19);
insert into Frunze values (12, "verde albastrui", 11);
insert into Frunze values (13, "verde deschis", 13);
insert into Frunze values (14, "rosu", 20);
insert into Frunze values (15, "roz", 16);
insert into Frunze values (16, "rosu", 15);
insert into Frunze values (17, "verde deschis", 17);
insert into Frunze values (18, "galben", 14);

insert into Radacini values (9, "radacina pivotanta", 15);
insert into Radacini values (10, "radacina pivotanta", 16);
insert into Radacini values (11, "radacina ramuroasa", 18);
insert into Radacini values (12, "radacini fasciculate", 17);
insert into Radacini values (13, "radacini pivotante", 13);
insert into Radacini values (14, "radacini ramuroase", 11);
insert into Radacini values (15, "radacini fasciculate", 19);
insert into Radacini values (16, "radacini pivotante", 20);
insert into Radacini values (17, "radacina ramuroasa", 10);

insert into Tulpini values (10, "supaterana", 10);
insert into Tulpini values (11, "subterana", 20);
insert into Tulpini values (12, "supraterana", 11);
insert into Tulpini values (13, "supraterana", 12);
insert into Tulpini values (14, "supterana", 16);
insert into Tulpini values (17, "supraterana", 18);
insert into Tulpini values (18, "supraterana", 17);
insert into Tulpini values (19, "subterana", 15);
insert into Tulpini values (20, "subterana", 14);

insert into Flori values ("roz", 10);
insert into Flori values ("rosu", 14);
insert into Flori values ("alb", 19);
insert into Flori values ("rosu", 20);
insert into Flori values ("roz", 16);
insert into Flori values ("galben", 17);

insert into Arbori values (3, 11, "foioase");
insert into Arbori values (4, 13, "oleaceae");
insert into Arbori values (5, 12, "foioase");
INSERT INTO Arbori VALUES (6, 18, "foioase");
insert into Arbori values (7, 17, "oleaceae");

INSERT INTO Bujori_arborescenti values (4, 14, "roz");
insert into Bujori_arborescenti values (5, 15, "rosu");
insert into Bujori_arborescenti values (7, 16, "roz");
insert into Bujori_arborescenti values (8, 20, "rosu");

SELECT * FROM Tulpini INNER JOIN Radacini ON id_tulp=id_radacina;

SELECT culoare, Frunze.id_frunza, tip from Frunze left join Tulpini on (Frunze.id_frunza = Tulpini.id_tulp);

SELECT * FROM TULPINI WHERE tip = "subterana";

SELECT denumire FROM Plante WHERE perioada_de_inflorire="martie, aprilie";

SELECT Arbori.id_arbore, Arbori.specie FROM Arbori UNION ALL SELECT bujori_arborescenti.id_bujor, bujori_arborescenti.culoare from bujori_arborescenti;

select * from Tulpini where tip not in (select tip from Radacini);
















 

























 





 






