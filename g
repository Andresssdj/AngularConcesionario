Como soluciono este error, ya que el query en la base de datos oracle si funciona 
org.hibernate.QueryException: Unmatched braces for alias path [UPDATE BIN_STAGES bs SET bs.BINES = (SELECT REPLACE('[' || LISTAGG('{"rf":"' || e.RANGO_FINAL || '","ri":"' || e.RANGO_INICIAL || '","id":"' || e.INDICE || '"}', ',') WITHIN GROUP (ORDER BY e.INDICE) || ']', '}, {"', '},{"')FROM BIN_EMISOR e WHERE e.INDICE IN (SELECT TO_NUMBER(REGEXP_SUBSTR(:INDICES, '[^,]+', 1, LEVEL))FROM DUAL CONNECT BY REGEXP_SUBSTR(:INDICES, '[^,]+', 1, LEVEL) IS NOT NULL))WHERE bs.ID_ESCENARIO = :ID_ESCENARIO]

   @Query(
        value = "UPDATE BIN_STAGES bs SET bs.BINES = (SELECT REPLACE('[' || LISTAGG('{\"rf\":\"' || e.RANGO_FINAL || '\",\"ri\":\"' || e.RANGO_INICIAL || '\",\"id\":\"' || e.INDICE || '\"}', ',') WITHIN GROUP (ORDER BY e.INDICE) || ']', '}, {\"', '},{\"')FROM BIN_EMISOR e WHERE e.INDICE IN (SELECT TO_NUMBER(REGEXP_SUBSTR(:INDICES, '[^,]+', 1, LEVEL))FROM DUAL CONNECT BY REGEXP_SUBSTR(:INDICES, '[^,]+', 1, LEVEL) IS NOT NULL))WHERE bs.ID_ESCENARIO = :ID_ESCENARIO",
        nativeQuery = true
    )
    void updateBines(@Param("ID_ESCENARIO") Long idEscenario, @Param("INDICES") String bines);

Tengo este query de oracle 

UPDATE BIN_STAGES bs
SET bs.BINES = (
    SELECT '[' || LISTAGG('{"rf":"' || e.RANGO_FINAL || '","ri":"' || e.RANGO_INICIAL || '","id":"' || e.INDICE || '"}', ', ') WITHIN GROUP (ORDER BY e.INDICE) || ']'
    FROM BIN_EMISOR e
    WHERE e.INDICE IN (
        SELECT TO_NUMBER(REGEXP_SUBSTR(:INDICES, '[^,]+', 1, LEVEL))
        FROM DUAL
        CONNECT BY REGEXP_SUBSTR(:INDICES, '[^,]+', 1, LEVEL) IS NOT NULL
    )
)
WHERE bs.ID_ESCENARIO = :ID_ESCENARIO;



