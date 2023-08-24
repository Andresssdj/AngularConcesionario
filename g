<div>
                <button matTooltip="Consutar terminal" type="button" class="btn movement"
                            (click)="viewTerminalSmarVista(codigoSearch ,modalAprobacion)"
                            *ngIf="showButton">
                            <mat-icon class="btn-group size-20 text-info" role="group"> task_alt
                            </mat-icon>
                            <span>Consutar terminal</span>
                        </button>
                </div>


<button [disabled]="t.enable == '100'" matTooltip="Editar" type="button"
                            class="btn movement text-white" *ngIf="profile == '0' || profile == '2'"
                            (click)="editTerminal(modalTerminal,t.id,t)">
                            <mat-icon [class.spinner]="t.enable == '100'" [class.text-white]="t.enable == '100'"
                                class="btn-group size-20 text-cbc" role="group"> mode
                            </mat-icon>
                        </button>



<div>
  <button matTooltip="Consultar terminal" type="button" class="btn movement"
          (click)="viewTerminalSmarVista(codigoSearch, modalAprobacion)"
          *ngIf="showButton">
    <mat-icon class="btn-group size-20 text-info" role="group" [class.spinner]="loading">
      <ng-container *ngIf="!loading; else loadingIcon">task_alt</ng-container>
      <ng-template #loadingIcon>
        <!-- Agrega aquí la animación de carga para el icono -->
        <div class="spinner"></div>
      </ng-template>
    </mat-icon>
    <span>Consultar terminal</span>
  </button>
</div>

