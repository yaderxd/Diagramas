use SFCIB

create procedure NBar
@NE nvarchar (4),
@PNE nvarchar (15),
@SNE nvarchar (15),
@PAE nvarchar (15),
@SAE nvarchar (15),
@DE nvarchar (70),
@IDM int,
@TE char(8),
@IDM int
as declare @nume as char(4)

--Procedimiento de insercion para contactos
--Crear las tablass Dev_CB esta sujeta a la venta 
--Dev_BP con su correspondiente det_DBP
--Recordar que la Dev_CB esta sujeto a al venta
--Recordar que la Dev_BP esta sujeta a la compra
--en las devoluciones se considera al empleado

create procedure Contactos
@Id int,
@PNCont nvarchar (15),
@SNCont nvarchar(15),
@PACont nvarchar(15),
@SACont nvarchar(15),
@DirCont nvarchar(50),
@IDM int,
@TelCont char(8),
@EstadoCont bit,
@IDP int
as
declare @id as int
set @id=(select Id_Contacto from Contactos where Id_Contacto=@id)
declare @scp as int
set @scp=(select Id_Mun from Contactos where Id_Mun=@scp)
declare @sex as int
set @sex=(select Id_Prov from Contactos where Id_Prov=@sex)
if(@PNCont='' or @SNCont='' or @PACont='' or @SACont='' or @DirCont='' or @TelCont='' or @EstadoCont='')
begin
print 'La variable es nula'
end 
else
begin
if(@Id=@id and @IDM=@scp and @IDP=@sex)
begin
insert into Contactos values (@PNCont,@SNCont,@PACont,@SACont,@DirCont,@TelCont,@EstadoCont)
end 
else
print 'No se logro registrar'
end
end

create table Dev_CB (
Id int primary key not null,
Id_DevV int foreign key references Ventas(Id_Venta)not null,
Id_Compras char(5) foreign key references Compras(Id_Compras) not null,
NombreDev nvarchar(15),
DirDev nvarchar(50),
TelDev char(8) check(TelDev '[2|8|5|7][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')

)

create table Dev_BP(
Id_DevB int foreign key references Contactos(Id)not null,
NombreDevB nvarchar(15),
DirDevB nvarchar(50),
TelDevB char(8) check(TelDev '[2|8|5|7][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')

)