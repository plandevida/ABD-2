--Con la aparición de los teléfonos móviles los clientes tienen más de un teléfono. Si creáramos una
--tupla en Clientes por cada teléfono se produciría información duplicada.
--Para evitar esta situación, hacer una descomposición en dos relaciones ClienteX y TieneTel ,
--contestando a las siguientes preguntas:

--a) Que atributos y clave debe tener cada relación para solucionar el problema?

	-- Cliente se queda con está y pierde la columna telefono
	--Tienetel DNI -> TELEFONO siendo pk y fk DNI  

--b) Realizar la creación de las dos tablas y la carga de las tuplas correspondientes. Se puede realizar
--usando una instrucción para cada tabla: (busca en la web cómo funciona esta instrucción)
--create table .... as select (...que obtiene datos que quiero) ;

create table TieneTel AS (SELECT DNI, Telefono from CLIENTE);

--c) Añadir un atributo Compañía, que es una ristra de caracteres, a TieneTel , cuyo valor por defecto es
--'martel' para todas las tuplas

alter table TieneTel ADD Company varchar(100) DEFAULT 'martel'; 

--d) Añadir a TieneTel un atributo FechaAlta , que es una fecha, cuyo valor por defecto es la fecha del
--sistema para todas las tuplas. También, hacer una consulta para ver el resultado.


alter table TieneTel ADD FechAlta DATE DEFAULT CURRENT_TIMESTAMP;
SELECT * from TieneTel;

--e) Insertar para los clientes '00000001' y '00000003' tres teléfonos diferentes para cada uno, con la
--compañía 'martel' y FechAlta dos días después de hoy (usar fecha del sistema más dos días)
--Nota: usar números de teléfono raros para reconocerlos más tarde.

insert into TieneTel (DNI, Telefono , FechAlta) values ('00000001', 4567786 , CURRENT_TIMESTAMP + 2);
insert into TieneTel (DNI, Telefono , FechAlta) values ('00000001', 12345678 , CURRENT_TIMESTAMP + 2);
insert into TieneTel (DNI, Telefono , FechAlta) values ('00000001', 910111213 , CURRENT_TIMESTAMP + 2);
insert into TieneTel (DNI, Telefono , FechAlta) values ('00000003', 1415161718 , CURRENT_TIMESTAMP + 2);
insert into TieneTel (DNI, Telefono , FechAlta) values ('00000003', 1987971210 , CURRENT_TIMESTAMP + 2);
insert into TieneTel (DNI, Telefono , FechAlta) values ('00000003', 423132132187 , CURRENT_TIMESTAMP + 2);

--f) Consulta de los DNI de los clientes con más de un teléfono ('000000001' y '000000003')

SELECT DNI , Telefono 
FROM TieneTel t
WHERE t.DNI in
(SELECT DNI
FROM TieneTel t2
GROUP by DNI
having count(*)>1)
order by dni;
