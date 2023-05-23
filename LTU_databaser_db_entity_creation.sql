#Assignment May 2023
#By Olivia Fabreschi

#Creating the database
CREATE DATABASE salong;
use salong;

#done
CREATE TABLE leverantor(
leverantorNr integer NOT NULL,
telefonNr varchar(50),
leverantorNamn Varchar(50),
 PRIMARY KEY (leverantorNr)
);

#done
CREATE TABLE produkter(
artikelNr integer NOT NULL,
produktTyp varchar(50),
pris integer NOT NULL,
storlek integer NOT NULL,
saldo integer NOT NULL,
 PRIMARY KEY (artikelNr)
);

# done 
CREATE TABLE produktbestallningsinfo(
pbID integer NOT NULL,
leverantorNr integer NOT NULL,
bestallningsNr integer NOT NULL,
artikelNr integer NOT NULL,
antal integer NOT NULL,
PRIMARY KEY (pbID),
FOREIGN KEY (leverantorNr) REFERENCES leverantor(leverantorNr),
FOREIGN KEY (artikelNr) REFERENCES produkter(artikelNr)

);

alter table produktbestallningsinfo
ADD FOREIGN KEY (bestallningsNr) REFERENCES produktbestallning(bestallningsNr);


# done 
CREATE TABLE produktforsaljningsinfo(
pfID integer NOT NULL,
leverantorNr integer NOT NULL,
forsaljningsNr integer NOT NULL,
artikelNr integer NOT NULL,
antal integer NOT NULL,
PRIMARY KEY (pfID),
FOREIGN KEY (artikelNr) REFERENCES produkter(artikelNr),
FOREIGN KEY (forsaljningsNr) REFERENCES produktforsaljning(forsaljningsNr)
);

# done 
CREATE TABLE produktforsaljning(
forsaljningsNr integer NOT NULL,
salongNr integer NOT NULL,
forsaljningsPris integer NOT NULL,
forsaljningsDatum date NOT NULL,
PRIMARY KEY (forsaljningsNr),
FOREIGN KEY (salongNr) REFERENCES salonger(salongNr)
);

#done 
CREATE TABLE produktbestallning(
bestallningsNr integer NOT NULL,
salongNr integer NOT NULL,
bestallningsPris integer NOT NULL,
bestallningsDatum datetime NOT NULL,
PRIMARY KEY (bestallningsNr),
FOREIGN KEY (salongNr) REFERENCES salonger(salongNr)
);

# done 
CREATE TABLE salonger(
salongNr integer NOT NULL,
personalNr integer NOT NULL,
postNr integer NOT NULL,
telefonNr varchar(50),
PRIMARY KEY (salongNr),
FOREIGN KEY (personalNr) REFERENCES Personal(personalNr),
FOREIGN KEY (postNr) REFERENCES adress(postNr)
);

alter table salonger
ADD FOREIGN KEY (personalNr) REFERENCES personal(personalNr);

# done 
CREATE TABLE adress(
postNr integer NOT NULL,
gatuSiffra integer NOT NULL,
GatuAdress varchar(50),
PRIMARY KEY (postNr)
);

#done 
CREATE TABLE personal(
personalNr integer NOT NULL,
postNr integer NOT NULL,
forNamn varchar(50),
eferNamn varchar(50),
PRIMARY KEY (personalNr)
);

CREATE TABLE egen_anstalld(
personalNr integer NOT NULL,
hyra integer NOT NULL,
PRIMARY KEY (personalNr),
FOREIGN KEY (personalNr) REFERENCES personal(personalNr)
);

CREATE TABLE foretags_anstalld(
personalNr integer NOT NULL,
lon integer NOT NULL,
PRIMARY KEY (personalNr),
FOREIGN KEY (personalNr) REFERENCES personal(personalNr)
);


#done 
CREATE TABLE bokning(
bokningsNr integer NOT NULL,
fakturaNr integer NOT NULL,
kundNr integer NOT NULL,
salongNr integer NOT NULL,
bokningsDatum date NOT NULL,
kommentar varchar(100),
eferNamn varchar(50),
PRIMARY KEY (bokningsNr),
FOREIGN KEY (fakturaNr) REFERENCES faktura(fakturaNr),
FOREIGN KEY (kundNr) REFERENCES kunder(kundNr)
);

alter table bokning
add foreign key  (salongNr) REFERENCES salonger(salongNr);

# done 
CREATE TABLE faktura(
fakturaNr integer NOT NULL,
betalningsmetod ENUM("kort", "kredit", "cash"),
pris integer NOT NULL,
PRIMARY KEY (fakturaNr)
);


# done 
CREATE TABLE kunder(
kundNr integer NOT NULL,
forNamn varchar(50),
efterNamn varchar(50),
telefonNr varchar(50),
ePost varchar(50),
PRIMARY KEY (kundNr)
);

# done 
CREATE TABLE orderInfo(
orderInfoNr integer NOT NULL,
behandlingsInfoID integer NOT NULL,
bokningsNr integer NOT NULL,
behandlingsTidDatum datetime NOT NULL,
PRIMARY KEY (orderInfoNr),
FOREIGN KEY (behandlingsInfoID) REFERENCES behandlingsInfo(behandlingsInfoID),
FOREIGN KEY (bokningsNr) REFERENCES bokning(bokningsNr)
);

alter table orderInfo
add COLUMN personalNr integer,
ADD FOREIGN KEY (personalNr) REFERENCES personal(personalNr);

# done 
CREATE TABLE behandlingsInfo(
behandlingsInfoID integer NOT NULL,
behandlingsTyp varchar(50),
behandlinngsPris integer NOT NULL,
behandlingsLangd time NOT NULL,
PRIMARY KEY (behandlingsInfoID)
);

ALTER TABLE personal
drop column postNr

alter table personal
add column salongNr integer NOT NULL;
#
#alter table personal


alter table bokning drop foreign key bokning_ibfk_1;
alter table salonger drop column personalNr;

alter table bokning drop column fakturaNr

alter table faktura drop column pris;

alter table faktura add foreign key (bokningsNr) REFERENCES bokning(bokningsNr);

select * from bokning

alter table personal
ADD FOREIGN KEY (salongNr) REFERENCES salonger(salongNr);


