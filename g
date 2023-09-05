TypeError: Cannot read properties of undefined (reading 'replace')

la respuesta de esta fucion 

this.changeService.requestGetListBin(0).subscribe({
      next: (response: any) => {

          console.log('Response escenarios bines list OK ');
          
          this.dataSource.data = response as EscenarioBinDTO[];
          
      },
      error(response: any) {
          console.log('Error al obtener la lista de escenarios bines en component:', response);
      }
	
	
	
	me devuelve esto 
	
	bi: "[{\"rf\":\"5294049999\",\"ri\":\"5294040000\",\"id\":\"340\"}]"
	es: "7. Exito, Enviar pan, con bines pan definidos en claro"
	
	quiero que bi quede asi
	
	[
	{
	"rf":"5294049999",
	"ri":"5294040000",
	"id":"340"
	}
	]



this.changeService.requestGetListBin(0).subscribe({
    next: (response: any) => {
        console.log('Response escenarios bines list OK ');

        // Elimina las barras invertidas de la cadena en response.bi
        response.bi = response.bi.replace(/\\/g, '');

        try {
            // Intenta analizar la cadena de texto resultante como JSON
            const biArray = JSON.parse(response.bi);

            // Verifica que biArray sea un array de objetos
            if (Array.isArray(biArray)) {
                this.dataSource.data = biArray as EscenarioBinDTO[];
            } else {
                console.log('Error: biArray no es un array de objetos');
            }
        } catch (error) {
            console.log('Error al analizar la cadena de texto de "bi":', error);
        }
    },
    error(response: any) {
        console.log('Error al obtener la lista de escenarios bines en component:', response);
    }
});
