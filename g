solo tengo un checked marcado y al imprimir  me indica que hay 16, como lo corrijo?


updateeBin(es: string, bi: string[], modal: any) {
  const numero = es.match(/^\d+(?=\.\s)/);
  if (numero) {
    this.selectedEscenario = numero[0];
  }

  // Inicializa selectedIds como un arreglo vacío una sola vez, antes de recorrer los elementos
  this.selectedIds = [];

  // Restablece el estado de los checkboxes
  this.listBinEmisorTEF.forEach(element => {
    element.checked = false;
  });

  // Realiza la comparación y marca los elementos correspondientes
  this.listBinEmisorTEF.forEach(element => {
    if (bi.includes(element.id)) {
      element.checked = true;
      // Agrega el ID al arreglo selectedIds
      this.selectedIds.push(element.id);
      console.log(element.checked);
    }
  });

  this.openModal(modal, 'content');
}




updateeBin(es: string, bi: string[], modal: any) {
  const numero = es.match(/^\d+(?=\.\s)/);
  if (numero) {
    this.selectedEscenario = numero[0];
  }

  // Inicializa selectedIds como un arreglo vacío
  this.selectedIds = [];

  // Restablece el estado de los checkboxes
  this.listBinEmisorTEF.forEach(element => {
    element.checked = false;
  });

  // Verifica si el ID que estás buscando se encuentra en el array bi
  const idBuscado = bi[0]; // Suponiendo que solo necesitas el primer ID

  // Realiza la comparación y marca el elemento correspondiente
  const elementoEncontrado = this.listBinEmisorTEF.find(element => element.id === idBuscado);
  if (elementoEncontrado) {
    elementoEncontrado.checked = true;
    this.selectedIds.push(elementoEncontrado.id);
  }

  this.openModal(modal, 'content');
}
