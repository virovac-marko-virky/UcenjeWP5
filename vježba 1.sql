use master;
go
drop database if exists opcine;
go
create database opcine;
go
use opcine;

create table nacelnici(
sifra int not null primary key identity(1,1),
ime varchar(50) not null,
prezime varchar(50) not null,
datrodjenja datetime not null
);

select * from nacelnici;

insert into nacelnici (ime,prezime,datrodjenja)
values ('Stjepan','Viduka','1974-08-01');
insert into nacelnici (ime,prezime,datrodjenja)
values ('Ana','Kovac','1970-01-10');
insert into nacelnici (ime,prezime,datrodjenja)
values ('Marko','Virovac','1981-10-26');









