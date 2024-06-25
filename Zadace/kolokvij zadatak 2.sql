use master;
go

drop database if exists veza;
go

create database veza COLLATE Croatian_CI_AS;
go

use veza;

create table decko(
sifra int not null primary key identity(1,1),
indiferentno bit,
vesta varchar(50),
asocijalno bit not null
);


create table cura(
sifra int not null primary key identity(1,1),
haljina varchar(50) not null,
drugiputa datetime not null,
suknja varchar(50),
narukvica int,
introvertno bit,
majica varchar(50) not null,
decko int,
foreign key (decko) references  decko (sifra)
);

create table neprijatelj(
sifra int not null primary key identity(1,1),
majica varchar(50),
haljina varchar(50) not null,
lipa decimal(16,2),
modelnaocala varchar(50) not null,
kuna decimal(12,2) not null,
jmbag char(11),
cura int,
foreign key (cura) references cura(sifra)
);



create table brat(
sifra int not null primary key identity(1,1),
suknja varchar(50),
ogrlica int not null,
asocijalno bit not null,
neprijatelj int,
foreign key (neprijatelj) references  neprijatelj(sifra)
);

create table zarucnica(
sifra int not null primary key identity(1,1),
narukvica int,
bojakose varchar(50) not null,
novcica decimal(15,2),
lipa decimal(15,2) not null,
indiferentno bit not null
);

create table decko_zarucnica(
sifra int not null primary key identity(1,1),
decko int not null,
zarucnica int not null,
foreign key(decko) references decko(sifra),
foreign key(zarucnica) references zarucnica(sifra)
);


create table svekar(
sifra int primary key identity(1,1),
stilfrizura varchar(50),
ogrlica int not null,
asocijalno int not null,
);

create table prijatelj(
sifra int not null primary key identity(1,1),
modelnaocala varchar(50),
treciputa datetime not null,
ekstroventno bit not null,
prviputa datetime,
svekar int not null,
foreign key (svekar) references svekar(sifra)
);

select * from decko;

insert into decko(indiferentno,vesta,asocijalno)
values (1,'Plava Vesta',1)
insert into decko(indiferentno,vesta,asocijalno)
values (0,'Crna Vesta',1)
insert into decko(indiferentno,vesta,asocijalno)
values (1,'Zelena Vesta',0);

select * from cura;

insert into cura(haljina,drugiputa,suknja,narukvica,introvertno,majica,decko)
values ('Roza Haljina','2019-10-10','Plava Suknja',1,0,'Zelena Majica',1)
insert into cura(haljina,drugiputa,suknja,narukvica,introvertno,majica,decko)
values ('Crna Haljina','2011-11-11','Crna Suknja',1,0,'Plava Majica',2)
insert into cura(haljina,drugiputa,suknja,narukvica,introvertno,majica,decko)
values ('Bijela Haljina','2023-05-05','Žuta Suknja',3,1,'Oker Majica',3);


select * from neprijatelj;

insert into neprijatelj(majica,haljina,lipa,modelnaocala,kuna,jmbag,cura)
values ('Bijela','Crna',145.22,'Model 1',500.50,'26109813007',1)
insert into neprijatelj(majica,haljina,lipa,modelnaocala,kuna,jmbag,cura)
values ('Ljubičasta','Roza',750.99,'Model 2',330.50,'26109843007',2)
insert into neprijatelj(majica,haljina,lipa,modelnaocala,kuna,jmbag,cura)
values ('Crna','Bijela',99.99,'Model 3',100.70,'76109813003',3);

select * from brat;

insert into brat (suknja, ogrlica, asocijalno, neprijatelj)
values ('Crna', 1, 0, 1)
insert into brat (suknja, ogrlica, asocijalno, neprijatelj)
values ('Roza', 1, 0, 2)
insert into brat (suknja, ogrlica, asocijalno, neprijatelj)
values ('Crna', 1, 0, 3);
       
select * from zarucnica;

insert into zarucnica(narukvica,bojakose,novcica,lipa,indiferentno)
values (1,'Plava',89.99,50.99,1)
insert into zarucnica(narukvica,bojakose,novcica,lipa,indiferentno)
values (2,'Crna',25.50,15.00,0)
insert into zarucnica(narukvica,bojakose,novcica,lipa,indiferentno)
values (3,'Crvena',126.49,35.00,1)

select * from decko_zarucnica;

insert into decko_zarucnica(decko,zarucnica)
values (1,1)
insert into decko_zarucnica(decko,zarucnica)
values (2,2)
insert into decko_zarucnica(decko,zarucnica)
values (3,3);

select * from svekar;

insert into svekar(stilfrizura,ogrlica,asocijalno)
values ('Kratka',1,1)
insert into svekar(stilfrizura,ogrlica,asocijalno)
values ('Duga',3,1)
insert into svekar(stilfrizura,ogrlica,asocijalno)
values ('Srednja',2,0);

select * from prijatelj;

insert into prijatelj(modelnaocala,treciputa,ekstroventno,prviputa,svekar)
values ('Model 1','2010-04-04',1,'2000-06-07',1)
insert into prijatelj(modelnaocala,treciputa,ekstroventno,prviputa,svekar)
values ('Model 2','1999-08-01',0,'1995-07-25',2)
insert into prijatelj(modelnaocala,treciputa,ekstroventno,prviputa,svekar)
values ('Model 3','2024-03-18',1,'2014-09-08',3);


select a.sifra as DeckoID, b.sifra as CuraID
from decko a
inner join cura b on a.sifra = b.decko;

select c.sifra  as NeprijateljID, d.sifra as CuraID
from neprijatelj c
inner join cura d on c.sifra = d.sifra;

