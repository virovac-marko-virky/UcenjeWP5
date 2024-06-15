use master;
go

drop database if exists hrvatska;
go

create database hrvatska collate Croatian_CI_AS;
go

use hrvatska;

create table župan(
šifra int not null primary key identity(1,1),
ime varchar(50),
prezime varchar(50)
);


create table županija(
šifra int not null primary key identity(1,1),
naziv varchar(50) not null,
župan int not null,
foreign key (župan) references župan(šifra)
);

create table opčina(
šifra int not null primary key identity(1,1),
županija int not null,
naziv varchar(50),
foreign key (županija) references županija(šifra)
);

create table mjesto(
šifra int not null primary key identity(1,1),
opčina int not null,
naziv varchar(50 ) not null,
foreign key (opčina) references opčina(šifra)
);

select * from župan;

insert into župan (ime,prezime)
values ('Marko', 'Virovac'), ('Vesna', 'Delić'), ('Mišo', 'Savanović');

select * from županija;

insert into županija (naziv,župan)
values ('Zagrebačka',1), ('Osječko-baranjska',2), ('Splitsko-dalmatinska',3);

select * from opčina;

insert into opčina (županija,naziv)
values (1,'Dubrava'), (1,'Dubravica'), (2,'Donji-Miholjac'), (2,'Antunovac'), (3,'Brela'), (3,'Bol');

select * from mjesto;

insert into mjesto (opčina,naziv)
values (1,'Donji-Marinkovac'), (1,'Novaki'), (1,'Prosinec'), (1,'Lugarski-Breg'), (2,'Sveti Đurađ'), (2,'Viljevo'),
(2,'Rakitovica'), (2,'Podravska-Moslavina'), (3,'Dugopolje'), (3,'Koprivno'), (3,'Kotlenice'), (3,'Liska');

select * from mjesto;
 update mjesto set naziv = 'Črnkovci' where šifra = 5;
 update mjesto set naziv = 'Veliškovci' where šifra = 6;
 update mjesto set naziv = 'Zagreb' where šifra = 1;
 update mjesto set naziv = 'Karlovac' where šifra = 2;
 update mjesto set naziv = 'Split' where šifra = 4;

 select * from opčina;

 delete from opčina where šifra = 5;
 delete from opčina where šifra = 6;




