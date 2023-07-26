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


{"tef_android":{"NOMBREARCHIVO":"ANDROID V1","STIMEOUTCU":"60","STIMEOUTME":"60","STIMEOUTSC":"60","FKCSIGN":"30","MXSIGNTOUT":"45","SIGNATUREW":"0","SIGNRETRIES":"2","BEEPLEVEL":"10","BLOCKMAGNETIC":"0","SETADFIELDS":"0","SENDTRACKS":"0","BLOCKCREDITCARD":"0","CIERREAUTO":"NULL","SETPRINTER":"0","ACTNUMRECEIPT":"0","DELAYSLAN":"0","SETOFFCAMPS":"53","SETONACK":"0","EXCLUSIVOFALA":"0","ISTEFON":"0","MODETEF2":"0","ISANULACION":"0","ISCIERRE":"0","ISBONOREGALO":"0","ISAVANCE":"0","ISPAGOMOVIL":"0","ISBONOVIRTUAL":"0","ISRECARGACELULAR":"0","ISCUPON":"0","ISRS232":"1","COMPORT":"0","PHYSICALCOMPORT":"0","NUMBERDATABITS":"8","PARITY":"N","STOPBITS":"1","BAUDRATE":"9600","ISETHERNET":"0","IPHOST":"0","PORTHOST":"0","ISUSB":"0","ISTEFCLOUD":"0"}}

 @Query("SELECT new com.credibanco.entity.UpdateDownload(u.id as id, u.value.tef_android.NOMBREARCHIVO as value) FROM UpdateDownload u WHERE u.value LIKE '%tef_android%' AND u.criterio LIKE '%> 1%' ORDER BY u.id DESC")



@Query("SELECT new com.credibanco.entity.UpdateDownload(u.id as id, " +
       "JSON_VALUE(u.value, '$.tef_android.NOMBREARCHIVO') as value) " +
       "FROM UpdateDownload u " +
       "WHERE u.value LIKE '%tef_android%' AND u.criterio LIKE '%> 1%' ORDER BY u.id DESC")
