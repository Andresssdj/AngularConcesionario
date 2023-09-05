updateeBin(es: string, bi: BinDtoTef, modal: any) {


console.log("Bi 1",bi);

  console.log("Bi 1",bi.id);

  const numero = es.match(/^\d+(?=\.\s)/);
  if (numero) {
    this.selectedEscenario = numero[0];
  }

  // Restablece el estado de los checkboxes
  this.listBinEmisorTEF.forEach(element => {
    element.checked = false;
  });



  this.openModal(modal, 'content');
 
}


cuando imprimo console.log("Bi 1",bi);

id: "353"
rf: "5361709999"
ri: "5361700000"

y cuando trato de imprimir   console.log("Bi 1",bi.id); me indica indefinido 


pero esto bi: BinDtoTef 

export class BinDtoTef {
    id: string;
    rf: string;
    ri: string;
    lb: string;
    checked: boolean;
}
