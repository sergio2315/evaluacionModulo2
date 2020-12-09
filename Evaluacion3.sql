--INTEGRANTES: MIGUEL AHUMADA, PATRICIO PEREIRA, SERGIO LILLO
--EVALUACIÓN 3
CREATE TABLE accidente (
    idaccidente           NUMBER(9) NOT NULL,
    accifecha             DATE NOT NULL,
    accihora              DATE NOT NULL,
    accilugar             VARCHAR2(150) NOT NULL,
    acciorigen            VARCHAR2(100) NOT NULL,
    acciconsecuencias     VARCHAR2(100),
    cliente_usuario_run   NUMBER(11) NOT NULL
);

ALTER TABLE accidente ADD CONSTRAINT accidente_pk PRIMARY KEY ( idaccidente );

CREATE TABLE administrativo (
    usuario_run         NUMBER(9) NOT NULL,
    correoelectronico   VARCHAR2(50),
    nombrearea          VARCHAR2(50)
);

ALTER TABLE administrativo ADD CONSTRAINT administrativo_pk PRIMARY KEY ( usuario_run );

CREATE TABLE asesoria (
    profesional_usuario_run   NUMBER(9) NOT NULL,
    cliente_usuario_run       NUMBER(11) NOT NULL,
    idasesoria                NUMBER(9) NOT NULL,
    fecha                     DATE NOT NULL,
    motivo                    VARCHAR2(50)
);

ALTER TABLE asesoria ADD CONSTRAINT asesoria_pk PRIMARY KEY ( idasesoria );

CREATE TABLE asistentes (
    idasistente                   NUMBER(9) NOT NULL,
    asistnombrecompleto           VARCHAR2(100) NOT NULL,
    asistedad                     NUMBER(3) NOT NULL,
    asistcorreo                   VARCHAR2(70),
    asisttelefono                 VARCHAR2(20),
    capacitacion_idcapacitacion   NUMBER(9) NOT NULL
);

ALTER TABLE asistentes ADD CONSTRAINT asistentes_pk PRIMARY KEY ( idasistente );

CREATE TABLE capacitacion (
    idcapacitacion        NUMBER(9) NOT NULL,
    capfecha              DATE NOT NULL,
    caphora               DATE,
    caplugar              VARCHAR2(100) NOT NULL,
    capduracion           NUMBER(4),
    cliente_usuario_run   NUMBER(11) NOT NULL
);

ALTER TABLE capacitacion ADD CONSTRAINT capacitacion_pk PRIMARY KEY ( idcapacitacion );

CREATE TABLE chequeos (
    visita_idvisita   NUMBER(9) NOT NULL,
    nombre            VARCHAR2(50) NOT NULL
);

ALTER TABLE chequeos ADD CONSTRAINT chequeos_pk PRIMARY KEY ( visita_idvisita );

CREATE TABLE cliente (
    usuario_run       NUMBER(11) NOT NULL,
    clitelefono       VARCHAR2(20) NOT NULL,
    cliafp            VARCHAR2(30),
    clisistemasalud   NUMBER(2),
    clidireccion      VARCHAR2(100) NOT NULL,
    clicomuna         VARCHAR2(50) NOT NULL,
    cliedad           NUMBER(3) NOT NULL
);

ALTER TABLE cliente ADD CONSTRAINT cliente_pk PRIMARY KEY ( usuario_run );

CREATE TABLE estadochequeo (
    chequeos_visita_idvisita   NUMBER(9) NOT NULL,
    cumple                     CHAR(1) NOT NULL,
    cumpleobservaciones        CHAR(1) NOT NULL,
    nocumple                   CHAR(1) NOT NULL
);

ALTER TABLE estadochequeo ADD CONSTRAINT estadochequeo_pk PRIMARY KEY ( chequeos_visita_idvisita );

CREATE TABLE pagos (
    idpago                NUMBER(9) NOT NULL,
    fecha                 DATE NOT NULL,
    monto                 NUMBER(10) NOT NULL,
    mes                   NUMBER(2) NOT NULL,
    año                   NUMBER(4) NOT NULL,
    cliente_usuario_run   NUMBER(11) NOT NULL
);

