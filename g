corrigue manageDownloadParams y  registerInDownloadInits para que funcione con la extructura de registerInDownloadFiles

public DownloadResponse manageDownloadParams(long terminalID, String params, int caso, int tipofile, String version, String description, boolean newTerminal) {

        Download download = null;
        try {
            logger.info("Manejando descargas ... ");
            int cantBytes = 0;
            int partsize = 0;
            byte[] arrayBytes;
            List<String>[] strings;

            if (caso == 1) {
                logger.info("Obteniendo bytes del init, add en descargas de init");
                arrayBytes = UtilManageFilesZip.comprimirFile(params.getBytes(StandardCharsets.UTF_8), "InitData.json");
                String sBase64 = Base64.getEncoder().encodeToString(arrayBytes);
                sBase64 = sBase64.replace("=", "");
                strings = createPackagesDownload(sBase64);
                partsize = arrayBytes.length / strings[1].size();

                download = registerInDownloadInits(strings, terminalID, partsize, arrayBytes, newTerminal);
            } else {
                params = params.replace("=", "");
                logger.info("Obteniendo bytes de file, add en descargas de files");
                tipofile = caso == 00 ? 0 : tipofile;
                arrayBytes = params.getBytes(StandardCharsets.UTF_8);
                cantBytes = (arrayBytes.length * 6) / 8;
                strings = createPackagesDownload(params);
                partsize = cantBytes / strings[1].size();
                download = registerInDownloadFiles(strings, terminalID, partsize, cantBytes, version, description, tipofile, 0);
            }

        } catch (Exception e) {
            logger.error("Error en el service manageDownload ", e);
        }
        return download != null ? mapperToResponse(download) : null;
    }
	
	
	
	private Download registerInDownloadInits(List<String>[] strings, long terminalID, int partsize, byte[] arrayBytes, boolean newTerminal) {
        Download download = null;
        try {
            // Inicializaciones manejar en numeros par
            Integer iddocumento = getIdDocumentDisponibleInit(terminalID);

            logger.info("Registrando paquetes loading ... ");
            int contador = 0;
            Date date = new Date();
            for (int i = 0; i < strings[1].size(); i++) {
                String base64Part = strings[1].get(i);
                download = new Download();
                download.setBase64(base64Part);
                download.setParts((i + 1) + "/" + strings[1].size());
                download.setTerminal(terminalID);
                download.setTYPE(BigDecimal.ZERO);
                download.setStatus(newTerminal ? BigDecimal.ONE : BigDecimal.ZERO);
                download.setPartSize("" + partsize);
                download.setVersion("");
                download.setDescription("");
                download.setTotalSize(arrayBytes.length + "");
                download.setDeflateCount(arrayBytes.length + "");
                download.setIdDocumento(iddocumento);
                download.setCreatedDate(date);
                download = downloadRepository.save(download);
                contador++;

            }
            logger.info("Se registraron " + contador + " paquetes con paquete: " + iddocumento + " el " + new Date());
        } catch (Exception e) {
            logger.error("Error en registro de paquetes para inicialización");
        }
        return download;
    }
	
	
	private DownloadFiles[] registerInDownloadFiles(List<String>[] strings, long terminalID, int partsize, int cantBytes, String version, String description, int tipofile, int terminalModel) {
        DownloadFiles[] download = new DownloadFiles[2];
        try {
            // Archicos manejar en numeros impar
            Integer iddocumento = getIdDocumentDisponibleFiles(terminalID);

            logger.info("Registrando paquetes loading ... ");
            int contador = 0;
            Date date = new Date();
            for (int i = 0; i < strings[1].size(); i++) {
                String base64Part = strings[1].get(i);
                DownloadFiles downloads = new DownloadFiles();
                downloads.setBase64(base64Part);
                downloads.setParts((i + 1) + "/" + strings[1].size());
                downloads.setTerminal(terminalID);
                downloads.setTYPE(new BigDecimal(tipofile));
                downloads.setStatus(BigDecimal.ZERO);
                downloads.setPartSize("" + partsize);
                downloads.setVersion(version);
                downloads.setDescription(description);
                downloads.setTotalSize(Integer.toString(cantBytes));
                downloads.setDeflateCount(Integer.toString(cantBytes));
                downloads.setIdDocumento(iddocumento);
                downloads.setCreatedDate(date);
                downloads.setModelTerminal((long) terminalModel);
                download[1] = downloads;
                contador++;
            }

            for (int i = 0; i < strings[0].size(); i++) {
                String base64Part = strings[0].get(i);
                DownloadFiles downloads = new DownloadFiles();
                downloads.setBase64(base64Part);
                downloads.setParts((i + 1) + "/" + strings[0].size());
                downloads.setTerminal(terminalID);
                downloads.setTYPE(new BigDecimal(tipofile));
                downloads.setStatus(BigDecimal.ZERO);
                downloads.setPartSize("" + partsize);
                downloads.setVersion(version);
                downloads.setDescription(description);
                downloads.setTotalSize(Integer.toString(cantBytes));
                downloads.setDeflateCount(Integer.toString(cantBytes));
                downloads.setIdDocumento(iddocumento);
                downloads.setCreatedDate(date);
                downloads.setModelTerminal((long) terminalModel);
                download[0] = downloads;
                contador++;
            }
            logger.info("Se registraron " + contador + " paquetes con paquete: " + iddocumento + " el " + new Date());
        } catch (Exception e) {
            logger.error("Error en registro de paquetes para inicialización");
        }
        return download;
    }
