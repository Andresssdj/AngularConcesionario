<button matTooltip="Consutar terminal" type="button" class="btn movement"
                            (click)="viewTerminalSmarVista(codigoSearch ,modalAprobacion)"
                            *ngIf="showButton" [class.spinner]="loading">
                            <mat-icon class="btn-group size-20 text-info" role="group"> task_alt
                            </mat-icon>
                            <span>Consutar terminal</span>
                        </button>

viewTerminalSmarVista(code: string, modal: any) {
    this.loading= true;
    code = this.codigoSearch;
    this.showCreate = false;
    this.serviceTerminal.requestSearchSmartVist(code).subscribe(response => {
      console.log(response);
      this.loading= false;
      for (const key in response) {
        if (response.hasOwnProperty(key)) {
          const value = response[key];
          if (key === 'cct') {
            this.complet = 'La terminal *' + value + '* si existe en Smart Vista';
            this.showCreate = value;
            this.openModal(modal, 'content');
          } else if (key === 'status') {
            console.log('response', response);
            this.complet = 'La terminal *' + value + '* en Smart Vista';
            this.openModal(modal, 'content');
          }
        }
      }
    });
  }
