tengo este codigo y este filtro 

HTML:
 <div class="p-1 col-sm-3">
                <mat-form-field>
                    <mat-label>Consultar por código</mat-label>
                    <input matInput (keyup)="tableFilter($event)" placeholder="Código" maxlength="15">
                    <mat-icon matSuffix class="text-gray-1">search</mat-icon>
                </mat-form-field>
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

pageListCodigosTerminal(pagina: number, codigo: string) {
    this.paginaActual = pagina;
    this.showButton = false;
    this.serviceTerminal.requestGetTerminalByCodTerminal(codigo, pagina).subscribe({
      next: (response: any) => {
        console.log('Response terminal list OK page search');
        this.dataSource.data = response as Terminal[];
        this.showButton = this.codigoSearch.length === 8 && response.length === 0;
      }, error(response: any) {
        console.log('Error al obtener la lista de terminales en component:', response)
      }
    });
  }
  
  pero en este fragmento al momento de seleccionar los 8 caracteres y borrarlos de golpe no se desactiva el boton
   this.showButton = this.codigoSearch.length === 8 && response.length === 0;