ALTER TABLE pagos ADD CONSTRAINT pagos_pk PRIMARY KEY ( idpago );

CREATE TABLE profesional (
    usuario_run         NUMBER(9) NOT NULL,
    telefono            VARCHAR2(20) NOT NULL,
    tituloprofesional   VARCHAR2(50),
    proyecto            VARCHAR2(50) NOT NULL
);

ALTER TABLE profesional ADD CONSTRAINT profesional_pk PRIMARY KEY ( usuario_run );

CREATE TABLE recomendaciones (
    idrecomendaciones      NUMBER(9) NOT NULL,
    tituloactividad        VARCHAR2(50) NOT NULL,
    descripcionactividad   VARCHAR2(50) NOT NULL,
    diasplazoresolucion    NUMBER(3) NOT NULL,
    asesorio_idasesoria    NUMBER(9) NOT NULL
);

ALTER TABLE recomendaciones ADD CONSTRAINT recomendaciones_pk PRIMARY KEY ( idrecomendaciones );

CREATE TABLE usuario (
    run               NUMBER(9) NOT NULL,
    nombre            VARCHAR2(50) NOT NULL,
    apellidos         VARCHAR2(50) NOT NULL,
    fechanacimiento   DATE NOT NULL
);

ALTER TABLE usuario ADD CONSTRAINT usuario_pk PRIMARY KEY ( run );

CREATE TABLE visita (
    idvisita              NUMBER(9) NOT NULL,
    visfecha              DATE NOT NULL,
    vishora               DATE,
    vislugar              VARCHAR2(50) NOT NULL,
    viscomentarios        VARCHAR2(250) NOT NULL,
    cliente_usuario_run   NUMBER(11) NOT NULL
);

ALTER TABLE visita ADD CONSTRAINT visita_pk PRIMARY KEY ( idvisita );

ALTER TABLE accidente
    ADD CONSTRAINT accidente_cliente_fk FOREIGN KEY ( cliente_usuario_run )
        REFERENCES cliente ( usuario_run );

ALTER TABLE administrativo
    ADD CONSTRAINT administrativo_usuario_fk FOREIGN KEY ( usuario_run )
        REFERENCES usuario ( run );

ALTER TABLE asesoria
    ADD CONSTRAINT asesoria_cliente_fk FOREIGN KEY ( cliente_usuario_run )
        REFERENCES cliente ( usuario_run );

ALTER TABLE asesoria
    ADD CONSTRAINT asesoria_profesional_fk FOREIGN KEY ( profesional_usuario_run )
        REFERENCES profesional ( usuario_run );

ALTER TABLE asistentes
    ADD CONSTRAINT asistentes_capacitacion_fk FOREIGN KEY ( capacitacion_idcapacitacion )
        REFERENCES capacitacion ( idcapacitacion );

ALTER TABLE capacitacion
    ADD CONSTRAINT capacitacion_cliente_fk FOREIGN KEY ( cliente_usuario_run )
        REFERENCES cliente ( usuario_run );

ALTER TABLE chequeos
    ADD CONSTRAINT chequeos_visita_fk FOREIGN KEY ( visita_idvisita )
        REFERENCES visita ( idvisita );

ALTER TABLE cliente
    ADD CONSTRAINT cliente_usuario_fk FOREIGN KEY ( usuario_run )
        REFERENCES usuario ( run );

ALTER TABLE estadochequeo
    ADD CONSTRAINT estadochequeo_chequeos_fk FOREIGN KEY ( chequeos_visita_idvisita )
        REFERENCES chequeos ( visita_idvisita );

ALTER TABLE pagos
    ADD CONSTRAINT pagos_cliente_fk FOREIGN KEY ( cliente_usuario_run )
        REFERENCES cliente ( usuario_run );

ALTER TABLE profesional
    ADD CONSTRAINT profesional_usuario_fk FOREIGN KEY ( usuario_run )
        REFERENCES usuario ( run );

ALTER TABLE recomendaciones
    ADD CONSTRAINT recomendaciones_asesoria_fk FOREIGN KEY ( asesorio_idasesoria )
        REFERENCES asesoria ( idasesoria );

