this.changeService.requestGetListBin(0).subscribe({
  next: (response: any) => {
    console.log('Response escenarios bines list OK ');

    // Parsea la cadena bi y mapea los objetos JSON
    const biJSON = JSON.parse(response.bi);
    const formattedBi = biJSON.map((item: any) => ({
      rf: item.rf,
      ri: item.ri,
      id: item.id
    }));

    // Asigna los valores al objeto EscenarioBinDTO
    const escenarioBinDTO: EscenarioBinDTO = {
      bi: formattedBi,
      es: response.es
    };

    // Asigna el objeto EscenarioBinDTO a la fuente de datos
    this.dataSource.data = [escenarioBinDTO];
  },
  error(response: any) {
    console.log('Error al obtener la lista de escenarios bines en component:', response);
  }
});




rsponse me response este formamato

bi: "[{\"rf\":\"5294049999\",\"ri\":\"5294040000\",\"id\":\"340\"}]"
es: "7"

y quiero que bi se combierta en json con los campos 

rf, ri, id 

this.changeService.requestGetListBin(0).subscribe({
      next: (response: any) => {

          console.log('Response escenarios bines list OK ');
          this.dataSource.data = response as EscenarioBinDTO[];
      },
      error(response: any) {
          console.log('Error al obtener la lista de escenarios bines en component:', response);
      }
  });
