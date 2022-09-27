create database SFCIB

restore database SFCIB from disk='D:\SFCIB.bak'
with replace

use SFCIB

select * from Deptos
select * from Municipios
select * from Proveedor
select * from Productos
select * from Clientes
select * from Facultad

insert into Municipios values('Managua',1)

insert into Facultad values('01','FTC','Pepito',
'1995-02-01')

insert into Facultad values('02','FTI','Juanito',
'1995-02-01')

insert into Facultad values('03','FCyS','Claudia Benavidez',
'1997-02-01')

create procedure NCliente
@IDC char(5),
@PNC nvarchar(15),
@SNC nvarchar(15),
@PAC nvarchar(15),
@SAC nvarchar(15),
@DC nvarchar(75),
@IDM int,
@TC char(8),
@IDF char(3)
as
declare @idcl as char(5)
set @idcl=(select Id_Cliente from Clientes
where Id_Cliente=@IDC)
declare @idmun as int
set @idmun=(select Id_Mun from Municipios
where Id_Mun=@IDM)
declare @pdt as char(1)
set @pdt=(select substring(@TC,1,1))
declare @idfac as char(3)
set @idfac=(select Id_Facultad from Facultad
where Id_Facultad=@IDF)
if(@idcl=@IDC)
begin
  print 'Cliente ya registrado'
end
else
begin
  if(@IDC='' or @PNC='' or @PAC='' or @DC='' or @IDF='')
  begin
    print 'No pueden ser nulos'
  end
  else
  begin
    if(@idmun=@IDM)
	begin
	  if(@pdt='2' or @pdt='5' or @pdt='7' or @pdt='8')
	  begin
	    if(@idfac=@IDF)
        begin
		  insert into Clientes values(@IDC,
		  @PNC,@SNC,@PAC,@SAC,@DC,@IDM,@TC,
		  1,@IDF)
		end
		else
		begin
		  print 'Facultad no registrada'
		end
	  end
	  else
	  begin
	    print 'Debe iniciar con 2,5,7 u 8'
	  end
	end
	else
	begin
	  print 'Municipio no registrado'
	end
  end

end

NCliente '01','Evelyn','','Espinoza',
'Aragon','Managua',1,'22496429','03'


NCliente '02','Angel','','Zuniga',
'Espinoza','Managua',8,'52496429','02'

select * from Clientes