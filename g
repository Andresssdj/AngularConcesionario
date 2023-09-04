tengo estas funciones y al momento de usar updateeBin me abre mi chexbox y me las muestra marcadas
los id que ya tiene el objeto un segundo pero luego se quita la marcacion 


getBinesTef() {
  this.binemisorService.requestGetListBinEmisor().subscribe({
    next: (response: any) => {
      this.listBinEmisorTEF = response;
      this.listBinEmisorTEF.forEach(element => {
        element.checked = false;
      });
    },
    error(response: any) {
      console.log('Error al obtener la lista de bines en component:', response)
    }
  });
}


updateeBin(es: string, bi: string[], modal: any) {
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
  
  
  updateEscenarioBin( selectedEscenario: string ,selectedIds: string[]){
  const es = selectedEscenario;
  const bines = selectedIds.join(',').replace(/,\s+/g, ',');
  console.log("es",es,"bines",bines)
  this.changeService.requestUpdateEscenarioBin(es, bines).subscribe(response =>{
    console.log(response);
    this.toastShow('Solicitud exitosa, bines actualizados', NgbToastType.Success);
    this.ngOnInit();
    //this.selectedIds=[];
  }, error => {
    this.toastShow('No se logro actualizar bines', NgbToastType.Danger);
  });
}


  selectedIds: string [] = [];
  toggleChackbox(id: string){
    var index = this.selectedIds.indexOf(id);
    if (index === -1){
      this.selectedIds.push(id);
    } else {
      this.selectedIds.splice(index, 1);
    }
    console.log("ids",this.selectedIds)
  }
  

}

