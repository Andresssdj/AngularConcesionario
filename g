	quiero una validacion que me valide si ya existen 

	this.changeService.requestGetListBin(0).subscribe({
		  next: (response: any) => {
			  console.log('Response escenarios bines list OK ');
			  this.dataSource.data = response as EscenarioBinDTO[];

			  for(let i = 0; i < response.length; i++){
				this.formattedData = response[i].bi.toString().replace(/\\/g, '');
				this.Array = JSON.parse(this.formattedData);

				response[i].bi =  this.Array; 
				this.dataSource.data = response as EscenarioBinDTO[];

			  }
			  // Crear un mapa de IDs a mensajes adicionales
			  const idToMensajeAdicional = {
				  1: "1. Enviar pan a caja con bines pan definidos",
				  2: "2. Enviar pan, con bines pan definidos en claro",
				  3: "3. Enviar pan, sin bines pan",
				  4: "4. Enviar pan completo con bines pan",
				  5: "5. No realiza envio de pan",
				  6: "6. Exito, Enviar pan completo con bines pan",
				  7: "7. Exito, Enviar pan, con bines pan definidos en claro"
			  };
			  // Asignar mensajes adicionales según el ID
			  this.dataSource.data.forEach(item => {
				  if (idToMensajeAdicional.hasOwnProperty(item.es)) {
					  item.es = idToMensajeAdicional[item.es];
				  }
			  });
		  },
		  error(response: any) {
			  console.log('Error al obtener la lista de escenarios bines en component:', response);
		  }
	  });
	  
	  
	  y si existe me desabilite los escenarios de aqui 
	  
	  <mat-form-field class="col-sm-3">
					<mat-label>Escenario</mat-label>
					<mat-select matNativeControl
						[(ngModel)]="escenario" name="escenario"
						minlength="1">
						<mat-option matTooltip="El formato con el cual deberá enviar la información del PAN es PAN completo"
						 value="1">1. Enviar pan a caja con bines pan definidos</mat-option>
						<mat-option matTooltip="El formato con el cual deberá enviar la información del PAN es 6 primeros dígitos del PAN en claro, últimos 4 dígitos del PAN en claro y asteriscos para los restantes dígitos del PAN"
						 value="2">2. Enviar pan, con bines pan definidos en claro</mat-option>
						<mat-option matTooltip="No verifica casilla de bines pan, aplica para todos los bines"
						 value="3">3. Enviar pan, sin bines pan</mat-option>
						<mat-option  matTooltip="Igual que escenario 2 y adicional traba con descuentos"
						 value="4">4. Enviar pan completo con bines pan</mat-option>
						<mat-option matTooltip="No realiza envio de pan multicomercio"
						 value="5">5. No realiza envio de pan</mat-option>
						<mat-option matTooltip="Igual que escenario 2 y adicional traba con descuentos"
						 value="6">6. Exito, Enviar pan completo con bines pan</mat-option>
						<mat-option matTooltip="El formato con el cual deberá enviar la información del PAN es 6 primeros dígitos del PAN en claro, últimos 4 dígitos del PAN en claro y asteriscos para los restantes dígitos del PAN"
						 value="7">7. Exito, Enviar pan, con bines pan definidos en claro</mat-option>
					</mat-select>
				</mat-form-field>
