@Query("select new com.credibanco.entity.UpdateDownload(u.id as id, u.value as value) FROM UpdateDownload u   where  u.value like '%tef%' and u.criterio like '%> 1%' ORDER BY ID DESC")

select u.id, REGEXP_SUBSTR(u.value, 'NOMBREARCHIVO=([^|]+)',1,1,NULL,1) AS NOMBREARCHIVO
FROM Update_Download u where u.value like '%tef%' and u.criterio like '%> 1%' ORDER BY ID DESC;


@Query("select new com.credibanco.entity.UpdateDownload(u.id as id, " +
       "REGEXP_SUBSTR(u.value, '\"NOMBREARCHIVO=([^|]+)\"', 1, 1, NULL, 1) as value) " +
       "FROM UpdateDownload u " +
       "where u.value like '%tef%' and u.criterio like '%> 1%' ORDER BY u.id DESC")

Caused by: org.springframework.data.repository.query.QueryCreationException: Could not create query for public abstract java.util.List com.credibanco.repository.IUpdateDownloadRepository.findByElementoId()! Reason: Validation failed for query for method public abstract java.util.List com.credibanco.repository.IUpdateDownloadRepository.findByElementoId()!; nested exception is java.lang.IllegalArgumentException: Validation failed for query for method public abstract java.util.List com.credibanco.repository.IUpdateDownloadRepository.findByElementoId()!


@Query("SELECT new com.credibanco.entity.UpdateDownload(u.id as id, " +
       "REGEXP_SUBSTR(u.value, 'NOMBREARCHIVO=([^|]+)', 1, 1, NULL, 1) as value) " +
       "FROM UpdateDownload u " +
       "WHERE u.value LIKE '%tef%' AND u.criterio LIKE '%> 1%' ORDER BY u.id DESC")
