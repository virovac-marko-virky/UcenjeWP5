use master;
go
drop database if exists tvrtka;
go
create database tvrtka collate Croatian_CI_AS;
go

use tvrtka;

create table zaposlenici(
sifra int not null primary key identity(1,1),
ime varchar(50) not null,
prezime varchar(50) not null,
datumrodjenja datetime not null,
placa int,
invalid bit
);
create table slike(
sifra int not null primary key identity(1,1),
zaposlenik int not null,
rednibroj int,
putanja nvarchar(255),
foreign key (zaposlenik) references zaposlenici(sifra)
);

select * from zaposlenici;

insert into zaposlenici (ime,prezime,datumrodjenja,placa,invalid)
values ('Marko', 'Virovac', '1981-10-26',850.20,1)
insert into zaposlenici (ime,prezime,datumrodjenja,placa,invalid)
values ('Vesna', 'Delic', '1978-07-18',1200.30,1)
insert into zaposlenici (ime,prezime,datumrodjenja,placa,invalid)
values ('Dinko', 'Mikicic', '1981-12-12',1500.00,2)

select * from slike;

INSERT INTO slike (zaposlenik, rednibroj, putanja)
VALUES 
(1, 1, 'C:\\putanja\\slika1_marko.jpg'),
(1, 2, 'C:\\putanja\\slika2_marko.jpg'),
(2, 1, 'C:\\putanja\\slika1_vesna.jpg'),
(2, 2, 'C:\\putanja\\slika2_vesna.jpg'),
(3, 1, 'C:\\putanja\\slika1_dinko.jpg'),
(3, 2, 'C:\\putanja\\slika2_dinko.jpg');



