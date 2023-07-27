  // ==== Filtrado de tabla de terminales
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
    this.serviceTerminal.requestGetTerminalByCodTerminal(codigo, pagina).subscribe({
      next: (response: any) => {
        console.log('Response terminal list OK page search');
        this.dataSource.data = response as Terminal[];
      }, error(response: any) {
        console.log('Error al obtener la lista de terminales en component:', response)
      }
    });
  }


SELECT *
FROM Update_Download u WHERE u.value LIKE '%tef_legacy%' and SUBSTR(u.value, INSTR(u.value, 'NOMBREARCHIVO=') + LENGTH('NOMBREARCHIVO='),
INSTR(u.value, '|', INSTR(u.value, 'NOMBREARCHIVO=')) - INSTR(u.value, 'NOMBREARCHIVO=') - LENGTH('NOMBREARCHIVO=')) 
AND u.criterio LIKE '%> 1%' ORDER BY u.id DESC;


<div class="p-1 col-sm-3">
                <mat-form-field>
                    <mat-label>Consultar por código</mat-label>
                    <input matInput (keyup)="tableFilter($event)" placeholder="Código" maxlength="15">
                    <mat-icon matSuffix class="text-gray-1">search</mat-icon>
                </mat-form-field>
            </div>


<input type="text" [(ngModel)]="searchTerm" (ngModelChange)="onSearch()" placeholder="Buscar...">
<ul>
  <li *ngFor="let item of filteredItems">{{ item.nombre }}</li>
</ul>


SELECT * FROM UPDATE_DOWNLOAD D WHERE D.VALUE.tef_legacy like '%  %' OR D.VALUE.tef_android like '%  %';
