@Query("select new com.credibanco.entity.UpdateDownload(u.id as id, u.value as value) FROM UpdateDownload u   where  u.value like '%tef%' and u.criterio like '%> 1%' ORDER BY ID DESC")

select u.id, REGEXP_SUBSTR(u.value, 'NOMBREARCHIVO=([^|]+)',1,1,NULL,1) AS NOMBREARCHIVO
FROM Update_Download u where u.value like '%tef%' and u.criterio like '%> 1%' ORDER BY ID DESC;


@Query("select new com.credibanco.entity.UpdateDownload(u.id as id, " +
       "REGEXP_SUBSTR(u.value, '\"NOMBREARCHIVO=([^|]+)\"', 1, 1, NULL, 1) as value) " +
       "FROM UpdateDownload u " +
       "where u.value like '%tef%' and u.criterio like '%> 1%' ORDER BY u.id DESC")

