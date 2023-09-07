for(let i = 0; i < response.length; i++){
          this.formattedData = response[i].bi.toString().replace(/\\/g, '');
          this.Array = JSON.parse(this.formattedData);

          response[i].bi =  this.Array; 
        }

este for me devuelve 
id: "436"
rf: "5704239999"
ri: "5704230000"

qiero quitarle las comillas al id
