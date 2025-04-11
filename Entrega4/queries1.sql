--- Queries para el bloc de notas

--- Usamos nuestra BD
show databases;
use  BlocNotas;
show tables;

--- 1) Eliminar todos los adjuntos de la nota cuyo titulo contiene la palabra 'Talentum' 
Update Nota
Set adjuntoID = NULL
where titulo like '%talentum%';

Delete from Adjunto 
where adjuntoID not in (
	select a.adjuntoID
	from Adjunto a 
	where a.adjuntoID is not null
);

---  2) Insertar tres nuevos blocs de notas (los que se quieran) 
insert into Bloc (blocID, fecha_creacion, nombre, usuarioID) values
(12, '2024-01-01', 'bloc de Edwin', 1),
(44, '2024-01-02', 'hola', 2),
(33, '2005-04-30', 'adios', 3);

---  3)  Actualizar la nota cuyo titulo contiene la palabra 'Carnaval' con el siguiente texto:
---  'Por motivos ajenos a la universidad se suspenden las Fiestas de Carnaval'
--- Indicar como fecha de modificacion la actual
UPDATE Nota
Set
	texto = 'por motivos de nos qué, se cancela eso',
	fecha_modificacion = CURRENT_DATE()
where titulo like '%nota%';

SELECT n.titulo, n.texto, n.fecha_modificacion
from Nota n;
 
--- 4) Cuales son los países distintos de los que tenemos usuarios


--- 5) Número de países distintos de los que tenemos usuarios


---  6) Cuantos usuarios hay de cada pais



---  7) Actualizar la BD para cambiar de bloc la nota cuyo titulo contiene la palabra 'Bocadillos' , 
---  debe cambiarse al bloc de notas cuyo nombre es 'ocio'



--- 8) Cuales son los blocs de notas que están vacios (ninguna nota). Muestra su identificador y el nombre. 



--- 9) Cuales son las notas que no tienen adjuntos


--- 10) Cual es la nota (ide_nota) con mayor número de modificaciones





