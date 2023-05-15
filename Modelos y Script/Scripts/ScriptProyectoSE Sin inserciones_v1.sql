/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     11/05/2023 0:10:09                           */
/*==============================================================*/


alter table ACCESO
   drop constraint FK_ACCESO_ASIGNA_TAQUILLA;

alter table ACCESO
   drop constraint FK_ACCESO_ESCOGE_MENU;

alter table ACCESO
   drop constraint FK_ACCESO_HACE_ZONA_JUE;

alter table ACCESO
   drop constraint FK_ACCESO_RELATIONS_USUARIO;

alter table ASISTE
   drop constraint FK_ASISTE_ASISTE_EVENTO;

alter table ASISTE
   drop constraint FK_ASISTE_ASISTE2_USUARIO;

alter table CORRESPONDE
   drop constraint FK_CORRESPO_CORRESPON_EVENTO;

alter table CORRESPONDE
   drop constraint FK_CORRESPO_CORRESPON_RESERVA;

alter table EVENTO
   drop constraint FK_EVENTO_OFRECE_MENU;

alter table INCLUYE
   drop constraint FK_INCLUYE_INCLUYE_ANIMACIO;

alter table INCLUYE
   drop constraint FK_INCLUYE_INCLUYE2_EVENTO;

alter table RESERVA
   drop constraint FK_RESERVA_ADMITE_USUARIO;

alter table TIENE
   drop constraint FK_TIENE_TIENE_USUARIO;

alter table TIENE
   drop constraint FK_TIENE_TIENE2_USUARIO;

alter table TRABAJA
   drop constraint FK_TRABAJA_TRABAJA_PERSONAL;

alter table TRABAJA
   drop constraint FK_TRABAJA_TRABAJA2_ZONA_JUE;

drop index HACE_FK;

drop index ESCOGE_FK;

drop index ASIGNA_FK;

drop index RELATIONSHIP_2_FK;

drop table ACCESO cascade constraints;

drop table ANIMACION cascade constraints;

drop index ASISTE_FK;

drop index ASISTE2_FK;

drop table ASISTE cascade constraints;

drop index CORRESPONDE_FK;

drop index CORRESPONDE2_FK;

drop table CORRESPONDE cascade constraints;

drop index OFRECE_FK;

drop table EVENTO cascade constraints;

drop index INCLUYE_FK;

drop index INCLUYE2_FK;

drop table INCLUYE cascade constraints;

drop table MENU cascade constraints;

drop table PERSONAL cascade constraints;

drop index ADMITE_FK;

drop table RESERVA cascade constraints;

drop table TAQUILLA cascade constraints;

drop index TIENE_FK;

drop index TIENE2_FK;

drop table TIENE cascade constraints;

drop index TRABAJA_FK;

drop index TRABAJA2_FK;

drop table TRABAJA cascade constraints;

drop table USUARIO cascade constraints;

drop table ZONA_JUEGOS cascade constraints;

/*==============================================================*/
/* Table: ACCESO                                                */
/*==============================================================*/
create table ACCESO 
(
   NUMERO_ACCESO        NUMBER(10)           not null,
   DNI_USUARIO          VARCHAR2(9),
   NUMERO_TAQUILLA      NUMBER(2)            not null,
   ID_MENU              NUMBER(1),
   ID_ZONAJUEGO         NUMBER(10)           not null,
   PRECIO_ACCESO        NUMBER(50),
   FECHA_ACCESO         DATE,
   constraint PK_ACCESO primary key (NUMERO_ACCESO)
);

/*==============================================================*/
/* Index: RELATIONSHIP_2_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_2_FK on ACCESO (
   DNI_USUARIO ASC
);

/*==============================================================*/
/* Index: ASIGNA_FK                                             */
/*==============================================================*/
create index ASIGNA_FK on ACCESO (
   NUMERO_TAQUILLA ASC
);

/*==============================================================*/
/* Index: ESCOGE_FK                                             */
/*==============================================================*/
create index ESCOGE_FK on ACCESO (
   ID_MENU ASC
);

/*==============================================================*/
/* Index: HACE_FK                                               */
/*==============================================================*/
create index HACE_FK on ACCESO (
   ID_ZONAJUEGO ASC
);

/*==============================================================*/
/* Table: ANIMACION                                             */
/*==============================================================*/
create table ANIMACION 
(
   DNI_ANIMADOR         VARCHAR2(9)          not null,
   NOMBRE_ANIMADOR      VARCHAR2(100),
   TELEFONO_ANIMADOR    NUMBER(9),
   DIRECCION_ANIMADOR   VARCHAR2(100),
   constraint PK_ANIMACION primary key (DNI_ANIMADOR)
);

/*==============================================================*/
/* Table: ASISTE                                                */
/*==============================================================*/
create table ASISTE 
(
   ID_EVENTO            NUMBER(10)           not null,
   DNI_USUARIO          VARCHAR2(9)          not null,
   constraint PK_ASISTE primary key (ID_EVENTO, DNI_USUARIO)
);

