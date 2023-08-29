 Resolved [org.springframework.web.bind.MissingServletRequestParameterException: Required request parameter 'bines' for method parameter type String is not present]

http://localhost:8080/pos/bin-stages/update/bines/8

{
       
        "bines": "dsgfdsgf"
}


 public ResponseEntity<Object> updateBinesForEscenario (@PathVariable int escenario ,@RequestParam String bines){
        logger.info("----- Actualizar bines   -----");
        Optional<BinStages> updateBiness =  binStagesService.updateBines(escenario, bines);
        if (updateBiness.isPresent()){
            return ResponseEntity.ok("Bines actualizados");
        } else {
            return ResponseEntity.ok("Bines no");
        }
    }
