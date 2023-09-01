tengo esta funcion que me trae una lista, quiero que dependiendo el id que traiga que le pueda añadir un mensaje adicional que le pondre 

this.changeService.requestGetListBin(0).subscribe({
      next: (response: any) =>{
        console.log('Response escenarios bines list OK ');
        this.dataSource.data = response as EscenarioBinDTO[];
        console.log('data',this.dataSource.data);
      }, error(response: any){
        console.log('Error al obtener la lista de escenarios bines en component:', response);
      }
    });
