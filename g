TENGO ESTA QUERY EN ORACLE 

UPDATE BIN_STAGES b set b.BINES = :BINES where b.ID_ESCENARIO = :ID_ESCENARIO

y quiero una query en Spring boog usando nativeQuery = true


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
