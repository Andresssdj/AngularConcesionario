Tengo este controlador


public ResponseEntity<Object> listBinStages(){
        logger.info("----- Obteniendo listado de bines -----");
        List<BinStagesResponse> response = binStagesService.listBines();
        logger.info(MessagesDTO.FIN_HTTP);
        return ResponseEntity.status(response != null ? HttpStatus.OK : HttpStatus.NOT_FOUND).body(response != null ? response : Util.jsonMessage(MessagesDTO.SIN_INFORMACION));
    }
	
	y este servicio
	
	public List<BinStagesResponse> listBines() {
        List<BinStages> listBines = binStagesRepository.findAll();
        return !listBines.isEmpty() ? mapperListToResponse(listBines) : null;


    }

    private Object convertObjectToJson(Object string) throws Exception {
        ObjectMapper objectMapper = new ObjectMapper();
        return objectMapper.readValue(string.toString(), Object.class);
    }
     private List <BinStagesResponse> mapperListToResponse(List<BinStages> listEntity) {
       List<BinStagesResponse> response = listEntity.stream().map(BinStages -> modelMapper.map(BinStages, BinStagesResponse.class)).collect(Collectors.toList());
       try{
           for (BinStagesResponse r : response){
               r.setBines(convertObjectToJson(r.getBines()));
           }
       } catch (Exception e) {
           logger.error("Error al convert String to Json en mapperListResponse: ", e);
       }
       return response;
    }
}

y esto es la respuesta pero quiero que bp sea una lista de objetos


[
    {
        "id": 1,
        "es": "6",
        "bp": {
            "rf": "6395299999",
            "ri": "6395290000",
            "id": "513"
        }
    },
    {
        "id": 2,
        "es": "7",
        "bp": {
            "rf": "6395299999",
            "ri": "6395290000",
            "id": "513"
        }
    }
]




org.springframework.beans.factory.BeanCreationException: Error creating bean with name 'entityManagerFactory' defined in class path resource [org/springframework/boot/autoconfigure/orm/jpa/HibernateJpaConfiguration.class]: Invocation of init method failed; nested exception is javax.persistence.PersistenceException: [PersistenceUnit: default] Unable to build Hibernate SessionFactory; nested exception is org.hibernate.MappingException: Could not determine type for: java.util.List, at table: bin_stages, for columns: [org.hibernate.mapping.Column(bines)]
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
Caused by: javax.persistence.PersistenceException: [PersistenceUnit: default] Unable to build Hibernate SessionFactory; nested exception is org.hibernate.MappingException: Could not determine type for: java.util.List, at table: bin_stages, for columns: [org.hibernate.mapping.Column(bines)]
	at org.springframework.orm.jpa.AbstractEntityManagerFactoryBean.buildNativeEntityManagerFactory(AbstractEntityManagerFactoryBean.java:421) ~[spring-orm-5.3.9.jar:5.3.9]
	at org.springframework.orm.jpa.AbstractEntityManagerFactoryBean.afterPropertiesSet(AbstractEntityManagerFactoryBean.java:396) ~[spring-orm-5.3.9.jar:5.3.9]
	at org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean.afterPropertiesSet(LocalContainerEntityManagerFactoryBean.java:341) ~[spring-orm-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.invokeInitMethods(AbstractAutowireCapableBeanFactory.java:1845) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.initializeBean(AbstractAutowireCapableBeanFactory.java:1782) ~[spring-beans-5.3.9.jar:5.3.9]
	... 16 common frames omitted
Caused by: org.hibernate.MappingException: Could not determine type for: java.util.List, at table: bin_stages, for columns: [org.hibernate.mapping.Column(bines)]
	at org.hibernate.mapping.SimpleValue.getType(SimpleValue.java:499) ~[hibernate-core-5.4.32.Final.jar:5.4.32.Final]
	at org.hibernate.mapping.SimpleValue.isValid(SimpleValue.java:466) ~[hibernate-core-5.4.32.Final.jar:5.4.32.Final]
	at org.hibernate.mapping.Property.isValid(Property.java:227) ~[hibernate-core-5.4.32.Final.jar:5.4.32.Final]
	at org.hibernate.mapping.PersistentClass.validate(PersistentClass.java:624) ~[hibernate-core-5.4.32.Final.jar:5.4.32.Final]
	at org.hibernate.mapping.RootClass.validate(RootClass.java:267) ~[hibernate-core-5.4.32.Final.jar:5.4.32.Final]
	at org.hibernate.boot.internal.MetadataImpl.validate(MetadataImpl.java:354) ~[hibernate-core-5.4.32.Final.jar:5.4.32.Final]
	at org.hibernate.internal.SessionFactoryImpl.<init>(SessionFactoryImpl.java:298) ~[hibernate-core-5.4.32.Final.jar:5.4.32.Final]
	at org.hibernate.boot.internal.SessionFactoryBuilderImpl.build(SessionFactoryBuilderImpl.java:468) ~[hibernate-core-5.4.32.Final.jar:5.4.32.Final]
	at org.hibernate.jpa.boot.internal.EntityManagerFactoryBuilderImpl.build(EntityManagerFactoryBuilderImpl.java:1259) ~[hibernate-core-5.4.32.Final.jar:5.4.32.Final]
	at org.springframework.orm.jpa.vendor.SpringHibernateJpaPersistenceProvider.createContainerEntityManagerFactory(SpringHibernateJpaPersistenceProvider.java:58) ~[spring-orm-5.3.9.jar:5.3.9]
	at org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean.createNativeEntityManagerFactory(LocalContainerEntityManagerFactoryBean.java:365) ~[spring-orm-5.3.9.jar:5.3.9]
	at org.springframework.orm.jpa.AbstractEntityManagerFactoryBean.buildNativeEntityManagerFactory(AbstractEntityManagerFactoryBean.java:409) ~[spring-orm-5.3.9.jar:5.3.9]
	... 20 common frames omitted


Process finished with exit code 1
