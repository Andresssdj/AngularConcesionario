for (const [clave, valor] of Object.entries(newTef)) {
      for (let param in this.params){
        if (this.params[param] === clave) {
          this.valTefParams += clave + '=' + valor + '|';
        }


<div class="col-sm-2">
                        <span>Habilitado a caja</span><br>
                        <div class="text-gray-300">
                            {{ dtoConfigParamsTef.value.tef.ISTEFON == 1 ? 'Activo' : 'Inactivo' }}
                        </div>
                    </div>
