tengo esta funcion "getBinesTef()"

listBinEmisorTEF: BinDtoTef[] = [];
  jsonBinPan: any;
  listCheck: BinDtoTef [] = []
  getBinesTef() {
    this.binemisorService.requestGetListBinEmisor().subscribe({
      next: (response: any) => {
        this.listBinEmisorTEF = response;
        this.listBinEmisorTEF.forEach(element => {
          element.checked = false;
          if (this.jsonBinPan != null) {
            for (let i = 0; i < this.jsonBinPan.length; i++) {
              if (element.id == this.jsonBinPan[i]['id']) {
                element.checked = true;
                break;
              } 
            }
          }
        });
      }, error(response: any) {
        console.log('Error al obtener la lista de bines en component:', response)
      }
    });
  }
  
  y estas otras  "updateeBin()", "updateEscenarioBin()"
  
  selectedEscenario: string;

updateeBin(es: string,modal: any){
  console.log(modal);
  const numero = es.match(/^\d+(?=\.\s)/);
   if(numero){
    this.selectedEscenario = numero[0];
   }
  this.getBinesTef();
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
    this.selectedIds=[];
  }, error => {
    this.toastShow('No se logro actualizar bines', NgbToastType.Danger);
  });
}


y este html 

<button matTooltip="Editar" type="button"
                    class="btn movement text-white" *ngIf="profile == '0' || profile == '2'"
                       (click)="updateeBin(f.es, modalBinesUp)">
                      <mat-icon class="btn-group size-20 text-cbc" role="group">mode</mat-icon>
                   </button>
				   
				   
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
	
	quiero que al momento de llamar

	updateeBin(es: string,modal: any){
  console.log(modal);
  const numero = es.match(/^\d+(?=\.\s)/);
   if(numero){
    this.selectedEscenario = numero[0];
   }
  this.getBinesTef();
  this.openModal(modal, 'content');
}

que se haga algo para que se comparen con unos id que tengo en un arreglo llamado "bi" para que si son iguales ya me aparescon marcados en el  checkbox de #modalBinesUp
