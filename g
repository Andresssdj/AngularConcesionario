que error tengo

viewTerminalSmarVista(code: string){
    code = this.codigoSearch;
    this.serviceTerminal.requestSearchSmartVist(code).subscribe(response => {
      for(let i in response){
       if (response[i].cct === 'cct'){
        console.log('cct',response[i].cct);
        var cct: any = [{"codigo":""}];
       response = cct.codigo;
       }else if (response[i].status === 'status'){
        console.log('response', response);
       }
      }
    }, error => {
      console.log('Sin información');
    })
  }


esta es la respuesta que tengo


viewTerminalSmarVista(code: string) {
  code = this.codigoSearch;
  this.serviceTerminal.requestSearchSmartVist(code).subscribe(response => {
    for (const key in response) {
      if (response.hasOwnProperty(key)) {
        const value = response[key];
        
        if (key === 'cct') {
          console.log('cct', value);
          const cct = [{"codigo": ""}];
          // ¿Quisieras asignar algo a cct.codigo aquí?
        } else if (key === 'status') {
          console.log('response', response);
        }
      }
    }
  }, error => {
    console.log('Sin información');
  });
}
