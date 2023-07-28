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



lenghtCodTerm: number;
  codigoSearch: string;

 

  tableFilter(event: Event) {

    const filterValue = (event.target as HTMLInputElement).value;
    this.codigoSearch = filterValue.toUpperCase();
    this.lenghtCodTerm = filterValue.length;

    if (filterValue.length > 1) {
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

              console.log(response);
            }
          }
        }
      this.dataSource.data = response as UpdateDownloadDTO[];    
      }, error => {
        console.log('Sin información');
      })
  }
