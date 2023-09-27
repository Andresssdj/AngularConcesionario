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



esto realiza lo sigueinte 

public void managerPackageFiles(DownloadFilesManageDTO filesManageDTO) {
        try {
            String params = filesManageDTO.getValueDownload().replace("=", "");
            logger.info("Obteniendo bytes de file, add en descargas de files");
            byte[] arrayBytes = params.getBytes(StandardCharsets.UTF_8);
            int cantBytes = arrayBytes.length * 6 / 8;
            List<String> values = this.createPackagesDownload(params);
            int partsize = cantBytes / values.size();
            if (!values.isEmpty()) {
                this.registerInDownloadFiles(values, filesManageDTO.getIdTerminal(), partsize, cantBytes, filesManageDTO.getVersion(), filesManageDTO.getDescription(), filesManageDTO.getTypeFile(), filesManageDTO.getModelTerminal());
            }
        } catch (Exception var7) {
            logger.info("Error en el manejo del archivo para descargar ");
        }

    }

y tambien esta este


private List<String> createPackagesDownload(String sBase64) {
        List<String> strings = new ArrayList();

        try {
            logger.info("Generar paquetes de a " + this.maxcaracters + " por campo");
            int maxCaracters = this.maxcaracters;
            int index = 0;
            logger.info("Generando listado de paquetes ...");

            while(index < sBase64.length()) {
                strings.add(sBase64.substring(index, Math.min(index + maxCaracters, sBase64.length())));
                index += maxCaracters;
            }
        } catch (Exception var5) {
            logger.error("Error al separar por paquetes en service managePackageDownload");
        }

        return strings;
    }

y quiero  modificarlo algo asi peor no que se guarte maxcaracters y newmaxcaracters cada uno aparte para que al momendo de asignar los dos archivos y no se anigne con un tamaño y el otro con el otro

 private List<String> createPackagesDownload(String sBase64) {
        List<String> strings = new ArrayList<>();
        try {

            logger.info("Generar paquetes de a " + maxcaracters + " por campo");
            logger.info("Generar paquetes de " + newmaxcaracters + " por campo");

            int maxCaracters = maxcaracters;
            int newMaxCaracters = newmaxcaracters;
            int index = 0;
            logger.info("Generando listado de paquetes ...");
            while (index < sBase64.length()) {
                strings.add(sBase64.substring(index, Math.min(index + maxCaracters, sBase64.length())));
                index += maxCaracters;
            }
            index = 0; // Reiniciar el índice para la nueva variable
            logger.info("Generando listado de paquetes con newMaxCaracters ...");
            while (index < sBase64.length()) {
                strings.add(sBase64.substring(index, Math.min(index + newMaxCaracters, sBase64.length())));
                index += newMaxCaracters;
            }

        } catch (Exception e) {
            logger.error("Error al separar por paquetes en service managePackageDownload");
        }
        return strings;
    }



