use hoteles;
CREATE VIEW entidades AS
select db.entidad, e.estado
from datos_bancario as db
join estadia as e on db.id=e.banco
where e.estado='activo';
select * from entidades;

CREATE VIEW ClientesPatagonia AS
select i.nombre, i.apellido, db.entidad
from inquilino as i
join datos_bancario as db on i.banco=db.id
where db.entidad='banco patagonia';
select * from ClientesPatagonia;

create view economicas as
select * from habitaciones
where precio<4000;
select* from economicas;

create view ocupacion as
select (count(*)/15)*100 as porcentaje
from habitaciones
where estado='ocupada';
select* from ocupacion;

create view DescuentoEfectivo as
select i.nombre,i.apellido, i.dni, h.precio *0.95
from inquilino as i
join habitaciones as h on i.habitaciones=h.id
join datos_bancario as db on db.id=i.banco
where db.metodopago='efectivo';

select * from DescuentoEfectivo;

