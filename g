tengo esta funcion y quiero agregar una balidacion que si 
que  si this.dtoTerminal.variables.estf es 6 o 7  que a  this.dtoTerminal.variables.bp 


quede algo asi  this.arrayRe.forEach(element =>{
            this.dtoTerminal.variables.bp = element.bi
          });



let arrayBines: any = [];
        if (this.dtoTerminal.variables.chabc == '1' && this.dtoTerminal.variables.estf != '0' && this.dtoTerminal.variables.estf != '3') {
          console.log('Habilitado a caja, definiendo bines');
          this.listBinEmisorTEF.forEach(bin => {
            if (bin.checked) {
              let jsonBines: any =
              {
                "id": bin.id,
                "ri": `${bin.ri}`,
                "rf": `${bin.rf}`
              }
              arrayBines.push(jsonBines);
            }
          });

          if (arrayBines[0]) {
            this.dtoTerminal.variables.bp = arrayBines;
          } else {
            this.dtoTerminal.variables.estf = '0';
            this.dtoTerminal.variables.chabc = '0';
            this.dtoTerminal.variables.bp = '0';
          }
        } else {
          this.dtoTerminal.variables.bp = '0';
          console.log('Sin habilitado a caja, no define bines -> bp debe ser 0');
        }
        this.listBinEmisorTEF = [(new BinDtoTef())]
		
		
