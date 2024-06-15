use master;
go
drop database if exists videoteka;
go
create database videoteka;
go

use videoteka;

create table clanovi(
sifra int not null primary key identity(1,1),
ime varchar(50) not null,
prezime varchar(50),
email varchar(50)
);

create table filmovi(
sifra int not null primary key identity(1,1),
naziv varchar(50) not null,
zanr varchar(50),
godinaizdanja int,
vrijemetrajanja int
);

create table posudba(
sifra int not null primary key identity(1,1),
sifraclana int,
sifrafilma int,
datumposudbe datetime,
FOREIGN KEY (sifrafilma) REFERENCES filmovi(sifra),
FOREIGN KEY (sifraclana) REFERENCES clanovi(sifra)
);

alter table posudba add foreign key (sifrafilma) references filmovi(sifra);
alter table posudba add foreign key (sifraclana) references clanovi(sifra);

select * from clanovi;

-- 1 - 30

insert into clanovi (ime, prezime, email) VALUES
('Marko', 'Virovac', 'marko@gmail.com'),
('Vesna', 'Delić', 'vesnad@gmail.com'),
('Vladimir', 'Bajtl', 'vladbajtl@gmail.com'),
('ČŠĆĐŽ', 'čšćđž', NULL);


select * from filmovi;

insert into filmovi (naziv,zanr,godinaizdanja,vrijemetrajanja)
values ('Thing','SC-FI',1979,125);
insert into filmovi (naziv,zanr,godinaizdanja,vrijemetrajanja)
values ('Alien','SC-FI',1980,119);
insert into filmovi (naziv,zanr,godinaizdanja,vrijemetrajanja)
values ('The Shaining','Horror',1981,105);

select * from posudba;

insert into posudba (sifrafilma,sifraclana,datumposudbe) values
(1,1,'2024-06-07'),
(1,2,'2024-06-07'),
(1,3,'2024-06-07');

