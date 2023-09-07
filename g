for (let i = 0; i < response.length; i++) {
          this.formattedData = response[i].bi.toString().replace(/\\/g, '');
          this.Array = JSON.parse(this.formattedData);

        
          response[i].bi = this.Array;
          }
           this.arrayRe = response;
           console.log("res",response);
    }
	
	
	quiero que a response[i].es se me agrege comillas ""
