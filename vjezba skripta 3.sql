use master;
go

drop database if exists samostan;
go

create database samostan collate Croatian_CI_AS;
go

use samostan;

create table svecenici(
sifra int not null primary key identity(1,1),
ime varchar(50) not null,
prezime varchar(50) not null,
nadređeni varchar(50) not null
);

select * from svecenici;

insert into svecenici(ime,prezime,nadređeni)
values ('Ante', 'Guberina', 'Don Viktor');
insert into svecenici(ime,prezime,nadređeni)
values ('Mirko', 'Vulina', 'Don Gabrijel');
insert into svecenici(ime,prezime,nadređeni)
values ('Valent', 'Skender', 'Don Martin');

