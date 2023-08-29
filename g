Resolved [org.springframework.web.method.annotation.MethodArgumentTypeMismatchException: Failed to convert value of type 'java.lang.String' to required type 'int'; nested exception is java.lang.NumberFormatException: For input string: "{8}"]
@ApiOperation (value = "Actualizar", notes = "Actualización del estado de la terminal")
    @ApiResponses ({@ApiResponse (code = 200, message = "OK"), @ApiResponse (code = 500, message = "INTERNAL SERVER ERROR")})
    @ApiImplicitParams ({@ApiImplicitParam (name = "Authorization", value = "Authorization token jwt", dataType = "String", paramType = "header")})
    @PutMapping (path = "/update/bines/{escenario}", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Object> updateBinesForEscenario (@PathVariable int escenario ,@RequestParam String bines){
        logger.info("----- Actualizar bines   -----");
        Optional<BinStages> updateBiness =  binStagesService.updateBines(escenario, bines);
        if (updateBiness.isPresent()){
            return ResponseEntity.ok("Bines actualizados");
        } else {
            return ResponseEntity.ok("Bines no");
        }
    }
