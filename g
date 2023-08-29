tengo una tabla que se llama BIN_STAGES que tiene columnas llamados BINES y tiene estos datos {"rf":"5704239999","ri":"5704230000","id":"436"}, 
{"rf":"5903099999","ri":"5903090000","id":"444"} y otra columna llamada id

y tengo otra tabla que se llama emisor y tiene los campos INDICE,
RANGO_INICIAL,
RANGO_FINAL,

quiero un query de oracle que me inserte datos en BIN_STAGES y que me llene la columna BINES con los datos de la tabla emisor  INDICE,
RANGO_INICIAL,
RANGO_FINAL,

y que quede con este formato
{"rf":" ","ri":"","id":""}

rf es RANGO_FINAL
ri es RANGO_INICIAL
id es INDICE



INSERT INTO BIN_STAGES (BINES, id)
SELECT '{"rf":"' || e.RANGO_FINAL || '","ri":"' || e.RANGO_INICIAL || '","id":"' || e.INDICE || '"}',
       e.INDICE
FROM emisor e;
