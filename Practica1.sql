
--PROBAR EL PODER DE SQL


CREATE TABLE DANCE (ID_DANCER INT,NOMBRE VARCHAR2(40),EDAD INT);

--PRENDEMOS EL SERVIDOR EN MODO DESARROLLADOR

SET SERVEROUTPUT ON;

-- VAMOS A EMPEZAR CON UN BLOQUE PL SQL

DECLARE 
--AQUI SE DECLARAN VARIABLES

EDAD INT;
YEARS INTEGER;

BEGIN
--LOGICA DEL PROGRAMA
YEARS:=20;
EDAD:=YEARS*365;

DBMS_OUTPUT.PUT_LINE('TU EDAD EN DIAS ES' || EDAD);

END;







--Crear un bloque PL SQL que genere 200,000 registros de secuencia ascendete en la tabla dance
BEGIN

  FOR I IN 1..200000 LOOP
  INSERT INTO DANCE VALUES(I,'MAX',20);
  
  END LOOP;
  END;
  /

SELECT * FROM DANCE;


--Sistema de peliculas

CREATE TABLE PELICULA (ID_PELICULA INT,
                      TITULO VARCHAR2 (120),
                      SINOPSIS VARCHAR2 (100),
                      CLASIFICACION VARCHAR2 (3),
                      CONSTRAINT PK_ID_PELICULA PRIMARY KEY(ID_PELICULA));
                      
                      DESCRIBE PELICULA;
                      
                      CREATE TABLE HORARIO (ID_HORARIO INT,
                                            ID_PELICULA INT,
                                            HORARIO VARCHAR2 (10),
                                            CONSTRAINT PK_ID_HORARIO PRIMARY KEY(ID_HORARIO),
                                            CONSTRAINT FK1_ID_PELICULA FOREIGN KEY (ID_PELICULA) REFERENCES PELICULA(ID_PELICULA));
                                            
                      CREATE TABLE SALA (ID_SALA INT,
                                         ID_PELICULA INT,
                                         NO_SALA INT,
                                         CONSTRAINT PK_ID_SALA PRIMARY KEY(ID_SALA),
                                         CONSTRAINT FK2_ID_PELICULA FOREIGN KEY(ID_PELICULA) REFERENCES PELICULA(ID_PELICULA));
                                         
                                         
                                         
                      CREATE SEQUENCE sec_pelicula
                      start with 1
                      increment by 1
                      nomaxvalue;




SET SERVEROUTPUT ON;
                      
                      CREATE OR REPLACE PROCEDURE HOLA_MUNDO(NOMBRE IN VARCHAR2)
                      AS
                      BEGIN
                      
                      --AQUI VA LOGICA
                      
                      DBMS_OUTPUT.PUT_LINE('HOLA COMO ESTAS' || NOMBRE);
                      END;
                      /
                      
                      
                      BEGIN
                      HOLA_MUNDO (' MAXI');
                      END;
                      /
                      
                      DECLARE 
                      RESULTADO NUMBER;
                      BEGIN
                      SUMA(12,8,RESULTADO);
                      DBMS_OUTPUT.PUT_LINE('LA SUMA ES ☺ '||RESULTADO);
                      END; 
                      /
                      
                      CREATE TABLE  PELICULA (ID_PELICULA INTEGER, 
                        TITULO VARCHAR2(120), 
                       SINOPSIS VARCHAR(500), 
                   CLASIFICACION VARCHAR2(3), 
                   CONSTRAINT PK_ID_PELICULA PRIMARY KEY (ID_PELICULA) 
                   );  
                   DESCRIBE PELICULA ; 
            
CREATE SEQUENCE sec_pelicula 
 start with 1 
 increment by 1 
 nomaxvalue;
 


CREATE OR REPLACE PROCEDURE GUARDAR_PELICULA  
( 
   MY_ID_PELICULA OUT NUMBER   
, MY_TITULO IN VARCHAR2   
, MY_SINOPSIS IN VARCHAR2   
 , MY_CLASIFICACION IN VARCHAR2   
) AS  
 BEGIN 
 --LOGICA 
 SELECT SEC_PELICULA.NEXTVAL INTO MY_ID_PELICULA FROM DUAL; 
 INSERT INTO PELICULA VALUES(MY_ID_PELICULA,MY_TITULO,MY_SINOPSIS,MY_CLASIFICACION); 

 END GUARDAR_PELICULA; 

