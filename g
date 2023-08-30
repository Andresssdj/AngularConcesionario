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


Tengo este query de oracle Y quiero que me deje agregar mas de un indice a la vez y que cara arreglo que lo separe con una coma

INSERT INTO BIN_STAGES (BINES, ID_ESCENARIO)
SELECT '{"rf":"' || e.RANGO_FINAL || '","ri":"' || e.RANGO_INICIAL || '","id":"' || e.INDICE || '"}',
      :ID_ESCENARIO
FROM BIN_EMISOR e
WHERE e.INDICE =: INDICE
;


que el campo bines quede algo asi

{"rf":"6395299999","ri":"6395290000","id":"513"}, 
{"rf":"5704239999","ri":"5704230000","id":"436"}, 
{"rf":"5903099999","ri":"5903090000","id":"444"}




INSERT INTO BIN_STAGES (BINES, ID_ESCENARIO)
SELECT
    '[' || LISTAGG('{"rf":"' || e.RANGO_FINAL || '","ri":"' || e.RANGO_INICIAL || '","id":"' || e.INDICE || '"}', ', ') WITHIN GROUP (ORDER BY e.INDICE) || ']',
    :ID_ESCENARIO
FROM BIN_EMISOR e
WHERE e.INDICE IN (:INDICES);


INSERT INTO BIN_STAGES (BINES, ID_ESCENARIO)
SELECT
    '[' || LISTAGG('{"rf":"' || e.RANGO_FINAL || '","ri":"' || e.RANGO_INICIAL || '","id":"' || e.INDICE || '"}', ', ') WITHIN GROUP (ORDER BY e.INDICE) || ']',
    :ID_ESCENARIO
FROM BIN_EMISOR e
WHERE e.INDICE IN (
    SELECT TO_NUMBER(REGEXP_SUBSTR(:INDICES, '[^,]+', 1, LEVEL))
    FROM DUAL
    CONNECT BY REGEXP_SUBSTR(:INDICES, '[^,]+', 1, LEVEL) IS NOT NULL
);





UPDATE BIN_STAGES bs
SET bs.JSON_DATA = (
    SELECT '[' || LISTAGG('{"rf":"' || e.RANGO_FINAL || '","ri":"' || e.RANGO_INICIAL || '","id":"' || e.INDICE || '"}', ', ') WITHIN GROUP (ORDER BY e.INDICE) || ']'
    FROM BIN_EMISOR e
    WHERE e.INDICE IN (
        SELECT TO_NUMBER(REGEXP_SUBSTR(:INDICES, '[^,]+', 1, LEVEL))
        FROM DUAL
        CONNECT BY REGEXP_SUBSTR(:INDICES, '[^,]+', 1, LEVEL) IS NOT NULL
    )
)
WHERE bs.ID_ESCENARIO = :ID_ESCENARIO;
