	controlardor
	 @GetMapping (path = "/list/filter/all", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Object>  ListId (@PathVariable long id, String value) {
        logger.info("----- Listado de archivos por id  {} -----", value);
        List<UpdateDownloadResponse> list = serviceDownload.ListId(id, value);
        logger.info(FIN_HTTP);

        return ResponseEntity.status(list != null ? HttpStatus.OK : HttpStatus.NOT_FOUND).body(list != null ? list : Util.jsonMessage(MessagesDTO.SIN_INFORMACION));
    }
	
	
	Servicio
	
	  public List<UpdateDownloadResponse> ListId(long id, String value) {
        List<UpdateDownload> list = repositoryDownload.findByElementoId(id, value);
        return (!list.isEmpty()) ? mapperListToResponse(list) : null;
    }
	
	
	   @Query("select new com.credibanco.entity.UpdateDownload(u.id as id , u.value as value, u.status as status,u.createdDate as createdDate, u.tipoCambio as tipoCambio,u.criterio as criterio,u.type as type,u.updatedDate as updatedDate,u.description as description,u.version as version)from UpdateDownload u where u.value  is not null")
    List<UpdateDownload> findByElementoId(long id, String value);
