que error tengo 


TENGO ESTE QUERY EN ORACLE
UPDATE BIN_STAGES bs SET bs.bines = (
    SELECT '[' || LISTAGG('{"rf":"' || e.RANGO_FINAL || '","ri":"' || e.RANGO_INICIAL || '","id":"' || e.INDICE || '"}', ', ') WITHIN GROUP (ORDER BY e.INDICE) || ']'
    FROM BIN_EMISOR e WHERE e.INDICE IN (SELECT TO_NUMBER(REGEXP_SUBSTR(:INDICES, '[^,]+', 1, LEVEL))FROM DUAL CONNECT BY REGEXP_SUBSTR(:INDICES, '[^,]+', 1, LEVEL) IS NOT NULL)) WHERE bs.ID_ESCENARIO = :ID_ESCENARIO;

ESTE EN SPRING BOOT
  @Transactional
    @Modifying
    @Query(value = "UPDATE BIN_STAGES bs SET bs.bines = (\n" +
            "    SELECT '[' || LISTAGG('{\"rf\":\"' || e.RANGO_FINAL || '\",\"ri\":\"' || e.RANGO_INICIAL || '\",\"id\":\"' || e.INDICE || '\"}', ', ') WITHIN GROUP (ORDER BY e.INDICE) || ']'\n" +
            "    FROM BIN_EMISOR e WHERE e.INDICE IN (SELECT TO_NUMBER(REGEXP_SUBSTR(:INDICES, '[^,]+', 1, LEVEL))FROM DUAL CONNECT BY REGEXP_SUBSTR(:INDICES, '[^,]+', 1, LEVEL) IS NOT NULL)) WHERE bs.ID_ESCENARIO = :ID_ESCENARIO", nativeQuery = true)
    void updateBines(@Param("ID_ESCENARIO") Long idEscenario,@Param("INDICES") String bines);

ESTA ES MI ENTITY
@Entity
@Table (name =" BIN_STAGES")
public class BinStages {


    @Id
    @Column (name = "ID_ESCENARIO")
    @JsonProperty ("es")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idEscenario;

    @Column (name = "BINES")
    @JsonProperty ("bi")
    private String bines;

    public Long getIdEscenario() {
        return idEscenario;
    }

    public void setIdEscenario(Long idEscenario) {
        this.idEscenario = idEscenario;
    }
    public String getBines() {
        return bines;
    }

    public void setBines(String bines) {
        this.bines = bines;
    }
}


@JsonIgnoreProperties (ignoreUnknown = true)
@JsonSerialize
public class BinStagesResponse {


    @JsonProperty ("es")
    private Long idEscenario;

    @JsonProperty ("bi")
    private String bines;


    public Long getIdEscenario() {
        return idEscenario;
    }

    public void setIdEscenario(Long idEscenario) {
        this.idEscenario = idEscenario;
    }

    public String getBines() {
        return bines;
    }

    public void setBines(String bines) {
        this.bines = bines;
    }
}


JsonIgnoreProperties (ignoreUnknown = true)
@JsonSerialize
public class BinStagesRequest {




    @JsonProperty ("es")
    private Long idEscenario;

    @JsonProperty ("bi")
    private String bines;

    public Long getIdEscenario() {
        return idEscenario;
    }

    public void setIdEscenario(Long idEscenario) {
        this.idEscenario = idEscenario;
    }

    public String getBines() {
        return bines;
    }

    public void setBines(String bines) {
        this.bines = bines;
    }
}


CONTROLADOR 

 public ResponseEntity<Object> updateBinesForEscenario (@PathVariable Long idEscenario ,@RequestBody BinStages binStages){
        logger.info("----- Actualizar bines   -----");
        binStages.setIdEscenario(idEscenario);
        boolean  updateBiness =  binStagesService.updateBiness(binStages);
        logger.info(FIN_HTTP);
        return ResponseEntity.status(updateBiness ? HttpStatus.OK : HttpStatus.BAD_REQUEST).body(updateBiness ? Util.jsonMessage(MessagesDTO.ACTUALIZADO) : Util.jsonMessage(MessagesDTO.NO_ACTUALIZADO));
        }

servicio


public boolean updateBiness (BinStages entity){
        try {
                binStagesRepository.updateBines(entity.getIdEscenario(), entity.getBines());
                binStagesRepository.save(entity);
                logger.info("Bines actualizados");
                return true;
            } catch (Exception e) {
                logger.info("Error al actualizar bines: ", e);
            }
            return false;
        }
