tengo este metodo

  formatParameterToJson(parameterBD: any): TefDTO {
    console.log('parameterBD',parameterBD);
    var listaNombres = parameterBD.split('|');
    var valTef: any = {"tef" : {}};
    
    var paramMap: {[key: string]: string} = {}; // Objeto para mapear nombres a valores
    
    // Llena el paramMap con los nombres de los parámetros y sus valores correspondientes
    listaNombres.forEach(item => {
        var [name, value] = item.split('=');
        paramMap[name] = value;
    });
    console.log('map', paramMap);
    // Asigna los valores en el orden correcto según this.itemsTef
    this.itemsTef.forEach(key => {
        if (paramMap.hasOwnProperty(key)) {
            valTef.tef[key] = paramMap[key];
        }
    });
    //console.log(this.itemsTef);
    console.log('valTef',valTef);
    return valTef;
	
	
que al momento de mapear los datos me los trae asi 

"": undefined
ACTNUMRECEIPT: "0"
BAUDRATE: "0"
BEEPLEVEL: "10"
BLOCKCREDITCARD: "0"
BLOCKMAGNETIC: "0"
CIERREAUTO: "NULL"
COMPORT: "0"
DELAYSLAN: "0"
ESTADOCIERRE: "0"
EXCLUSIVOFALA: "0"
FKCSIGN: "30"
IMPUESTOSAUTO: "0"IPHOST: "0"
ISANULACION: "1"
ISAVANCE: "1"
ISBONOREGALO: "1"
ISBONOVIRTUAL: "1"
ISCIERRE: "1"
ISCUPON: "1"
ISRECARGACELULAR: "1"
ISTEFON: "1"
MODETEF2: "1"
MXSIGNTOUT: "45"
NUMBERDATABITS:"0"
PARITY: "0"
PHYSICALCOMPORT: "0"
PORTHOST: "0"
SENDTRACKS: "0"
SETADFIELDS: "0"
SETOFFCAMPS: "53"
SETONACK: "0"
SETPRINTER: "0"
SIGNATUREW: "0"
SIGNRETRIES: "2"
STIMEOUTCU: "60"
STIMEOUTME: "60"
STIMEOUTSC: "60"STOPBITS: "0"
[ETHERNET]ISETHERNET: "0"
[PARAMS]ISPAGOMOVIL: "1"
[RS232]ISRS232: "0"
[TEFCLOUD]ISTEFCLOUD: "0"
[USB]ISUSB: "1"
[VARIABLES]NOMBREARCHIVO: "PRUEBA_M"

quiero que cuando me los mapee me borre todo lo que este dentro de [ ] incluendo los corchetes


formatParameterToJson(parameterBD: any): TefDTO {
    var listaNombres = parameterBD.split('|');
    var valTef: any = {"tef": {}};
    
    var paramMap: {[key: string]: string} = {}; // Objeto para mapear nombres a valores
    
    // Llena el paramMap con los nombres de los parámetros y sus valores correspondientes
    listaNombres.forEach(item => {
        var [name, value] = item.split('=');
        var normalizedName = name.replace(/[\[\]"]/g, ''); // Elimina corchetes y comillas
        paramMap[normalizedName] = value;
    });
    
    // Asigna los valores en el orden correcto según this.itemsTef
    this.itemsTef.forEach(key => {
        if (paramMap.hasOwnProperty(key)) {
            valTef.tef[key] = paramMap[key];
        }
    });
    
    return valTef;
}




formatParameterToJson(parameterBD: any): TefDTO {
    var listaNombres = parameterBD.split('|');
    var valTef: any = {"tef": {}};

    var paramMap: {[key: string]: string} = {}; // Objeto para mapear nombres a valores

    // Llena el paramMap con los nombres de los parámetros y sus valores correspondientes
    listaNombres.forEach(item => {
        var [name, value] = item.split('=');
        paramMap[name] = value;
    });

    // Asigna los valores en el orden correcto según this.itemsTef
    this.itemsTef.forEach(key => {
        var normalizedKey = key.replace(/[\[\]"]/g, ''); // Normaliza el nombre del campo
        if (paramMap.hasOwnProperty(normalizedKey)) {
            valTef.tef[key] = paramMap[normalizedKey];
        }
    });

    return valTef;
}





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




listParams(pagina: string, type: string) {
  this.requestType = type;
  this.changeService.requestListChangeParamsTef('0', type, pagina).subscribe(
    response => {
      for (let parameters in response) {
        for (let parameter in response[parameters].value) {
          if (parameter === 'tef_android') {
            // ... Lógica para tef_android (sin cambios)
          } else if (parameter === 'tef_legacy') {
            var valTef1: TefDTO;
            valTef1 = this.formatParameterToJson(response[parameters].value[parameter]);
            response[parameters].value = valTef1; // Esta línea puede estar causando problemas
          }
        }
      }
      
      this.dataSource.data = response as UpdateDownloadDTO[];    
    },
    error => {
      this.dataSource.data = [];
      console.log('Sin información');
    }
  );
}


  itemsTef = ['ISTEFON','MODETEF2','ISANULACION','ISCIERRE','ISBONOREGALO','ISAVANCE','ISPAGOMOVIL','ISBONOVIRTUAL','ISRECARGACELULAR','ISCUPON','ISRS232','COMPORT','PHYSICALCOMPORT','NUMBERDATABITS','PARITY','STOPBITS','BAUDRATE','ISETHERNET','IPHOST','PORTHOST','ISUSB','ISTEFCLOUD','NOMBREARCHIVO','STIMEOUTCU','STIMEOUTME','STIMEOUTSC','FKCSIGN','MXSIGNTOUT','SIGNATUREW','SIGNRETRIES','BEEPLEVEL','BLOCKMAGNETIC','SETADFIELDS','SENDTRACKS','BLOCKCREDITCARD','CIERREAUTO','SETPRINTER','ACTNUMRECEIPT','DELAYSLAN','SETOFFCAMPS','SETONACK','EXCLUSIVOFALA','IMPUESTOSAUTO','ESTADOCIERRE'];


  params : string[] = ['ISTEFON','MODETEF2','ISANULACION','ISCIERRE','ISBONOREGALO','ISAVANCE','ISPAGOMOVIL','ISBONOVIRTUAL','ISRECARGACELULAR','ISCUPON'];

formatParameterToJson(parameterBD: any): TefDTO {
    var listaNombres = parameterBD.split('|');
    var valTef: any = {"tef" : {}};
    
    var paramMap: {[key: string]: string} = {}; // Objeto para mapear nombres a valores
    
    // Llena el paramMap con los nombres de los parámetros y sus valores correspondientes
    listaNombres.forEach(item => {
        var [name, value] = item.split('=');
        paramMap[name] = value;
    });
    
    // Asigna los valores en el orden correcto según this.itemsTef
    this.itemsTef.forEach(key => {
        if (paramMap.hasOwnProperty(key)) {
            valTef.tef[key] = paramMap[key];
        }
    });
    
    return valTef;
}

Al momento de paramMap me los esta mostrando asi 

"": undefined
ACTNUMRECEIPT: "0"
BAUDRATE: "0"
BEEPLEVEL: "10"
BLOCKCREDITCARD: "0"
BLOCKMAGNETIC: "0"
CIERREAUTO: "NULL"
COMPORT: "0"
DELAYSLAN: "0"
ESTADOCIERRE: "0"
EXCLUSIVOFALA: "0"
FKCSIGN: "30"
IMPUESTOSAUTO: "0"IPHOST: "0"
ISANULACION: "1"
ISAVANCE: "1"
ISBONOREGALO: "1"
ISBONOVIRTUAL: "1"
ISCIERRE: "1"
ISCUPON: "1"
ISRECARGACELULAR: "1"
ISTEFON: "1"
MODETEF2: "1"
MXSIGNTOUT: "45"
NUMBERDATABITS:"0"
PARITY: "0"
PHYSICALCOMPORT: "0"
PORTHOST: "0"
SENDTRACKS: "0"
SETADFIELDS: "0"
SETOFFCAMPS: "53"
SETONACK: "0"
SETPRINTER: "0"
SIGNATUREW: "0"
SIGNRETRIES: "2"
STIMEOUTCU: "60"
STIMEOUTME: "60"
STIMEOUTSC: "60"STOPBITS: "0"
[ETHERNET]ISETHERNET: "0"
[PARAMS]ISPAGOMOVIL: "1"
[RS232]ISRS232: "0"
[TEFCLOUD]ISTEFCLOUD: "0"
[USB]ISUSB: "1"
[VARIABLES]NOMBREARCHIVO: "PRUEBA_M"


pero quiero que me los mapee como esta en el TefDTO
que tiene este formato 

ISTEFON: 
MODETEF2: 
ISANULACION: 
ISCIERRE: 
ISBONOREGALO: 
ISAVANCE: 
ISPAGOMOVIL: 
ISBONOVIRTUAL: 
ISRECARGACELULAR: 
ISCUPON: 
ISRS232: 
COMPORT: 
PHYSICALCOMPORT: 
NUMBERDATABITS:
PARITY:
STOPBITS: 
BAUDRATE: 
ISETHERNET: 
IPHOST: 
PORTHOST: 
ISUSB: 
ISTEFCLOUD: 
NOMBREARCHIVO:
STIMEOUTCU: 
STIMEOUTME: 
STIMEOUTSC: 
FKCSIGN: 
MXSIGNTOUT: 
SIGNATUREW: 
SIGNRETRIES: 
BEEPLEVEL: 
BLOCKMAGNETIC: 
SETADFIELDS: 
SENDTRACKS: 
BLOCKCREDITCARD: 
CIERREAUTO: 
SETPRINTER: 
ACTNUMRECEIPT: 
DELAYSLAN: 
SETOFFCAMPS: 
SETONACK: 
EXCLUSIVOFALA: 
IMPUESTOSAUTO: 
ESTADOCIERRE: 



ya que al hacer la comparacion en 
this.itemsTef.forEach(key => {
        if (paramMap.hasOwnProperty(key)) {
            valTef.tef[key] = paramMap[key];

me los esta asignando asi en valTef 


tef: 
ACTNUMRECEIPT: "0"
BAUDRATE: "0"
BEEPLEVEL: "10"
BLOCKCREDITCARD: "0"
BLOCKMAGNETIC: "0"
CIERREAUTO: "NULL"
COMPORT: "0"
DELAYSLAN: "0"
ESTADOCIERRE: "0"
EXCLUSIVOFALA: "0"
FKCSIGN: "30"
IMPUESTOSAUTO: "0"
IPHOST: "0"
ISANULACION: "1"
ISAVANCE: "1"
ISBONOREGALO: "1"
ISBONOVIRTUAL: "1"
ISCIERRE: "1"
ISCUPON: "1"
ISRECARGACELULAR: "1"ISTEFON: "1"
MODETEF2: "1"
MXSIGNTOUT: "45"
NUMBERDATABITS: "0"
PARITY: "0"
PHYSICALCOMPORT: "0"
PORTHOST: "0"
SENDTRACKS: "0"
SETADFIELDS: "0"
SETOFFCAMPS: "53"
SETONACK: "0"
SETPRINTER: "0"
SIGNATUREW: "0"
SIGNRETRIES: "2"
STIMEOUTCU: "60"
STIMEOUTME: "60"
STIMEOUTSC: "60"
STOPBITS: "0"

lo cual hace que me excluya estos datos en la asignacion de valTef 

[ETHERNET]ISETHERNET: "0"
[PARAMS]ISPAGOMOVIL: "1"
[RS232]ISRS232: "0"
[TEFCLOUD]ISTEFCLOUD: "0"
[USB]ISUSB: "1"
[VARIABLES]NOMBREARCHIVO: "PRUEBA_M"
