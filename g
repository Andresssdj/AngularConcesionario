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
              console.log(valTef1);
            }
          }
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



params : string[] = ['ISTEFON','MODETEF2','ISANULACION','ISCIERRE','ISBONOREGALO','ISAVANCE','ISPAGOMOVIL','ISBONOVIRTUAL','ISRECARGACELULAR','ISCUPON'];


interface TefDTO {
  [key: string]: string;
}

for (const parameters in response) {
  for (const parameter in response[parameters].value) {
    if (parameter === 'tef_android') {
      const valTef: any = { tef: '' };
      valTef.tef = response[parameters].value[parameter];
      response[parameters].value = valTef;
    } else if (parameter === 'tef_legacy') {
      const valTef1: TefDTO = this.formatParameterToJson(response[parameters].value[parameter]);
      response[parameters].value = valTef1;
      console.log(valTef1);
    }
  }
}


formatParameterToJson(parameterBD: any): TefDTO {
  const tef1 = parameterBD.slice(0, -1);
  const listaNombres = tef1.split('|');
  const valTef: TefDTO = {};
  
  this.itemsTef.forEach((key, index) => {
    const name = key.concat('=');
    if (listaNombres.length > index && listaNombres[index].includes(name)) {
      const position = listaNombres[index].indexOf(name) + name.length;
      const values = listaNombres[index].substring(position);
      valTef[key] = values;
    }
  });
  
  return valTef;
}
