variables : string[] = ['NOMBREARCHIVO','STIMEOUTCU','STIMEOUTME','STIMEOUTSC','FKCSIGN','MXSIGNTOUT','SIGNATUREW','BEEPLEVEL','SIGNRETRIES','BLOCKMAGNETIC','SETADFIELDS','SENDTRACKS','BLOCKCREDITCARD','CIERREAUTO','SETPRINTER','ACTNUMRECEIPT','DELAYSLAN','SETOFFCAMPS','SETONACK','EXCLUSIVOFALA','IMPUESTOSAUTO','ESTADOCIERRE'];


for (let param in this.variables){
        if (this.variables[param] === clave) {
         
        this.valTefVARIABLES += clave + '=' + (clave === 'NOMBREARCHIVO' ? valor.toUpperCase(): valor) + '|';
        }
      }
