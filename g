tenfo este codigo

String[] terminals = updateDownload.get().getDescription().split(",");
            logger.info("Leer terminales encontradas");
            for (String terminal : terminals) {
                logger.info("Consultando variables de una terminal encontrada");
                Variable variable = variableService.getVariableTerminalById(Long.parseLong(terminal));


                if (variable.getValue() == null || variable.getValue().isEmpty()){
                    logger.info("variable.getValue() esta vacio o es nulo.Saltando a la siguiente terminal");
                    continue;
                }
				
				
				
y quiero implementarlo aqui y que el " if (variable.getValue() == null || variable.getValue().isEmpty()){
                    logger.info("variable.getValue() esta vacio o es nulo.Saltando a la siguiente terminal");
                    continue;
                }" quede como otro else de estos
				
				  }else {
                                terminalFile.setTerminal(linea);
                                terminalFile.setResponse("No existe o tipo no valido");
                            }

                        }else {
                            terminalFile.setTerminal(linea);
                            terminalFile.setResponse("Terminal incorrecta");
                        }
						
						
						
						
						
						
						
						
						
						
						

try {
            if(saveFile(uploadDir,fileName,multipartFile)){
                logger.info("Archivo guardado.");
                String fileDir = uploadDir + "/" + fileName;
                archivo = new File (fileDir);
                fr = new FileReader (archivo);
                br = new BufferedReader(fr);

                // Lectura del fichero
                String linea;
                if (br.readLine() == null){
                    logger.info("Archivo vacio");
                }else {
                    logger.info("Procesando archivo  de terminales.");
                    while((linea=br.readLine())!=null) {

                        terminalFile = new FileTerminals();
                        if (linea.matches("[a-zA-Z0-9]{8}")){
                            terminal = terminalRepository.searchTerminal(linea, Integer.parseInt(tipo));
                            if (terminal.isPresent()){
                                id_terminals += terminal.get().getId() + ",";
                                terminalFile.setTerminal(linea);
                                terminalFile.setResponse("Agregada");
                                validTerminal = true;
                            }else {
                                terminalFile.setTerminal(linea);
                                terminalFile.setResponse("No existe o tipo no valido");
                            }

                        }else {
                            terminalFile.setTerminal(linea);
                            terminalFile.setResponse("Terminal incorrecta");
                        }
                        terminalsResponse.add(terminalFile);
                    }
                    if (validTerminal){
                        logger.info("Guardando cambios en BD.");
                        updateDownloadRequest.setId(0);
                        id_terminals = id_terminals.substring(0, id_terminals.length() - 1);
                        updateDownloadRequest.setCriterio(cirterio);
                        updateDownloadRequest.setCreatedDate(new Date());
                        updateDownloadRequest.setUpdatedDate(new Date());
                        updateDownloadRequest.setValue(valor);
                        updateDownloadRequest.setTipoCambio("globals");
                        updateDownloadRequest.setDescription(id_terminals);
                        updateDownloadRequest.setType(2);
                        repositoryDownload.save(mapperToEntity(updateDownloadRequest));
                    }
                }


            }

        }
