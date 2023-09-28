editame este tambien

private Download registerInDownloadFiles(List<String> strings, long terminalID, int partsize, int cantBytes, String version, String description, int tipofile, int terminalModel) {
        DownloadFiles download = null;
        try {
            // Archicos manejar en numeros impar
            Integer iddocumento = getIdDocumentDisponibleFiles(terminalID);

            logger.info("Registrando paquetes loading ... ");
            int contador = 0;
            Date date = new Date();
            for (int i = 0; i < strings.size(); i++) {
                String base64Part = strings.get(i);
                download = new DownloadFiles();
                download.setBase64(base64Part);
                download.setParts((i + 1) + "/" + strings.size());
                download.setTerminal(terminalID);
                download.setTYPE(new BigDecimal(tipofile));
                download.setStatus(BigDecimal.ZERO);
                download.setPartSize("" + partsize);
                download.setVersion(version);
                download.setDescription(description);
                download.setTotalSize(Integer.toString(cantBytes));
                download.setDeflateCount(Integer.toString(cantBytes));
                download.setIdDocumento(iddocumento);
                download.setCreatedDate(date);
                download.setModelTerminal((long) terminalModel);
                download = downloadFilesRepository.save(download);
                contador++;
            }
            logger.info("Se registraron " + contador + " paquetes con paquete: " + iddocumento + " el " + new Date());
        } catch (Exception e) {
            logger.error("Error en registro de paquetes para inicialización");
        }
        return download != null ? mapperToDownloadFilesToDownload(download) : null;
    }
