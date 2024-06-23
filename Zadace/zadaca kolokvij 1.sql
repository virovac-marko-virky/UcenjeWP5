use master;
go
drop database if exists familija;
go
create database familija collate Croatian_CI_AS;
go

use familija;


create table sestra(
sifra int not null primary key identity(1,1),
introvertno bit,
haljina varchar(50) not null,
maraka decimal(16,6),
hlace varchar(50) not null,
narukvica int not null
);

create table zena(
sifra int not null primary key identity(1,1),
treciputa datetime,
hlace varchar(50),
kratkamajica varchar(50) not null,
jmbag char(11) not null,
bojaociju varchar(50) not null,
haljina varchar(50),
sestra int not null,
foreign key (sestra) references sestra(sifra)
);

create table muškarac(
sifra int not null primary key identity(1,1),
bojaociju varchar(50) not null,
hlace varchar(50),
modelnaocala varchar(50),
maraka decimal(14,5) not null,
zena int not null,
foreign key (zena) references zena(sifra)
);

create table mladic(
sifra int not null primary key identity(1,1),
suknja varchar(50) not null,
kuna decimal(16,8) not null,
drugiputa datetime,
asocijalno bit,
ekstroventno bit not null,
dukserica varchar(50) not null,
muskarac int,
foreign key (muskarac) references muškarac(sifra)
);

create table punac(
sifra int not null primary key identity(1,1),
ogrlica int,
gustoca decimal(14,9),
hlace varchar(50) not null
);

create table cura(
sifra int not null primary key identity(1,1),
novcica decimal(16,5) not null,
gustoca decimal(18,6) not null,
lipa decimal(13,10),
ogrlica int not null,
bojakose varchar(50),
suknja varchar(50),
punac int,
foreign key (punac) references punac(sifra)
);

create table svekar(
sifra int not null primary key identity(1,1),
bojaociju varchar(50) not null,
prstena int,
dukserica varchar(50),
lipa decimal(13,8),
eura decimal(12,7),
majica varchar(50)
);



create table sestra_svekar(
sifra int not null primary key identity(1,1),
sestra int not null,
svekar int not null,
foreign key (sestra) references sestra(sifra),
foreign key (svekar) references svekar(sifra)
);

select * from sestra;


insert into sestra (introvertno, haljina, maraka, hlace, narukvica) 
values (1, 'Plava', 100.12, 'Crne', 1);
insert into sestra (introvertno, haljina, maraka, hlace, narukvica) 
values (2, 'Crna', 125.50, 'Bijele', 2);
insert into sestra (introvertno, haljina, maraka, hlace, narukvica) 
values (3, 'Bijela', 99.99, 'Zelene', 3);

select * from zena;

insert into zena (treciputa,hlace,kratkamajica,jmbag,bojaociju,haljina,sestra)
values ('2020-10-26','Crne','Bijela','12345678901','Plave','Crvena',1);
insert into zena (treciputa,hlace,kratkamajica,jmbag,bojaociju,haljina,sestra)
values ('2015-07-11','Bijele','Bijela','12345678902','Smedje','Roza',2);
insert into zena (treciputa,hlace,kratkamajica,jmbag,bojaociju,haljina,sestra)
values ('2024-01-24','Zelene','Plava','12345678903','Roze','Bijela',3);

select * from muškarac;

insert into muškarac (bojaociju,hlace,modelnaocala,maraka,zena)
values ('Smeđe', 'Traperice', 'Ray-Ban', 200.50, 1);
insert into muškarac (bojaociju,hlace,modelnaocala,maraka,zena)
values ('Plave', 'Kratke-hlace', 'Nike', 50.20, 2);
insert into muškarac (bojaociju,hlace,modelnaocala,maraka,zena)
values ('Zelene', 'Radne_hlace', 'Carrera', 127.19, 3);

select * from mladic;

