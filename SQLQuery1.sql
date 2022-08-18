create database Amazon
go
use Amazon
go

usuario/Admin
sp_addlogin 'Yader','HornetHot'
sp_addsrvrolemember 'Yader','sysadmin'

sp_adduser 'Yader','Phd'
sp_addsrvrolemember 'db_ddladmin','Phd'


create table Camioneros(
Id int identity (1,1) primary key,
Nombre nvarchar (15) not null,
Apellido nvarchar (15) not null,
FechaN datetime not null,
Sexo nvarchar (15) not null,
Telefono char(8) check(Telefono like '[2|5|7|8][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
Direccion nvarchar (75) not null,
Poblacion nvarchar (20) not null
)

create table Tipo(
NombreT nvarchar (30) not null,
)

create table Modelo(
NombreM nvarchar (30) not null,
)

create table Camion(
Matricula int not null,
TipoA nvarchar foreign key references Tipo(NombreT) not null,
Potencia int not null,
ModeloA nvarchar foreign key references Modelo(NombreM) not null
)

create table Paquete(
Codigo int identity (1,1) primary key not null,
NombreP nvarchar (15) not null,
FechaE datetime not null,
)

create table Remitente(
Codigo int identity (1,1) primary key,
NombreR nvarchar (15) not null,
Direccion nvarchar (70) not null,
Provincia nvarchar (25) not null
)