for (let i = 0; i < response.length; i++) {
          this.formattedData = response[i].bi.toString().replace(/\\/g, '');
          this.Array = JSON.parse(this.formattedData);

          this.Array.forEach(element =>{
            element.id = element.id.replace(/"/g, '');
           

            
          });

tengo este for y quiero asignarle             element.id = element.id.replace(/"/g, '');
 a array en id 
