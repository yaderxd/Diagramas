use SFCIB

select*from Productos

select count(CodProd) as CanReg,
sum(existp) as CantP,
AVG(preciop) as PrecioProm,
min(preciop) as PrecioMin,
max(preciop) as PrecioMax,
var(preciop) as VarianzaP,
stdev(preciop) as DesvEP from Productos

create view FAgregados
select GETDATE() as FechaHoraActual


--Funciones standard del sistema
--1.Fecha/hora
--1.1 GetDate(): Retorna la fecha y la hora del sistema
--1.2 year():retorna el año de una fecha

select year(GETDATE()) as AñoActual,year('19710619') as MiAñoNac

select month(GETDATE()) as MesActual,month('19710619') as MiMesNac

select day(GETDATE()) as DiaActual,day('19710619') as MiDiaNac

--1.3 DateDiff(): diferenciar fechas
select DateDiff(year,'19710619',getdate()) as
EdadA ,DateDiff(month,'19710619',getdate()) as
EdadB ,DateDiff(week,'19710619',getdate()) as
EdadC ,DateDiff(day,'19710619',getdate()) as
EdadD ,DateDiff(hour,'19710619',getdate()) as
EdadE ,DateDiff(minute,'19710619',getdate()) as
EdadF ,DateDiff(second,'19710619',getdate()) as
EdadG

--1.4 Dateadd(): sumar fechas 
select dateadd(day,10,getdate()) as DiezDD

--1.5 DateName():

select datename(year,getdate()) as AñoActual,
datename(month,getdate())as MesActual,
datename(week,getdate()) as SemanaActual,
datename(day,getdate()) as DiaActual,
datename(hour,getdate()) as HoraActual,
datename(weekday,getdate()) as DiaSem,
datename(dayofyear,getdate()) as DiaDelAño

--1.6 DatePart()
select datepart(year,getdate()) as AñoActual,
datepart(month,getdate())as MesActual,
datepart(week,getdate()) as SemanaActual,
datepart(day,getdate()) as DiaActual,
datepart(hour,getdate()) as HoraActual,
datepart(weekday,getdate()) as DiaSem,
datepart(dayofyear,getdate()) as DiaDelAño

--2 Cadena
--2.1 Len():devuelve la longitud de una cadena
select len(NombreProd) as LNP from Productos

--2.2 char():devuelve el caracter a partir  de su codigo ascii
select char(61) as caract

--2.3 ascii(): Devuelve el codigo de un caracter
select ascii('Ñ') as VAlorA

--2.4 lower(): Transforma una Cadena a minuscula
select lower('BLUE') as Minus

--2.5 upper(): Transforma una Cadena a mayuscula
select upper('red') as Mayus

--2.6 SubString():Abstraer una cadena de una cadena
select substring('001-180702-1008G',5,6) as FechaNac

--2.7 Charindex(): Coincidencia a partir de un indice 
declare @document varchar(64);
select @document = 'Reflectors are vital safety' + 'Components of your bycicle.';

select charindex('bycicle',@document) as Indice

--2.8 Concat(): Concadenar cadenas
select concat('Happy','Byrthday','to',11,'/',25) as result 

--2.9 reverse(): revertir una cadena
select reverse ('Angel') as NombreInver

--2.10 left():valores a partir de una posicion izquierdas
select left('msr. en Computacion',8) as Parted

--2.11 Right():  valores a partir de una posicion derecha
select right('msr. en Computacion0',6) as BI


--2.12 ltrim(): elimina espacios  en blanco de la izquierda
select ltrim('msr. en Computacion0') as EBI

--2.13 Rtrim(): elimina espacios  en blanco de la derecha
select Rtrim('msr. en Computacion') as EBD

--3 funciones de conversion
--Cast,Convert,Parsed,Try_cast,Try_Convert,Try_Parse

declare @ani as int 
set @ani =(select cast(substring('001-180207-1008G',9,2)as int )as añoNac) print  @ani

declare @ania as int 
set @ania =(select convert(int,substring('001-180207-1008G',9,2) )as añoNac) print  @ania

declare @anib as int 
set @anib =(select try_cast(substring('001-180207-1008G',9,2)as int )as añoNac) print  @anib

declare @anic as int 
set @anic =(select try_parse(substring('001-180207-1008G',9,2)as int )as añoNac) print  @anic

declare @anid as int 
set @anid =(select try_convert(int,substring('001-180207-1008G',9,2) )as añoN) print  @anid

select parse('moday,13 december 2010' as datetime2 using 'en-us') as result