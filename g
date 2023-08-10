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


 tef_legacy: "[PARAMS]ISCUPON=1|ISANULACION=1|ISBONOREGALO=1|ISPAGOMOVIL=1|ISBONOVIRTUAL=1|ISTEFON=1|ISAVANCE=1|ISRECARGACELULAR=1|ISCIERRE=1|MODETEF2=1|
  [RS232]ISRS232=1|COMPORT=0|PHYSICALCOMPORT=0|NUMBERDATABITS=8|PARITY=N|STOPBITS=1|BAUDRATE=9600|
  [ETHERNET]ISETHERNET=0|IPHOST=0|PORTHOST=0|
  [USB]ISUSB=0|
  [TEFCLOUD]ISTEFCLOUD=0|
  [VARIABLES]NOMBREARCHIVO=PRUEBA_M|STIMEOUTCU=60|STIMEOUTME=60|STIMEOUTSC=60|FKCSIGN=30|MXSIGNTOUT=45|SIGNATUREW=0|SIGNRETRIES=2|BEEPLEVEL=10|BLOCKMAGNETIC=0|SETADFIELDS=0|SENDTRACKS=0|BLOCKCREDITCARD=0|CIERREAUTO=NULL|SETPRINTER=0|ACTNUMRECEIPT=0|DELAYSLAN=0|SETOFFCAMPS=53|SETONACK=0|EXCLUSIVOFALA=0|IMPUESTOSAUTO=0|ESTADOCIERRE=0|"

value: tef: 
ACTNUMRECEIPT
: 
"0"
BAUDRATE
: 
"9600"
BEEPLEVEL
: 
"10"
BLOCKCREDITCARD
: 
"0"
BLOCKMAGNETIC
: 
"0"
CIERREAUTO
: 
"NULL"
COMPORT
: 
"0"
DELAYSLAN
: 
"0"
ESTADOCIERRE
: 
"0"
EXCLUSIVOFALA
: 
"0"
FKCSIGN
: 
"30"
IMPUESTOSAUTO
: 
"0"
IPHOST
: 
"0"
ISETHERNET
: 
"0"
ISRS232
: 
"1"
ISTEFCLOUD
: 
"0"
ISUSB
: 
"0"
MXSIGNTOUT
: 
"45"
NOMBREARCHIVO
: 
"PRUEBA_M"
NUMBERDATABITS
: 
"8"
PARITY
: 
"N"
PHYSICALCOMPORT
: 
"0"
PORTHOST
: 
"0"
SENDTRACKS
: 
"0"
SETADFIELDS
: 
"0"
SETOFFCAMPS
: 
"53"
SETONACK
: 
"0"
SETPRINTER
: 
"0"
SIGNATUREW
: 
"0"
SIGNRETRIES
: 
"2"
STIMEOUTCU
: 
"60"
STIMEOUTME
: 
"60"
STIMEOUTSC
: 
"60"
STOPBITS
: 
"1"
