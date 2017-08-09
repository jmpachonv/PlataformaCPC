--------------------------------------------------------
-- Archivo creado  - mi�rcoles-agosto-09-2017   
--------------------------------------------------------
DROP TABLE "CPCDB"."CITA" cascade constraints;
DROP TABLE "CPCDB"."COMENTARIOS_REPORTE" cascade constraints;
DROP TABLE "CPCDB"."CONSECUTIVO_HISTORIA" cascade constraints;
DROP TABLE "CPCDB"."CUPOS" cascade constraints;
DROP TABLE "CPCDB"."DETALLE_PERSONA" cascade constraints;
DROP TABLE "CPCDB"."EPS" cascade constraints;
DROP TABLE "CPCDB"."HISTORIA_CLINICA" cascade constraints;
DROP TABLE "CPCDB"."PERFIL" cascade constraints;
DROP TABLE "CPCDB"."PERSONA" cascade constraints;
DROP TABLE "CPCDB"."REPORTE_SESION" cascade constraints;
DROP TABLE "CPCDB"."REPORTE_VALORACION" cascade constraints;
DROP TABLE "CPCDB"."TIPO_DOCUMENTO" cascade constraints;
DROP TABLE "CPCDB"."TRATAMIENTO" cascade constraints;
DROP SEQUENCE "CPCDB"."CITA_SEQ";
DROP SEQUENCE "CPCDB"."COMENTARIOS_REPORTE_SEQ";
DROP SEQUENCE "CPCDB"."EPS_SEQ";
DROP SEQUENCE "CPCDB"."HISTORIA_SEQ";
DROP SEQUENCE "CPCDB"."PERSONA_SEQ";
DROP SEQUENCE "CPCDB"."REPORTE_CITA_SEQ";
DROP SEQUENCE "CPCDB"."REPORTE_SEQ";
DROP SEQUENCE "CPCDB"."REPORTE_SESION_SEQ";
DROP SEQUENCE "CPCDB"."TIPO_DOCUMENTO_SEQ";
DROP SEQUENCE "CPCDB"."TRATAMIENTO_SEQ";
DROP SEQUENCE "CPCDB"."USUARIO_SEQ";
DROP SEQUENCE "CPCDB"."VALORACION_SEQ";
DROP FUNCTION "CPCDB"."CUSTOM_AUTH";
DROP FUNCTION "CPCDB"."CUSTOM_HASH";
--------------------------------------------------------
--  DDL for Table CITA
--------------------------------------------------------

  CREATE TABLE "CPCDB"."CITA" 
   (	"ID_CITA" NUMBER(8,0), 
	"SALON" VARCHAR2(50 BYTE) DEFAULT 0, 
	"FECHA_SOLICITUD" TIMESTAMP (6) DEFAULT '01/01/00 12:00:00,000000000 AM', 
	"FECHA_CITA" TIMESTAMP (6) DEFAULT '01/01/00 12:00:00,000000000 AM', 
	"ID_PRACTICANTE" NUMBER(8,0) DEFAULT 0, 
	"ID_PACIENTE" NUMBER(8,0) DEFAULT 0, 
	"ESTADO" VARCHAR2(100 BYTE) DEFAULT 'creada', 
	"ID_TRATAMIENTO" NUMBER(8,0) DEFAULT 0, 
	"ES_VALORACION" NUMBER DEFAULT 0, 
	"NUM_CITA" NUMBER DEFAULT 0
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table COMENTARIOS_REPORTE
--------------------------------------------------------

  CREATE TABLE "CPCDB"."COMENTARIOS_REPORTE" 
   (	"ID_COMENTARIOS" NUMBER, 
	"COM_OBJETIVO" VARCHAR2(4000 BYTE) DEFAULT '', 
	"COM_DESCRIPCION" VARCHAR2(4000 BYTE) DEFAULT '', 
	"COM_TAREAS" VARCHAR2(4000 BYTE) DEFAULT '', 
	"COM_ACTIVIDADES" VARCHAR2(4000 BYTE) DEFAULT ''
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table CONSECUTIVO_HISTORIA
--------------------------------------------------------

  CREATE TABLE "CPCDB"."CONSECUTIVO_HISTORIA" 
   (	"ANO" NUMBER DEFAULT 2017, 
	"CONSECUTIVO" NUMBER DEFAULT 1, 
	"SEMESTRE" VARCHAR2(20 BYTE) DEFAULT 'I'
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table CUPOS
--------------------------------------------------------

  CREATE TABLE "CPCDB"."CUPOS" 
   (	"NUMERO" NUMBER DEFAULT 7
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table DETALLE_PERSONA
--------------------------------------------------------

  CREATE TABLE "CPCDB"."DETALLE_PERSONA" 
   (	"ID_PERSONA" NUMBER(8,0), 
	"SEXO" VARCHAR2(20 BYTE), 
	"EDAD" NUMBER, 
	"ACUDIENTE" VARCHAR2(200 BYTE), 
	"PROCESO" VARCHAR2(200 BYTE), 
	"PERTENECE_U" VARCHAR2(20 BYTE), 
	"FACULTAD" VARCHAR2(200 BYTE), 
	"SEMESTRE" VARCHAR2(50 BYTE), 
	"PROBLEMATICA" VARCHAR2(4000 BYTE), 
	"OBSERVACIONES" VARCHAR2(4000 BYTE), 
	"PERSONA_MODIFICA_DATOS" VARCHAR2(200 BYTE), 
	"ESTADO_CIVIL" VARCHAR2(20 BYTE), 
	"FECHA_NACIMIENTO" VARCHAR2(20 BYTE), 
	"LUGAR_NACIMIENTO" VARCHAR2(200 BYTE), 
	"ESCOLARIDAD" VARCHAR2(20 BYTE), 
	"OCUPACION" VARCHAR2(200 BYTE), 
	"LOCALIDAD" VARCHAR2(200 BYTE), 
	"BARRIO" VARCHAR2(200 BYTE), 
	"ESTRATO" NUMBER, 
	"PERSONA_EMERGENCIA" VARCHAR2(200 BYTE), 
	"TELEFONO_EMERGENCIA" VARCHAR2(200 BYTE), 
	"PARENTESCO_EMERGENCIA" VARCHAR2(200 BYTE), 
	"FORMATO_SOLICITUD" VARCHAR2(20 BYTE), 
	"INSTITUCION_REMISION" VARCHAR2(200 BYTE), 
	"PARENTESCO_ACUDIENTE" VARCHAR2(200 BYTE), 
	"TELEFONO_ACUDIENTE" VARCHAR2(200 BYTE), 
	"PERSONAS_RESIDE" VARCHAR2(4000 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table EPS
--------------------------------------------------------

  CREATE TABLE "CPCDB"."EPS" 
   (	"ID_EPS" NUMBER(8,0) DEFAULT 0, 
	"NOMBRE_EPS" VARCHAR2(200 BYTE) DEFAULT ''
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table HISTORIA_CLINICA
--------------------------------------------------------

  CREATE TABLE "CPCDB"."HISTORIA_CLINICA" 
   (	"ID_HISTORIA" NUMBER, 
	"ID_PACIENTE" NUMBER, 
	"CODIGO" VARCHAR2(200 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table PERFIL
--------------------------------------------------------

  CREATE TABLE "CPCDB"."PERFIL" 
   (	"ID_PERFIL" NUMBER(8,0) DEFAULT 0, 
	"NOMBRE_PERFIL" VARCHAR2(100 BYTE) DEFAULT '', 
	"PERMISO" VARCHAR2(100 BYTE) DEFAULT ''
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table PERSONA
--------------------------------------------------------

  CREATE TABLE "CPCDB"."PERSONA" 
   (	"ID_PERSONA" NUMBER(8,0) DEFAULT 0, 
	"PRIMER_NOMBRE" VARCHAR2(200 BYTE) DEFAULT '', 
	"SEGUNDO_NOMBRE" VARCHAR2(200 BYTE) DEFAULT '', 
	"PRIMER_APELLIDO" VARCHAR2(200 BYTE) DEFAULT '', 
	"SEGUNDO_APELLIDO" VARCHAR2(200 BYTE) DEFAULT '', 
	"NUMERO_DOCUMENTO" VARCHAR2(200 BYTE) DEFAULT '', 
	"DIRECCION" VARCHAR2(200 BYTE) DEFAULT '', 
	"TELEFONO" NUMBER(12,0) DEFAULT 0, 
	"TIPO_DOCUMENTO_ID_DOCUMENTO" NUMBER(8,0) DEFAULT 0, 
	"EPS_ID_EPS" NUMBER(8,0) DEFAULT 0, 
	"PERSONA_ID_SUPERIOR" NUMBER(8,0) DEFAULT NULL, 
	"PERFIL_ID_PERFIL" NUMBER(8,0) DEFAULT 0, 
	"PERSONA_ID_PERSONA" NUMBER(8,0) DEFAULT NULL, 
	"USUARIO" VARCHAR2(30 BYTE) DEFAULT '', 
	"PASS" VARCHAR2(30 BYTE) DEFAULT 'clave321', 
	"CORREO" VARCHAR2(100 BYTE) DEFAULT '', 
	"OTRO_TEL" NUMBER(12,0) DEFAULT 0, 
	"CODIGO" NUMBER(12,0) DEFAULT 0, 
	"JORNADA" VARCHAR2(20 BYTE) DEFAULT 'dia'
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table REPORTE_SESION
--------------------------------------------------------

  CREATE TABLE "CPCDB"."REPORTE_SESION" 
   (	"ID_SESION" NUMBER DEFAULT 0, 
	"FECHA" TIMESTAMP (6) DEFAULT '01/01/00 12:00:00,000000000 AM', 
	"NOMBRE_PROFESIONAL" VARCHAR2(200 BYTE) DEFAULT '', 
	"OBJETIVO_SESION" VARCHAR2(4000 BYTE) DEFAULT '', 
	"DESCRIPCION_SESION" VARCHAR2(4000 BYTE) DEFAULT '', 
	"TAREAS_ASIGNADAS" VARCHAR2(4000 BYTE) DEFAULT '', 
	"ACTIVIDADES_PROX_SESION" VARCHAR2(4000 BYTE), 
	"RECIBO" NUMBER DEFAULT 0, 
	"ES_FALLO" NUMBER DEFAULT 0, 
	"ID_COMENTARIOS" NUMBER DEFAULT 0, 
	"ID_CITA" VARCHAR2(200 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table REPORTE_VALORACION
--------------------------------------------------------

  CREATE TABLE "CPCDB"."REPORTE_VALORACION" 
   (	"ID_VALORACION" NUMBER, 
	"ID_CITA" NUMBER, 
	"MOTIVO" VARCHAR2(4000 BYTE), 
	"REPORTA" VARCHAR2(200 BYTE), 
	"COMPORTAMIENTO" VARCHAR2(4000 BYTE), 
	"HIPOTESIS" VARCHAR2(4000 BYTE), 
	"SERVICIO_REMITIDO" VARCHAR2(4000 BYTE), 
	"ENCUESTADOR" VARCHAR2(4000 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table TIPO_DOCUMENTO
--------------------------------------------------------

  CREATE TABLE "CPCDB"."TIPO_DOCUMENTO" 
   (	"ID_DOCUMENTO" NUMBER(8,0) DEFAULT 0, 
	"SIGLA" VARCHAR2(5 BYTE) DEFAULT 'CC', 
	"NOMBRE_DOCUMENTO" VARCHAR2(100 BYTE) DEFAULT ''
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table TRATAMIENTO
--------------------------------------------------------

  CREATE TABLE "CPCDB"."TRATAMIENTO" 
   (	"ID_TRATAMIENTO" NUMBER(8,0) DEFAULT 0, 
	"ID_PACIENTE" NUMBER(8,0) DEFAULT 0, 
	"ESTADO" VARCHAR2(20 BYTE) DEFAULT 'valoracion', 
	"FECHA_INICIO" TIMESTAMP (6) DEFAULT '01/01/00 12:00:00,000000000 AM', 
	"FECHA_CIERRE" TIMESTAMP (6) DEFAULT '01/01/00 12:00:00,000000000 AM', 
	"TIPO" VARCHAR2(100 BYTE) DEFAULT 'individual', 
	"NUM_CITA_ACTUAL" NUMBER DEFAULT 0, 
	"PENDIENTE" NUMBER DEFAULT 0
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Sequence CITA_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "CPCDB"."CITA_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 61 CACHE 20 ORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence COMENTARIOS_REPORTE_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "CPCDB"."COMENTARIOS_REPORTE_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 41 CACHE 20 ORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence EPS_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "CPCDB"."EPS_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 ORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence HISTORIA_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "CPCDB"."HISTORIA_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 41 CACHE 20 ORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence PERSONA_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "CPCDB"."PERSONA_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 41 CACHE 20 ORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence REPORTE_CITA_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "CPCDB"."REPORTE_CITA_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 ORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence REPORTE_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "CPCDB"."REPORTE_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 ORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence REPORTE_SESION_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "CPCDB"."REPORTE_SESION_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 61 CACHE 20 ORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence TIPO_DOCUMENTO_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "CPCDB"."TIPO_DOCUMENTO_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 5 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence TRATAMIENTO_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "CPCDB"."TRATAMIENTO_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 41 CACHE 20 ORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence USUARIO_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "CPCDB"."USUARIO_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 ORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence VALORACION_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "CPCDB"."VALORACION_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 41 CACHE 20 ORDER  NOCYCLE ;
REM INSERTING into CPCDB.CITA
SET DEFINE OFF;
REM INSERTING into CPCDB.COMENTARIOS_REPORTE
SET DEFINE OFF;
Insert into CPCDB.COMENTARIOS_REPORTE (ID_COMENTARIOS,COM_OBJETIVO,COM_DESCRIPCION,COM_TAREAS,COM_ACTIVIDADES) values ('0',null,null,null,null);
REM INSERTING into CPCDB.CONSECUTIVO_HISTORIA
SET DEFINE OFF;
Insert into CPCDB.CONSECUTIVO_HISTORIA (ANO,CONSECUTIVO,SEMESTRE) values ('2017','1','I');
REM INSERTING into CPCDB.CUPOS
SET DEFINE OFF;
Insert into CPCDB.CUPOS (NUMERO) values ('4');
REM INSERTING into CPCDB.DETALLE_PERSONA
SET DEFINE OFF;
REM INSERTING into CPCDB.EPS
SET DEFINE OFF;
Insert into CPCDB.EPS (ID_EPS,NOMBRE_EPS) values ('0','No Aplica');
REM INSERTING into CPCDB.HISTORIA_CLINICA
SET DEFINE OFF;
REM INSERTING into CPCDB.PERFIL
SET DEFINE OFF;
Insert into CPCDB.PERFIL (ID_PERFIL,NOMBRE_PERFIL,PERMISO) values ('1','Administrador',null);
Insert into CPCDB.PERFIL (ID_PERFIL,NOMBRE_PERFIL,PERMISO) values ('2','Supervisor',null);
Insert into CPCDB.PERFIL (ID_PERFIL,NOMBRE_PERFIL,PERMISO) values ('3','Practicante',null);
Insert into CPCDB.PERFIL (ID_PERFIL,NOMBRE_PERFIL,PERMISO) values ('4','Paciente',null);
REM INSERTING into CPCDB.PERSONA
SET DEFINE OFF;
Insert into CPCDB.PERSONA (ID_PERSONA,PRIMER_NOMBRE,SEGUNDO_NOMBRE,PRIMER_APELLIDO,SEGUNDO_APELLIDO,NUMERO_DOCUMENTO,DIRECCION,TELEFONO,TIPO_DOCUMENTO_ID_DOCUMENTO,EPS_ID_EPS,PERSONA_ID_SUPERIOR,PERFIL_ID_PERFIL,PERSONA_ID_PERSONA,USUARIO,PASS,CORREO,OTRO_TEL,CODIGO,JORNADA) values ('0','Admin',null,null,null,'9876543210',null,null,'1',null,null,'1',null,null,'cpc_admin',null,'0','0','manana');
REM INSERTING into CPCDB.REPORTE_SESION
SET DEFINE OFF;
REM INSERTING into CPCDB.REPORTE_VALORACION
SET DEFINE OFF;
REM INSERTING into CPCDB.TIPO_DOCUMENTO
SET DEFINE OFF;
Insert into CPCDB.TIPO_DOCUMENTO (ID_DOCUMENTO,SIGLA,NOMBRE_DOCUMENTO) values ('1','CC','Cedula de Ciudadania');
Insert into CPCDB.TIPO_DOCUMENTO (ID_DOCUMENTO,SIGLA,NOMBRE_DOCUMENTO) values ('2','TI','Tarjeta de Identidad');
Insert into CPCDB.TIPO_DOCUMENTO (ID_DOCUMENTO,SIGLA,NOMBRE_DOCUMENTO) values ('3','CE','Cedula de Extranjeria');
Insert into CPCDB.TIPO_DOCUMENTO (ID_DOCUMENTO,SIGLA,NOMBRE_DOCUMENTO) values ('4','RC','Registro Civill');
REM INSERTING into CPCDB.TRATAMIENTO
SET DEFINE OFF;
--------------------------------------------------------
--  DDL for Index REPORTE_VALORACION_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CPCDB"."REPORTE_VALORACION_PK" ON "CPCDB"."REPORTE_VALORACION" ("ID_VALORACION") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PERSONA_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CPCDB"."PERSONA_PK" ON "CPCDB"."PERSONA" ("ID_PERSONA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index CITA_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CPCDB"."CITA_PK" ON "CPCDB"."CITA" ("ID_CITA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index COMENTARIOS_REPORTE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CPCDB"."COMENTARIOS_REPORTE_PK" ON "CPCDB"."COMENTARIOS_REPORTE" ("ID_COMENTARIOS") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SESION_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CPCDB"."SESION_PK" ON "CPCDB"."REPORTE_SESION" ("ID_SESION") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index CUPOS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CPCDB"."CUPOS_PK" ON "CPCDB"."CUPOS" ("NUMERO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index TIPO_DOCUMENTO_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CPCDB"."TIPO_DOCUMENTO_PK" ON "CPCDB"."TIPO_DOCUMENTO" ("ID_DOCUMENTO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PERFIL_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CPCDB"."PERFIL_PK" ON "CPCDB"."PERFIL" ("ID_PERFIL") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index TRATAMIENTO_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CPCDB"."TRATAMIENTO_PK" ON "CPCDB"."TRATAMIENTO" ("ID_TRATAMIENTO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index HISTORIA_CLINICA_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CPCDB"."HISTORIA_CLINICA_PK" ON "CPCDB"."HISTORIA_CLINICA" ("ID_HISTORIA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index EPS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CPCDB"."EPS_PK" ON "CPCDB"."EPS" ("ID_EPS") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Function CUSTOM_AUTH
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "CPCDB"."CUSTOM_AUTH" (p_username in VARCHAR2, p_password in VARCHAR2)
return BOOLEAN
is
  l_password varchar2(4000);
  l_stored_password varchar2(4000);
  l_expires_on date;
  l_count number;
begin
-- First, check to see if the user is in the user table
select count(*) into l_count from demo_users where user_name = p_username;
if l_count > 0 then
  -- First, we fetch the stored hashed password & expire date
  select password, expires_on into l_stored_password, l_expires_on
   from demo_users where user_name = p_username;

  -- Next, we check to see if the user's account is expired
  -- If it is, return FALSE
  if l_expires_on > sysdate or l_expires_on is null then

    -- If the account is not expired, we have to apply the custom hash
    -- function to the password
    l_password := custom_hash(p_username, p_password);

    -- Finally, we compare them to see if they are the same and return
    -- either TRUE or FALSE
    if l_password = l_stored_password then
      return true;
    else
      return false;
    end if;
  else
    return false;
  end if;
else
  -- The username provided is not in the DEMO_USERS table
  return false;
end if;
end;



/
--------------------------------------------------------
--  DDL for Function CUSTOM_HASH
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "CPCDB"."CUSTOM_HASH" (p_username in varchar2, p_password in varchar2)
return varchar2
is
  l_password varchar2(4000);
  l_salt varchar2(4000) := 'BBCXDLDDKDMSHUSGINDARXMEC26KIZ';
begin

-- This function should be wrapped, as the hash algorhythm is exposed here.
-- You can change the value of l_salt or the method of which to call the
-- DBMS_OBFUSCATOIN toolkit, but you much reset all of your passwords
-- if you choose to do this.

l_password := utl_raw.cast_to_raw(dbms_obfuscation_toolkit.md5
  (input_string => p_password || substr(l_salt,10,13) || p_username ||
    substr(l_salt, 4,10)));
return l_password;
end;



/
--------------------------------------------------------
--  Constraints for Table PERSONA
--------------------------------------------------------

  ALTER TABLE "CPCDB"."PERSONA" MODIFY ("PERFIL_ID_PERFIL" NOT NULL ENABLE);
  ALTER TABLE "CPCDB"."PERSONA" MODIFY ("ID_PERSONA" NOT NULL ENABLE);
  ALTER TABLE "CPCDB"."PERSONA" ADD CONSTRAINT "PERSONA_PK" PRIMARY KEY ("ID_PERSONA")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table REPORTE_SESION
--------------------------------------------------------

  ALTER TABLE "CPCDB"."REPORTE_SESION" MODIFY ("ID_CITA" NOT NULL ENABLE);
  ALTER TABLE "CPCDB"."REPORTE_SESION" MODIFY ("ID_SESION" NOT NULL ENABLE);
  ALTER TABLE "CPCDB"."REPORTE_SESION" ADD CONSTRAINT "SESION_PK" PRIMARY KEY ("ID_SESION")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table REPORTE_VALORACION
--------------------------------------------------------

  ALTER TABLE "CPCDB"."REPORTE_VALORACION" MODIFY ("ID_CITA" NOT NULL ENABLE);
  ALTER TABLE "CPCDB"."REPORTE_VALORACION" ADD CONSTRAINT "REPORTE_VALORACION_PK" PRIMARY KEY ("ID_VALORACION")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "CPCDB"."REPORTE_VALORACION" MODIFY ("ID_VALORACION" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TIPO_DOCUMENTO
--------------------------------------------------------

  ALTER TABLE "CPCDB"."TIPO_DOCUMENTO" MODIFY ("ID_DOCUMENTO" NOT NULL ENABLE);
  ALTER TABLE "CPCDB"."TIPO_DOCUMENTO" ADD CONSTRAINT "TIPO_DOCUMENTO_PK" PRIMARY KEY ("ID_DOCUMENTO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table TRATAMIENTO
--------------------------------------------------------

  ALTER TABLE "CPCDB"."TRATAMIENTO" MODIFY ("ID_PACIENTE" NOT NULL ENABLE);
  ALTER TABLE "CPCDB"."TRATAMIENTO" ADD CONSTRAINT "TRATAMIENTO_PK" PRIMARY KEY ("ID_TRATAMIENTO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "CPCDB"."TRATAMIENTO" MODIFY ("ID_TRATAMIENTO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CITA
--------------------------------------------------------

  ALTER TABLE "CPCDB"."CITA" MODIFY ("ID_TRATAMIENTO" NOT NULL ENABLE);
  ALTER TABLE "CPCDB"."CITA" MODIFY ("ID_PACIENTE" NOT NULL ENABLE);
  ALTER TABLE "CPCDB"."CITA" MODIFY ("ID_PRACTICANTE" NOT NULL ENABLE);
  ALTER TABLE "CPCDB"."CITA" MODIFY ("ID_CITA" NOT NULL ENABLE);
  ALTER TABLE "CPCDB"."CITA" ADD CONSTRAINT "CITA_PK" PRIMARY KEY ("ID_CITA")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table PERFIL
--------------------------------------------------------

  ALTER TABLE "CPCDB"."PERFIL" MODIFY ("ID_PERFIL" NOT NULL ENABLE);
  ALTER TABLE "CPCDB"."PERFIL" ADD CONSTRAINT "PERFIL_PK" PRIMARY KEY ("ID_PERFIL")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table EPS
--------------------------------------------------------

  ALTER TABLE "CPCDB"."EPS" MODIFY ("ID_EPS" NOT NULL ENABLE);
  ALTER TABLE "CPCDB"."EPS" ADD CONSTRAINT "EPS_PK" PRIMARY KEY ("ID_EPS")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table HISTORIA_CLINICA
--------------------------------------------------------

  ALTER TABLE "CPCDB"."HISTORIA_CLINICA" MODIFY ("ID_PACIENTE" NOT NULL ENABLE);
  ALTER TABLE "CPCDB"."HISTORIA_CLINICA" MODIFY ("ID_HISTORIA" NOT NULL ENABLE);
  ALTER TABLE "CPCDB"."HISTORIA_CLINICA" ADD CONSTRAINT "HISTORIA_CLINICA_PK" PRIMARY KEY ("ID_HISTORIA")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table DETALLE_PERSONA
--------------------------------------------------------

  ALTER TABLE "CPCDB"."DETALLE_PERSONA" MODIFY ("ID_PERSONA" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table COMENTARIOS_REPORTE
--------------------------------------------------------

  ALTER TABLE "CPCDB"."COMENTARIOS_REPORTE" MODIFY ("ID_COMENTARIOS" NOT NULL ENABLE);
  ALTER TABLE "CPCDB"."COMENTARIOS_REPORTE" ADD CONSTRAINT "COMENTARIOS_REPORTE_PK" PRIMARY KEY ("ID_COMENTARIOS")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table CITA
--------------------------------------------------------

  ALTER TABLE "CPCDB"."CITA" ADD CONSTRAINT "FK_PACIENTE_CITA" FOREIGN KEY ("ID_PACIENTE")
	  REFERENCES "CPCDB"."PERSONA" ("ID_PERSONA") ENABLE;
  ALTER TABLE "CPCDB"."CITA" ADD CONSTRAINT "FK_PRACTICANTE" FOREIGN KEY ("ID_PRACTICANTE")
	  REFERENCES "CPCDB"."PERSONA" ("ID_PERSONA") ENABLE;
  ALTER TABLE "CPCDB"."CITA" ADD CONSTRAINT "FK_TRATAMIENTO" FOREIGN KEY ("ID_TRATAMIENTO")
	  REFERENCES "CPCDB"."TRATAMIENTO" ("ID_TRATAMIENTO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table DETALLE_PERSONA
--------------------------------------------------------

  ALTER TABLE "CPCDB"."DETALLE_PERSONA" ADD CONSTRAINT "DETALLE_PERSONA_FK1" FOREIGN KEY ("ID_PERSONA")
	  REFERENCES "CPCDB"."PERSONA" ("ID_PERSONA") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table HISTORIA_CLINICA
--------------------------------------------------------

  ALTER TABLE "CPCDB"."HISTORIA_CLINICA" ADD CONSTRAINT "HISTORIA_CLINICA_FK1" FOREIGN KEY ("ID_HISTORIA")
	  REFERENCES "CPCDB"."PERSONA" ("ID_PERSONA") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PERSONA
--------------------------------------------------------

  ALTER TABLE "CPCDB"."PERSONA" ADD CONSTRAINT "FK_DOCUMENTO" FOREIGN KEY ("TIPO_DOCUMENTO_ID_DOCUMENTO")
	  REFERENCES "CPCDB"."TIPO_DOCUMENTO" ("ID_DOCUMENTO") ENABLE;
  ALTER TABLE "CPCDB"."PERSONA" ADD CONSTRAINT "FK_EPS" FOREIGN KEY ("EPS_ID_EPS")
	  REFERENCES "CPCDB"."EPS" ("ID_EPS") ENABLE;
  ALTER TABLE "CPCDB"."PERSONA" ADD CONSTRAINT "FK_PERFIL" FOREIGN KEY ("PERFIL_ID_PERFIL")
	  REFERENCES "CPCDB"."PERFIL" ("ID_PERFIL") ENABLE;
  ALTER TABLE "CPCDB"."PERSONA" ADD CONSTRAINT "FK_SUPERIOR" FOREIGN KEY ("PERSONA_ID_SUPERIOR")
	  REFERENCES "CPCDB"."PERSONA" ("ID_PERSONA") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table REPORTE_SESION
--------------------------------------------------------

  ALTER TABLE "CPCDB"."REPORTE_SESION" ADD CONSTRAINT "REPORTE_SESION_FK1" FOREIGN KEY ("ID_COMENTARIOS")
	  REFERENCES "CPCDB"."COMENTARIOS_REPORTE" ("ID_COMENTARIOS") ENABLE;
  ALTER TABLE "CPCDB"."REPORTE_SESION" ADD CONSTRAINT "REPORTE_SESION_FK2" FOREIGN KEY ("ID_SESION")
	  REFERENCES "CPCDB"."CITA" ("ID_CITA") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table REPORTE_VALORACION
--------------------------------------------------------

  ALTER TABLE "CPCDB"."REPORTE_VALORACION" ADD CONSTRAINT "REPORTE_VALORACION_FK1" FOREIGN KEY ("ID_CITA")
	  REFERENCES "CPCDB"."CITA" ("ID_CITA") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table TRATAMIENTO
--------------------------------------------------------

  ALTER TABLE "CPCDB"."TRATAMIENTO" ADD CONSTRAINT "FK_PACIENTE_TRATAMIENTO" FOREIGN KEY ("ID_PACIENTE")
	  REFERENCES "CPCDB"."PERSONA" ("ID_PERSONA") ENABLE;
