CONTROLADOR 

    @GetMapping (path = "/list/filter/all", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Object>  listR () {
        logger.info("----- Listado de archivos por id  {} -----" );
        List<UpdateDownloadResponse> list = serviceDownload.ListId();
        logger.info(FIN_HTTP);

        return ResponseEntity.status(list != null ? HttpStatus.OK : HttpStatus.NOT_FOUND).body(list != null ? list : Util.jsonMessage(MessagesDTO.SIN_INFORMACION));
    }


SERVICIO

public List<UpdateDownloadResponse> ListId() {
        List<UpdateDownload> list = repositoryDownload.findByElementoId();
        return (!list.isEmpty()) ? mapperListToResponse(list) : null;
    }




















@Service
public class TuServicio {

    @Autowired
    private UpdateDownloadRepository repositoryDownload;

    public List<UpdateDownloadResponse> listAllIdAndValue() {
        List<Object[]> resultList = repositoryDownload.findAllIdAndValue();
        return mapResultToResponse(resultList);
    }

    private List<UpdateDownloadResponse> mapResultToResponse(List<Object[]> resultList) {
        List<UpdateDownloadResponse> responseList = new ArrayList<>();
        for (Object[] result : resultList) {
            long id = (long) result[0];
            String value = (String) result[1];
            UpdateDownloadResponse response = new UpdateDownloadResponse(id, value);
            responseList.add(response);
        }
        return responseList;
    }
}





public List<IdValueResponse> getIdValueList() {
    List<UpdateDownload> list = repositoryDownload.findByElementoId();
    return (!list.isEmpty()) ? mapperListToIdValueResponse(list) : null;
}

private List<IdValueResponse> mapperListToIdValueResponse(List<UpdateDownload> list) {
    List<IdValueResponse> idValueList = new ArrayList<>();
    for (UpdateDownload updateDownload : list) {
        IdValueResponse idValueResponse = new IdValueResponse();
        idValueResponse.setId(updateDownload.getId());
        idValueResponse.setValue(updateDownload.getValue());
        idValueList.add(idValueResponse);
    }
    return idValueList;
}


   @Query("select new com.credibanco.entity.UpdateDownload(u.id as id , u.value as value, u.status as status,u.createdDate as createdDate, u.tipoCambio as tipoCambio,u.criterio as criterio,u.type as type,u.updatedDate as updatedDate,u.description as description,u.version as version)FROM UpdateDownload u  where u.value like '%tef%' ORDER BY ID DESC")
    List<UpdateDownload> findByElementoId();



Query("select new com.credibanco.entity.UpdateDownload(u.id as id, u.value as value) FROM UpdateDownload u where u.value like '%tef%' ORDER BY u.id DESC")
List<UpdateDownload> findByElementoId();

