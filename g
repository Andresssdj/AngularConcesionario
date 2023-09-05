tengo dentro de response

hay un arrego bi 

que tiene id: "338"

quiero quitarte las comillas al id 

for(let i = 0; i < response.length; i++){
            this.formattedData = response[i].bi.toString().replace(/\\/g, '');
            this.Array = JSON.parse(this.formattedData);

            response[i].bi =  this.Array; 
            this.dataSource.data = response as EscenarioBinDTO[];

          }