ALTER TABLE visita
    ADD CONSTRAINT visita_cliente_fk FOREIGN KEY ( cliente_usuario_run )
        REFERENCES cliente ( usuario_run );
  --datos usuario      
INSERT INTO usuario VALUES(152359658,'MIGUEL','AHUMADA RIQUELME',TO_DATE('02/06/1996','DD/MM/YYYY'));
INSERT INTO usuario VALUES(161564588,'PATRICIO','PEREIRA DIAZ',TO_DATE('26/01/1991','DD/MM/YYYY'));
INSERT INTO usuario VALUES(116565887,'SERGIO','LILLO PEREZ',TO_DATE('15/09/2000','DD/MM/YYYY'));
INSERT INTO usuario VALUES(162858999,'PEDRO','AHUMADA MATUS',TO_DATE('02/06/1996','DD/MM/YYYY'));
INSERT INTO usuario VALUES(161564516,'PJUAN','MATUS QUEZADA',TO_DATE('26/11/1991','DD/MM/YYYY'));
INSERT INTO usuario VALUES(196565887,'ANITA','CRUCES RAMIREZ',TO_DATE('15/09/2002','DD/MM/YYYY'));
INSERT INTO usuario VALUES(112359658,'ANTONIA','VIDAL SANCHEZ',TO_DATE('15/07/1982','DD/MM/YYYY'));
INSERT INTO usuario VALUES(161564599,'JORGE','SANCHEZ BRAVO',TO_DATE('22/01/1989','DD/MM/YYYY'));
INSERT INTO usuario VALUES(146561587,'LUCERO','BRAVO JARA',TO_DATE('08/02/1999','DD/MM/YYYY'));
 --datos administrativo
INSERT INTO administrativo VALUES(152359658,'MIGUEL@GMAIL.COM','ventas');
INSERT INTO administrativo VALUES(161564588,'PATRICIO@GMAIL.COM','cobranzas');
INSERT INTO administrativo VALUES(116565887,'SERGIO@GMAIL.COM','despachos');
 --datos profesional
INSERT INTO profesional VALUES(162858999,'46564864','ingeniero','angostura');
INSERT INTO profesional VALUES(161564516,'68566844','prevensionista','aeropuerto');
INSERT INTO profesional VALUES(196565887,'73156198','topografo','calama');
--datos cliente
INSERT INTO cliente VALUES(112359658,'46564864','capital',1,'avda #5','valparaiso',38);
INSERT INTO cliente VALUES(161564599,'46564864','provida',2,'calle #13','vitacura',31);
INSERT INTO cliente VALUES(146561587,'46564864','habitat',1,'avda #11','temuco',21);

INSERT INTO usuario VALUES(153549563,'probando','edad',TO_DATE('26/01/1991','DD/MM/YYYY'));
INSERT INTO cliente VALUES(153549563,'46564864','capital',1,'avda #5','valparaiso',(SELECT to_number(substr(to_number(to_char(sysdate,'mmyyyy')) - to_number(to_char(fechanacimiento,'mmyyyy')),4))
FROM usuario WHERE run=153549563));
--datos pagos
create sequence seq_id_pagos
start with 1
increment by 1
maxvalue 1000
minvalue 1;

INSERT INTO pagos VALUES(seq_id_pagos.NEXTVAL,TO_DATE('15/09/2020','DD/MM/YYYY'),25000,09,2020,112359658);
INSERT INTO pagos VALUES(seq_id_pagos.NEXTVAL,TO_DATE('15/06/2020','DD/MM/YYYY'),40000,07,2020,161564599);
INSERT INTO pagos VALUES(seq_id_pagos.NEXTVAL,TO_DATE('15/10/2020','DD/MM/YYYY'),56000,10,2020,146561587);
--datos asesoria
create sequence seq_id_asesoria
start with 1
increment by 1
maxvalue 1000
minvalue 1;
INSERT INTO asesoria VALUES(162858999,112359658,seq_id_asesoria.NEXTVAL,TO_DATE('22/11/2020','DD/MM/YYYY'),'incremento accidentes');
INSERT INTO asesoria VALUES(161564516,161564599,seq_id_asesoria.NEXTVAL,TO_DATE('06/10/2020','DD/MM/YYYY'),'preventivo');
INSERT INTO asesoria VALUES(196565887,146561587,seq_id_asesoria.NEXTVAL,TO_DATE('24/10/2020','DD/MM/YYYY'),'asesoria mensual');
--datos recomendaciones
create sequence seq_id_recomendaciones
start with 1
increment by 1
maxvalue 1000
minvalue 1;

