
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
    }
  });

  this.openModal(modal, 'content');
}




updateeBin(es: string, bi: string[], modal: any) {
  const numero = es.match(/^\d+(?=\.\s)/);
  if (numero) {
    this.selectedEscenario = numero[0];
  }
  this.listBinEmisorTEF.forEach(element =>{
    element.checked= false;

    
  // Inicializa selectedIds como un arreglo vacío
  this.selectedIds = [];
 
  });
  // Realiza la comparación y marca los elementos correspondientes
  this.listBinEmisorTEF.forEach(element => {
    if (bi.includes(element.id)) {
      element.checked = true;
      // Agrega el ID al arreglo selectedIds
      this.selectedIds.push(element.id);
    } else {
      element.checked = false;
    }
  });

  this.openModal(modal, 'content');
}
