
que esta haciendo esto 

private List<String> createPackagesDownload(String sBase64) {
        List<String> strings = new ArrayList<>();
        try {

            logger.info("Generar paquetes de a " + maxcaracters + " por campo");
            int maxCaracters = maxcaracters;
            int index = 0;
            logger.info("Generando listado de paquetes ...");
            while (index < sBase64.length()) {
                strings.add(sBase64.substring(index, Math.min(index + maxCaracters, sBase64.length())));
                index += maxCaracters;
            }

        } catch (Exception e) {
            logger.error("Error al separar por paquetes en service managePackageDownload");
        }
        return strings;
    }