INSERT INTO recomendaciones VALUES(seq_id_recomendaciones.NEXTVAL,'Limpiar instalaciones','despejar pasillos',30,1);
INSERT INTO recomendaciones VALUES(seq_id_recomendaciones.NEXTVAL,'Mantención extintores','rellenar extintores',14,2);
INSERT INTO recomendaciones VALUES(seq_id_recomendaciones.NEXTVAL,'Reparar goteras','cambiar parte del techo',14,3);
--datos recomendaciones
create sequence seq_id_capacitacion
start with 1
increment by 1
maxvalue 1000
minvalue 1;

INSERT INTO capacitacion VALUES(seq_id_capacitacion.NEXTVAL,TO_DATE('22/11/2020','DD/MM/YYYY'),TO_DATE('22/11/2020 14:30','DD/MM/YYYY HH24:MI'),'teatro',2,112359658);
INSERT INTO capacitacion VALUES(seq_id_capacitacion.NEXTVAL,TO_DATE('18/11/2020','DD/MM/YYYY'),TO_DATE('18/11/2020 16:00','DD/MM/YYYY HH24:MI'),'planta',1,161564599);
INSERT INTO capacitacion VALUES(seq_id_capacitacion.NEXTVAL,TO_DATE('26/11/2020','DD/MM/YYYY'),TO_DATE('26/11/2020 15:30','DD/MM/YYYY HH24:MI'),'oficina',3,146561587);
INSERT INTO capacitacion VALUES(seq_id_capacitacion.NEXTVAL,TO_DATE('25/10/2020','DD/MM/YYYY'),TO_DATE('25/10/2020 17:30','DD/MM/YYYY HH24:MI'),'planta',1,153549563);
--datos asistentes
create sequence seq_id_asistentes
start with 1
increment by 1
maxvalue 1000
minvalue 1;

INSERT INTO asistentes VALUES(seq_id_asistentes.NEXTVAL,( SELECT nombre ||' ' || apellidos FROM usuario WHERE run = 112359658),(SELECT cliedad FROM cliente WHERE usuario_run = 112359658),'ANTONIA@GMAIL.COM',(SELECT clitelefono FROM cliente WHERE usuario_run = 112359658),1 );
INSERT INTO asistentes VALUES(seq_id_asistentes.NEXTVAL,( SELECT nombre ||' ' || apellidos FROM usuario WHERE run = 161564599),(SELECT cliedad FROM cliente WHERE usuario_run = 161564599),'JORGE@GMAIL.COM',(SELECT clitelefono FROM cliente WHERE usuario_run = 161564599),2 );
INSERT INTO asistentes VALUES(seq_id_asistentes.NEXTVAL,( SELECT nombre ||' ' || apellidos FROM usuario WHERE run = 146561587),(SELECT cliedad FROM cliente WHERE usuario_run = 146561587),'LUCERO@GMAIL.COM',(SELECT clitelefono FROM cliente WHERE usuario_run = 146561587),3 );
INSERT INTO asistentes VALUES(seq_id_asistentes.NEXTVAL,( SELECT nombre ||' ' || apellidos FROM usuario WHERE run = 153549563),(SELECT cliedad FROM cliente WHERE usuario_run = 153549563),'LUCERO@GMAIL.COM',(SELECT clitelefono FROM cliente WHERE usuario_run = 153549563),4 );
--datos accidente
create sequence seq_id_accidente
start with 1
increment by 1
maxvalue 1000
minvalue 1;

