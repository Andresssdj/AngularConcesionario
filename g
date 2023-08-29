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
