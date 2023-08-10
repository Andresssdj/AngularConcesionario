 listParams(pagina: string, type: string) {

    this.requestType = type;
    this.changeService.requestListChangeParamsTef('0', type, pagina).subscribe(
      response => {
        // console.log('Response OK change params');
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
            }
          }
        }
        
        this.dataSource.data = response as UpdateDownloadDTO[];    
      }, error => {
        this.dataSource.data = [];
        console.log('Sin información');
      }
    )
  }




formatParameterToJson(parameterBD: any) : TefDTO{
    var tef1 = parameterBD.slice(0,-1);
    var listaNombres = tef1.split('|');
    var valTef: any = {"tef" : {}};
    var position;
    var values;
    this.itemsTef.forEach((key, index) => {
      var name = key.concat('=');
      if (listaNombres.length > index) {
        if (listaNombres[index].indexOf(name) > -1) {
          position = listaNombres[index].indexOf(name)+name.length;
          values = listaNombres[index].substring(position);
          valTef.tef[key] = values; 
        }        
      }      
    });
    
    return valTef;

  }




createTef() {
    this.dtoParametros = new Parameters();
    this.dtoParamsTef = new UpdateDownloadDTO();
    if (this.tipoTerminal == '1') {
      this.dtoParametros.tef_legacy = this.generateTefLegacy(this.tefDTO);
    }else{
      this.dtoParametros.tef_android = this.tefDTO;
    }

    this.dtoParamsTef.created = localStorage.getItem('username');
    this.dtoParamsTef.description = this.tefDTO.NOMBREARCHIVO;
    var parametrosUpdate = this.managerJsonService.removeCleanKeysJson(this.dtoParametros);
    this.dtoParamsTef.value = parametrosUpdate;
    let criterioGroup = {
      "id_terminal": "> 1"
    }

    console.log(this.dtoParamsTef);

    this.changeService.requestChangesBuilderTef(parametrosUpdate).subscribe(
      response => {
        console.log(response.id);
        this.tefDTO = new TefDTO();
        this.auditService.requestAddAudit(response.id, 2, parametrosUpdate, JSON.stringify(parametrosUpdate), parametrosUpdate, criterioGroup);
        this.modal.dismissAll();
        this.tipoTerminal="";
        this.habilitado = "";
        console.log('STATUS = 202');
        this.toastShow('Solicitud exitosa, parametros TEF agregados', NgbToastType.Success, 5);
        this.ngOnInit();
      }, error => {
        console.log('STATUS = 400');
        this.toastShow('No se logro aplicar los cambios', NgbToastType.Danger, 5);
      }
    );

    
  }




generateTefLegacy(newTef: TefDTO) : string{
    this.valTefParams  = '[PARAMS]';
    this.valTefRS232  = '[RS232]';
    this.valTefVARIABLES  = '[VARIABLES]';
    
    for (const [clave, valor] of Object.entries(newTef)) {
      for (let param in this.params){
        if (this.params[param] === clave) {
          this.valTefParams += clave + '=' + valor + '|';
        }
      }    
      for (let param in this.rs232){
        if (this.rs232[param] === clave) {
          this.valTefRS232 += clave + '=' + valor + '|';
        }
      }  
      for (let param in this.variables){
        if (this.variables[param] === clave) {
          this.valTefVARIABLES += clave + '=' + (clave === 'NOMBREARCHIVO' ? valor.toUpperCase(): valor) + '|';
        }
      }
    }
    this.archivoTef = this.valTefParams + this.valTefRS232 + this.valTefVARIABLES
    return this.archivoTef;
    
  }


 generateTefLegacy(newTef: TefDTO): string {
  const tefParams: any = {};
  const rs232Params: any = {};
  const ethernetParams: any = {};
  // ... Define other parameter sections as needed

  for (const [clave, valor] of Object.entries(newTef)) {
    if (this.params.includes(clave)) {
      tefParams[clave] = valor;
    } else if (this.rs232.includes(clave)) {
      rs232Params[clave] = valor;
    } else if (this.ethernet.includes(clave)) {
      ethernetParams[clave] = valor;
    }
    // ... Add logic for other parameter sections
  }

  const tefParamsString = this.formatParameterToString(tefParams);
  const rs232ParamsString = this.formatParameterToString(rs232Params);
  const ethernetParamsString = this.formatParameterToString(ethernetParams);
  // ... Convert other parameter sections to strings

  const archivoTef = `[PARAMS]${tefParamsString}[RS232]${rs232ParamsString}[ETHERNET]${ethernetParamsString}`;
  // ... Concatenate other parameter sections

  return archivoTef;
}

formatParameterToString(params: any): string {
  let paramString = '';
  for (const [key, value] of Object.entries(params)) {
    paramString += `${key}=${value}|`;
  }
  return paramString;
}
