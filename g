tengo este codigo


<div class="col-sm-12">
                        <button class="card card-small btn bg-cbc float-right" [disabled]="loading" (click)="updateParams()">
                           <div > <span [class.spinner]="loading" class="p-2 text-white">Actualizar</span> </div>
                        </button>
                    </div>

updateParams() {
    // -- bines tef 
    this.loading = true;
    let arrayBines: any = [];
    if (this.dtoParametrosUpdate.chabc == '1' && this.dtoParametrosUpdate.estf != '0' && this.dtoParametrosUpdate.estf != '3') {
      console.log('Habilitado a caja, definiendo bines');
      this.listBinEmisorTEF.forEach(bin => {
        if (bin.checked) {
          let jsonBines: any =
          {
            "id": bin.id,
            "ri": `${bin.ri}`,
            "rf": `${bin.rf}`
          }
          arrayBines.push(jsonBines);
        }
      });
      if (arrayBines[0]) {
        this.dtoParametrosUpdate.bp = arrayBines;
      }
    }

    var parametrosUpdate = this.managerJsonService.removeCleanKeysJson(this.dtoParametrosUpdate);
    
    if (this.message == 'Grupo') {
      this.approbalGroup(parametrosUpdate);
    }else if(this.message == 'Carga_Archivo'){
      this.approbalTerminalsFile(parametrosUpdate);
    }else{
      console.log('aca');
    }
    
  }
  
  
  
  pero el bopon de carga se queda activo, donde lo puedo desactivar
  
