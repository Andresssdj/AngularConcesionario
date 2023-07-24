 @GetMapping (path = "/list/filter/{id}", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Object>  ListId (@PathVariable long id, Pageable pageable) {
        logger.info("----- Listado de archivos por id  {} -----", id);
        List<UpdateDownloadResponse> list = UpdateDownloadService.ListId(pageable, id);
        logger.info(FIN_HTTP);

        return ResponseEntity.status(list != null ? HttpStatus.OK : HttpStatus.NOT_FOUND).body(list != null ? list : Util.jsonMessage(MessagesDTO.SIN_INFORMACION));
    }

Non-static method 'ListId(org.springframework.data.domain.Pageable, long)' cannot be referenced from a static context


public List<UpdateDownloadResponse> ListId(Pageable pageable, long id) {
        List<UpdateDownload> list = repositoryDownload.findByElementoId(id, pageable);
        return (!list.isEmpty()) ? mapperListToResponse(list) : null;
    }
