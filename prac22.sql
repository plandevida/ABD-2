--a) Copia y ejecuta el fichero Ejeprac2.sql para trabajar con la BD adecuada. OK

--b) Explicar en una frase porqué es un error de diseño el esquema original de TieneT?
--c) Realizar el cambio siguiendo estos pasos:

	--1.- Alterar la tabla Tarjeta añadiendo los dos campos Caducidad y saldo.
	ALTER TABLE Tarjeta 
	ADD (Caducidad INT , Saldo FLOAT);

--	2.- Asegurarse que ahora tiene los atributos adecuados usando 'describe'
	DESCRIBE Tarjeta;
--	3.- (aunque se pueda hacer de otras formas por ser dos tablas diferentes, hacerlo como se indica)
--	Actualizar cada tupla de Tarjeta con el Saldo y Caducidad correspondiente de TieneT. Para ello
--se utilizan unas consultas nuevas llamadas subconsultas correlativas. Son subconsultas que tienen
--	un 'alias' para poder usar un valor de la consulta original dentro de la subconsulta cuando se usa en
--	ambas la misma tabla: Ver el ejemplo con select, (el update funciona con el mismo sistema, UNA
--	o DOS instrucciones update pueden actualizan todas las tuplas):
	--	select *
	--	from Rel1 alias_rel1
--		where rel1.columnY in
--		(select rel1.columnY
--		from Rel1 alias2
--		where alias_rel1.columnaX = alias_rel2.columnaX);


update Tarjeta tj  set (caducidad , saldo)  =    
(select caducidad , saldo
from TieneT t1
where tj.numt in
(select t1.numt
from Tarjeta t2
where t1.numT = t2.numT))

where tj.numT in ( SELECT numT from TieneT tt where tt.numT = tj.numT ); 


--	4.- Poner los valores en TieneT de (caducidad, saldo) a null en todas las lineas, se hace con UNA o
--	DOS update.
update TieneT   set caducidad= null , saldo= null;

--	5.1.- Porqué en Tarjeta salen en blanco los valores de caducidad y saldo en algunas filas?

-- Porque esas tarjetas no estan asignadas a ningun cliente.

--	5.2.- Poner los valores de las filas de 5.1 a cero con un solo update

update Tarjeta  t set caducidad= 0 , saldo= 0 where t.caducidad IS NULL OR t.saldo IS NULL;

--d) Corrige las otras DF’s y DM’s que hayas considerado problemáticas,  Debes hacerlo como en el
--apartado anterior: con instrucciones DDL y DML, a partir de la BD ya creada y con datos en sus
--filas.

create table tarjeta_organizacion (
	TipoT		CHAR(10),
	Organizacion	CHAR(20),
	PRIMARY KEY (TipoT)
);

insert into tarjeta_organizacion ( TipoT, Organizacion ) 
SELECT distinct(TipoT) , Organizacion from TARJETA; 

alter table Tarjeta drop column Organizacion;

alter table Tarjeta 
ADD CONSTRAINT fk_tipotarjeta
FOREIGN KEY (TipoT)
REFERENCES tarjeta_organizacion(TipoT);

--e) Después del apartado d), en qué Forma Normal ha quedado cada tabla? Y la BD completa?
CLIENTES 3FN
COMPRAS 3FN
EMPRESA 3FN
INVIERTE 3FN 
MOROSO  3FN
PUESTO 3FN
TARJETA 3FN
TIENET	3FN


BD -> 3FN

--Entregar: Las instrucciones DDL y DML de SQL necesarias para hacer lo pedido (en el fichero
--prac22.sql).