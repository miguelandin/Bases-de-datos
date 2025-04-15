USE mysalud;
show tables;
-- 1. Listar todos los médicos, su especialidad y el hospital en el que trabajan.
select m.nombre_medico, m.especialidad, h.nombre_hospital, m.id_hospital_med as ID_hospital
from medicos m 
inner join hospitales h on h.id_hospital = m.id_hospital_med;

-- 2. Obtener para cada hospital el número total de pacientes registrados en dicho hospital 
-- (aquellos que alguna vez han tenido una cita)
select h.nombre_hospital, count(distinct p.id_paciente) as pacientes
from hospitales h
left join medicos m on m.id_hospital_med = h.id_hospital
left join citas c on c.id_medico_citas = m.id_medico
left join pacientes p on c.id_paciente_citas = p.id_paciente
group by h.id_hospital, h.nombre_hospital
order by pacientes desc;

-- 3. Mostrar detalles de las citas programadas en los próximos 30 días.
-- (id de la cita, paciente, nombre del médico y fecha hora de la cita)
select c.id_cita, p.nombre_paciente, m.nombre_medico, c.fecha_hora_cita 
from citas c 
inner join pacientes p on p.id_paciente = c.id_paciente_citas
inner join medicos m on m.id_medico = c.id_medico_citas
where (DATE_SUB(CURRENT_DATE(), interval 30 DAY)) < c.fecha_hora_cita
order by c.fecha_hora_cita asc;

-- 4. Obtener el total de ingresos generados por facturas 'pagadas'.
select SUM(f.importe) as total
from facturas f
where f.estado_pago like 'pagado';

-- 5. Listar los pacientes que han tenido más de una cita. 
-- Nombre del paciente y número de citas
SELECT p.nombre_paciente , count(c.id_paciente_citas) as citas 
from pacientes p 
inner join citas c on c.id_paciente_citas = p.id_paciente
group by p.id_paciente, p.nombre_paciente
order by citas desc;

-- 6. Encontrar el nombre del médico que ha atendido más citas.
select m.nombre_medico, count(c.id_cita) as citas
from medicos m 
inner join citas c on c.id_medico_citas = m.id_medico
group by m.nombre_medico
order by citas desc
limit 1;

-- 7. Mostrar los tratamientos aplicados en cada cita junto con su precio total. 
-- Indica la cita, el nombre del paciente, la descripción del tratamiento recibido y el precio
select c.id_cita, p.nombre_paciente, t.descripcion_tr, t.precio_tr
from citas c 
inner join tratamientos t on t.id_cita_tr = c.id_cita
inner join pacientes p on p.id_paciente = c.id_paciente_citas
order by c.id_cita asc;

-- 8. Identificar los pacientes que tienen facturas pendientes de pago.
-- y el importe de su deuda ordenado de mayor a menor.
select p.nombre_paciente, sum(f.importe) as deuda
from pacientes p 
inner join citas c on c.id_paciente_citas = p.id_paciente
inner join facturas f on f.id_cita_f = c.id_cita
where f.estado_pago like 'pendiente'
group by p.nombre_paciente
order by deuda desc;

-- 9 Listar las dos especialidades con más médicos
select m.especialidad ,count(m.especialidad) as cant_medicos
from medicos m
group by m.id_medico, m.especialidad
order by cant_medicos desc
limit 2;

-- 10. Encontrar los hospitales que tienen más de 5 médicos contratados.
select h.nombre_hospital, count(m.id_hospital_med) as medicos
from hospitales h 
inner join medicos m on m.id_hospital_med = h.id_hospital
group by h.id_hospital
order by medicos desc;

-- 11. Obtener la edad promedio de los pacientes registrados en la base de datos.
SELECT AVG(p.fecha_nacimiento) as fecha_promedio
from pacientes p ;

-- 12. Determinar cuántos médicos hay por hospital y ordenarlos de mayor a menor.
select h.nombre_hospital, count(m.id_hospital_med) as medicos
from hospitales h 
inner join medicos m on m.id_hospital_med = h.id_hospital
group by h.id_hospital
order by medicos desc;

-- 13. Actualizar el estado de pago de todas las facturas pendientes a 'pagado' si han pasado más de 60 días desde su emisión.
UPDATE facturas
SET estado_pago = 'pagado'
where fecha_emision > DATE_SUB(CURRENT_DATE(), INTERVAL 60 DAY);

-- 14  Actualiza la BD para insertar 2 nuevos pacientes
insert into pacientes (nombre_paciente, DNI, fecha_nacimiento, email, telefono_contacto) values
('Edwin', '12345678A', '2000-01-01', 'ImadeTheMimic@gmail.com', 111222333),
('Jhon', '124412412B', '2001-01-01', 'hola@gmail.com', 123);

-- 15. Eliminar de la base de datos los pacientes mayores de 55 años
DELETE FROM pacientes
WHERE fecha_nacimiento < DATE_SUB(CURRENT_DATE(), INTERVAL 55 YEAR);