/

DECLARE
VALOR INTEGER;
BEGIN
GUARDAR_PELICULA(VALOR,'EL RENACIDO','ESTA MASOMENOS','B');
END;
/

SELECT * FROM PELICULA;

CREATE TABLE SIMPLE1(ID_SIMPLE INT,
                     EDAD INT,
                     NOMBRE VARCHAR2 (20));
                     
                     --LA LLAMAMOS CON INFORMACION RAPIDA
                     
                     DECLARE
                     MI_EDAD INT;
                     
                     BEGIN
                     MI_EDAD:=20;
                     
                     FOR i IN 1..20 LOOP
                     MI_EDAD:=MI_EDAD+i;
                     insert into simple1 values(i,MI_EDAD,'MAXITO');
                     END LOOP;
                     END;
                     /
                     
                     SELECT * FROM SIMPLE1;
                     
                      --CURSOR SIMPLE DE UNA SOLA OCURRENCIA.    
                     --CREAR UN CURSOR QUE BUSQUE EL ID QUE VALGA 21 Y SUSTITUIR EL NOMBRE POR EL TUYO.
                     SET SERVEROUTPUT ON;
                     
             
                  
                  INSERT INTO SIMPLE1 VALUES(1,21,'MAX');
                  INSERT INTO SIMPLE1 VALUES(2,23,'OSCAR');
                  INSERT INTO SIMPLE1 VALUES(3,25,'JUAN');
                  
                  SELECT * FROM SIMPLE1;
                  
                
                   DECLARE
                     MI_NOMBRE VARCHAR2 (30);
                     
                     BEGIN
                    SELECT NOMBRE INTO MI_NOMBRE FROM SIMPLE1 WHERE EDAD:=21;
                    DBMS_OUTPUT.PUT_LINE(MI_NOMBRE);
                    END;
                    /


create table paises(id_pais varchar2 (4),
                    nombre varchar2 (100),
                    habitante int, 
                    idioma varchar2 (40), 
                    constraint pk_id_pais primary key (id_pais));


insert into paises values('mx','Mexico',900000,'español');
insert into paises values('usa','Estados Unidos',1200000,'ingles');
insert into paises values('jpa','Japon',800000,'japones');
insert into paises values('ger','Alemania',1400000,'aleman');
insert into paises values('bra','Brasil',2300000,'portugues');

select * from paises;



DECLARE 
CURSOR CUR_PAISES IS SELECT * FROM PAISES;
TOTAL_HABITANTE INTEGER;
BEGIN


TOTAL_HABITANTE:=0;



FOR FILA IN CUR_PAISES LOOP

TOTAL_HABITANTE:=TOTAL_HABITANTE+FILA.HABITANTE;

DBMS_OUTPUT.PUT_LINE('MENSAJITO: '|| FILA.NOMBRE||' HABITANTES: '||FILA.HABITANTE);
END LOOP;
DBMS_OUTPUT.PUT_LINE('HABITANTES DE TODOS LOS PAISES: '||TOTAL_HABITANTE);
END;






create table pais(id_pais varchar2 (4),
                    nombre varchar2 (100),
                    habitante int, 
                    idioma varchar2 (40), 
                    constraint pk_id_pais primary key (id_pais));
            
create table estudiante(id_estudiante int,
                        carrera varchar2(50), 
                        edad int,
                        id_pais varchar2 (4),
                        constraint pk_id_estudiante primary key (id_estudiante),
                        constraint fk1_id_pais foreign key (id_pais) references pais(id_pais));
                        
insert into pais values('mx','Mexico',900000,'español');
insert into pais values('usa','Estados Unidos',1200000,'ingles');
insert into pais values('jpa','Japon',800000,'japones');
insert into pais values('ger','Alemania',1400000,'aleman');
insert into pais values('bra','Brasil',2300000,'portugues');                       

INSERT INTO ESTUDIANTE VALUES(1,'SISTEMAS COMPUTACIONALES',20,'mx');
INSERT INTO ESTUDIANTE VALUES(2,'DERECHO',21,'usa');  
INSERT INTO ESTUDIANTE VALUES(3,'NUTRICION',22,'jpa');
INSERT INTO ESTUDIANTE VALUES(4,'ENFERMERIA',23,'ger');
INSERT INTO ESTUDIANTE VALUES(5,'TELECOMUNICACIONES',24,'bra');
INSERT INTO ESTUDIANTE VALUES(6,'MECATRONICA',25,'mx');
INSERT INTO ESTUDIANTE VALUES(7,'ROBOTICA',26,'mx');  

