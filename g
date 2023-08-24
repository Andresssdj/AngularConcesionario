viewTerminalSmarVista(code: string, modal: any) {
    this.loading= true;
    code = this.codigoSearch;
    this.showCreate = false;
    this.serviceTerminal.requestSearchSmartVist(code).subscribe(response => {
      console.log(response);
      for (const key in response) {
        if (response.hasOwnProperty(key)) {
          const value = response[key];
          if (key === 'cct') {
            this.complet = 'La terminal *' + value + '* si existe en Smart Vista';
            this.showCreate = value;
            this.openModal(modal, 'content');
          } else if (key === 'status') {
            console.log('response', response);
            this.complet = 'La terminal *' + value + '* en Smart Vista';
            this.openModal(modal, 'content');
          }
        }
      }
    });
  }
