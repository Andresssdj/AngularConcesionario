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