SELECT * FROM PAIS;




SET SERVEROUTPUT ON;
DECLARE
CURSOR CUR_EMP IS SELECT * FROM empleado_ventas; --CURSOR
CURSOR CUR_SUC IS SELECT * FROM SUCURSAL;

BEGIN

FOR EMP IN CUR_EMP LOOP --LOOP INDICA INCIO DEL CICLO
FOR SUC IN CUR_SUC LOOP
IF EMP.ID_CLIENTE=SUC.ID_CLIENTE THEN

dbms_output.put_line('NOMBRE: '||EMP.NOMBRE_CLIENTE||'     SUCURSAL: '||SUC.NOMBRE);
END IF;
END LOOP;
END LOOP;
END;
/
SELECT * FROM EMPLEADO_VENTAS;





proyecto

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
    </head>
    <body>
        <h1>Proyecto de base de datos</h1>
        <button class="btn btn-primry">Este es un boton feo</button>
        
        
            </body>
</html>>


CREATE TABLE PRODUCTO (ID_PRODUCTO INTEGER, 
DESCRIPCION VARCHAR2(120),  MARCA VARCHAR2(120), 
CATEGORIA VARCHAR2(80), PRECIO FLOAT,
CONSTRAINT PK_ID_PRODUCTO PRIMARY KEY (ID_PRODUCTO));

CREATE TABLE FECHA (ID_FECHA INTEGER, DIA INTEGER,  MES INTEGER, 
ANIO INTEGER,
CONSTRAINT PK1_ID_FECHA PRIMARY KEY (ID_FECHA));

CREATE TABLE ALMACEN (ID_ALMACEN INTEGER, NUMERO INTEGER,  
NOMBRE VARCHAR2(120), ESTADO VARCHAR2(80), MUNICIPIO VARCHAR2(80),
CONSTRAINT PK2_ID_ALAMACEN PRIMARY KEY (ID_ALMACEN));

CREATE TABLE CAJERO (ID_CAJERO INTEGER, NOMBRE VARCHAR2(80), 
A_PATERNO VARCHAR2(80), A_MATERNO VARCHAR2(80), SUELDO FLOAT,
CONSTRAINT PK3_ID_CAJERO PRIMARY KEY (ID_CAJERO));

----CONSTRUIMOS LA TABLA DE HECHOS A PARTIR DE SUS DIMENSIONES Y SUS 
----HECHOS DEFINIDOS

CREATE TABLE VENTA_ALMACEN_FACT (ID_PRODUCTO INTEGER, ID_FECHA INTEGER,  
ID_ALMACEN INTEGER, ID_CAJERO INTEGER, NUM_TRANSACCION INTEGER,
VENTAS_UNIDADES INTEGER,
CONSTRAINT FK_ID_PRODUCTO FOREIGN KEY (ID_PRODUCTO) REFERENCES PRODUCTO(ID_PRODUCTO),
CONSTRAINT FK1_ID_FECHA FOREIGN KEY (ID_FECHA) REFERENCES FECHA(ID_FECHA),
CONSTRAINT FK1_ID_ALMACEN FOREIGN KEY (ID_ALMACEN) REFERENCES ALMACEN(ID_ALMACEN),
CONSTRAINT FK1_ID_CAJERO FOREIGN KEY (ID_CAJERO) REFERENCES CAJERO(ID_CAJERO));

--ENTREGABLE 4

INSERT INTO PRODUCTO VALUES(1,'GALLETAS MARIAS','GAMESA', 'CEREALES', 34.50 );
INSERT INTO PRODUCTO VALUES(2,'QUESO COTTAGE','LYNCOTT', 'LACTEOS', 45.20 );
INSERT INTO PRODUCTO VALUES(3,'DETERGENTE PARA ROMA','ROMA', 'LIMPIEZA',22.20 );
INSERT INTO PRODUCTO VALUES(4,'CUADERNO PROFESIONAL','SCRIBE', 'PAPELERIA', 38.00 );
INSERT INTO PRODUCTO VALUES(5,'YOGURT PARA BEBER','YOPLAIT', 'LACTEOS', 12.50 );
INSERT INTO PRODUCTO VALUES(6,'LIPIADOR FABULOSO','FABULOSO', 'LIMPIEZA', 15.00 );
INSERT INTO PRODUCTO VALUES(7,'PASTA DE DIENTES','COLGATE', 'HIGIENE', 24.50 );
INSERT INTO PRODUCTO VALUES(8,'DESODORANTE','AXE', 'HIGIENE', 43.50 );
INSERT INTO PRODUCTO VALUES(9,'SALSA DE SOYA','KIKOMAN', 'SALSAS', 45.50 );
INSERT INTO PRODUCTO VALUES(10,'HOJUELAS DE MAIZ', 'KELLOGS', 'CEREALES', 36.20 );
INSERT INTO PRODUCTO VALUES(11,'LECHE EVAPORADA','CARNATION', 'LACTEOS ', 16.40 );

