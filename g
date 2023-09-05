updateeBin(es: string, response: EscenarioBinDTO[], modal: any) {
  response.forEach(responseItem => {
    this.listBinEmisorTEF.forEach(element => {
      if (responseItem.bi.id === element.id) {
        element.checked = true;
      }
    });
  });

  this.openModal(modal, 'content');
}
