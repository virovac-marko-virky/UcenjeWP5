use master;
go

drop database if exists webshop;
go

create database webshop;
go
use webshop;

create table proizvodi(
sifra int not null primary key identity(1,1),
naziv varchar(50) not null,
datumnabave datetime not null,
cijena decimal(15,2),
aktivan bit
);

create table racuni(
sifra int not null primary key identity(1,1),
datum datetime not null,
kupac int not null,
status bit
);

create table kupci(
sifra int not null primary key identity(1,1),
ime varchar(50) not null,
prezime varchar(50) not null,
ulica varchar(50),
mjesto varchar(50)
);

create table stavke(
sifra int not null primary key identity(1,1),
racun int not null,
proizvod int not null,
kolicina int,
cijena decimal(15,2)
);

alter table stavke add foreign key (proizvod) references proizvodi(sifra);
alter table stavke add foreign key (racun) references racuni(sifra);
alter table racuni add foreign key(kupac) references kupci(sifra);

select * from proizvodi;

insert into proizvodi (naziv,datumnabave,cijena,aktivan)
values ('Mobitel','2023-04-04',230.00,1);
insert into proizvodi (naziv,datumnabave,cijena,aktivan)
values ('Baterija','2023-02-01',25.00,1);
insert into proizvodi (naziv,datumnabave,cijena,aktivan)
values ('Futrola','2024-03-01',9.99,1);


select * from kupci;

insert into kupci (ime,prezime,ulica,mjesto)
values ('Marko','Virovac','Andrije Hebranga','Osijek');
insert into kupci (ime,prezime,ulica,mjesto)
values ('Ivan','Zuber','Trg Slobode','Valpovo');
insert into kupci (ime,prezime,ulica,mjesto)
values ('Natalija','Jurina','Vinska','Krapina');

select * from racuni;

insert into racuni (datum,kupac,status)
values ('2023-03-03',1,1)
insert into racuni (datum,kupac,status)
values ('2023-08-13',2,0)
insert into racuni (datum,kupac,status)
values ('2024-01-11',3,1)

select * from stavke;

insert into stavke (racun, proizvod, kolicina, cijena)
values (1,1,2,230.00)
insert into stavke (racun, proizvod, kolicina, cijena)
values (1,2,1,25.00)
insert into stavke (racun, proizvod, kolicina, cijena)
values (2,1,1,9.99)









