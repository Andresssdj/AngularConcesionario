viewTerminalSmarVista(code: string, modal: any) {
    code = this.codigoSearch;
    this.serviceTerminal.requestSearchSmartVist(code).subscribe(response => {
      for (const key in response) {
        if (response.hasOwnProperty(key)) {
          const value = response[key];
          if (key === 'cct') {
            this.modal.dismissAll();
            console.log('La terminal', value, 'si existe en Smart Vista');
          } else if (key === 'status') {
            console.log('response', response);
          }
        }
      }
      this.openModal(modal, 'content');
    });
  }
  
  
  
  
  openModal(modal: any, type: any) {
    this.modal.open(modal, { size: type });
  }
  
  
  
  
  
  
  
  <div>
                <button matTooltip="Crear terminal" type="button" class="btn movement"
                            (click)="viewTerminalSmarVista(modalAprobacion)"
                            *ngIf="profile == '0' || profile == '2'">
                            <mat-icon class="btn-group size-20 text-info" role="group"> task_alt
                            </mat-icon>
                            <span>Crear terminal</span>
                        </button>
                </div>
        </div>

        <ng-template #modalAprobacion let-modal>

            <div class="modal-header">
                <h3 class="modal-title">Aprobar parámetros de {{ complet }}</h3>
                <button type="button" class="close" aria-label="Close" (click)="modal.dismiss()">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <mat-progress-bar mode="buffer"></mat-progress-bar>
    
            <div class="modal-body">
                <div *ngIf="viewTerminalSmarVista">
                    <div class="form-group row col-sm-12 ml-2">
                        {{response}}
                    </div>
                </div>
            </div>
    
            <div class="modal-footer" *ngIf="profile == '0' || profile == '2'">
                <button class="card card-small btn bg-light" (click)="modal.dismiss()">
                    <span class="p-2">Cerrar</span>
                </button>
            </div>
    
        </ng-template>



<!-- Corrección de la plantilla modal -->
<ng-template #modalAprobacion let-modal>

  <div class="modal-header">
    <h3 class="modal-title">Aprobar parámetros de {{ complet }}</h3> <!-- ¿Dónde se define complet? -->
    <button type="button" class="close" aria-label="Close" (click)="modal.dismiss()">
      <span aria-hidden="true">&times;</span>
    </button>
  </div>
  
  <mat-progress-bar mode="buffer"></mat-progress-bar>
  
  <div class="modal-body">
    <div *ngIf="response">
      <div class="form-group row col-sm-12 ml-2">
        {{ response }}
      </div>
    </div>
  </div>
  
  <div class="modal-footer" *ngIf="profile == '0' || profile == '2'">
    <button class="card card-small btn bg-light" (click)="modal.dismiss()">
      <span class="p-2">Cerrar</span>
    </button>
  </div>

</ng-template>

