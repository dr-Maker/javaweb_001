
-- create database db_planitaller;
use db_planitaller;
go
drop table planificacion;
drop table tbl_taller;
drop table tbl_tutor;
drop table tbl_dpto;
drop table tbl_area;
drop table tbl_user;
go
create table tbl_user(
num int identity(1,1),
usuario varchar(100),
clave varchar(100),
primary key(num),
unique(usuario));
go
create table tbl_area(
num int identity(1,1),
nombre varchar(100),
primary key(num));
go
create table tbl_dpto(
num int identity(1,1),
nombre varchar(100),
numarea int,
primary key(num),
foreign key (numarea) references tbl_area(num));
go
create table tbl_tutor(
num int identity(1,1),
nombre varchar(100),
email varchar(100),
fono varchar(20),
primary key(num));
go
create table tbl_taller(
num int identity(1,1),
nombre varchar(100),
horas int,
cupos int,
primary key(num));
go
create table planificacion(
num int identity(1,1),
numdpto int,
numtaller int,
numtutor int,
fechainicio date,
primary key(num),
foreign key (numdpto) references tbl_dpto(num),
foreign key (numtaller) references tbl_taller(num),
foreign key (numtutor) references tbl_tutor(num));
go

insert into tbl_user (usuario, clave) values('admin', '12345');
insert into tbl_area (nombre) values('Administración'); 
insert into tbl_area (nombre) values('Ventas'); 
insert into tbl_area (nombre) values('Tecnología'); 

insert into tbl_dpto (nombre, numarea) values('Contabilidad', 1); 
insert into tbl_dpto (nombre, numarea) values('Remuneraciones', 1); 
insert into tbl_dpto (nombre, numarea) values('Personal', 1); 

insert into tbl_dpto (nombre, numarea) values('Publicidad', 2); 
insert into tbl_dpto (nombre, numarea) values('Marketing', 2); 

insert into tbl_dpto (nombre, numarea) values('Ofimática', 3); 
insert into tbl_dpto (nombre, numarea) values('Internet', 3); 
insert into tbl_dpto (nombre, numarea) values('Base de datos', 3); 
insert into tbl_dpto (nombre, numarea) values('Programación', 3); 

insert into tbl_taller (nombre, horas, cupos) values('Excel', 35, 20);
insert into tbl_taller (nombre, horas, cupos) values('Word', 35, 30);
insert into tbl_taller (nombre, horas, cupos) values('Costo', 40, 15);
insert into tbl_taller (nombre, horas, cupos) values('Impuestos', 25, 20);
insert into tbl_taller (nombre, horas, cupos) values('Sql server', 60, 25);
insert into tbl_taller (nombre, horas, cupos) values('MySql', 70, 25);
insert into tbl_taller (nombre, horas, cupos) values('Android', 90, 35);
insert into tbl_taller (nombre, horas, cupos) values('Python', 120, 35);

insert into tbl_tutor (nombre, email, fono) values('Salvador Ponce', 'salva@correo.cl', '987654321');
insert into tbl_tutor (nombre, email, fono) values('Sophia Pavez', 'pavez@correo.cl', '876543219');
insert into tbl_tutor (nombre, email, fono) values('Elena Olivares', 'eolivares@correo.cl', '765432198');
insert into tbl_tutor (nombre, email, fono) values('Angela Marrou', 'amorrou@correo.cl', '654321987');
insert into tbl_tutor (nombre, email, fono) values('Taro Ling', 'talinga@correo.cl', '741852963');

insert into planificacion 
(numdpto, numtaller, numtutor, fechainicio)
values(1,1,1,'2020-08-03') 

insert into planificacion 
(numdpto, numtaller, numtutor, fechainicio)
values(1,3,4,'2020-08-03') 

insert into planificacion 
(numdpto, numtaller, numtutor, fechainicio)
values(1,5,5,'2020-08-03') 

select p.*, 
a.nombre as nomarea,
d.nombre as nomdpto, 
ta.nombre as nomtaller,
tu.nombre as nomtutor
from planificacion as p
join tbl_dpto as d on d.num = p.numdpto
join tbl_area as a on a.num = d.numarea
join tbl_taller as ta on ta.num = p.numtaller
join tbl_tutor as tu on tu.num = p.numtutor

select * from tbl_user;

insert into planificacion 
(numdpto, numtaller, numtutor, fechainicio)
values(1,1,1,'2020-08-03') 

insert into planificacion 
(numdpto, numtaller, numtutor, fechainicio)
values(4,3,4,'2020-08-03') 

insert into planificacion 
(numdpto, numtaller, numtutor, fechainicio)
values(7,5,5,'2020-08-03') 


drop procedure sp_insert_planificacion;
go
create procedure sp_insert_planificacion
@p_numdpto int,
@p_numtaller int,
@p_numtutor int,
@p_fecha date
as
	insert into planificacion (numdpto, numtaller, numtaller, fechainicio)
	values(@p_numdpto, @p_numtaller, @p_numtutor, @p_fecha);
go

/*
select p.num, 
		P.numdpto,
		p.numtaller,
		p.numtutor,
		convert(varchar ,p.fechainicio, 105) as fechainicio,
a.num as numarea,
a.nombre as nomarea,
d.nombre as nomdpto, 
ta.nombre as nomtaller,
tu.nombre as nomtutor
from planificacion as p
join tbl_dpto as d on d.num = p.numdpto
join tbl_area as a on a.num = d.numarea
join tbl_taller as ta on ta.num = p.numtaller
join tbl_tutor as tu on tu.num = p.numtutor
*/