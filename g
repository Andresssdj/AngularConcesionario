// === Obtiene la lista de Bines
  listBinEmisorTEF: BinDtoTef[] = [];
  jsonBinPan: any;
  listCheck: BinDtoTef [] = []
  getBinesTef() {
    this.binemisorService.requestGetListBinEmisor().subscribe({
      next: (response: any) => {
        this.listBinEmisorTEF = response;
        this.listBinEmisorTEF.forEach(element => {
          element.checked = false;
          if (this.jsonBinPan != null) {
            for (let i = 0; i < this.jsonBinPan.length; i++) {
              if (element.id == this.jsonBinPan[i]['id']) {
                element.checked = true;
                break;
              } 
            }
          }
        });
      }, error(response: any) {
        console.log('Error al obtener la lista de bines en component:', response)
      }
    });
  }
  
  
  updateeBin(es: string, bi:string[], modal: any) {
  console.log(bi);
  const numero = es.match(/^\d+(?=\.\s)/);
  if (numero) {
    this.selectedEscenario = numero[0];
  }
  // Realiza la comparación y marca los elementos correspondientes
  this.listBinEmisorTEF.forEach(element => {
    if (bi.includes(element.id)) {
      element.checked = true;
    }
  });
  this.getBinesTef();
  this.openModal(modal, 'content');
}


tengo estas funciones pero me las muestra marcadas un segundo en el checkedbox y luego se quita la marcacion 
