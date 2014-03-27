--Ahora se desea incluir dos modificaciones:
-- El pago del teléfono con tarjeta.
-- Incluir algunos datos más para el teléfono: qué compañía posee la línea y un tipo de tarifa.
--Para ello seguir exactamente estos pasos:

--a)- Indique el diagrama de E/R nuevo de las relaciones y entidades afectadas por los apartados
--anteriores, incluyendo TieneTel, Telefono, Tarjeta, ClienteX y otra relación nueva PagoTel para
--el nuevo uso.

-- 	  TIENETEL
-- DNI , TELEFONO

--			PAGOTEL
-- NUMT , TELEFONO , SALDOACUMULADO

--			TELEFONO
-- TELEFONO , COMPANY , TIPOTARIFA , FECHAALTA

--		CLIENTE
-- DNI , NOMBREC , DIRECCION , TELEFONO

--		TARJETA
-- NUMT , TIPOT , CADUCIDAD , SALDO


--b)- Qué atributos y qué clave debe tener las nuevas relaciones? Escribir el esquema relacional de las
--relaciones de a)

-- PK:
--		PAGOTEL --> NUMT, TELEFONO
--		TELEFONO --> TELEFONO


--c) Sigue siendo válido (es decir: es un diseño adecuado de la BD?) para este apartado el cambio hecho
--con el saldo y la caducidad en el apartado 3? porqué ?
--Si , no modificamos la tabla TARJETA 


--e)- Escribir las instrucciones SQL para:
-- Crear tabla Telefono e insertar las tuplas correspondientes desde TieneTel. Poner valores por
--defecto a los atributos nuevos.

CREATE TABLE TELEFONO (
	TELEFONO VARCHAR(9) NOT NULL,
	COMPANY VARCHAR(255),
	TEIPOTARIFA VARCHAR(255),
	FECHAALTA DATE
);


-- Crear tabla PagoTel e insertar tuplas para que cada usuario pueda pagar cualquiera de sus teléfonos
--con cualquiera de sus tarjetas. Para ello se extraen los datos de las tablas TieneT y TieneTel mediante
--instrucciones SQL dentro de la inserción.
-- Arreglar los atributos de TieneTel, quitando los que sobren (No use “drop table”)

--f) - Crear varias tuplas válidas de acuerdo a los datos existentes. Compruebe que la tarjeta es del cliente
--adecuado dentro de la instrucción de creación.

--g)- Escribir varias tuplas incorrectas y explicar en una frase qué falla.

--Entregar: Las instrucciones necesarias para hacer lo pedido (el fichero prac24.sql ). Para los apartados
--no ejecutables entregue un fichero prac25.doc en word