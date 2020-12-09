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