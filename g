escenarioOption = [
    {value: 1, label: "1. Enviar pan a caja con bines pan definidos"},
    {value: 2, label: "2. Enviar pan, con bines pan definidos en claro"},
    {value: 3, label: "3. Enviar pan, sin bines pan"},
    {value: 4, label: "4. Enviar pan completo con bines pan"},
    {value: 5, label: "5. No realiza envio de pan"},
    {value: 6, label: "6. Exito, Enviar pan completo con bines pan"},
    {value: 7, label: "7. Exito, Enviar pan, con bines pan definidos en claro"}
  ];


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
          // Asignar mensajes adicionales según el ID
          this.dataSource.data.forEach(item => {
            this.escenarioOption.forEach(esce =>{
              if (esce.value.hasOwnProperty(item.es)) {
                item.es = esce.label[item.es];
            }
            });
          });
          this.escenariosExistentes = response.map((item: any ) => item.es);
      }


quiero asignarle los mensajes de label  
