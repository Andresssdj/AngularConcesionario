ARCHIVO TS ANGULAR 

codigoSearch: string;

 

  tableFilter(event: Event) {

    const filterValue = (event.target as HTMLInputElement).value;
    this.codigoSearch = filterValue;
   

    if (filterValue.length > 3) {
      this.requestGetByValue(this.codigoSearch);
    } else if (filterValue.length == 0) {
      this.ngOnInit();
    }

    this.dataSource.filter = filterValue;
  }
  

  requestGetByValue(value: string) {
    console.log(value);
   this.changeService.requestGetFilesByValue(0, value).subscribe(
      response => {
        for (let parameters in response){
          for (let parameter in response[parameters].value){
            if (parameter === 'tef_android') {
              var valTef: any = {"tef" : ""};
              valTef.tef = response[parameters].value[parameter];
              response[parameters].value = valTef;
            }else if (parameter === 'tef_legacy'){
              var valTef1: TefDTO;
              valTef1 = this.formatParameterToJson(response[parameters].value[parameter]);
              response[parameters].value = valTef1;
            }
          }
        }
      this.dataSource.data = response as UpdateDownloadDTO[];    
      console.log(this.dataSource.data);
      }, error => {
        console.log('Sin información');
      })
  }


<mat-form-field class="col-sm-3">
                            <mat-label>Nombre configuración</mat-label>
                            <input type="text" matInput [(ngModel)]="tefDTO.NOMBREARCHIVO" name="NOMBREARCHIVO" matTooltip="Nombre y versión comercio que se va a configurar"
                                    minlength="1" maxlength="20" pattern="[0-9 A-Z a-z - _ .]*" #addNOMBREARCHIVO="ngModel" required>
                            <mat-hint align="end" class="text-danger" *ngIf="addNOMBREARCHIVO.hasError('pattern')">
                                    inválido
                            </mat-hint>
                        </mat-form-field> 
