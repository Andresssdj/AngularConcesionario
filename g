for (let parameters in response){
        for (let parameter in response[parameters].value){
          if (parameter === 'tef_android') {
            var valTef: any = {"tef" : ""};
            valTef.tef = response[parameters].value[parameter];
            response[parameters].value = valTef;
          }else if (parameter === 'tef_legacy'){
            var valTef1: TefDTO;
            valTef1 = this.formatParameterToJson(response[parameters].value[parameter]);
            response[parameters].value = valTef1;
          }
        }
      }


for (let parameters in response) {
  for (let parameter in response[parameters].value) {
    if (parameter === 'tef_legacy') {
      var valTef1: TefDTO;
      valTef1 = this.formatParameterToJson(response[parameters].value[parameter]);
      response[parameters].value = valTef1;
    }
  }
}


SELECT
    u.id,
    SUBSTR(u.value, INSTR(u.value, 'NOMBREARCHIVO=') + LENGTH('NOMBREARCHIVO='), INSTR(u.value, '|', INSTR(u.value, 'NOMBREARCHIVO=')) - INSTR(u.value, 'NOMBREARCHIVO=') - LENGTH('NOMBREARCHIVO=')) AS NOMBREARCHIVO
FROM
    Update_Download u
WHERE
    u.value LIKE '%tef%'
    AND u.criterio LIKE '%> 1%'
ORDER BY
    u.id DESC;



