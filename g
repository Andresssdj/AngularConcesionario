tengo este codigo y este filtro 

HTML:
<div class="p-1 col-sm-3">
                <mat-form-field>
                    <mat-label>Consultar por código</mat-label>
                    <input matInput (keyup)="tableFilter($event)" placeholder="Código" maxlength="15">
                    <mat-icon matSuffix class="text-gray-1">search</mat-icon>
                </mat-form-field>
            </div>
            <div>
                <button matTooltip="Consutar terminal" type="button" class="btn movement"
                            (click)="viewTerminalSmarVista(codigoSearch ,modalAprobacion)"
                            *ngIf="showButton">
                            <mat-icon class="btn-group size-20 text-info" role="group"> task_alt
                            </mat-icon>
                            <span>Consutar terminal</span>
                        </button>
                </div>

TS:
selectProgramas: boolean = false;
  lenghtCodTerm: number;
  codigoSearch: string;

  tableFilter(event: Event) {

    this.right = 1;
    this.left = -1;
    const filterValue = (event.target as HTMLInputElement).value;
    this.codigoSearch = filterValue.toUpperCase();
    this.lenghtCodTerm = filterValue.length;

    if (filterValue.length > 3) {
      this.pageListCodigosTerminal(0, this.codigoSearch);
    } else if (filterValue.length == 0) {
      this.ngOnInit();
    }

    this.dataSource.filter = filterValue.trim().toLowerCase();
  }

  // === Paginacion de terminales
  right: number = 1;
  left: number = -1;
  showButton: boolean = false;
  showCreate: boolean = false;

  pageList(pagina: number, opcion: string) {
    console.log('pagina: ' + pagina);
    this.paginaActual = pagina;

    if (this.lenghtCodTerm > 0) {
      this.pageListCodigosTerminal(pagina, this.codigoSearch);
    } else {
      if (pagina >= 0) {
        this.serviceTerminal.requestGetListTerminals(pagina).subscribe({
          next: (response: any) => {
            console.log('Response terminal list OK page all');
            this.dataSource.data = response as Terminal[];
          }, error(response: any) {
            console.log('Error al obtener la lista de terminales en component:', response)
          }
        });
      }
    }

    if (pagina >= 0) {
      if (opcion == '+') {
        console.log('+');
        this.right++;
        this.left++;
      } else {
        console.log('-');
        this.right--;
        this.left--;
      }
    }
  }

  pageListCodigosTerminal(pagina: number, codigo: string) {
    this.paginaActual = pagina;
    this.showButton = false;
    this.serviceTerminal.requestGetTerminalByCodTerminal(codigo, pagina).subscribe({
      next: (response: any) => {
        console.log('Response terminal list OK page search');
        this.dataSource.data = response as Terminal[];
        //this.showButton = this.codigoSearch.length === 8 && response.length === 0;
      }, error(response: any) {
        console.log('Error al obtener la lista de terminales en component:', response)
      }
    });
  }
  
  pero en este fragmento al momento de seleccionar los 8 caracteres y borrarlos de golpe no se desactiva el boton
   this.showButton = this.codigoSearch.length === 8 && response.length === 0;
