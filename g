ARCHIVO TS ANGULAR 

codigoSearch: string;

tableFilter(event: Event) {

    const filterValue = (event.target as HTMLInputElement).value;
    this.codigoSearch = filterValue;
   

    if (filterValue.length > 3) {
      this.requestGetByValue(this.codigoSearch);
    } else if (filterValue.length == 0) {
      this.ngOnInit();
    }

    this.dataSource.filter = filterValue;
  }
  

  requestGetByValue(value: string) {
    console.log(value);
   this.changeService.requestGetFilesByValue(0, value).subscribe(
      response => {
        for (let parameters in response){
          for (let parameter in response[parameters].value){
            if (parameter === 'tef_android') {
              var valTef: any = {"tef" : ""};
              valTef.tef = response[parameters].value[parameter];
              response[parameters].value = valTef;
            }else if (parameter === 'tef_legacy'){
              var valTef1: TefDTO;
              valTef1 = this.formatParameterToJson(response[parameters].value[parameter]);
              response[parameters].value = valTef1;

              console.log(response);
            }
          }
        }
      this.dataSource.data = response as UpdateDownloadDTO[];    
      }, error => {
        console.log('Sin información');
      })
  }


CONTROLADOR JAVA

@GetMapping (path = "/list/filter-value/{value}", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Object> searchListFilesByValue(@PathVariable String value, Pageable pageable) {
        logger.info("----- filtro por value {} -----", value);
        List<UpdateDownloadResponse> listVersions = serviceDownload.ListByValue(value, pageable);
        logger.info(FIN_HTTP);
        return ResponseEntity.status(listVersions != null ? HttpStatus.OK : HttpStatus.NOT_FOUND).body(listVersions != null ? listVersions : Util.jsonMessage(MessagesDTO.SIN_INFORMACION));
    }

SERVICIO JAVA 

 public List<UpdateDownloadResponse> ListByValue(String value, Pageable pageable) {
        List<UpdateDownload> list = repositoryDownload.listFilesVersionByValue(value, pageable);
        return (!list.isEmpty()) ? mapperListToResponse(list) : null;
    }

QUERY REPOCITORIO

 @Query("select new com.credibanco.entity.UpdateDownload(u.id as id, u.value as value,u.status as status,u.createdDate as createdDate, u.tipoCambio as tipoCambio,u.criterio as criterio,u.type as type,u.updatedDate as updatedDate,u.description as description,u.version as version)from UpdateDownload u WHERE u.criterio like '%> 1%' AND u.value like '%' || :value || '%' and u.value like '%tef%'")
    List<UpdateDownload> listFilesVersionByValue(String value, Pageable pageable);
