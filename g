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


for (let i = 0; i < response.length; i++) {
    this.formattedData = response[i].bi.toString().replace(/\\/g, '');
    this.Array = JSON.parse(this.formattedData);

    // Verifica si "id" es una cadena y elimina las comillas si es así
    if (typeof this.Array.id === 'string') {
        this.Array.id = this.Array.id.replace(/"/g, '');
    }

    response[i].bi = this.Array;
}
