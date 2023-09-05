tengo esta funcion 

this.changeService.requestGetListBin(0).subscribe({
      next: (response: any) => {
          console.log('Response escenarios bines list OK ');
          this.dataSource.data = response as EscenarioBinDTO[];

          for(let i = 0; i < response.length; i++){
            this.formattedData = response[i].bi.toString().replace(/\\/g, '');
            this.Array = JSON.parse(this.formattedData);

            response[i].bi =  this.Array; 
            this.dataSource.data = response as EscenarioBinDTO[];

          }
          // Crear un mapa de IDs a mensajes adicionales
          const idToMensajeAdicional = {
              1: "1. Enviar pan a caja con bines pan definidos",
              2: "2. Enviar pan, con bines pan definidos en claro",
              3: "3. Enviar pan, sin bines pan",
              4: "4. Enviar pan completo con bines pan",
              5: "5. No realiza envio de pan",
              6: "6. Exito, Enviar pan completo con bines pan",
              7: "7. Exito, Enviar pan, con bines pan definidos en claro"
          };
          // Asignar mensajes adicionales según el ID
          this.dataSource.data.forEach(item => {
              if (idToMensajeAdicional.hasOwnProperty(item.es)) {
                  item.es = idToMensajeAdicional[item.es];
              }
          });
          console.log(response);
      },
      error(response: any) {
          console.log('Error al obtener la lista de escenarios bines en component:', response);
      }
  });



y quiero pasarle a updateeBin en su parametro bi, los que hay en la primera que te envie pero me sale un error ya que no me deja realizar esta comparacion 

if (bi.id === element.id)) {



updateeBin(es: string, bi: string[], modal: any) {


  this.listBinEmisorTEF.forEach(element => {
    if (bi.id === element.id)) {
      
      element.checked = true;
      
    }
  });

  this.openModal(modal, 'content');
}
