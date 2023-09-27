
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




private List<String> createPackagesDownload(String sBase64, int maxCaracters, int newMaxCaracters) {
    List<String> strings = new ArrayList<>();
    try {
        logger.info("Generar paquetes de " + maxCaracters + " por campo");
        logger.info("Generar paquetes de " + newMaxCaracters + " por campo");

        int index = 0;
        logger.info("Generando listado de paquetes con maxCaracters ...");
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

