for (const [clave, valor] of Object.entries(newTef)) {
      for (let param in this.params){
        if (this.params[param] === clave) {
          this.valTefParams += clave + '=' + valor + '|';
        }
