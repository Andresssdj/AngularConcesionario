while((linea=br.readLine())!=null) {
                        terminalFile = new FileTerminals();
                        if (linea.matches("[a-zA-Z0-9]{8}")){
                            terminal = terminalRepository.searchOptionalTerminal(linea);
                            Variable variable = variableService.getVariableTerminalById(Long.parseLong(linea));
                            if (terminal.isPresent()) {
                                id_terminals += terminal.get().getId() + ",";
                                terminalFile.setTerminal(linea);
                                terminalFile.setResponse("Agregada");
                                validTerminal = true;

                            } else {

                                if (variable.getValue() == null || variable.getValue().isEmpty()) {
                                terminalFile.setTerminal(linea);
                                terminalFile.setResponse("variable.getValue() esta vacio o es nulo.Saltando a la siguiente terminal");
                            }
                            }else {
                                terminalFile.setTerminal(linea);
                                terminalFile.setResponse("No existe terminal");
                            }

                        }else {
                            terminalFile.setTerminal(linea);
                            terminalFile.setResponse("Terminal incorrecta");
                        }
