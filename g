
UPDATE BIN_STAGES bs SET bs.bines = (
    SELECT '[' || LISTAGG('{"rf":"' || e.RANGO_FINAL || '","ri":"' || e.RANGO_INICIAL || '","id":"' || e.INDICE || '"}', ', ') WITHIN GROUP (ORDER BY e.INDICE) || ']'
    FROM BIN_EMISOR e WHERE e.INDICE IN (SELECT TO_NUMBER(REGEXP_SUBSTR(:INDICES, '[^,]+', 1, LEVEL))FROM DUAL CONNECT BY REGEXP_SUBSTR(:INDICES, '[^,]+', 1, LEVEL) IS NOT NULL)) WHERE bs.ID_ESCENARIO = :ID_ESCENARIO;


  @Transactional
    @Modifying
    @Query(value = "UPDATE BIN_STAGES bs SET bs.bines = (\n" +
            "    SELECT '[' || LISTAGG('{\"rf\":\"' || e.RANGO_FINAL || '\",\"ri\":\"' || e.RANGO_INICIAL || '\",\"id\":\"' || e.INDICE || '\"}', ', ') WITHIN GROUP (ORDER BY e.INDICE) || ']'\n" +
            "    FROM BIN_EMISOR e WHERE e.INDICE IN (SELECT TO_NUMBER(REGEXP_SUBSTR(:INDICES, '[^,]+', 1, LEVEL))FROM DUAL CONNECT BY REGEXP_SUBSTR(:INDICES, '[^,]+', 1, LEVEL) IS NOT NULL)) WHERE bs.ID_ESCENARIO = :ID_ESCENARIO", nativeQuery = true)
    void updateBines(@Param("ID_ESCENARIO") Long idEscenario,@Param("INDICES") String bines);
