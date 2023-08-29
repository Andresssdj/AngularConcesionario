hazme el controlador para este servicio


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