/*==============================================================*/
/* Index: ASISTE2_FK                                            */
/*==============================================================*/
create index ASISTE2_FK on ASISTE (
   DNI_USUARIO ASC
);

/*==============================================================*/
/* Index: ASISTE_FK                                             */
/*==============================================================*/
create index ASISTE_FK on ASISTE (
   ID_EVENTO ASC
);

/*==============================================================*/
/* Table: CORRESPONDE                                           */
/*==============================================================*/
create table CORRESPONDE 
(
   ID_EVENTO            NUMBER(10)           not null,
   ID_RESERVA           NUMBER(3)            not null,
   constraint PK_CORRESPONDE primary key (ID_EVENTO, ID_RESERVA)
);

/*==============================================================*/
/* Index: CORRESPONDE2_FK                                       */
/*==============================================================*/
create index CORRESPONDE2_FK on CORRESPONDE (
   ID_RESERVA ASC
);

/*==============================================================*/
/* Index: CORRESPONDE_FK                                        */
/*==============================================================*/
create index CORRESPONDE_FK on CORRESPONDE (
   ID_EVENTO ASC
);

/*==============================================================*/
/* Table: EVENTO                                                */
/*==============================================================*/
create table EVENTO 
(
   ID_EVENTO            NUMBER(10)           not null,
   ID_MENU              NUMBER(1),
   NOMBRE_EVENTO        VARCHAR2(100),
   FECHA_EVENTO         DATE,
   NUMERO_SALA          NUMBER(10),
   ES_CUMPLE            SMALLINT,
   constraint PK_EVENTO primary key (ID_EVENTO)
);

/*==============================================================*/
/* Index: OFRECE_FK                                             */
/*==============================================================*/
create index OFRECE_FK on EVENTO (
   ID_MENU ASC
);

/*==============================================================*/
/* Table: INCLUYE                                               */
/*==============================================================*/
create table INCLUYE 
(
   DNI_ANIMADOR         VARCHAR2(9)          not null,
   ID_EVENTO            NUMBER(10)           not null,
   constraint PK_INCLUYE primary key (DNI_ANIMADOR, ID_EVENTO)
);

/*==============================================================*/
/* Index: INCLUYE2_FK                                           */
/*==============================================================*/
create index INCLUYE2_FK on INCLUYE (
   ID_EVENTO ASC
);

/*==============================================================*/
/* Index: INCLUYE_FK                                            */
/*==============================================================*/
create index INCLUYE_FK on INCLUYE (
   DNI_ANIMADOR ASC
);

/*==============================================================*/
/* Table: MENU                                                  */
/*==============================================================*/
create table MENU 
(
   ID_MENU              NUMBER(1)            not null,
   NOMBRE_MENU          VARCHAR2(100),
   PRECIO_MENU          NUMBER(4,2),
   constraint PK_MENU primary key (ID_MENU)
);

/*==============================================================*/
/* Table: PERSONAL                                              */
/*==============================================================*/
create table PERSONAL 
(
   DNI_PERSONAL         VARCHAR2(9)          not null,
   NOMBRE_PERSONAL      VARCHAR2(100),
   TELEFONO_PERSONAL    NUMBER(9),
   DIRECCION_PERSONAL   VARCHAR2(100),
   CORREO_PERSONAL      VARCHAR2(100),
   PUESTO_PERSONAL      VARCHAR2(100),
   constraint PK_PERSONAL primary key (DNI_PERSONAL)
);

/*==============================================================*/
/* Table: RESERVA                                               */
/*==============================================================*/
create table RESERVA 
(
   ID_RESERVA           NUMBER(3)            not null,
   DNI_USUARIO          VARCHAR2(9)          not null,
   FECHA_RESERVA        DATE,
   constraint PK_RESERVA primary key (ID_RESERVA)
);

/*==============================================================*/
/* Index: ADMITE_FK                                             */
/*==============================================================*/
create index ADMITE_FK on RESERVA (
   DNI_USUARIO ASC
);

/*==============================================================*/
/* Table: TAQUILLA                                              */
/*==============================================================*/
create table TAQUILLA 
(
   NUMERO_TAQUILLA      NUMBER(2)            not null,
   constraint PK_TAQUILLA primary key (NUMERO_TAQUILLA)
);

/*==============================================================*/
/* Table: TIENE                                                 */
/*==============================================================*/
create table TIENE 
(
   USU_DNI_USUARIO      VARCHAR2(9)          not null,
   DNI_USUARIO          VARCHAR2(9)          not null,
   constraint PK_TIENE primary key (USU_DNI_USUARIO, DNI_USUARIO)
);

/*==============================================================*/
/* Index: TIENE2_FK                                             */
/*==============================================================*/
create index TIENE2_FK on TIENE (
   DNI_USUARIO ASC
);

