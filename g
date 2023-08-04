
    
    for (const [clave, valor] of Object.entries(newTef)) {
      for (let param in this.params) {
        const clave = this.params[param];
        const valor = newTef[clave];
        if (valor !== clave) {
          this.valTefParams += clave + '=' + valor + '|';
        }

    


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




generateTefLegacy(newTef: TefDTO): string {
  const tefSections = {
    PARAMS: this.params,
    RS232: this.rs232,
    ETHERNET: this.ethernet,
    USB: [this.usb],
    TEFCLOUD: [this.tefCloud],
    VARIABLES: this.variables,
  };

  const sectionNames = Object.keys(tefSections);
  const sectionValues = Object.values(tefSections);
  const sectionKeys = sectionNames.map(name => `[${name}]`);

  const sections = sectionValues.map((section, index) => {
    const sectionEntries = Object.entries(newTef);
    const sectionValues = sectionEntries.filter(([clave]) => section.includes(clave));
    return sectionValues.map(([clave, valor]) => {
      return clave === 'NOMBREARCHIVO' ? `${clave}=${valor.toUpperCase()}` : `${clave}=${valor}`;
    }).join('|');
  });

  this.archivoTef = sectionKeys.map((sectionKey, index) => `${sectionKey}${sections[index]}`).join('');
  return this.archivoTef;
}
