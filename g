Tengo este controlador


public ResponseEntity<Object> listBinStages(){
        logger.info("----- Obteniendo listado de bines -----");
        List<BinStagesResponse> response = binStagesService.listBines();
        logger.info(MessagesDTO.FIN_HTTP);
        return ResponseEntity.status(response != null ? HttpStatus.OK : HttpStatus.NOT_FOUND).body(response != null ? response : Util.jsonMessage(MessagesDTO.SIN_INFORMACION));
    }
	
	y este servicio
	
	public List<BinStagesResponse> listBines() {
        List<BinStages> listBines = binStagesRepository.findAll();
        return !listBines.isEmpty() ? mapperListToResponse(listBines) : null;


    }

    private Object convertObjectToJson(Object string) throws Exception {
        ObjectMapper objectMapper = new ObjectMapper();
        return objectMapper.readValue(string.toString(), Object.class);
    }
     private List <BinStagesResponse> mapperListToResponse(List<BinStages> listEntity) {
       List<BinStagesResponse> response = listEntity.stream().map(BinStages -> modelMapper.map(BinStages, BinStagesResponse.class)).collect(Collectors.toList());
       try{
           for (BinStagesResponse r : response){
               r.setBines(convertObjectToJson(r.getBines()));
           }
       } catch (Exception e) {
           logger.error("Error al convert String to Json en mapperListResponse: ", e);
       }
       return response;
    }
}

y esto es la respuesta pero quiero que bp sea una lista de objetos


[
    {
        "id": 1,
        "es": "6",
        "bp": {
            "rf": "6395299999",
            "ri": "6395290000",
            "id": "513"
        }
    },
    {
        "id": 2,
        "es": "7",
        "bp": {
            "rf": "6395299999",
            "ri": "6395290000",
            "id": "513"
        }
    }
]




public class BinStagesResponse {
    private int id;
    private String es;
    private List<BpObject> bp;

    // Getters and setters
}

public class BpObject {
    private String rf;
    private String ri;
    private String id;

    // Getters and setters
}

// ...

private List<BinStagesResponse> mapperListToResponse(List<BinStages> listEntity) {
    Map<String, List<BinStages>> groupedByEs = listEntity.stream().collect(Collectors.groupingBy(BinStages::getEs));

    List<BinStagesResponse> response = new ArrayList<>();
    try {
        for (Map.Entry<String, List<BinStages>> entry : groupedByEs.entrySet()) {
            List<BpObject> bpList = entry.getValue().stream()
                    .map(binStages -> {
                        BpObject bpObject = new BpObject();
                        bpObject.setRf(binStages.getBp().getRf());
                        bpObject.setRi(binStages.getBp().getRi());
                        bpObject.setId(binStages.getBp().getId());
                        return bpObject;
                    })
                    .collect(Collectors.toList());

            BinStagesResponse binStagesResponse = new BinStagesResponse();
            binStagesResponse.setId(entry.getValue().get(0).getId());
            binStagesResponse.setEs(entry.getValue().get(0).getEs());
            binStagesResponse.setBp(bpList);

            response.add(binStagesResponse);
        }
    } catch (Exception e) {
        logger.error("Error al convertir String a Json en mapperListResponse: ", e);
    }
    return response;
}

