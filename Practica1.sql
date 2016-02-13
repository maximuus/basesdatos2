
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

