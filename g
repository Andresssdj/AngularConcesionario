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
