
    
    for (const [clave, valor] of Object.entries(newTef)) {
      for (let param in this.params) {
        const clave = this.params[param];
        const valor = newTef[clave];
        if (valor !== clave) {
          this.valTefParams += clave + '=' + valor + '|';
        }

    


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
