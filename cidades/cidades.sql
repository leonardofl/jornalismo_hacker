PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE cidades (
  "id" INTEGER,
  "Nome" TEXT,
  "Populacao" INTEGER,
  "idPais" INTEGER
  );
INSERT INTO "cidades" VALUES(1,'Xangai',17836133,2);
INSERT INTO "cidades" VALUES(2,'Lagos',16060307,14);
INSERT INTO "cidades" VALUES(3,'Karachi',13969284,15);
INSERT INTO "cidades" VALUES(4,'Istambul',13907015,19);
INSERT INTO "cidades" VALUES(5,'Mumbai',12478447,8);
INSERT INTO "cidades" VALUES(6,'Moscou',12111194,17);
INSERT INTO "cidades" VALUES(7,'São Paulo',11821873,1);
INSERT INTO "cidades" VALUES(8,'Pequim',11716620,2);
INSERT INTO "cidades" VALUES(9,'Cantão',11185600,2);
INSERT INTO "cidades" VALUES(10,'Delhi',11007835,8);
INSERT INTO "cidades" VALUES(11,'Shenzen',10467400,2);
INSERT INTO "cidades" VALUES(12,'Seul',10388055,5);
INSERT INTO "cidades" VALUES(13,'Jacarta',9988329,9);
INSERT INTO "cidades" VALUES(14,'Kinshasa',9735000,4);
INSERT INTO "cidades" VALUES(15,'Tianjin',9341844,2);
INSERT INTO "cidades" VALUES(16,'Tóquio',9071577,12);
INSERT INTO "cidades" VALUES(17,'Chennai',8981087,8);
INSERT INTO "cidades" VALUES(18,'Cairo',8922949,6);
INSERT INTO "cidades" VALUES(19,'Dhaka',8906039,21);
INSERT INTO "cidades" VALUES(20,'Cidade do México',8874724,13);
INSERT INTO "cidades" VALUES(21,'Bangalore',8425970,8);
INSERT INTO "cidades" VALUES(22,'Nova York',8405837,7);
INSERT INTO "cidades" VALUES(23,'Londres',8308369,16);
INSERT INTO "cidades" VALUES(24,'Bangkok',8280925,18);
INSERT INTO "cidades" VALUES(25,'Dongguan',8220207,2);
INSERT INTO "cidades" VALUES(26,'Teerã',8154051,10);
INSERT INTO "cidades" VALUES(27,'Bogotá',7776845,3);
INSERT INTO "cidades" VALUES(28,'Cidade de Ho Chi Minh',7681700,20);
INSERT INTO "cidades" VALUES(29,'Hong Kong',7219700,2);
INSERT INTO "cidades" VALUES(30,'Bagdá',7180889,11);
CREATE TABLE pais_lingua (
  "idpais" INTEGER,
  "idlingua" INTEGER
  );
INSERT INTO "pais_lingua" VALUES(1,2);
INSERT INTO "pais_lingua" VALUES(2,3);
INSERT INTO "pais_lingua" VALUES(3,4);
INSERT INTO "pais_lingua" VALUES(4,5);
INSERT INTO "pais_lingua" VALUES(5,6);
INSERT INTO "pais_lingua" VALUES(6,7);
INSERT INTO "pais_lingua" VALUES(7,8);
INSERT INTO "pais_lingua" VALUES(8,9);
INSERT INTO "pais_lingua" VALUES(8,8);
INSERT INTO "pais_lingua" VALUES(9,10);
INSERT INTO "pais_lingua" VALUES(10,11);
INSERT INTO "pais_lingua" VALUES(11,7);
INSERT INTO "pais_lingua" VALUES(11,12);
INSERT INTO "pais_lingua" VALUES(12,13);
INSERT INTO "pais_lingua" VALUES(13,4);
INSERT INTO "pais_lingua" VALUES(14,8);
INSERT INTO "pais_lingua" VALUES(15,14);
INSERT INTO "pais_lingua" VALUES(15,8);
INSERT INTO "pais_lingua" VALUES(16,8);
INSERT INTO "pais_lingua" VALUES(17,15);
INSERT INTO "pais_lingua" VALUES(18,16);
INSERT INTO "pais_lingua" VALUES(19,17);
INSERT INTO "pais_lingua" VALUES(20,18);
INSERT INTO "pais_lingua" VALUES(21,1);
CREATE TABLE linguas (
    "id" INTEGER,
    "nome" TEXT,
    "falantes" INTEGER,
    "familia" TEXT,
    "escrita" TEXT
    );