select * from PRODUCTO;

INSERT INTO FECHA VALUES (1, 1,10,2015);
INSERT INTO FECHA VALUES (2, 2,10,2015);
INSERT INTO FECHA VALUES (3, 3,10,2015);
INSERT INTO FECHA VALUES (4, 4,10,2015);
INSERT INTO FECHA VALUES (5, 5,10,2015);
INSERT INTO FECHA VALUES (6, 6,10,2015);
INSERT INTO FECHA VALUES (7, 7,10,2015);
INSERT INTO FECHA VALUES (8, 8,10,2015);
INSERT INTO FECHA VALUES (9, 9,10,2015);
INSERT INTO FECHA VALUES (10, 10,10,2015);
INSERT INTO FECHA VALUES (11, 11,10,2015);
INSERT INTO FECHA VALUES (12,12,10,2015);
INSERT INTO FECHA VALUES (13, 13,10,2015);
INSERT INTO FECHA VALUES (14, 14,10,2015);
INSERT INTO FECHA VALUES (15, 15,10,2015);

select * from FECHA;


INSERT INTO ALMACEN VALUES (1,44, 'PLAZA ARAGON','MEXICO','ECATEPEC' );
INSERT INTO ALMACEN VALUES (2,45, 'LAS AMERICAS','MEXICO','ECATEPEC' );
INSERT INTO ALMACEN VALUES (3, 46, 'PLAZA ECATEPEC','MEXICO','ECATEPEC' );
INSERT INTO ALMACEN VALUES (4,47, 'PLAZA COACALCO','MEXICO','COACALCO' );
INSERT INTO ALMACEN VALUES (5,48, 'CENTRALIA','MEXICO','COACALCO');
INSERT INTO ALMACEN VALUES (6,49, 'COSMOPOL','MEXICO','COACALCO');

select * from ALMACEN;


INSERT INTO CAJERO VALUES (1,'JUAN', 'CAMPOS','MARTINEZ',12000);
INSERT INTO CAJERO VALUES (2,'PETRA', 'PEREZ','LOPEZ',9500);
INSERT INTO CAJERO VALUES (3,'PANCRACIO', 'VARGAS','GONZALEZ',8900);
INSERT INTO CAJERO VALUES (4,'ROQUE', 'DALTO','VILLAGRAN',11500);
INSERT INTO CAJERO VALUES (5,'EDUARDO', 'GALEANO','PEREZ',12000);
INSERT INTO CAJERO VALUES (6,'SANDRA', 'GOMEZ','ENRIQUEZ',13200);


select * from producto;

CREATE OR REPLACE PROCEDURE ACTUALIZAR_PRODUCTO 
(MY_ID_PRODUCTO IN INTEGER, 
MY_PRECIO FLOAT
) AS  
 BEGIN 
 --LOGICA 
UPDATE PRODUCTO SET PRECIO = MY_PRECIO WHERE ID_PRODUCTO=MY_ID_PRODUCTO;

 END ACTUALIZAR_PRODUCTO; 

/

CREATE OR REPLACE TRIGGER ACT_PRODUCTO  BEFORE UPDATE  ON PRODUCTO  FOR EACH ROW --DECLARACION DE PROCEDIMIENTO, DISPARADOR

BEGIN-- AQUI VA LA LOGICA 

IF:NEW.PRECIO<:OLD.PRECIO THEN
RAISE_APPLICATION_ERROR(-20001,'LO SIENTO PERO NO PUEDES ASIGNAR UN NUEVO PRECIO MENOR QUE EL ANTERIOR');
END IF;

END;
/

--PROBEMOS
BEGIN
ACTUALIZAR_PRODUCTO(1,34);
END;
/


