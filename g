org.springframework.beans.factory.BeanCreationException: Error creating bean with name 'entityManagerFactory' defined in class path resource [org/springframework/boot/autoconfigure/orm/jpa/HibernateJpaConfiguration.class]: Invocation of init method failed; nested exception is org.hibernate.AnnotationException: Use of @OneToMany or @ManyToMany targeting an unmapped class: com.credibanco.entity.BinStages.bines[com.credibanco.dtoresponse.ValueBinResponse]
	at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.initializeBean(AbstractAutowireCapableBeanFactory.java:1786) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.doCreateBean(AbstractAutowireCapableBeanFactory.java:602) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.createBean(AbstractAutowireCapableBeanFactory.java:524) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.support.AbstractBeanFactory.lambda$doGetBean$0(AbstractBeanFactory.java:335) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.support.DefaultSingletonBeanRegistry.getSingleton(DefaultSingletonBeanRegistry.java:234) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.support.AbstractBeanFactory.doGetBean(AbstractBeanFactory.java:333) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.support.AbstractBeanFactory.getBean(AbstractBeanFactory.java:208) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.context.support.AbstractApplicationContext.getBean(AbstractApplicationContext.java:1154) ~[spring-context-5.3.9.jar:5.3.9]
	at org.springframework.context.support.AbstractApplicationContext.finishBeanFactoryInitialization(AbstractApplicationContext.java:908) ~[spring-context-5.3.9.jar:5.3.9]
	at org.springframework.context.support.AbstractApplicationContext.refresh(AbstractApplicationContext.java:583) ~[spring-context-5.3.9.jar:5.3.9]
	at org.springframework.boot.web.servlet.context.ServletWebServerApplicationContext.refresh(ServletWebServerApplicationContext.java:145) ~[spring-boot-2.5.4.jar:2.5.4]
	at org.springframework.boot.SpringApplication.refresh(SpringApplication.java:754) ~[spring-boot-2.5.4.jar:2.5.4]
	at org.springframework.boot.SpringApplication.refreshContext(SpringApplication.java:434) ~[spring-boot-2.5.4.jar:2.5.4]
	at org.springframework.boot.SpringApplication.run(SpringApplication.java:338) ~[spring-boot-2.5.4.jar:2.5.4]
	at org.springframework.boot.SpringApplication.run(SpringApplication.java:1343) ~[spring-boot-2.5.4.jar:2.5.4]
	at org.springframework.boot.SpringApplication.run(SpringApplication.java:1332) ~[spring-boot-2.5.4.jar:2.5.4]
	at com.credibanco.PosApiFiladelfiaApplication.main(PosApiFiladelfiaApplication.java:19) ~[classes/:na]
Caused by: org.hibernate.AnnotationException: Use of @OneToMany or @ManyToMany targeting an unmapped class: com.credibanco.entity.BinStages.bines[com.credibanco.dtoresponse.ValueBinResponse]
	at org.hibernate.cfg.annotations.CollectionBinder.bindManyToManySecondPass(CollectionBinder.java:1351) ~[hibernate-core-5.4.32.Final.jar:5.4.32.Final]
	at org.hibernate.cfg.annotations.CollectionBinder.bindStarToManySecondPass(CollectionBinder.java:874) ~[hibernate-core-5.4.32.Final.jar:5.4.32.Final]
	at org.hibernate.cfg.annotations.CollectionBinder$1.secondPass(CollectionBinder.java:799) ~[hibernate-core-5.4.32.Final.jar:5.4.32.Final]
	at org.hibernate.cfg.CollectionSecondPass.doSecondPass(CollectionSecondPass.java:53) ~[hibernate-core-5.4.32.Final.jar:5.4.32.Final]
	at org.hibernate.boot.internal.InFlightMetadataCollectorImpl.processSecondPasses(InFlightMetadataCollectorImpl.java:1693) ~[hibernate-core-5.4.32.Final.jar:5.4.32.Final]
	at org.hibernate.boot.internal.InFlightMetadataCollectorImpl.processSecondPasses(InFlightMetadataCollectorImpl.java:1661) ~[hibernate-core-5.4.32.Final.jar:5.4.32.Final]
	at org.hibernate.boot.model.process.spi.MetadataBuildingProcess.complete(MetadataBuildingProcess.java:295) ~[hibernate-core-5.4.32.Final.jar:5.4.32.Final]
	at org.hibernate.jpa.boot.internal.EntityManagerFactoryBuilderImpl.metadata(EntityManagerFactoryBuilderImpl.java:1224) ~[hibernate-core-5.4.32.Final.jar:5.4.32.Final]
	at org.hibernate.jpa.boot.internal.EntityManagerFactoryBuilderImpl.build(EntityManagerFactoryBuilderImpl.java:1255) ~[hibernate-core-5.4.32.Final.jar:5.4.32.Final]
	at org.springframework.orm.jpa.vendor.SpringHibernateJpaPersistenceProvider.createContainerEntityManagerFactory(SpringHibernateJpaPersistenceProvider.java:58) ~[spring-orm-5.3.9.jar:5.3.9]
	at org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean.createNativeEntityManagerFactory(LocalContainerEntityManagerFactoryBean.java:365) ~[spring-orm-5.3.9.jar:5.3.9]
	at org.springframework.orm.jpa.AbstractEntityManagerFactoryBean.buildNativeEntityManagerFactory(AbstractEntityManagerFactoryBean.java:409) ~[spring-orm-5.3.9.jar:5.3.9]
	at org.springframework.orm.jpa.AbstractEntityManagerFactoryBean.afterPropertiesSet(AbstractEntityManagerFactoryBean.java:396) ~[spring-orm-5.3.9.jar:5.3.9]
	at org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean.afterPropertiesSet(LocalContainerEntityManagerFactoryBean.java:341) ~[spring-orm-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.invokeInitMethods(AbstractAutowireCapableBeanFactory.java:1845) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.initializeBean(AbstractAutowireCapableBeanFactory.java:1782) ~[spring-beans-5.3.9.jar:5.3.9]
	... 16 common frames omitted


Process finished with exit code 1


@Entity
@Table (name =" BIN_STAGES")
public class BinStages {

    @JsonProperty ("id")
    @Id
    @Column (name = "ID")
    private Long id;

    @Column (name = "ESCENARIO")
    @JsonProperty ("es")
    private String escenario;


    @OneToMany(mappedBy = "binStages", cascade = CascadeType.ALL , orphanRemoval = true)
    private List<ValueBinResponse>bines;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getEscenario() {
        return escenario;
    }

    public void setEscenario(String escenario) {
        this.escenario = escenario;
    }

    public List<ValueBinResponse> getBines() {
        return bines;
    }

    public void setBines(List<ValueBinResponse> bines) {
        this.bines = bines;
    }
}



public class ValueBinResponse {

    @JsonProperty ("rf")
    private String rf;
    @JsonProperty ("ri")
    private String ri;
    @JsonProperty ("id")
    private String id;

    @ManyToOne
    @JoinColumn (name = "BINES")
    private BinStages binStages;

    public BinStages getBinStages() {
        return binStages;
    }

    public void setBinStages(BinStages binStages) {
        this.binStages = binStages;
    }

    public String getRf() {
        return rf;
    }

    public void setRf(String rf) {
        this.rf = rf;
    }

    public String getRi() {
        return ri;
    }

    public void setRi(String ri) {
        this.ri = ri;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
}

