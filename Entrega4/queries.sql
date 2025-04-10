--- Queries para el bloc de notas
show databases;
use  BlocNotas;
show tables;

--- 1) seleccciona el id de la Nota y su texto con mayor número de caracteres
SELECT n.notaID, CHAR_LENGTH(n.texto) as longitud
from Nota n 
order by longitud desc
limit 1;

--- 2)  Usuarios con más blocs de notas / con más notas
Select
	u.nombre_completo,
	count(distinct b.blocID) as cantidad_blocs,
	count(distinct n.notaID) as cantidad_notas
from
	Usuario u 
left join
	Bloc b on u.usuarioID = b.usuarioID
left join
	Nota n on n.blocID  = b.blocID
group BY
	u.usuarioID, u.nombre_completo
order by
	cantidad_blocs desc, cantidad_notas desc;

--- 2.1) seleccionar el nombre de los 5 Usuarios con más blocs de notas 
Select
	u.nombre_completo,
	count(distinct b.blocID) as cantidad_blocs
from
	Usuario u 
left join
	Bloc b on u.usuarioID = b.usuarioID
group BY
	u.usuarioID, u.nombre_completo
order by
    cantidad_blocs desc
limit 5;

--- 2.2) seleccionar nombre de los 5 Usuarios con más notas
Select
	u.nombre_completo,
	count(distinct n.notaID) as cantidad_notas
from
	Usuario u 
left join
	Bloc b on u.usuarioID = b.usuarioID
left join
	Nota n on n.blocID = b.blocID
group BY
	u.usuarioID, u.nombre_completo
order by
	cantidad_notas desc
limit 5;

--- 3) Obtener las 5 notas más recientes y las más antiguas
(SELECT u.nombre_usuario, n.fecha_alta AS fecha
FROM Usuario u 
INNER JOIN Bloc b ON b.usuarioID = u.usuarioID
INNER JOIN Nota n ON n.blocID = b.blocID
ORDER BY n.fecha_alta DESC
LIMIT 5)

UNION ALL

(SELECT u.nombre_usuario, n.fecha_alta AS fecha
FROM Usuario u 
INNER JOIN Bloc b ON b.usuarioID = u.usuarioID
INNER JOIN Nota n ON n.blocID = b.blocID
ORDER BY n.fecha_alta ASC
LIMIT 5)

--- 3.1) Seleccionar el identificador, titulo y fecha de creacion de las 5 notas más recientes
select n.titulo, n.notaID as ID, n.fecha_alta as fecha_creacion
from Nota n 
order by n.fecha_alta desc
limit 5;

--- 3.2) Seleccionar el identificador, titulo y fecha de creacion de las 5 notas más antiguas 
select n.titulo, n.notaID as ID, n.fecha_alta as fecha_creacion
from Nota n 
order by n.fecha_alta asc
limit 5;

--- 4) Seleccionar titulo y texto de las Notas cuyo título o texto contenga la palabra “ becas”
select n.notaID, n.titulo, n.texto
from Nota n
where n.titulo like '%becas%' or n.texto like '%becas%';

--- 5) Cuantos tags tiene cada nota ordenados de forma descendente 
--- (selecciona el id de la nota, su titulo y el numero de tags por cada una)
SELECT n.notaID, n.titulo, count(n.tagID) as cantidad_tags
from Nota n
group by n.notaID, n.titulo
order by cantidad_tags desc;

--- 6)Tags más populares
Select t.nombre, count(t.tagID) as veces_usado
from Tag t 
inner join Nota n on n.tagID = t.tagID
group by n.tagID, t.tagID
order by veces_usado desc;

--- 6.1) obtener el Tag que aparece en más notas
Select t.nombre, count(t.tagID) as veces_usado
from Tag t 
inner join Nota n on n.tagID = t.tagID
group by n.tagID, t.tagID
order by veces_usado desc
limit 1;

--- 6.2) Los 5 Tags que aparecen en más notas  
Select t.nombre, count(t.tagID) as veces_usado
from Tag t 
inner join Nota n on n.tagID = t.tagID
group by n.tagID, t.tagID
order by veces_usado desc
limit 5;

--- 7) EL nombre del bloc con mayor número de notas
Select b.nombre, count(n.notaID) as notas
from Bloc b 
left join Nota n on n.blocID = b.blocID
group by n.blocID, b.nombre
order by notas desc
limit 1;

--- 8) Obtener el identificador y el titulo de la nota más modificada
Select n.notaID, n.titulo, count(c.cambioID) as cambios
from Nota n 
left join Cambio c on c.notaID = n.notaID
group by n.notaID, n.titulo 
order by cambios desc
limit 1;

--- 9) Crear una vista en la que tengamos el id de la nota, su titulo, su texto, el id del bloc al que pertence y el id del usuario que creo dicho bloque
--- Añadiendo además el nombre del bloc y del usuario
Select n.notaID, n.titulo, n.texto, 
b.blocID, b.nombre, 
u.usuarioID, u.nombre_completo
from Nota n 
inner join Bloc b on b.blocID = n.blocID
inner join Usuario u on u.usuarioID  = b.usuarioID;

--- 10) Obtener (utilizando la primera vista creada anteriormente) cual es el nombre del usuario que creo cada nota
Select n.titulo as titulo_nota, u.nombre_completo as autor
from Nota n 
inner join Bloc b on b.blocID = n.blocID
inner join Usuario u on u.usuarioID  = b.usuarioID;