INSERT INTO accidente VALUES(seq_id_accidente.NEXTVAL,TO_DATE('20/10/2020','DD/MM/YYYY'),TO_DATE('20/10/2020 10:30','DD/MM/YYYY HH24:MI'),'bodega','caida','esguince',112359658);
INSERT INTO accidente VALUES(seq_id_accidente.NEXTVAL,TO_DATE('25/08/2020','DD/MM/YYYY'),TO_DATE('25/08/2020 11:30','DD/MM/YYYY HH24:MI'),'patio','pelea','hematoma',161564599);
INSERT INTO accidente VALUES(seq_id_accidente.NEXTVAL,TO_DATE('16/11/2020','DD/MM/YYYY'),TO_DATE('16/11/2020 15:00','DD/MM/YYYY HH24:MI'),'empaque','apreton','fractura',146561587);
--datos visita
create sequence seq_id_visita
start with 1
increment by 1
maxvalue 1000
minvalue 1;

INSERT INTO visita VALUES(seq_id_visita.NEXTVAL,TO_DATE('16/11/2020','DD/MM/YYYY'),TO_DATE('16/11/2020 15:30','DD/MM/YYYY HH24:MI'),'oficina','falta de documentacion',112359658);
INSERT INTO visita VALUES(seq_id_visita.NEXTVAL,TO_DATE('19/10/2020','DD/MM/YYYY'),TO_DATE('19/10/2020 14:00','DD/MM/YYYY HH24:MI'),'planta','visita sin inconvenientes, todo al dia',161564599);
INSERT INTO visita VALUES(seq_id_visita.NEXTVAL,TO_DATE('04/11/2020','DD/MM/YYYY'),TO_DATE('04/11/2020 11:30','DD/MM/YYYY HH24:MI'),'bodegas','falta de documentacion',146561587);
INSERT INTO visita VALUES(seq_id_visita.NEXTVAL,TO_DATE('04/10/2020','DD/MM/YYYY'),TO_DATE('04/10/2020 12:30','DD/MM/YYYY HH24:MI'),'bodegas','falta de documentacion',153549563);
--datos chequeo
INSERT INTO chequeos VALUES(1,'entel');
INSERT INTO chequeos VALUES(2,'claro');
INSERT INTO chequeos VALUES(3,'wom');
INSERT INTO chequeos VALUES(4,'nextel');
--datos estadochequeo
INSERT INTO estadochequeo VALUES(1,'F','F','V');
INSERT INTO estadochequeo VALUES(2,'V','F','F');
INSERT INTO estadochequeo VALUES(3,'F','V','F');
INSERT INTO estadochequeo VALUES(4,'F','F','V');
--a) Realice una consulta que permita listar todas las capacitaciones de un cliente en
--particular, indicando el nombre completo, la edad y el correo electrónico de los
--asistentes.
SELECT c.idcapacitacion, a.asistnombrecompleto, a.asistedad,a.asistcorreo FROM capacitacion c, asistentes a WHERE c.cliente_usuario_run = 146561587 AND c.idcapacitacion = a.capacitacion_idcapacitacion;
--b) Realice una consulta que permita desplegar todas las visitas en terreno realizadas a los
--clientes que sean de la comuna de Valparaíso. Por cada visita debe indicar todos los
--chequeos que se hicieron en ella, junto con el estado de cumplimiento de cada uno.
SELECT c.clicomuna, ch.*,ech.* FROM cliente c,visita v, chequeos ch, estadochequeo ech WHERE c.clicomuna = 'valparaiso' AND v.idvisita = ch.visita_idvisita AND ch.visita_idvisita = ech.chequeos_visita_idvisita AND c.usuario_run = v.cliente_usuario_run;

--Realice una consulta que despliegue los accidentes registrados para todos los clientes,
--indicando los datos de detalle del accidente, y el nombre, apellido, RUT y teléfono del
--cliente al que se asocia dicha situación.
SELECT u.nombre, u.apellidos,c.usuario_run,c.clitelefono, a.* 
    FROM accidente a, cliente c, usuario u 
    WHERE c.usuario_run = a.cliente_usuario_run 
        AND u.run = c.usuario_run;


