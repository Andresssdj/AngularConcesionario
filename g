public void generateFiles(Terminal entity, FilesVersions files) {
        try {
            logger.info("* Terminal: " + entity.getCodigoTerminal());
            logger.info("* Tipo de terminal : " + entity.getType() + " model: " + entity.getTerminalModel());
            logger.info("* Tipo archivo: " + files.getTypeFile());
            String[] listModels = files.getTerminalModel().split(",");
            for (String md : listModels) {

                if (entity.getTerminalModel() != null && entity.getTerminalModel() == Integer.parseInt(md)) {
                    logger.info("Validar paquetes asignados pendientes por descargar");
                    int cantDownloadAssigned = 0;
                    cantDownloadAssigned = downloadFilesRepository.getNumberDownloadsAssigned(entity.getId(), files.getVersion(), files.getDescription());
                    if (cantDownloadAssigned == 0){
                        logger.info("Validar paquetes descargados");
                        int cantDownloads = 0;
                        cantDownloads = downloadPosRepository.getNumberDownloads(entity.getId(), files.getVersion(), files.getDescription());
                        if (cantDownloads == 0){
                            logger.info("Generando archivo para la terminal: " + entity.getCodigoTerminal());
                            logger.info("-- execute files con nueva logica");
                            DownloadFilesManageDTO filesManageDTO = new DownloadFilesManageDTO();
                            filesManageDTO.setIdTerminal(entity.getId());
                            filesManageDTO.setValueDownload(files.getValueFile());
                            filesManageDTO.setVersion(files.getContainerVersion());
                            filesManageDTO.setDescription(files.getDescription());
                            filesManageDTO.setTypeFile(files.getTypeFile());
                            filesManageDTO.setModelTerminal(entity.getTerminalModel());
                            manageDownloadService.managerPackageFiles(filesManageDTO);

                            AssignedFiles assignedFiles = new AssignedFiles();
                            assignedFiles.setIdFile(files.getId());
                            assignedFiles.setVersion(files.getContainerVersion());
                            assignedFiles.setIdTerminal(entity.getId());
                            assignedFiles.setStatus(0);
                            addAssignedFilesTerminal(assignedFiles);
                        }else {
                            logger.info("No se asigna, paquetes ya asignados y descargados archivo: {} terminal: {}" , files.getId()  , entity.getCodigoTerminal());
                        }

                    }else{
                        logger.info("No se asigna, paquetes ya han sido asignados archivo: {} terminal: {}", files.getId(), entity.getCodigoTerminal());
                    }

                }
            }
        } catch (Exception e) {
            logger.error("Error al generar los archivos: {}", e);
        }
    }
