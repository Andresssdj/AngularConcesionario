  @Query("SELECT * FROM Update_Download u WHERE u.id = :id")
    List<UpdateDownload> findByElementoId(long id, Pageable pageable);


Caused by: org.hibernate.hql.internal.ast.QuerySyntaxException: unexpected token: * near line 1, column 8 [SELECT * FROM Update_Download u WHERE u.id = :id]
