
--PROBAR EL PODER DE SQL


CREATE TABLE DANCE (ID_DANCER INT,NOMBRE VARCHAR2(40),EDAD INT);

--PRENDEMOS EL SERVIDOR EN MODO DESARROLLADOR

SET SERVEROUTPUT ON;

-- VAMOS A EMPEZAR CON UN BLOQUE PL SQL

DECLARE 
--AQUI SE DECLARAN VARIABLES

EDAD INT;
YEARS INT;

BEGIN
--LOGICA DEL PROGRAMA
YEARS:=20;
EDAD:=YEARS*365;

DBMS_OUTPUT.PUT_LINE('TU EDAD EN DIAS ES' || EDAD);

END;
/
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

