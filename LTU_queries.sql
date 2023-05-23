#Assignment May 2023
#By Olivia Fabreschi

#select statements
#add customer
INSERT INTO kunder (kundNr, forNamn, efterNamn, telefonNr, ePost)
VALUES (6,"Raita", "Haina", "0910234i1", "fjdal@gmail.com");
select * from kunder

#update booking
update bokning set kundNr = (SELECT kundNr FROM kunder WHERE forNamn = 'Adam') where bokningsNr = 1;
select * from bokning

#update booking
update orderinfo set behandlingsTidDatum = "2023-02-12 12:00:00" where bokningsNr = 1 and behandlingsInfoID = 1;
select * from orderinfo


#update booking time based on person name and the date they booked
update orderinfo set behandlingsTidDatum = "2023-02-12 15:30:00" 
where bokningsNr IN (SELECT bokningsNr from bokning WHERE bokningsDatum = "2022-06-12" 
and  kundNr IN (select kundNr from kunder where forNamn = "Olivia"));
select * from orderinfo

#visar alla behandlingstider en frisör har
SELECT o.behandlingsTidDatum, p.forNamn
FROM orderinfo o
JOIN personal p ON o.personalNr = p.personalNr
WHERE p.personalNr = (SELECT personalNr FROM personal WHERE forNamn = 'Max');


#update the comments on a booking based on
#a customer name, which salong, as well as the year and month of the booking
update bokning set kommentar = ("Ny text här") 
where kundNr in (select kundNr from kunder where forNamn = "Adam")
and salongNr  = 2
and YEAR(bokningsDatum) = 2023
and MONTH(bokningsDatum) = 1;
select * from bokning



SELECT b.bokningsDatum, k.forNamn
FROM bokning b
JOIN kunder k ON b.kundNr = b.kundNr
WHERE k.forNamn = "Adam";

 kundNr = (SELECT kundNr FROM kunder WHERE forNamn = 'Adam') where bokningsNr = 1;
select * from bokning

select * from bokning
#Hittar en bokningsdatum med x kundnamn
SELECT b.bokningsDatum, k.forNamn
FROM bokning b
JOIN kunder k ON b.kundNr = b.kundNr
WHERE k.forNamn = "Adam";

#Lägga till en ny leverantör i systemet
INSERT INTO leverantor (leverantorNr, telefonNr, leverantorNamn)
VALUES (5,"43240329", "ABsäljaren");
select * from leverantor


#Ändra lön-nivå på en personal
UPDATE foretags_anstalld
SET lon = 28000
WHERE personalNr IN (
  SELECT personalNr
  FROM personal
  WHERE forNamn = 'Jenny'
  AND eferNamn = "Krapp"
);
select * from foretags_anstalld


#Visa antal försäljningar under en viss tidsperiod
SELECT count(*) AS total_sales
FROM produktforsaljning
WHERE YEAR(forsaljningsDatum) = 2022
GROUP BY YEAR(forsaljningsDatum);

#Hitta totalbelopp på försäljningarna
SELECT sum(forsaljningsPris)
FROM produktforsaljning

#Hitta antal anställda på x salong
SELECT COUNT(*) AS number_staff
FROM personal
WHERE salongNr = 1;

#Hitta namn på anställda på x salong
SELECT p.forNamn
FROM personal p 
JOIN salonger s ON p.salongNr = s.salongNr
WHERE s.salongNr = 1;

#Hitta antal saldo av x produkt
select p.saldo, p.produktTyp from produkter p
where produktTyp = "Sax"


#Hitta totalbelopp av alla bokningar per salong
SELECT SUM(f.totalPris) AS total_pris_per_salong
FROM faktura f
JOIN bokning b ON f.bokningsNr = b.bokningsNr
JOIN salonger s ON b.salongNr = s.salongNr
WHERE s.salongNr = 1;

select * from kunder
#göra bokning, en bokning med flera behandlingar. kopplar namn på kund till kundnr:et i bokningen
INSERT INTO bokning (bokningsNr, kundNr, salongNr, bokningsDatum, kommentar)
VALUES (11, (SELECT kundNr FROM kunder WHERE forNamn = 'Adam'), 2, "2023-05-21", "-");
INSERT INTO orderinfo(orderInfoNr, behandlingsInfoID, bokningsNr, behandlingsTidDatum, personalNr)
VALUES (7, 2, 11, "23-07-12 10:00:0", (SELECT personalNr FROM personal WHERE forNamn = 'Max'));
INSERT INTO orderinfo(orderInfoNr, behandlingsInfoID, bokningsNr, behandlingsTidDatum, personalNr)
VALUES (8, 1, 11, "23-07-12 12::00", (SELECT personalNr FROM personal WHERE forNamn = 'Max'));
select * from orderinfo

select * from produktforsaljning
#Visa antal försäljningar under en viss tidsperiod per salong
SELECT YEAR(forsaljningsDatum) AS sales_year, COUNT(*) AS total_sales, salongNr as salong_nummer
FROM produktforsaljning
WHERE YEAR(forsaljningsDatum) = 2022 
GROUP BY YEAR(forsaljningsDatum), salongNr;
