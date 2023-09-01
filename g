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





this.changeService.requestGetListBin(0).subscribe({
    next: (response: any) => {
        console.log('Response escenarios bines list OK ');
        this.dataSource.data = response as EscenarioBinDTO[];
        
        // Crear un mapa de IDs a mensajes adicionales
        const idToMensajeAdicional = {
            1: "Mensaje para ID 1",
            2: "Mensaje para ID 2",
            3: "Mensaje para ID 3",
            4: "Mensaje para ID 4",
            5: "Mensaje para ID 5",
            6: "Mensaje para ID 6"
        };

        // Asignar mensajes adicionales según el ID
        this.dataSource.data.forEach(item => {
            if (idToMensajeAdicional.hasOwnProperty(item.id)) {
                item.mensajeAdicional = idToMensajeAdicional[item.id];
            }
        });

        console.log('data', this.dataSource.data);
    },
    error(response: any) {
        console.log('Error al obtener la lista de escenarios bines en component:', response);
    }
});
