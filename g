ahora corrige este para que se haga con los dos 

public DownloadResponse manageDownloadParams(long terminalID, String params, int caso, int tipofile, String version, String description, boolean newTerminal) {

        Download download = null;
        try {
            logger.info("Manejando descargas ... ");
            int cantBytes = 0;
            int partsize = 0;
            byte[] arrayBytes;
            List<String> strings;

            if (caso == 1) {
                logger.info("Obteniendo bytes del init, add en descargas de init");
                arrayBytes = UtilManageFilesZip.comprimirFile(params.getBytes(StandardCharsets.UTF_8), "InitData.json");
                String sBase64 = Base64.getEncoder().encodeToString(arrayBytes);
                sBase64 = sBase64.replace("=", "");
                strings = createPackagesDownload(sBase64);
                partsize = arrayBytes.length / strings.size();

                download = registerInDownloadInits(strings, terminalID, partsize, arrayBytes, newTerminal);
            } else {
                params = params.replace("=", "");
                logger.info("Obteniendo bytes de file, add en descargas de files");
                tipofile = caso == 00 ? 0 : tipofile;
                arrayBytes = params.getBytes(StandardCharsets.UTF_8);
                cantBytes = (arrayBytes.length * 6) / 8;
                strings = createPackagesDownload(params);
                partsize = cantBytes / strings.size();
                download = registerInDownloadFiles(strings, terminalID, partsize, cantBytes, version, description, tipofile, 0);
            }

        } catch (Exception e) {
            logger.error("Error en el service manageDownload ", e);
        }
        return download != null ? mapperToResponse(download) : null;
    }
