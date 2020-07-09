use db_planitaller
go
drop procedure sp_valida_usuario;
go
create procedure sp_valida_usuario
@p_usuario varchar(100),
@p_clave varchar(100)
as
	select num, usuario from tbl_user 
	where usuario = @p_usuario
	and clave = @p_clave;
go

exec sp_valida_usuario 'admin','12345';
sp_valida_usuario 'admin','12345'


go
drop procedure sp_listar_planificacion;
go
create procedure sp_listar_planificacion
as
	select p.*, a.num as numarea,
	a.nombre as nomarea,
	d.nombre as nomdpto, 
	ta.nombre as nomtaller,
	tu.nombre as nomtutor
	from planificacion as p
	join tbl_dpto as d on d.num = p.numdpto
	join tbl_area as a on a.num = d.numarea
	join tbl_taller as ta on ta.num = p.numtaller
	join tbl_tutor as tu on tu.num = p.numtutor
go

sp_listar_planificacion


go
drop procedure sp_listar_planificacionV2;
go
create procedure sp_listar_planificacionV2
@p_numarea int,
@p_numdpto int,
@p_numtaller int,
@p_numtutor int
as
	select p.*, a.num as numarea,
	a.nombre as nomarea,
	d.nombre as nomdpto, 
	ta.nombre as nomtaller,
	tu.nombre as nomtutor
	from planificacion as p
	join tbl_dpto as d on d.num = p.numdpto
	join tbl_area as a on a.num = d.numarea
	join tbl_taller as ta on ta.num = p.numtaller
	join tbl_tutor as tu on tu.num = p.numtutor
	where (a.num = @p_numarea or @p_numarea= 0) 
	and (d.num = @p_numdpto or @p_numdpto = 0)
	and (ta.num = @p_numtaller or @p_numtaller = 0)
	and (tu.num = @p_numtutor or @p_numtutor = 0 )
go