insert into mladic (suknja, kuna, drugiputa, asocijalno, ekstroventno, dukserica, muskarac) 
values ('Mini', 428.30, '2024-05-29', 0, 1, 'Crvena', 1);
insert into mladic (suknja, kuna, drugiputa, asocijalno, ekstroventno, dukserica, muskarac) 
values ('Duga', 180.30, '2023-05-29', 1, 1, 'Plava', 2);
insert into mladic (suknja, kuna, drugiputa, asocijalno, ekstroventno, dukserica, muskarac) 
values ('Kratka', 220.80, '2019-05-29', 1, 0, 'Crna', 3);

select * from punac;

insert into punac (ogrlica, gustoca, hlace) 
values (3, 400.123456789, 'Traperice');
insert into punac (ogrlica, gustoca, hlace) 
values (2, 210.123456789, 'Kratke-hlace');
insert into punac (ogrlica, gustoca, hlace) 
values (1, 88.123456789, 'Duge-hlace');

select * from cura;

insert into cura (novcica, gustoca, lipa, ogrlica, bojakose, suknja, punac) 
values (500.12345, 600.123456, 700.1234567890, 1, 'Plava', 'Mini', 1);
insert into cura (novcica, gustoca, lipa, ogrlica, bojakose, suknja, punac) 
values (340.12345, 900.123456, 200.1234567890, 2, 'Smedja', 'Duga', 2);
insert into cura (novcica, gustoca, lipa, ogrlica, bojakose, suknja, punac) 
values (158.12345, 400.123456, 330.1234567890, 3, 'Crvena', 'Kratka', 3);

select * from svekar;

insert into svekar (bojaociju, prstena, dukserica, lipa, eura, majica) 
values ('Plave', 2, 'Zelena', 800.12345678, 900.1234567, 'Bijela');
insert into svekar (bojaociju, prstena, dukserica, lipa, eura, majica) 
values ('Zelene', 3, 'Plava', 600.12345678, 300.1234567, 'Plava');
insert into svekar (bojaociju, prstena, dukserica, lipa, eura, majica) 
values ('Plave', 1, 'Crna', 150.12345678, 100.1234567, 'Zelene');

select *from sestra_svekar;

insert into sestra_svekar (sestra, svekar) 
values (1, 1);
insert into sestra_svekar (sestra, svekar) 
values (1, 2);
insert into sestra_svekar (sestra, svekar) 
values (1, 3);

select z.sifra as ZenaSifra, s.haljina as SestraHaljina
from zena z
inner join sestra s on z.sestra = s.sifra;

select m.sifra as MuskaracSifra, z.kratkamajica as ZenaMajica
from muškarac m
inner join zena z on m.zena = z.sifra;

select ml.suknja as MladicSuknja, m.bojaociju as MuskaracBojaOciju
from mladic ml
inner join muškarac m on ml.muskarac = m.sifra;

select c.bojakose as CuraBojaKose, p.hlace as PunacHlace
from cura c
inner join punac p on c.punac = p.sifra;

select ss.sifra as SestraSvekarSifra, s.haljina as SestraHaljina, sk.bojaociju as SvekarBojaOciju
from sestra_svekar ss
inner join sestra s on ss.sestra = s.sifra
inner join svekar sk on ss.svekar = sk.sifra;

update cura
set gustoca = 15.77;

delete from mladic
where kuna > 15.78;

select kratkamajica
from zena
where hlace like '%ana%';

select svekar.dukserica, mladic.asocijalno, muškarac.hlace
from svekar
inner join mladic on svekar.sifra = mladic.muskarac
inner join muškarac on muškarac.sifra = mladic.muskarac
inner join zena on muškarac.zena = zena.sifra
inner join sestra on zena.sestra = sestra.sifra
where zena.hlace like 'a%'
and sestra.haljina like '%ba%'
order by muškarac.hlace desc;

use familija;

select sestra.haljina, sestra.maraka
from sestra
left join sestra_svekar on sestra.sifra = sestra_svekar.sestra
where sestra_svekar.sifra is null;














