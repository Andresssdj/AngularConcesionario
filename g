Tengo este endpoint de un api, y quiero un metodo en typescrip que me permita visualizar lo que retorne ese endpoint

@PostMapping (path = "/search", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Object> consultaParameterSv(@RequestBody RequestDTO requestDTO) {
        Object obj = httpService.Consult(requestDTO, 0, false);
        return ResponseEntity.ok(obj);


y el body de requestDTO es de tipo JSON 
{"operation":"unica","code":"000QA"}

