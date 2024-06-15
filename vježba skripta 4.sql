use master;
go

drop database if exists hrvatska;
go

create database hrvatska collate Croatian_CI_AS;
go

use hrvatska;

create table zupan(
sifra int not null primary key identity(1,1),
ime varchar(50),
prezime varchar(50)
);


create table zupanija(
sifra int not null primary key identity(1,1),
naziv varchar(50) not null,
zupan int not null,
foreign key (zupan) references zupan(sifra)
);

create table opcina(
sifra int not null primary key identity(1,1),
zupanija int not null,
naziv varchar(50),
foreign key (zupanija) references zupanija(sifra)
);

create table mjesto(
sifra int not null primary key identity(1,1),
opcina int not null,
naziv varchar(50 ) not null,
foreign key (opcina) references opcina(sifra)
);

select * from zupan;

insert into zupan (ime,prezime)
values ('Marko', 'Virovac'), ('Vesna', 'Delic'), ('Mišo', 'Savanovic');

select * from zupanija;

insert into zupanija (naziv,zupan)
values ('Zagrebacka',1), ('Osjecko-baranjska',2), ('Splitsko-dalmatinska',3);

select * from opcina;

insert into opcina (zupanija,naziv)
values (1,'Dubrava'), (1,'Dubravica'), (2,'Donji-Miholjac'), (2,'Antunovac'), (3,'Brela'), (3,'Bol');

select * from mjesto;

insert into mjesto (opcina,naziv)
values (1,'Donji-Marinkovac'), (1,'Novaki'), (1,'Prosinec'), (1,'Lugarski-Breg'), (2,'Sveti djuradj'), (2,'Viljevo'),
(2,'Rakitovica'), (2,'Podravska-Moslavina'), (3,'Dugopolje'), (3,'Koprivno'), (3,'Kotlenice'), (3,'Liska');

select * from mjesto;
 update mjesto set naziv = 'Crnkovci' where sifra = 5;
 update mjesto set naziv = 'Veliskovci' where sifra = 6;
 update mjesto set naziv = 'Zagreb' where sifra = 1;
 update mjesto set naziv = 'Karlovac' where sifra = 2;
 update mjesto set naziv = 'Split' where sifra = 4;

 select * from opcina;

 delete from opcina where sifra = 5;
 delete from opcina where sifra = 6;




