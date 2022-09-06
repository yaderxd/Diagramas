--CRUD:Ingresar,Dar baja,MOdificar,buscar y listar
use SFCIB
go

select*from Deptos
alter table Deptos add EstadoD bit default 1
update Deptos set EstadoD=1

create procedure NDpto
@ND nvarchar (48)
as
declare @nde as nvarchar(48)
set @nde=(select NombreDpto from Deptos
where NombreDpto = @ND)
if(@ND='')
begin 
print 'No puede ser nulo'
end
else 
begin
    if(@ND=@nde)
	begin
	print 'Dato duplicado'
	end 
	else 
	begin
	   insert into Deptos values(@ND,1)
	   end
end

select * from Deptos
NDpto'Leon'

--Dar Baja

create procedure BDpto 
@ID int 
as 
declare @iddpet as int
set @iddpet= (select Id_Dptos from Deptos where Id_Dptos=@ID)
if(@iddpet =@ID)
begin
   update Deptos set EstadoD=0 where Id_Dptos=@ID
   end
   else
   begin
     print 'Departamento no encontrado'
	 end

BDpto 4
select *from Deptos

--Insercion Municipios
create procedure NMunx
@NM nvarchar(45),
@IDD int
as 
declare @iddept as int
set @iddept=(select Id_Dptos from Deptos where Id_Dptos=@IDD)
if(@NM='')
begin
   print 'No puede ser nula'
   end
   else
   begin
   if(@IDD=@iddept)
   begin
   insert into Municipios Values (@NM,@IDD)
   end
   else
   begin 
     print 'Dpto no registrado Papu'
	 end
end

select*from Deptos 
NMun 'Leon',4

--Buscar Depto
create procedure BuscarD
@ID int 
as
declare @idd as int
set @idd=(select Id_Dptos from Deptos where Id_Dptos=@ID)
if(@ID=@idd)
begin
   select *from Deptos where Id_Dptos=@ID
   end
   else
   begin
   print 'Depto no encontrado'
   end

select*from Deptos
BuscarD 2

--lISTAR Deptos
alter procedure Listar0
create procedure Listar0
as
select*from Deptos

Listar0

--Modificacion o Actualizacion
create procedure MDpto
@ID int,
@ND nvarchar(48)
as
declare @idd as int 
set @idd=(select Id_Dptos from Deptos where Id_Dptos=@ID)
if(@ID=@idd)
begin 
if(@ND='')
begin
 print 'No puede ser nulo '
 end
 else
 begin
     update Deptos set NombreDpto=@ND where Id_Dptos=@ID and EstadoD=1
	 end
	 end
	 else
	 begin
	    print 'Depto no encontrado'
		end

MDpto 4,'Matagalpa'
select*from Deptos
backup database SFICIB to disk ='D:\SFICIB.Bak'
