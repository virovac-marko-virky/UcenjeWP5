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
datumposudbe datetime
);

alter table posudba add foreign key (sifrafilma) references filmovi(sifra);
alter table posudba add foreign key (sifraclana) references clanovi(sifra);

select * from clanovi;

insert into clanovi (ime,prezime,email)
values ('Marko','Virovac','marko@gmail.com');
insert into clanovi (ime,prezime,email)
values ('Vesna','Delić','vesnad@gmail.com');
insert into clanovi (ime,prezime,email)
values ('Vladimir','Bajtl','vladbajtl@gmail.com');

insert into clanovi (ime) values ('ČŠĆĐŽ čšćđž');


select * from filmovi;

insert into filmovi (naziv,zanr,godinaizdanja,vrijemetrajanja)
values ('Thing','SC-FI',1979,125);
insert into filmovi (naziv,zanr,godinaizdanja,vrijemetrajanja)
values ('Alien','SC-FI',1980,119);
insert into filmovi (naziv,zanr,godinaizdanja,vrijemetrajanja)
values ('The Shaining','Horror',1981,105);



insert into posudba (sifraclana, sifrafilma, datumposudbe)
values (1, 1, '2023-01-01'),
       (1, 2, '2023-01-02'),
       (2, 1, '2023-01-03'),
       (3, 3, '2023-01-04');



select c.ime as clan, f.naziv as film, p.datumposudbe
from clanovi c
inner join posudba p on c.sifra = p.sifraclana
inner join filmovi f on p.sifrafilma = f.sifra;

select c.ime as clan, f.naziv as film, p.datumposudbe
from clanovi c
left join posudba p on c.sifra = p.sifraclana
left join filmovi f on p.sifrafilma = f.sifra;









