INSERT INTO "linguas" VALUES(1,'Bengali',270000000,'Indo-europeia','Escrita bengali');
INSERT INTO "linguas" VALUES(2,'Português',250000000,'Indo-europeia','Alfabeto latino');
INSERT INTO "linguas" VALUES(3,'Mandarim',885000000,'Sino-tibetana','Alfabeto chinês');
INSERT INTO "linguas" VALUES(4,'Espanhol',406000000,'Indo-europeia','Alfabeto latino');
INSERT INTO "linguas" VALUES(5,'Francês',115000000,'Indo-europeia','Alfabeto latino');
INSERT INTO "linguas" VALUES(6,'Coreano',78000000,'Altaica','Alfabeto hangul');
INSERT INTO "linguas" VALUES(7,'Árabe',206000000,'Afro-asiática','Alfabeto árabe');
INSERT INTO "linguas" VALUES(8,'Inglês',400000000,'Indo-europeia','Alfabeto latino');
INSERT INTO "linguas" VALUES(9,'Hindi',322000000,'Indo-europeia','Alfabeto devanágari');
INSERT INTO "linguas" VALUES(10,'Indonésio',200000000,'Línguas austronésias','Alfabeto latino');
INSERT INTO "linguas" VALUES(11,'Persa',110000000,'Indo-europeia','Alfabeto persa');
INSERT INTO "linguas" VALUES(12,'Curdo',39500000,'Indo-europeia','Alfabeto árabe, Alfabeto latino, Alfabeto cirílico');
INSERT INTO "linguas" VALUES(13,'Japonês',125000000,'Altaica','Kanji, Hiragana, Katakana');
INSERT INTO "linguas" VALUES(14,'Urdu',61000000,'Indo-europeia','Alfabeto urdu');
INSERT INTO "linguas" VALUES(15,'Russo',164000000,'Indo-europeia','Alfabeto cirílico');
INSERT INTO "linguas" VALUES(16,'Tailandês',65000000,'Tai-Kadai','Alfabeto Tai');
INSERT INTO "linguas" VALUES(17,'Turco',70000000,'Altaica','Alfabeto latino');
INSERT INTO "linguas" VALUES(18,'Vietnamita',73000000,'Austro-asiática','Alfabeto vietnamita');
CREATE TABLE paises (
      "id" INTEGER,
      "nome" TEXT,
      "populacao" INTEGER      
      );
INSERT INTO "paises" VALUES(21,'Bangladesh',154786561);
INSERT INTO "paises" VALUES(1,'Brasil',203701100);
INSERT INTO "paises" VALUES(2,'China',1354040000);
INSERT INTO "paises" VALUES(3,'Colômbia',45745783);
INSERT INTO "paises" VALUES(4,'Congo',75507308);
INSERT INTO "paises" VALUES(5,'Coréia do Sul',48955203);
INSERT INTO "paises" VALUES(6,'Egito',85294388);
INSERT INTO "paises" VALUES(7,'Estados Unidos',316438601);
INSERT INTO "paises" VALUES(8,'Índia',1220800359);
INSERT INTO "paises" VALUES(9,'Indonésia',251160124);
INSERT INTO "paises" VALUES(10,'Irã',79853900);
INSERT INTO "paises" VALUES(11,'Iraque',31858481);
INSERT INTO "paises" VALUES(12,'Japão',127253075);
INSERT INTO "paises" VALUES(13,'México',118818228);
INSERT INTO "paises" VALUES(14,'Nigéria',168835645);
INSERT INTO "paises" VALUES(15,'Paquistão',179253789);
INSERT INTO "paises" VALUES(16,'Reino Unido',63395574);
INSERT INTO "paises" VALUES(17,'Rússia',143666931);
INSERT INTO "paises" VALUES(18,'Tailândia',67497151);
INSERT INTO "paises" VALUES(19,'Turquia',80694485);
INSERT INTO "paises" VALUES(20,'Vietnã',92477857);
COMMIT;
