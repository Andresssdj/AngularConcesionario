yo@Query("select new com.credibanco.entity.UpdateDownload(u.id as id, u.value as value) FROM UpdateDownload u   where  u.value like '%tef%' and u.criterio like '%> 1%' ORDER BY ID DESC")

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


Error al crear el bean con el nombre 'updateDownloadController': Dependencia insatisfecha expresada a través del campo 'serviceDownload'; la excepción anidada es org.springframework.beans.factory.UnsatisfiedDependencyException: error al crear el bean con el nombre 'updateDownloadService': dependencia no satisfecha expresada a través del campo 'repositoryDownload'; la excepción anidada es org.springframework.beans.factory.BeanCreationException: error al crear el bean con el nombre 'IUpdateDownloadRepository' definido en com.credibanco.repository.IUpdateDownloadRepository definido en @EnableJpaRepositories declarado en PosApiFiladelfiaApplication: invocación del método init fallida; La excepción anidada es org.springframework.data.repository.query.QueryCreationException: ¡No se pudo crear una consulta para el resumen público java.util.List com.credibanco.repository.IUpdateDownloadRepository.findByElementoId()! Motivo: Falló la validación de la consulta del método public abstract java.util.List com.credibanco.repository.IUpdateDownloadRepository.findByElementoId(!); la excepción anidada es java.lang.IllegalArgumentException: la validación falló para la consulta del método public abstract java.util.List com.credibanco.repository.IUpdateDownloadRepository.findByElementoId()!



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
