tengo este codigo de java

 private List<String>[] createPackagesDownload(String sBase64) {
        List<String> array1= new ArrayList<>();
        List<String> array2= new ArrayList<>();
        try {

            logger.info("Generar paquetes de a " + maxcaracters + " por campo");
            logger.info("Generar paquetes de " + newmaxcaracters + " por campo");

            int maxCaracters = maxcaracters;
            int newMaxCaracters = newmaxcaracters;
            int index = 0;
            logger.info("Generando listado de paquetes ...");
            while (index < sBase64.length()) {
                array1.add(sBase64.substring(index, Math.min(index + maxCaracters, sBase64.length())));
                index += maxCaracters;
            }
            index = 0; // Reiniciar el índice para la nueva variable
            logger.info("Generando listado de paquetes con newMaxCaracters ...");
            while (index < sBase64.length()) {
                array2.add(sBase64.substring(index, Math.min(index + newMaxCaracters, sBase64.length())));
                index += newMaxCaracters;
            }

        } catch (Exception e) {
            logger.error("Error al separar por paquetes en service managePackageDownload");
        }

        List<String>[] strings = new List[2];
        strings[0]= array1;
        strings[1]= array2;
       return strings;
    }


y quiero que me haga esto para los dos arreglos de strings 

private Download registerInDownloadInits(List<String> strings, long terminalID, int partsize, byte[] arrayBytes, boolean newTerminal) {
        Download download = null;
        try {
            // Inicializaciones manejar en numeros par
            Integer iddocumento = getIdDocumentDisponibleInit(terminalID);

            logger.info("Registrando paquetes loading ... ");
            int contador = 0;
            Date date = new Date();
            for (int i = 0; i < strings.size(); i++) {
                String base64Part = strings.get(i);
                download = new Download();
                download.setBase64(base64Part);
                download.setParts((i + 1) + "/" + strings.size());
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