/*==============================================================*/
/* Index: TIENE_FK                                              */
/*==============================================================*/
create index TIENE_FK on TIENE (
   USU_DNI_USUARIO ASC
);

/*==============================================================*/
/* Table: TRABAJA                                               */
/*==============================================================*/
create table TRABAJA 
(
   DNI_PERSONAL         VARCHAR2(9)          not null,
   ID_ZONAJUEGO         NUMBER(10)           not null,
   constraint PK_TRABAJA primary key (DNI_PERSONAL, ID_ZONAJUEGO)
);

/*==============================================================*/
/* Index: TRABAJA2_FK                                           */
/*==============================================================*/
create index TRABAJA2_FK on TRABAJA (
   ID_ZONAJUEGO ASC
);

/*==============================================================*/
/* Index: TRABAJA_FK                                            */
/*==============================================================*/
create index TRABAJA_FK on TRABAJA (
   DNI_PERSONAL ASC
);

/*==============================================================*/
/* Table: USUARIO                                               */
/*==============================================================*/
create table USUARIO 
(
   DNI_USUARIO          VARCHAR2(9)          not null,
   NOMBRE_USUARIO       VARCHAR2(100),
   TELEFONO_USUARIO     NUMBER(9),
   CORREO_USUARIO       VARCHAR2(200),
   DIRECCION_USUARIO    VARCHAR2(100),
   ALERGIAS_USUARIO     VARCHAR2(100),
   FECHA_NACIMIENTO_USUARIO DATE,
   constraint PK_USUARIO primary key (DNI_USUARIO)
);

/*==============================================================*/
/* Table: ZONA_JUEGOS                                           */
/*==============================================================*/
create table ZONA_JUEGOS 
(
   ID_ZONAJUEGO         NUMBER(10)           not null,
   NOMBRE_ZONAJUEGO     VARCHAR2(100),
   constraint PK_ZONA_JUEGOS primary key (ID_ZONAJUEGO)
);

alter table ACCESO
   add constraint FK_ACCESO_ASIGNA_TAQUILLA foreign key (NUMERO_TAQUILLA)
      references TAQUILLA (NUMERO_TAQUILLA);

alter table ACCESO
   add constraint FK_ACCESO_ESCOGE_MENU foreign key (ID_MENU)
      references MENU (ID_MENU);

alter table ACCESO
   add constraint FK_ACCESO_HACE_ZONA_JUE foreign key (ID_ZONAJUEGO)
      references ZONA_JUEGOS (ID_ZONAJUEGO);

alter table ACCESO
   add constraint FK_ACCESO_RELATIONS_USUARIO foreign key (DNI_USUARIO)
      references USUARIO (DNI_USUARIO);

alter table ASISTE
   add constraint FK_ASISTE_ASISTE_EVENTO foreign key (ID_EVENTO)
      references EVENTO (ID_EVENTO);

alter table ASISTE
   add constraint FK_ASISTE_ASISTE2_USUARIO foreign key (DNI_USUARIO)
      references USUARIO (DNI_USUARIO);

alter table CORRESPONDE
   add constraint FK_CORRESPO_CORRESPON_EVENTO foreign key (ID_EVENTO)
      references EVENTO (ID_EVENTO);

alter table CORRESPONDE
   add constraint FK_CORRESPO_CORRESPON_RESERVA foreign key (ID_RESERVA)
      references RESERVA (ID_RESERVA);

alter table EVENTO
   add constraint FK_EVENTO_OFRECE_MENU foreign key (ID_MENU)
      references MENU (ID_MENU);

alter table INCLUYE
   add constraint FK_INCLUYE_INCLUYE_ANIMACIO foreign key (DNI_ANIMADOR)
      references ANIMACION (DNI_ANIMADOR);

alter table INCLUYE
   add constraint FK_INCLUYE_INCLUYE2_EVENTO foreign key (ID_EVENTO)
      references EVENTO (ID_EVENTO);

alter table RESERVA
   add constraint FK_RESERVA_ADMITE_USUARIO foreign key (DNI_USUARIO)
      references USUARIO (DNI_USUARIO);

alter table TIENE
   add constraint FK_TIENE_TIENE_USUARIO foreign key (USU_DNI_USUARIO)
      references USUARIO (DNI_USUARIO);

alter table TIENE
   add constraint FK_TIENE_TIENE2_USUARIO foreign key (DNI_USUARIO)
      references USUARIO (DNI_USUARIO);

alter table TRABAJA
   add constraint FK_TRABAJA_TRABAJA_PERSONAL foreign key (DNI_PERSONAL)
      references PERSONAL (DNI_PERSONAL);

alter table TRABAJA
   add constraint FK_TRABAJA_TRABAJA2_ZONA_JUE foreign key (ID_ZONAJUEGO)
      references ZONA_JUEGOS (ID_ZONAJUEGO);

