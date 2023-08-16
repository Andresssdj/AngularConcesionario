Tengo esta paginacion y quiero que un boton que tengo solo aparezca cuando esa paginacion no tenga resultados y lo que este en codigoSearch enga 8 caracteres

pageList(pagina: number, opcion: string) {
    console.log('pagina: ' + pagina);
    this.paginaActual = pagina;

    if (this.lenghtCodTerm > 0) {
      this.pageListCodigosTerminal(pagina, this.codigoSearch);
    } else {
      if (pagina >= 0) {
        this.serviceTerminal.requestGetListTerminals(pagina).subscribe({
          next: (response: any) => {
            console.log('Response terminal list OK page all');
            this.dataSource.data = response as Terminal[];
          }, error(response: any) {
            console.log('Error al obtener la lista de terminales en component:', response)
          }
        });
      }
    }

    if (pagina >= 0) {
      if (opcion == '+') {
        console.log('+');
        this.right++;
        this.left++;
      } else {
        console.log('-');
        this.right--;
        this.left--;
      }
    }
  }

  pageListCodigosTerminal(pagina: number, codigo: string) {
    this.paginaActual = pagina;
    this.serviceTerminal.requestGetTerminalByCodTerminal(codigo, pagina).subscribe({
      next: (response: any) => {
        console.log('Response terminal list OK page search');
        this.dataSource.data = response as Terminal[];
      }, error(response: any) {
        console.log('Error al obtener la lista de terminales en component:', response)
      }
    });
  }

