#Assignment May 2023
#By Olivia Fabreschi

#adding data to tables

INSERT INTO behandlingsinfo (behandlingsinfoID, behandlingsTyp, behandlinngsPris, behandlingsLangd)
VALUES (1, "Klippning kort", 200, "00:30");
INSERT INTO behandlingsinfo (behandlingsinfoID, behandlingsTyp, behandlinngsPris, behandlingsLangd)
VALUES (2, "Klippning lång", 400, "01:00"),
 (3, "Styling bröllop", 500, "01:30"),
 (4, "Tvätt", 200, "00:30");
 


INSERT INTO personal (personalNr, forNamn, eferNamn)
values (1 , "Max", "Dripp"),
(2, "Jenny", "Krapp");

INSERT INTO egen_anstalld (personalNr, hyra)
values (2, 20000);

INSERT INTO foretags_anstalld (personalNr, lon)
values (1, 25000);

select * from foretags_anstalld;
delete from foretags_anstalld WHERE personalNr = 1;

insert into adress(postNr, gatuSiffra, gatuAdress)
values (1204, 5, "Plommonvägen"),
(1211, 10, "jordgubbsvägen"),
(, 45, "körsbärsvägen");

insert into salonger(salongNr, postNr, telefonNr)
values (1, 1204, "0700383983"),
(2, 1211, "070432383983"),
(3, 1999, "0703983");

select * from personal;

UPDATE personal SET salongNr = 2 where personalNr = 2;

insert into kunder(kundNr, forNamn, efterNamn, telefonNr, ePost)
values (1, "Olivia", "Fab", "0101903", "jfdklsa@gm"),
 (2, "Adam", "Fab", "0101903", "jfdklsa@gm"),
  (3, "hilda", "Osa", "0101903", "jfdklsa@gm"),
   (4, "Kia", "Ism", "0101903", "jfdklsa@gm"),
    (5, "Anna", "Olda", "0101903", "jfdklsa@gm");
    
select * from bokning

INSERT INTO bokning (bokningsNr, kundNr, salongNr, bokningsDatum, kommentar)
VALUES (1 , 1, 1, '22-06-12 10:34:09', "klippning utan tvätt"),
 (2 , 1, 1, '22-06-12 10:34:09', "klippning "),
 (3 , 1, 2, '22-06-12 10:34:09', "klippning utan tvätt"),
 (4 , 2, 2, '23-01-12 10:34:09', "klippning utan tvätt"),
 (5 , 2, 1, '23-01-12 10:34:09', "klippning utan tvätt"),
 (6 , 2, 1, '23-02-12 10:34:09', "klippning utan tvätt");
 
DELETE FROM bokning where kundNr =1;

select * from orderinfo

INSERT INTO orderinfo (orderInfoNr, behandlingsInfoID, bokningsNr, behandlingsTidDatum, personalNr)
VALUES (1,1,1,"23-02-12 10:34:09", 1),
(2,3,1,"23-02-12 10:34:09", 1),
(3,3,2,"23-02-12 10:34:09", 2),
(4,1,3,"23-02-12 10:34:09", 2),
(5,1,3,"23-02-12 10:34:09", 2),
(6,1,3,"23-02-12 10:34:09", 2);



INSERT INTO leverantor (leverantorNr, telefonNr, leverantorNamn)
VALUES (1,"984937432080423", "Storstan AB"),
(2,"984937432080423", "säljarena AB"),
(3,"984937432080423", "RENSA-frisör AB");


INSERT INTO produkter (artikelNr, produktTyp, pris, saldo)
VALUES (1, "Sax", 50,  100),
(2, "shampoo", 250, 100),
(3, "balsam", 250,  100),
(4, "stol", 500,  100),
(5, "borste", 300,  100);

select * from produktforsaljning
INSERT INTO produktforsaljning (forsaljningsNr, salongNr, forsaljningsPris, forsaljningsDatum)
VALUES (1, 1, 500 "23-02-12 10:34:09"),
