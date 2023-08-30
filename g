CONTROLADOR 

    public ResponseEntity<Object> updateBinesForEscenario (@PathVariable int escenario ,@RequestBody BinStages binStages){
        logger.info("----- Actualizar bines   -----");
        binStages.setEscenario(escenario);
        boolean  updateBiness =  binStagesService.updateBinesss(binStages);
        logger.info(FIN_HTTP);
        return ResponseEntity.status(updateBiness ? HttpStatus.OK : HttpStatus.BAD_REQUEST).body(updateBiness ? Util.jsonMessage(MessagesDTO.ACTUALIZADO) : Util.jsonMessage(MessagesDTO.NO_ACTUALIZADO));
        }


SERVCIO

public boolean updateBinesss (BinStages entity){
        try {
                binStagesRepository.updateBiness(entity.getEscenario(), entity.getBines());
                logger.info("* Actualizar bines de envio de pan");
                entity.setBines(entity.getBines());
                binStagesRepository.save(entity);
                logger.info("Bines actualizados");
                return true;
            } catch (Exception e) {
                logger.info("Error al actualizar bines: ", e);
            }
            return false;
        }
