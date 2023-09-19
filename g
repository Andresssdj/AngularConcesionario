tengo este for 

for (String terminal : terminals) {
                logger.info("Consultando variables de una terminal encontrada");
                Variable variable = variableService.getVariableTerminalById(Long.parseLong(terminal));
                logger.info("Mapear cambios puntuales en el json de la terminal");
                variable.setValue(Util.changesPunctualJson(variable.getValue(), updateDownload.get().getValue()));
                variableService.updateParametersTerminal(variable);
                logger.info("Termino de actualizar parámetros, pasamos a validar init");
                Optional<Terminal> terminalBD = terminalService.searchTerminalById(Long.parseLong(terminal));
                if ((terminalBD.isPresent()) && (terminalBD.get().getType() == null || terminalBD.get().getType() == 1)){
                    downloadService.createInit(variable.getTerminal());
                }
            }
			
			
			y quiero que aqui 
			 variable.setValue(Util.changesPunctualJson(variable.getValue(), updateDownload.get().getValue()));
			 
			 se haga una validacion y si no existe nada en variagle Value me termine el procese y siga  con el siguiente elemento del for 
			
			
