tengo este codigo 

pageListCodigosTerminal(pagina: number, codigo: string) {
    this.paginaActual = pagina;
    this.showButton = false;
    this.serviceTerminal.requestGetTerminalByCodTerminal(codigo, pagina).subscribe({
      next: (response: any) => {
        console.log('Response terminal list OK page search');
        this.dataSource.data = response as Terminal[];
        this.showButton = this.codigoSearch.length === 8 && response.length === 0;
      }, error(response: any) {
        console.log('Error al obtener la lista de terminales en component:', response)
      }
    });
  }
  
  pero en este fragmento al momento de seleccionar los 8 caracteres y borrarlos de golpe no se desactiva el boton
   this.showButton = this.codigoSearch.length === 8 && response.length === 0;
