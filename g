Tengo este html

<ng-template #modalBines let-modal>

        <div class="modal-body">

            <mat-form-field>
                <mat-label>Escenario</mat-label>
                <input matInput>
              </mat-form-field>
        
        

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
            
            <button (click)="modal.dismiss()" class="card card-small btn btn-primary bg-primary text-light">
                <span class="p-2">Confirmar</span>
            </button>   
        </div>
    </ng-template>
	
	
	y estas funciones en el ts 
	
	esta crea
	
	createEscenario(escenario: string, bines: string){
    this.changeService.requestCreateEscenario(escenario, bines).subscribe(response =>{
      console.log(response);
      this.toastShow('Solicitud exitosa, escenario agregado', NgbToastType.Success);
      this.ngOnInit()
    }, error => {
      this.toastShow('No se logro agregar el escenario', NgbToastType.Danger);
    });
  }
  
  y esta me guarlos los checkbox
  
  selectedIds: string [] = [];

  toggleChackbox(id: string){
    var index = this.selectedIds.indexOf(id);
    if (index === -1){
      this.selectedIds.push(id);
    } else {
      this.selectedIds.splice(index, 1);
    }
    console.log(this.selectedIds);
  }
  
  
  
  quiero que al momento de darle click a confirmar si actibe la funcion createEscenario(escenario, bines) y que los bines que se le pagen sean los de selectedIds y que el escenario sea lo que se ponga en <mat-form-field>
                <mat-label>Escenario</mat-label>
                <input matInput>
              </mat-form-field>
