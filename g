  @Query("SELECT * FROM Update_Download u WHERE u.id = :id")
    List<UpdateDownload> findByElementoId(long id, Pageable pageable);


Caused by: org.hibernate.hql.internal.ast.QuerySyntaxException: unexpected token: * near line 1, column 8 [SELECT * FROM Update_Download u WHERE u.id = :id]




ng : No se puede cargar el archivo C:\Users\CCASALLAS\AppData\Roaming\npm\ng.ps1 porque la ejecución de scripts está deshabilitada en este 
sistema. Para obtener más información, consulta el tema about_Execution_Policies en https:/go.microsoft.com/fwlink/?LinkID=135170.
En línea: 1 Carácter: 1
+ ng serve
+ ~~


+ ng serve
+ ~~
    + CategoryInfo          : SecurityError: (:) [], PSSecurityException
    + FullyQualifiedErrorId : UnauthorizedAccess

SELECT u.id, JSON_VALUE(u.value, '$.tef_legacy.NOMBREARCHIVO') FROM Update_Download u;


 {"tef_legacy":"[PARAMS]ISTEFON=1|MODETEF2=1|ISANULACION=1|ISCIERRE=1|ISBONOREGALO=1|ISAVANCE=1|ISPAGOMOVIL=0|ISBONOVIRTUAL=0|
   ISRECARGACELULAR=0|ISCUPON=0|[RS232]ISRS232=1|COMPORT=7052|PHYSICALCOMPORT=7025|NUMBERDATABITS=5|PARITY=NA|STOPBITS=5|BAUDRATE=9600|
   [ETHERNET]ISETHERNET=0|IPHOST=0|PORTHOST=0|[USB]ISUSB=0|[TEFCLOUD]ISTEFCLOUD=0|[VARIABLES]NOMBREARCHIVO=LEGACY P1|STIMEOUTCU=1|STIMEOUTME=1|
   STIMEOUTSC=1|FKCSIGN=1|MXSIGNTOUT=1|SIGNATUREW=1|SIGNRETRIES=1|BEEPLEVEL=1|BLOCKMAGNETIC=1|SETADFIELDS=0|SENDTRACKS=0|
   BLOCKCREDITCARD=0|CIERREAUTO=4|SETPRINTER=0|ACTNUMRECEIPT=0|DELAYSLAN=10|SETOFFCAMPS=45,51|SETONACK=1|EXCLUSIVOFALA=1|"}




SELECT 
    u.id, 
    JSON_VALUE(json_data, '$.tef_legacy.NOMBREARCHIVO') AS NOMBREARCHIVO
FROM 
    Update_Download u,
    JSON_TABLE(u.value, '$' 
        COLUMNS (json_data PATH '$.tef_legacy')
    ) jt;



SELECT
    JSON_VALUE(t.value, '$.tef_legacy.VARIABLES.NOMBREARCHIVO') AS NOMBREARCHIVO
FROM
    tu_tabla t;


SELECT
    SUBSTR(
        t.value,
        INSTR(t.value, 'NOMBREARCHIVO=') + LENGTH('NOMBREARCHIVO='),
        INSTR(t.value, '|', INSTR(t.value, 'NOMBREARCHIVO=')) - (INSTR(t.value, 'NOMBREARCHIVO=') + LENGTH('NOMBREARCHIVO='))
    ) AS NOMBREARCHIVO
FROM
    tu_tabla t;


SELECT
    REGEXP_SUBSTR(t.value, 'NOMBREARCHIVO=([^|]+)', 1, 1, NULL, 1) AS NOMBREARCHIVO
FROM
    tu_tabla t;



 @Query("select new com.credibanco.entity.UpdateDownload(u.id as id , u.value as value, u.status as status,u.createdDate as createdDate, u.tipoCambio as tipoCambio,u.criterio as criterio,u.type as type,u.updatedDate as updatedDate,u.description as description,u.version as version)from UpdateDownload u where u.value.tef_legacy is not null")
    List<UpdateDownload> findByElementoId();


Caused by: org.hibernate.QueryException: could not resolve property: tef_legacy of: com.credibanco.entity.UpdateDownload
