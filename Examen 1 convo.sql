create database Cinemark
go

create table Taquilla(
Id_Ticket int identity(1,1)primary key not null,
Sala int not null,
Producto_combo nvarchar(30) not null,
Extra nvarchar(30) not null,
Venta int not null,
Fecha datetime not null,
Horario datetime not null,
)

create table PeliculaSala(
Id_Pelicula int identity(1,1) primary key not null,
NombrePelicula nvarchar (20) not null,
Sipnosis nvarchar(100) not null,
Clasificacion nvarchar(20) not null,
Duracion datetime not null
)

create table Asiento(
Id_Asiento int identity(1,1) primary key not null,
Fila int not null,
Sala int foreign key references PeliculaSala(Id_Pelicula) not null,
)

create table Detalles(
Id_Venta int foreign key references Taquilla(Id_Ticket) not null,
Asiento int foreign key references Asiento(Id_Asiento) not null,
)

insert into Taquilla(Id_Ticket,Sala,Producto_combo,Extra,Venta,Fecha,Horario) values (1,1,'Combo 1','Hot Dog',356,'11/09/2022','10:30')

insert into PeliculaSala(Id_Pelicula,NombrePelicula,Sipnosis,Clasificacion,Duracion) values(1,'Dead Space','Sipnosis','Para mayores de 18 años','2:45')

insert into Asiento(Id_Asiento,Fila) values(1,1)

alter table Detalles add EstadoD bit default 1

update Detalles set EstadoD=1

create procedure NCombo
@Ticket char(200),
@Producto nvarchar(30),
@Extra nvarchar(30),
@Precio int not null,
@Horario datetime not null,
@NombrePelicula nvarchar(20) not null,
@Sipnosis nvarchar(100) not null,
@Clasificacion nvarchar(20) not null,
@Duracion datetime not null,
@Asiento char(200) not null,
@Sala int not null,
@Fila int not null
as
declare @IDCOL as char(200)
set @IDCOL=(Select Id_Venta from Detalles 
where Id_Venta=@Ticket)
declare @IDC as char(200)
set @IDC=(select Asiento from Detalles 
where Asiento=@Asiento)
begin
print 'Cliente Registrado'
end
begin
if(@Ticket='' or @Precio='' or @Asiento='' or @Fila='' or @Horario='')
begin
print 'No puede ser nulo'
end
begin try
declare @Precio int;
set @Precio = 500;
select @Precio/2
print 'Descuento por pago mayor'
end try
begin catch
select
ERROR_NUMBER() AS 'No se permite escribir Letra'
end catch
end

create procedure Listarg
as
select * from Detalles where EstadoD=1

create procedure Actualizar
@Ticket char(200),
@Producto nvarchar(30),
@Extra nvarchar(30),
@Precio int not null,
@Horario datetime not null,
@NombrePelicula nvarchar(20) not null,
@Sipnosis nvarchar(100) not null,
@Clasificacion nvarchar(20) not null,
@Duracion datetime not null,
@Asiento char(200) not null,
@Sala int not null,
@Fila int not null
as
declare @IDCOL as char(200)
set @IDCOL=(Select Id_Venta from Detalles 
where Id_Venta=@Ticket)
declare @IDC as char(200)
set @IDC=(select Asiento from Detalles 
where Asiento=@Asiento)
if(@IDCOL=@Ticket)
begin
  if(@Ticket='' or @Precio='' or @Asiento='' or @Fila='' or @Horario='')
  begin
    print 'No puede ser nulo'
  end
  else
  begin
    update Detalles set Id_Venta=@Ticket where Id_Venta=@Ticket and EstadoD=1
  end
end
else
begin
  print 'Sala de cine no encontrado'
end

create procedure BuscarSala
@Asiento char(200) not null
as
declare @idd as char(200)
set @idd=(select Asiento from Detalles where Asiento=@Asiento)
if(@Asiento=@idd)
begin
  select * from Detalles where Asiento=@Asiento
end
else
begin
  print 'Asiento no encontrado'
end

create procedure InsercionDetalles
@Ticket char(200),
@Producto nvarchar(30),
@Extra nvarchar(30),
@Precio int not null,
@Horario datetime not null,
@NombrePelicula nvarchar(20) not null,
@Sipnosis nvarchar(100) not null,
@Clasificacion nvarchar(20) not null,
@Duracion datetime not null,
@Asiento char(200) not null,
@Sala int not null,
@Fila int not null
as
declare @IDCOL as char(200)
set @IDCOL=(Select Id_Venta from Detalles 
where Id_Venta=@Ticket)
declare @IDC as char(200)
set @IDC=(select Asiento from Detalles 
where Asiento=@Asiento)
if(@IDCOL=@Ticket)
if(@Ticket='')
begin
  print 'No puede ser nulo'
end
else
begin
  if(@Ticket=@IDC)
  begin
    insert into Municipios values(@Ticket,@Producto,@Extra,@Precio,@Horario,@NombrePelicula,@Sipnosis,@Clasificacion,@Duracion,@Asiento,@Sala,@Fila)
  end
  else
  begin
    print 'Datos no registrados'
  end
end