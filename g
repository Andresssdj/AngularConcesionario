QUE ERRORES TENGO

CONTROLADOR 

public ResponseEntity<Object> updateBinesForEscenario (@RequestBody BinStages binStages){
        logger.info("----- Actualizar bines   -----");
        boolean response = binStagesService.updateParametersTerminal(binStages);
        logger.info(FIN_HTTP);
        return ResponseEntity.status(response ? HttpStatus.OK :HttpStatus.BAD_REQUEST).body(response ? Util.jsonMessage(MessagesDTO.ACTUALIZADO) : Util.jsonMessage(MessagesDTO.NO_ACTUALIZADO));

    }

SERVICIO

public boolean updateParametersTerminal(BinStages entity) {
        try {
            logger.info("* Actualizar parametros de terminal");
            entity.setBines(new String());
            binStagesRepository.save(entity);
            logger.info("Parametros actualizados");
            return true;
        } catch (Exception e) {
            logger.info("Error al actualizar parametros de terminal: ", e);
        }
        return false;
    }


REPOSITORIO 

@Query("BIN_STAGES b set b.BINES = :BINES where b.ESCENARIO = :ESCENARIO")
    Optional<BinStages>updateBines(int escenario, String bines);
