pageList(pagina: number, opcion: string) {
    console.log('pagina: ' + pagina);
    this.paginaActual = pagina;

    if (this.lenghtCodTerm > 0) {
      this.pageListCodigosTerminal(pagina, this.codigoSearch);
      this.showButton = false;
    } else {
      if (pagina >= 0) {
        this.serviceTerminal.requestGetListTerminals(pagina).subscribe({
          next: (response: any) => {
            console.log('Response terminal list OK page all');
            this.dataSource.data = response as Terminal[];
            this.showButton = this.codigoSearch.length === 8 && response.lenght === 0;
          }, error(response: any) {
            console.log('Error al obtener la lista de terminales en component:', response)
          }
        });
      }
    }



<button matTooltip="Consutar terminal" type="button" class="btn movement"
                            (click)="viewTerminalSmarVista(codigoSearch ,modalAprobacion)"
                            *ngIf="showButton">
                            <mat-icon class="btn-group size-20 text-info" role="group"> task_alt
                            </mat-icon>
                            <span>Consutar terminal</span>
                        </button>
