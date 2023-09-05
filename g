tengo esta funcion  y bi tiene esto 	[{"rf":"5294049999","ri":"5294040000","id":"340"}]	

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



quiero que en esta parte 

  // Realiza la comparación y marca los elementos correspondientes
  this.listBinEmisorTEF.forEach(element => {
    if (bi.includes(element.id)) {
      element.checked = true;
      // Agrega el ID al arreglo selectedIds
      this.selectedIds.push(element.id);
      console.log(element.checked);
    }
  });
  
  
  la corrijas para comparar si el id que tiene bi es === a el id de element.id) y si son iguales me active 
  
  element.checked = true;