y esto es lo que me arroja pero quiero quitarle este este espacio "340"}, {"rf" que esta despues de la coma 

[{"rf":"5294049999","ri":"5294040000","id":"340"}, {"rf":"5303739999","ri":"5303710000","id":"341"}]



UPDATE BIN_STAGES bs
SET bs.BINES = (
    SELECT '[' || REPLACE(LISTAGG('{"rf":"' || e.RANGO_FINAL || '","ri":"' || e.RANGO_INICIAL || '","id":"' || e.INDICE || '"}', ', ') WITHIN GROUP (ORDER BY e.INDICE), '"}, {"', '"},{"') || ']'
    FROM BIN_EMISOR e
    WHERE e.INDICE IN (
        SELECT TO_NUMBER(REGEXP_SUBSTR(:INDICES, '[^,]+', 1, LEVEL))
        FROM DUAL
        CONNECT BY REGEXP_SUBSTR(:INDICES, '[^,]+', 1, LEVEL) IS NOT NULL
    )
)
WHERE bs.ID_ESCENARIO = :ID_ESCENARIO;


tengo este error

nmatched braces for alias path [UPDATE BIN_STAGES bs SET bs.BINES = (SELECT '[' || REPLACE(LISTAGG('{"rf":"' || e.RANGO_FINAL || '","ri":"' || e.RANGO_INICIAL || '","id":"' || e.INDICE || '"}', ', ') WITHIN GROUP (ORDER BY e.INDICE), '"}, {"', '"},{"') || ']' FROM BIN_EMISOR e WHERE e.INDICE IN (SELECT TO_NUMBER(REGEXP_SUBSTR(:INDICES, '[^,]+', 1, LEVEL))FROM DUAL CONNECT BY REGEXP_SUBSTR(:INDICES, '[^,]+', 1, LEVEL) IS NOT NULL ))WHERE bs.ID_ESCENARIO = :ID_ESCENARIO]; nested exception is java.lang.IllegalArgumentException: org.hibernate.QueryException: Unmatched braces for alias path [UPDATE BIN_STAGES bs SET bs.BINES = (SELECT '[' || REPLACE(LISTAGG('{"rf":"' || e.RANGO_FINAL || '","ri":"' || e.RANGO_INICIAL || '","id":"' || e.INDICE || '"}', ', ') WITHIN GROUP (ORDER BY e.INDICE), '"}, {"', '"},{"') || ']' FROM BIN_EMISOR e WHERE e.INDICE IN (SELECT TO_NUMBER(REGEXP_SUBSTR(:INDICES, '[^,]+', 1, LEVEL))FROM DUAL CONNECT BY REGEXP_SUBSTR(:INDICES, '[^,]+', 1, LEVEL) IS NOT NULL ))WHERE bs.ID_ESCENARIO = :ID_ESCENARIO]



   @Query(value = "UPDATE BIN_STAGES bs SET bs.BINES = (SELECT '[' || REPLACE(LISTAGG('{\"rf\":\"' || e.RANGO_FINAL || '\",\"ri\":\"' || e.RANGO_INICIAL || '\",\"id\":\"' || e.INDICE || '\"}', ', ') WITHIN GROUP (ORDER BY e.INDICE), '\"}, {\"', '\"},{\"') || ']' FROM BIN_EMISOR e WHERE e.INDICE IN (SELECT TO_NUMBER(REGEXP_SUBSTR(:INDICES, '[^,]+', 1, LEVEL))FROM DUAL CONNECT BY REGEXP_SUBSTR(:INDICES, '[^,]+', 1, LEVEL) IS NOT NULL ))WHERE bs.ID_ESCENARIO = :ID_ESCENARIO", nativeQuery = true)
            void updateBines(@Param("ID_ESCENARIO") Long idEscenario,@Param("INDICES") String bines);



UPDATE BIN_STAGES bs
SET bs.BINES = (
    SELECT '[' || REPLACE(LISTAGG('{"rf":"' || e.RANGO_FINAL || '","ri":"' || e.RANGO_INICIAL || '","id":"' || e.INDICE || '"}', ', ') WITHIN GROUP (ORDER BY e.INDICE), ''',''') || ']'
    FROM BIN_EMISOR e
    WHERE e.INDICE IN (
        SELECT TO_NUMBER(REGEXP_SUBSTR(:INDICES, '[^,]+', 1, LEVEL))
        FROM DUAL
        CONNECT BY REGEXP_SUBSTR(:INDICES, '[^,]+', 1, LEVEL) IS NOT NULL
    )
)
WHERE bs.ID_ESCENARIO = :ID_ESCENARIO;



UPDATE BIN_STAGES bs
SET bs.BINES = (
    SELECT REPLACE('[' || LISTAGG('{"rf":"' || e.RANGO_FINAL || '","ri":"' || e.RANGO_INICIAL || '","id":"' || e.INDICE || '"}', ',') WITHIN GROUP (ORDER BY e.INDICE) || ']', '}, {"', '},{"')
    FROM BIN_EMISOR e
    WHERE e.INDICE IN (
        SELECT TO_NUMBER(REGEXP_SUBSTR(:INDICES, '[^,]+', 1, LEVEL))
        FROM DUAL
        CONNECT BY REGEXP_SUBSTR(:INDICES, '[^,]+', 1, LEVEL) IS NOT NULL
    )
)
WHERE bs.ID_ESCENARIO = :ID_ESCENARIO;
