updateeBin(es: string, bi: string[], modal: any) {
  const numero = es.match(/^\d+(?=\.\s)/);
  if (numero) {
    this.selectedEscenario = numero[0];
  }

  // Inicializa selectedIds como un arreglo vacío
  this.selectedIds = [];

  // Realiza la comparación y marca los elementos correspondientes
  this.listBinEmisorTEF.forEach(element => {
    if (bi.includes(element.id)) {
      element.checked = true;
      // Agrega el ID al arreglo selectedIds
      this.selectedIds.push(element.id);
    } else {
      element.checked = false;
    }
  });

  this.openModal(modal, 'content');
}



tengo esta funcion y quiero es el resultado de la comparacion sea lo que se le pase a updateEscenarioBin en su campo selectedIds


updateeBin(es: string, bi: string[], modal: any) {
  const numero = es.match(/^\d+(?=\.\s)/);
  if (numero) {
    this.selectedEscenario = numero[0];
  }
  this.listBinEmisorTEF.forEach(element => {
      element.checked = false;
  });
  // Realiza la comparación y marca los elementos correspondientes
  this.listBinEmisorTEF.forEach(element => {
    if (bi.includes(element.id)) {
      element.checked = true;
    }
  });

  this.openModal(modal, 'content');
}



updateEscenarioBin( selectedEscenario: string ,selectedIds: string[]){
  const es = selectedEscenario;
  const bines = selectedIds.join(',').replace(/,\s+/g, ',');
  console.log("es",es,"bines",bines)
  this.changeService.requestUpdateEscenarioBin(es, bines).subscribe(response =>{
    console.log(response);
    this.toastShow('Solicitud exitosa, bines actualizados', NgbToastType.Success);
    this.ngOnInit();
    //this.selectedIds=[];
  }, error => {
    this.toastShow('No se logro actualizar bines', NgbToastType.Danger);
  });
}


y este checkedbox

<ng-template #modalBinesUp let-modal>

        <div class="modal-header">
            <h3 class="modal-title">Escenario a editar: {{selectedEscenario}}</h3>
            <button type="button" class="close" aria-label="Close" (click)="modal.dismiss()">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>

        <div class="modal-body">
        

            <cdk-virtual-scroll-viewport itemSize="50" class="example-viewport col-sm-12">
                <table class="table table-striped table-light">
                    <thead>
                        <tr>
                            <th scope="col">Rango Inicial</th>
                            <th scope="col">Rango Final</th>
                            <th scope="col">Label</th>
                            <th scope="col"> </th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr *ngFor="let bin of listBinEmisorTEF">
                            <td>{{ bin.ri }}</td>
                            <td>{{ bin.rf }}</td>
                            <td>{{ bin.lb }}</td>
                            <td>
                                <mat-checkbox [(ngModel)]="bin.checked" color="primary" (change)="toggleChackbox(bin.id)">
                                </mat-checkbox>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </cdk-virtual-scroll-viewport>
        </div>

        <div class="modal-footer">
            <button class="card card-small btn bg-light" (click)="modal.dismiss()">
                <span class="p-2">Cerrar</span>
              </button>
            
            <button (click)="updateEscenarioBin(selectedEscenario, selectedIds)" class="card card-small btn btn-primary bg-primary text-light">
                <span class="p-2">Confirmar</span>
            </button>   
        </div>
    </ng-template>



