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
