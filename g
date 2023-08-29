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



Quiero que actualice este query para que en vez de actualizarme la columna me completamente me deje los
valores que ya estan en BINES y que me me agrege los nuevos que le coloque separandolos con una coma
UPDATE BIN_STAGES b set b.BINES = :BINES where b.ESCENARIO = :ESCENARIO



UPDATE BIN_STAGES b
SET b.BINES = CASE 
                  WHEN b.BINES IS NULL THEN :BINES
                  ELSE b.BINES || ',' || :BINES
             END
WHERE b.ESCENARIO = :ESCENARIO;
