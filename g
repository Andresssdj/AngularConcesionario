let arrayBines: any = [];

        if ( this.dtoTerminal.variables.chabc == '1' &&  this.dtoTerminal.variables.estf === '6' || this.dtoTerminal.variables.estf === '7') {
          this.arrayRe.forEach(element =>{
            arrayBines.push(element.bi);
            console.log("ar",arrayBines);
            console.log("re",this.arrayRe);
          });
          }
		  
		  
tengo esto y this.arrayRe quiero esto bi: (5) [{…}, {…}, {…}, {…}, {…}]
es: "6"


quiero que a arrayBines.push(element.bi); se le haga pues dependiendo si de  this.dtoTerminal.variables.estf === '6' || this.dtoTerminal.variables.estf === '7' es 6 o 7
se le asigne del arreglo this.arrayRe si los bi 
