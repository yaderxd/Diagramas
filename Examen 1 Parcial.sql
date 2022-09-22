use  SVenta
go

select * from Consumidor

alter table Consumidor add Act bit default 1

update Consumidor set Act =1

--Agregar
create procedure MConsu
@ID int,
@PNC nvarchar(15),
@SNC nvarchar(15),
@PAC nvarchar(15),
@SAC nvarchar(15),
@Dir nvarchar(70),
@Pais nvarchar(20),
@SALDOZ float,
@SALDOA float
as
declare @nd as int
set @nd=(select Id_Cliente from Consumidor
where Id_Cliente=@ND)
if(@PNC='' or @SNC='' or @PAC='' or @SAC='' or @Dir='' or @Pais='' or @SALDOZ='' or @SALDOA='')
begin
  print 'No puede ser nulo'
end
else
begin
if(@ID=@nd)
  begin
    insert into Consumidor values(@PNC,@SNC,@PAC,@SAC,@Dir,@Pais,@SALDOZ,@SALDOA,1,@ID)
  end
  else
  begin
    print 'Cliente no registrado'
  end
end

select * from Consumidor

--Dar Baja

create procedure Baja
@ID int
as
declare @idd as int
set @idd=(select Id_Cliente from Consumidor where Id_Cliente=@ID)
if(@idd=@ID)
begin
  update Consumidor set Act =0 where Id_Cliente=@ID
end
else
begin
  print 'Cliente no encontrado'
end

select * from Consumidor

--Modificar

create procedure LMod
@PNC nvarchar(15),
@SNC nvarchar(15),
@PAC nvarchar(15),
@SAC nvarchar(15),
@Dir nvarchar(70),
@Pais nvarchar(20),
@SALDOZ float,
@SALDOA float,
@IDE int
as
declare @id as int
set @id=(select Id_Cliente from Consumidor where Id_Cliente=@IDE)
if(@PNC='' or @SNC='' or @PAC='' or @SAC='' or @Dir='' or @Pais='' or @SALDOZ='' or @SALDOA='')
begin
  print 'No puede ser nulo'
end
else
begin
  if(@IDE=@id)
  begin
    update Consumidor set PNC=@PNC,SNC=@SNC,PAC=@PAC,SAC=@SAC,Direccion=@Dir,Pais=@Pais,SaldoInic=@SALDOZ,SaldoAct=@SALDOA
	where Id_Cliente=@IDE and Act=1
	end
  else
  begin
    print 'Cliente no registrado'
  end
end

select * from Consumidor

--Buscar
create procedure Buscar
@IDC int
as
declare @idd as int
set @idd=(select Id_Cliente from Consumidor where Id_Cliente=@IDC)
if(@IDC=@idd)
begin
  select * from Consumidor where Id_Cliente=@IDC
end
else
begin
  print 'Cliente no encontrado'
end

--Insercion
create procedure CCrear
@PNC nvarchar(15),
@SNC nvarchar(15),
@PAC nvarchar(15),
@SAC nvarchar(15),
@Dir nvarchar(70),
@Pais nvarchar(20),
@SALDOZ float,
@SALDOA float,
@IDD int
as
declare @iddept as int
set @iddept=(select Id_Cliente from Consumidor where Id_Cliente=@IDD)
if(@PNC='' or @SNC='' or @PAC='' or @SAC='' or @Dir='' or @Pais='' or @SALDOZ='' or @SALDOA='')
begin
  print 'No puede ser nulo'
end
else
begin
  if(@IDD=@iddept)
  begin
    insert into Consumidor values(@PNC,@SNC,@PAC,@SAC,@Dir,@Pais,@SALDOZ,@SALDOA,1,@IDD)
  end
  else
  begin
    print 'Cliente no registrado'
  end
end

select*from Consumidor

--Calculo
--Vendedor x Ventas

select PNV,SNV,PAV,SAV,Id_Vendedor,FechaV,Id_Cliente from Ventas inner join
Distribuidor  on Ventas.Id_Cliente=Id_Vendedor

create view Ej00 as 
select PNV,SNV,PAV,SAV,Id_Vendedor,FechaV,Id_Cliente from Ventas inner join
Distribuidor  on Ventas.Id_Cliente=Id_Vendedor

select*from Ej00

--Cliente por Pais

Select Id_Cliente,PNC,SNC,PAC,SAC,Direccion,SaldoInic,SaldoAct from Consumidor where Pais='Canada'

create View Ej007 as
Select Id_Cliente,PNC,SNC,PAC,SAC,Direccion,SaldoInic,SaldoAct from Consumidor where Pais='Canada'

select*from Ej007

--Alterar La tabla Articulos

alter table Articulos add FechaC date not null

alter table Articulos add FechaV date not null

