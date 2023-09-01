tego esta tabla y este modalBinesUp y quiero que el comento de darle click a editar me tome el f.es y se lo pase a la
 fincion de updateEscenarioBin y tambine quiero que al momento de darle al boton edidat y que me abre el modalBinesUp
 quiero que el el modal-header me muestre el id del elemento selecionado a editar



<table mat-table [dataSource]="dataSource">
            <ng-container matColumnDef="Escenarios">
                <th mat-header-cell *matHeaderCellDef><strong>Escenario</strong></th>
                <td mat-cell *matCellDef="let f"> 
                    <span>{{f.es}}</span>
                </td>
            </ng-container>

            <ng-container matColumnDef="Bines">
                <th mat-header-cell *matHeaderCellDef> <strong> Bines </strong></th>
                <td mat-cell *matCellDef="let f"> {{f.bi}} </td>
            </ng-container>


            <ng-container matColumnDef="Acciones">

                <th mat-header-cell *matHeaderCellDef> <strong> Acciones </strong></th>
                <td mat-cell *matCellDef="let f"> 
                   
                   
                   
                    <button matTooltip="Editar" type="button"
                    class="btn movement text-white" *ngIf="profile == '0' || profile == '2'"
                    (click)="">
                    <mat-icon
                        class="btn-group size-20 text-cbc" role="group"> mode
                    </mat-icon>
                    </button> 

                </td>

            </ng-container>
            
            <tr mat-header-row *matHeaderRowDef="displayedColumns"></tr>
            <tr mat-row *matRowDef="let row; columns: displayedColumns;"></tr>

            

        </table>




<ng-template #modalBinesUp let-modal>

        <div class="modal-header">
            <h3 class="modal-title" ></h3>
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
            
            <button (click)="updateEscenarioBin(f.es, selectedIds)" class="card card-small btn btn-primary bg-primary text-light">
                <span class="p-2">Confirmar</span>
            </button>   
        </div>
    </ng-template>
	
	
	
	
	updateEscenarioBin(es: string, selectedIds: string[]){

    const bines = selectedIds.join(',').replace(/,\s+/g, ',');
    this.changeService.requestUpdateEscenarioBin(es, bines).subscribe(response =>{
      console.log(response);
      this.toastShow('Solicitud exitosa, bines actualizados', NgbToastType.Success);
      this.ngOnInit();
      this.selectedIds=[];
    }, error => {
      this.toastShow('No se logro actualizar bines', NgbToastType.Danger);
    });
  }






<button matTooltip="Editar" type="button"
    class="btn movement text-white" *ngIf="profile == '0' || profile == '2'"
    (click)="openEditModal(f.es)">
    <mat-icon class="btn-group size-20 text-cbc" role="group">mode</mat-icon>
</button>






<div class="modal-header">
    <h3 class="modal-title">{{ selectedEscenario }}</h3>
    <button type="button" class="close" aria-label="Close" (click)="modal.dismiss()">
        <span aria-hidden="true">&times;</span>
    </button>
</div>



selectedEscenario: string;
selectedIds: string[] = [];

openEditModal(es: string) {
    this.selectedEscenario = es;
    // También puedes aquí obtener los valores seleccionados y asignarlos a this.selectedIds si es necesario
    // Ejemplo: this.selectedIds = obtenerIdsSeleccionados();
    // Luego, puedes mostrar el modal aquí
    this.modalService.open(this.modalBinesUp);
}

updateEscenarioBin() {
    const es = this.selectedEscenario;
    const selectedIds = this.selectedIds;
    // Resto de tu código para realizar la actualización
    this.changeService.requestUpdateEscenarioBin(es, selectedIds).subscribe(response => {
        console.log(response);
        this.toastShow('Solicitud exitosa, bines actualizados', NgbToastType.Success);
        this.ngOnInit();
        this.selectedIds = [];
    }, error => {
        this.toastShow('No se logró actualizar bines', NgbToastType.Danger);
    });
}

