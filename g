Tengo estos metodos que me filtran una tabla y los metodos funcionan 
pero el filtro funciona cuando escribo el nombre completo de lo que 
estoy filtrando pero si no lo escribo completo no me trae nada

 codigoSearch: string;
  
  tableFilter(event: Event) {

    const filterValue = (event.target as HTMLInputElement).value;
    this.codigoSearch = filterValue;

   
    if (filterValue.length > 1) {
      this.requestGetByValue(this.codigoSearch);
    } else if (filterValue.length == 0) {
      this.ngOnInit();
    }
  }
  
  requestGetByValue(containerVersion: string) {
    this.changeService.requestFilterFilesAndVersions(0,containerVersion).subscribe(response => {
      console.log('Response list files OK');
      console.log('response',response);
      this.dataSource.data = response as FilesAndVersionsDTO[];
      
     for(let i = 0; i < response.length; i++){
        this.formattedData = response[i].terminalModel.toString().replace('[', '').replace(']',"");
        console.log(this.formattedData);
        this.dataArray = this.formattedData.split(',').map(Number);

        var nombres= '';

        for (const dato of this.dataArray){
          for(const item of this.listModels){

            if (item.id === dato){ 
              nombres += item.model + " ";
            }
          }
        }
        response[i].terminalModel = nombres; 
        this.dataSource.data = response as FilesAndVersionsDTO[];
    }
    
    }, error => {
      console.log('Response list files Not Found');
    })
  }





codigoSearch: string;
dataSource: MatTableDataSource<FilesAndVersionsDTO>;  // Asegúrate de importar MatTableDataSource si no lo has hecho.

constructor() {
  this.dataSource = new MatTableDataSource<FilesAndVersionsDTO>();
}

tableFilter(event: Event) {
  const filterValue = (event.target as HTMLInputElement).value;
  this.codigoSearch = filterValue.trim().toLowerCase();
  this.applyFilter();
}

applyFilter() {
  if (!this.codigoSearch) {
    this.dataSource.filter = '';
    return;
  }

  this.dataSource.filterPredicate = (data: FilesAndVersionsDTO, filter: string) => {
    const formattedData = data.terminalModel.toString().replace('[', '').replace(']', "");
    const dataArray = formattedData.split(',').map(Number);

    const matchingModels = this.listModels
      .filter(item => dataArray.includes(item.id))
      .map(item => item.model.toLowerCase());

    return matchingModels.join(' ').includes(filter);
  };

  this.dataSource.filter = this.codigoSearch;
}

