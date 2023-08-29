UPDATE bin b
SET b.valor = (
    SELECT b2.i || ',' || b2.a || ',' || b2.t
    FROM bien b2
    WHERE b2.ID = b.valor
)
WHERE EXISTS (
    SELECT 1
    FROM bien b2
    WHERE b2.ID = b.valor
);


UPDATE Terminal t set t.terminalModel = :model where t.id = :id


UPDATE BIN_STAGES b
SET b.BINES = (
    SELECT b2.RANGO_FINAL || ',' || b2.RANGO_INICIAL || ',' || b2.INDICE
    FROM BIN_EMISOR b2
    WHERE b2.INDICE = :b2.INDICE
)
WHERE EXISTS (
    SELECT 1
    FROM BIN_STAGES b
    WHERE b.ESCENARIO = :ESCENARIO
);
