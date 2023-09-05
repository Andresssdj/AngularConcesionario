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
