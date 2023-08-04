 generateTefLegacy(newTef: TefDTO) : string{
    this.valTefParams  = '[PARAMS]';
    this.valTefRS232  = '[RS232]';
    this.valTefETHERNET  = '[ETHERNET]';
    this.valTefUSB  = '[USB]';
    this.valTefTEFCLOUD  = '[TEFCLOUD]';
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
      for (let param in this.ethernet){
        if (this.ethernet[param] === clave) {
          this.valTefETHERNET += clave + '=' + valor + '|';
        }
      }
      if (this.usb === clave) {
        this.valTefUSB += clave + '=' + valor + '|';
      }
      if (this.tefCloud === clave) {
        this.valTefTEFCLOUD += clave + '=' + valor + '|';
      }
      for (let param in this.variables){
        if (this.variables[param] === clave) {
          //this.valTefVARIABLES += clave + '=' + valor + '|';
          this.valTefVARIABLES += clave + '=' + (clave === 'NOMBREARCHIVO' ? valor.toUpperCase(): valor) + '|';
        }
      }
    }
    this.archivoTef = this.valTefParams + this.valTefRS232 + this.valTefETHERNET + this.valTefUSB + this.valTefTEFCLOUD + this.valTefVARIABLES
    return this.archivoTef;
    
  }

 params : string[] = ['ISTEFON','MODETEF2','ISANULACION','ISCIERRE','ISBONOREGALO','ISAVANCE','ISPAGOMOVIL','ISBONOVIRTUAL','ISRECARGACELULAR','ISCUPON'];
