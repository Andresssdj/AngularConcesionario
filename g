
UPDATE BIN_STAGES bs SET bs.bines = (
    SELECT '[' || LISTAGG('{"rf":"' || e.RANGO_FINAL || '","ri":"' || e.RANGO_INICIAL || '","id":"' || e.INDICE || '"}', ', ') WITHIN GROUP (ORDER BY e.INDICE) || ']'
    FROM BIN_EMISOR e WHERE e.INDICE IN (SELECT TO_NUMBER(REGEXP_SUBSTR(:INDICES, '[^,]+', 1, LEVEL))FROM DUAL CONNECT BY REGEXP_SUBSTR(:INDICES, '[^,]+', 1, LEVEL) IS NOT NULL)) WHERE bs.ID_ESCENARIO = :ID_ESCENARIO;


public boolean updateBiness (BinStages entity){
        try {
                binStagesRepository.updateBines(entity.getIdEscenario(), entity.getBines());
                logger.info("* Actualizar bines de envio de pan");
                entity.setIdEscenario(entity.getIdEscenario());
                entity.setBines(entity.getBines());
                binStagesRepository.save(entity);
                logger.info("Bines actualizados");
                return true;
            } catch (Exception e) {
                logger.info("Error al actualizar bines: ", e);
            }
            return false;
        }
