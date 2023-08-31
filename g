tengo esta tabla 


<div class="mat-elevation-z4 col-lg-12" style="border-radius: 10px;">
        <table mat-table [dataSource]="dataSource">

            <ng-container matColumnDef="Escenarios">
                <th mat-header-cell *matHeaderCellDef><strong>Escenario</strong></th>
                <td mat-cell *matCellDef="let f"> <span>{{f.es}}</span>
                </td>
            </ng-container>

            <!--

            <ng-container matColumnDef="Bines">
                <th mat-header-cell *matHeaderCellDef> <strong> Bines </strong></th>
                <td mat-cell *matCellDef="let f"> {{f.bi}} </td>
            </ng-container>
        -->
            <tr mat-header-row *matHeaderRowDef="displayedColumns"></tr>
            <tr mat-row *matRowDef="let row; columns: displayedColumns;"></tr>

        </table>
    </div>



y este es mi ts

ngOnInit(): void {
    // === Obtiene la lista de terminales
    this.paginaActual = 0;
    this.changeService.requestGetListBin(0).subscribe({
      next: (response: any) =>{
        console.log('Response escenarios bines list OK ');
        this.dataSource.data = response as EscenarioBinDTO[];
        console.log('data',this.dataSource.data);
      }, error(response: any){
        console.log('Error al obtener la lista de escenarios bines en component:', response);
      }
    });


al momento de usar esto 

console.log('data',this.dataSource.data);

veo que si me trae datos 
pero no me muestra en la tabla 
