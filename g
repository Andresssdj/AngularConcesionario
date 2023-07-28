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
