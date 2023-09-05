public List<BinStagesResponse> mapperListToResponse(List<BinStages> listEntity) {
    return listEntity.stream()
        .map(binStages -> {
            BinStagesResponse response = modelMapper.map(binStages, BinStagesResponse.class);
            // Parsea la cadena JSON en objetos
            List<BinInfo> binInfoList = Arrays.asList(new Gson().fromJson(response.getBi(), BinInfo[].class));
            response.setBi(binInfoList);
            return response;
        })
        .collect(Collectors.toList());
}





tengo este query 

@Query(
        value = "SELECT * from  BIN_STAGES B order by B.ID_ESCENARIO",
        nativeQuery = true
    )
    Page<BinStages> getBines(Pageable pageable);
	
	
	este servicio
	
	public List<BinStagesResponse> listBines(Pageable pageable) {
        Page <BinStages> listBines = binStagesRepository.getBines(pageable);
        return !listBines.isEmpty() ? mapperListToResponse(listBines.getContent()) : null;
    }
    List<BinStagesResponse> mapperListToResponse(List<BinStages> listEntity) {
        return listEntity.stream().map(BinStages -> modelMapper.map(BinStages, BinStagesResponse.class)).collect(Collectors.toList());
    }
	
	este controlador 
	
	 public ResponseEntity<Object> listBinStages(@PageableDefault Pageable pageable){
        logger.info("----- Obteniendo listado de bines -----");
        List<BinStagesResponse> response = binStagesService.listBines(pageable);
        logger.info(MessagesDTO.FIN_HTTP);
        return ResponseEntity.status(response != null ? HttpStatus.OK : HttpStatus.NOT_FOUND).body(response != null ? response : Util.jsonMessage(MessagesDTO.SIN_INFORMACION));
    }
	
	
	
	y me arroja 


  {
        "es": 4,
        "bi": "[{\"rf\":\"5288849999\",\"ri\":\"5288840000\",\"id\":\"338\"}]"
    },
    {
        "es": 7,
        "bi": "[{\"rf\":\"5294049999\",\"ri\":\"5294040000\",\"id\":\"340\"}]"
    }
	
	
	quiero que lo de bi es vez de que sea un string
	
	quede como objetos
