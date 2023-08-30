antlr.MismatchedTokenException: expecting "by", found '('
	at antlr.Parser.match(Parser.java:211) ~[antlr-2.7.7.jar:na]
	at org.hibernate.hql.internal.antlr.HqlBaseParser.groupByClause(HqlBaseParser.java:1228) ~[hibernate-core-5.4.32.Final.jar:5.4.32.Final]
	at org.hibernate.hql.internal.antlr.HqlBaseParser.queryRule(HqlBaseParser.java:852) ~[hibernate-core-5.4.32.Final.jar:5.4.32.Final]
	at org.hibernate.hql.internal.antlr.HqlBaseParser.subQuery(HqlBaseParser.java:4342) ~[hibernate-core-5.4.32.Final.jar:5.4.32.Final]
	at org.hibernate.hql.internal.antlr.HqlBaseParser.primaryExpression(HqlBaseParser.java:1059) ~[hibernate-core-5.4.32.Final.jar:5.4.32.Final]
	at org.hibernate.hql.internal.antlr.HqlBaseParser.atom(HqlBaseParser.java:3946) ~[hibernate-core-5.4.32.Final.jar:5.4.32.Final]
	at org.hibernate.hql.internal.antlr.HqlBaseParser.unaryExpression(HqlBaseParser.java:3877) ~[hibernate-core-5.4.32.Final.jar:5.4.32.Final]
	at org.hibernate.hql.internal.antlr.HqlBaseParser.multiplyExpression(HqlBaseParser.java:3754) ~[hibernate-core-5.4.32.Final.jar:5.4.32.Final]
	at org.hibernate.hql.internal.antlr.HqlBaseParser.additiveExpression(HqlBaseParser.java:3381) ~[hibernate-core-5.4.32.Final.jar:5.4.32.Final]
	at org.hibernate.hql.internal.antlr.HqlBaseParser.concatenation(HqlBaseParser.java:682) ~[hibernate-core-5.4.32.Final.jar:5.4.32.Final]
	at org.hibernate.hql.internal.antlr.HqlBaseParser.newValue(HqlBaseParser.java:615) ~[hibernate-core-5.4.32.Final.jar:5.4.32.Final]
	at org.hibernate.hql.internal.antlr.HqlBaseParser.assignment(HqlBaseParser.java:569) ~[hibernate-core-5.4.32.Final.jar:5.4.32.Final]
	at org.hibernate.hql.internal.antlr.HqlBaseParser.setClause(HqlBaseParser.java:498) ~[hibernate-core-5.4.32.Final.jar:5.4.32.Final]
	at org.hibernate.hql.internal.antlr.HqlBaseParser.updateStatement(HqlBaseParser.java:248) ~[hibernate-core-5.4.32.Final.jar:5.4.32.Final]
	at org.hibernate.hql.internal.antlr.HqlBaseParser.statement(HqlBaseParser.java:183) ~[hibernate-core-5.4.32.Final.jar:5.4.32.Final]
	at org.hibernate.hql.internal.ast.QueryTranslatorImpl.parse(QueryTranslatorImpl.java:294) ~[hibernate-core-5.4.32.Final.jar:5.4.32.Final]
	at org.hibernate.hql.internal.ast.QueryTranslatorImpl.doCompile(QueryTranslatorImpl.java:189) ~[hibernate-core-5.4.32.Final.jar:5.4.32.Final]
	at org.hibernate.hql.internal.ast.QueryTranslatorImpl.compile(QueryTranslatorImpl.java:144) ~[hibernate-core-5.4.32.Final.jar:5.4.32.Final]
	at org.hibernate.engine.query.spi.HQLQueryPlan.<init>(HQLQueryPlan.java:113) ~[hibernate-core-5.4.32.Final.jar:5.4.32.Final]
	at org.hibernate.engine.query.spi.HQLQueryPlan.<init>(HQLQueryPlan.java:73) ~[hibernate-core-5.4.32.Final.jar:5.4.32.Final]
	at org.hibernate.engine.query.spi.QueryPlanCache.getHQLQueryPlan(QueryPlanCache.java:162) ~[hibernate-core-5.4.32.Final.jar:5.4.32.Final]
	at org.hibernate.internal.AbstractSharedSessionContract.getQueryPlan(AbstractSharedSessionContract.java:613) ~[hibernate-core-5.4.32.Final.jar:5.4.32.Final]
	at org.hibernate.internal.AbstractSharedSessionContract.createQuery(AbstractSharedSessionContract.java:725) ~[hibernate-core-5.4.32.Final.jar:5.4.32.Final]
	at org.hibernate.internal.AbstractSharedSessionContract.createQuery(AbstractSharedSessionContract.java:114) ~[hibernate-core-5.4.32.Final.jar:5.4.32.Final]
	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method) ~[na:na]
	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62) ~[na:na]
	at java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43) ~[na:na]
	at java.base/java.lang.reflect.Method.invoke(Method.java:566) ~[na:na]
	at org.springframework.orm.jpa.ExtendedEntityManagerCreator$ExtendedEntityManagerInvocationHandler.invoke(ExtendedEntityManagerCreator.java:362) ~[spring-orm-5.3.9.jar:5.3.9]
	at com.sun.proxy.$Proxy109.createQuery(Unknown Source) ~[na:na]
	at org.springframework.data.jpa.repository.query.SimpleJpaQuery.validateQuery(SimpleJpaQuery.java:87) ~[spring-data-jpa-2.5.4.jar:2.5.4]
	at org.springframework.data.jpa.repository.query.SimpleJpaQuery.<init>(SimpleJpaQuery.java:63) ~[spring-data-jpa-2.5.4.jar:2.5.4]
	at org.springframework.data.jpa.repository.query.JpaQueryFactory.fromMethodWithQueryString(JpaQueryFactory.java:76) ~[spring-data-jpa-2.5.4.jar:2.5.4]
	at org.springframework.data.jpa.repository.query.JpaQueryFactory.fromQueryAnnotation(JpaQueryFactory.java:56) ~[spring-data-jpa-2.5.4.jar:2.5.4]
	at org.springframework.data.jpa.repository.query.JpaQueryLookupStrategy$DeclaredQueryLookupStrategy.resolveQuery(JpaQueryLookupStrategy.java:146) ~[spring-data-jpa-2.5.4.jar:2.5.4]
	at org.springframework.data.jpa.repository.query.JpaQueryLookupStrategy$CreateIfNotFoundQueryLookupStrategy.resolveQuery(JpaQueryLookupStrategy.java:216) ~[spring-data-jpa-2.5.4.jar:2.5.4]
	at org.springframework.data.jpa.repository.query.JpaQueryLookupStrategy$AbstractQueryLookupStrategy.resolveQuery(JpaQueryLookupStrategy.java:81) ~[spring-data-jpa-2.5.4.jar:2.5.4]
	at org.springframework.data.repository.core.support.QueryExecutorMethodInterceptor.lookupQuery(QueryExecutorMethodInterceptor.java:102) ~[spring-data-commons-2.5.4.jar:2.5.4]
	at org.springframework.data.repository.core.support.QueryExecutorMethodInterceptor.lambda$mapMethodsToQuery$1(QueryExecutorMethodInterceptor.java:94) ~[spring-data-commons-2.5.4.jar:2.5.4]
	at java.base/java.util.stream.ReferencePipeline$3$1.accept(ReferencePipeline.java:195) ~[na:na]
	at java.base/java.util.Iterator.forEachRemaining(Iterator.java:133) ~[na:na]
	at java.base/java.util.Collections$UnmodifiableCollection$1.forEachRemaining(Collections.java:1054) ~[na:na]
	at java.base/java.util.Spliterators$IteratorSpliterator.forEachRemaining(Spliterators.java:1801) ~[na:na]
	at java.base/java.util.stream.AbstractPipeline.copyInto(AbstractPipeline.java:484) ~[na:na]
	at java.base/java.util.stream.AbstractPipeline.wrapAndCopyInto(AbstractPipeline.java:474) ~[na:na]
	at java.base/java.util.stream.ReduceOps$ReduceOp.evaluateSequential(ReduceOps.java:913) ~[na:na]
	at java.base/java.util.stream.AbstractPipeline.evaluate(AbstractPipeline.java:234) ~[na:na]
	at java.base/java.util.stream.ReferencePipeline.collect(ReferencePipeline.java:578) ~[na:na]
	at org.springframework.data.repository.core.support.QueryExecutorMethodInterceptor.mapMethodsToQuery(QueryExecutorMethodInterceptor.java:96) ~[spring-data-commons-2.5.4.jar:2.5.4]
	at org.springframework.data.repository.core.support.QueryExecutorMethodInterceptor.lambda$new$0(QueryExecutorMethodInterceptor.java:86) ~[spring-data-commons-2.5.4.jar:2.5.4]
	at java.base/java.util.Optional.map(Optional.java:265) ~[na:na]
	at org.springframework.data.repository.core.support.QueryExecutorMethodInterceptor.<init>(QueryExecutorMethodInterceptor.java:86) ~[spring-data-commons-2.5.4.jar:2.5.4]
	at org.springframework.data.repository.core.support.RepositoryFactorySupport.getRepository(RepositoryFactorySupport.java:360) ~[spring-data-commons-2.5.4.jar:2.5.4]
	at org.springframework.data.repository.core.support.RepositoryFactoryBeanSupport.lambda$afterPropertiesSet$5(RepositoryFactoryBeanSupport.java:323) ~[spring-data-commons-2.5.4.jar:2.5.4]
	at org.springframework.data.util.Lazy.getNullable(Lazy.java:230) ~[spring-data-commons-2.5.4.jar:2.5.4]
	at org.springframework.data.util.Lazy.get(Lazy.java:114) ~[spring-data-commons-2.5.4.jar:2.5.4]
	at org.springframework.data.repository.core.support.RepositoryFactoryBeanSupport.afterPropertiesSet(RepositoryFactoryBeanSupport.java:329) ~[spring-data-commons-2.5.4.jar:2.5.4]
	at org.springframework.data.jpa.repository.support.JpaRepositoryFactoryBean.afterPropertiesSet(JpaRepositoryFactoryBean.java:144) ~[spring-data-jpa-2.5.4.jar:2.5.4]
	at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.invokeInitMethods(AbstractAutowireCapableBeanFactory.java:1845) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.initializeBean(AbstractAutowireCapableBeanFactory.java:1782) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.doCreateBean(AbstractAutowireCapableBeanFactory.java:602) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.createBean(AbstractAutowireCapableBeanFactory.java:524) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.support.AbstractBeanFactory.lambda$doGetBean$0(AbstractBeanFactory.java:335) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.support.DefaultSingletonBeanRegistry.getSingleton(DefaultSingletonBeanRegistry.java:234) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.support.AbstractBeanFactory.doGetBean(AbstractBeanFactory.java:333) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.support.AbstractBeanFactory.getBean(AbstractBeanFactory.java:208) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.config.DependencyDescriptor.resolveCandidate(DependencyDescriptor.java:276) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.support.DefaultListableBeanFactory.doResolveDependency(DefaultListableBeanFactory.java:1380) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.support.DefaultListableBeanFactory.resolveDependency(DefaultListableBeanFactory.java:1300) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.annotation.AutowiredAnnotationBeanPostProcessor$AutowiredFieldElement.resolveFieldValue(AutowiredAnnotationBeanPostProcessor.java:657) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.annotation.AutowiredAnnotationBeanPostProcessor$AutowiredFieldElement.inject(AutowiredAnnotationBeanPostProcessor.java:640) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.annotation.InjectionMetadata.inject(InjectionMetadata.java:119) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.annotation.AutowiredAnnotationBeanPostProcessor.postProcessProperties(AutowiredAnnotationBeanPostProcessor.java:399) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.populateBean(AbstractAutowireCapableBeanFactory.java:1413) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.doCreateBean(AbstractAutowireCapableBeanFactory.java:601) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.createBean(AbstractAutowireCapableBeanFactory.java:524) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.support.AbstractBeanFactory.lambda$doGetBean$0(AbstractBeanFactory.java:335) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.support.DefaultSingletonBeanRegistry.getSingleton(DefaultSingletonBeanRegistry.java:234) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.support.AbstractBeanFactory.doGetBean(AbstractBeanFactory.java:333) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.support.AbstractBeanFactory.getBean(AbstractBeanFactory.java:208) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.config.DependencyDescriptor.resolveCandidate(DependencyDescriptor.java:276) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.support.DefaultListableBeanFactory.doResolveDependency(DefaultListableBeanFactory.java:1380) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.support.DefaultListableBeanFactory.resolveDependency(DefaultListableBeanFactory.java:1300) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.annotation.AutowiredAnnotationBeanPostProcessor$AutowiredFieldElement.resolveFieldValue(AutowiredAnnotationBeanPostProcessor.java:657) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.annotation.AutowiredAnnotationBeanPostProcessor$AutowiredFieldElement.inject(AutowiredAnnotationBeanPostProcessor.java:640) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.annotation.InjectionMetadata.inject(InjectionMetadata.java:119) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.annotation.AutowiredAnnotationBeanPostProcessor.postProcessProperties(AutowiredAnnotationBeanPostProcessor.java:399) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.populateBean(AbstractAutowireCapableBeanFactory.java:1413) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.doCreateBean(AbstractAutowireCapableBeanFactory.java:601) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.createBean(AbstractAutowireCapableBeanFactory.java:524) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.support.AbstractBeanFactory.lambda$doGetBean$0(AbstractBeanFactory.java:335) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.support.DefaultSingletonBeanRegistry.getSingleton(DefaultSingletonBeanRegistry.java:234) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.support.AbstractBeanFactory.doGetBean(AbstractBeanFactory.java:333) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.support.AbstractBeanFactory.getBean(AbstractBeanFactory.java:208) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.support.DefaultListableBeanFactory.preInstantiateSingletons(DefaultListableBeanFactory.java:944) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.context.support.AbstractApplicationContext.finishBeanFactoryInitialization(AbstractApplicationContext.java:918) ~[spring-context-5.3.9.jar:5.3.9]
	at org.springframework.context.support.AbstractApplicationContext.refresh(AbstractApplicationContext.java:583) ~[spring-context-5.3.9.jar:5.3.9]
	at org.springframework.boot.web.servlet.context.ServletWebServerApplicationContext.refresh(ServletWebServerApplicationContext.java:145) ~[spring-boot-2.5.4.jar:2.5.4]
	at org.springframework.boot.SpringApplication.refresh(SpringApplication.java:754) ~[spring-boot-2.5.4.jar:2.5.4]
	at org.springframework.boot.SpringApplication.refreshContext(SpringApplication.java:434) ~[spring-boot-2.5.4.jar:2.5.4]
	at org.springframework.boot.SpringApplication.run(SpringApplication.java:338) ~[spring-boot-2.5.4.jar:2.5.4]
	at org.springframework.boot.SpringApplication.run(SpringApplication.java:1343) ~[spring-boot-2.5.4.jar:2.5.4]
	at org.springframework.boot.SpringApplication.run(SpringApplication.java:1332) ~[spring-boot-2.5.4.jar:2.5.4]
	at com.credibanco.PosApiFiladelfiaApplication.main(PosApiFiladelfiaApplication.java:19) ~[classes/:na]

2023-08-30 09:29:21.433 ERROR 25056 --- [           main] o.h.hql.internal.ast.ErrorTracker        : line 1:220: unexpected token: FROM
2023-08-30 09:29:21.434 ERROR 25056 --- [           main] o.h.hql.internal.ast.ErrorTracker        : line 1:220: unexpected token: FROM

antlr.NoViableAltException: unexpected token: FROM
	at org.hibernate.hql.internal.antlr.HqlBaseParser.updateStatement(HqlBaseParser.java:264) ~[hibernate-core-5.4.32.Final.jar:5.4.32.Final]
	at org.hibernate.hql.internal.antlr.HqlBaseParser.statement(HqlBaseParser.java:183) ~[hibernate-core-5.4.32.Final.jar:5.4.32.Final]
	at org.hibernate.hql.internal.ast.QueryTranslatorImpl.parse(QueryTranslatorImpl.java:294) ~[hibernate-core-5.4.32.Final.jar:5.4.32.Final]
	at org.hibernate.hql.internal.ast.QueryTranslatorImpl.doCompile(QueryTranslatorImpl.java:189) ~[hibernate-core-5.4.32.Final.jar:5.4.32.Final]
	at org.hibernate.hql.internal.ast.QueryTranslatorImpl.compile(QueryTranslatorImpl.java:144) ~[hibernate-core-5.4.32.Final.jar:5.4.32.Final]
	at org.hibernate.engine.query.spi.HQLQueryPlan.<init>(HQLQueryPlan.java:113) ~[hibernate-core-5.4.32.Final.jar:5.4.32.Final]
	at org.hibernate.engine.query.spi.HQLQueryPlan.<init>(HQLQueryPlan.java:73) ~[hibernate-core-5.4.32.Final.jar:5.4.32.Final]
	at org.hibernate.engine.query.spi.QueryPlanCache.getHQLQueryPlan(QueryPlanCache.java:162) ~[hibernate-core-5.4.32.Final.jar:5.4.32.Final]
	at org.hibernate.internal.AbstractSharedSessionContract.getQueryPlan(AbstractSharedSessionContract.java:613) ~[hibernate-core-5.4.32.Final.jar:5.4.32.Final]
	at org.hibernate.internal.AbstractSharedSessionContract.createQuery(AbstractSharedSessionContract.java:725) ~[hibernate-core-5.4.32.Final.jar:5.4.32.Final]
	at org.hibernate.internal.AbstractSharedSessionContract.createQuery(AbstractSharedSessionContract.java:114) ~[hibernate-core-5.4.32.Final.jar:5.4.32.Final]
	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method) ~[na:na]
	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62) ~[na:na]
	at java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43) ~[na:na]
	at java.base/java.lang.reflect.Method.invoke(Method.java:566) ~[na:na]
	at org.springframework.orm.jpa.ExtendedEntityManagerCreator$ExtendedEntityManagerInvocationHandler.invoke(ExtendedEntityManagerCreator.java:362) ~[spring-orm-5.3.9.jar:5.3.9]
	at com.sun.proxy.$Proxy109.createQuery(Unknown Source) ~[na:na]
	at org.springframework.data.jpa.repository.query.SimpleJpaQuery.validateQuery(SimpleJpaQuery.java:87) ~[spring-data-jpa-2.5.4.jar:2.5.4]
	at org.springframework.data.jpa.repository.query.SimpleJpaQuery.<init>(SimpleJpaQuery.java:63) ~[spring-data-jpa-2.5.4.jar:2.5.4]
	at org.springframework.data.jpa.repository.query.JpaQueryFactory.fromMethodWithQueryString(JpaQueryFactory.java:76) ~[spring-data-jpa-2.5.4.jar:2.5.4]
	at org.springframework.data.jpa.repository.query.JpaQueryFactory.fromQueryAnnotation(JpaQueryFactory.java:56) ~[spring-data-jpa-2.5.4.jar:2.5.4]
	at org.springframework.data.jpa.repository.query.JpaQueryLookupStrategy$DeclaredQueryLookupStrategy.resolveQuery(JpaQueryLookupStrategy.java:146) ~[spring-data-jpa-2.5.4.jar:2.5.4]
	at org.springframework.data.jpa.repository.query.JpaQueryLookupStrategy$CreateIfNotFoundQueryLookupStrategy.resolveQuery(JpaQueryLookupStrategy.java:216) ~[spring-data-jpa-2.5.4.jar:2.5.4]
	at org.springframework.data.jpa.repository.query.JpaQueryLookupStrategy$AbstractQueryLookupStrategy.resolveQuery(JpaQueryLookupStrategy.java:81) ~[spring-data-jpa-2.5.4.jar:2.5.4]
	at org.springframework.data.repository.core.support.QueryExecutorMethodInterceptor.lookupQuery(QueryExecutorMethodInterceptor.java:102) ~[spring-data-commons-2.5.4.jar:2.5.4]
	at org.springframework.data.repository.core.support.QueryExecutorMethodInterceptor.lambda$mapMethodsToQuery$1(QueryExecutorMethodInterceptor.java:94) ~[spring-data-commons-2.5.4.jar:2.5.4]
	at java.base/java.util.stream.ReferencePipeline$3$1.accept(ReferencePipeline.java:195) ~[na:na]
	at java.base/java.util.Iterator.forEachRemaining(Iterator.java:133) ~[na:na]
	at java.base/java.util.Collections$UnmodifiableCollection$1.forEachRemaining(Collections.java:1054) ~[na:na]
	at java.base/java.util.Spliterators$IteratorSpliterator.forEachRemaining(Spliterators.java:1801) ~[na:na]
	at java.base/java.util.stream.AbstractPipeline.copyInto(AbstractPipeline.java:484) ~[na:na]
	at java.base/java.util.stream.AbstractPipeline.wrapAndCopyInto(AbstractPipeline.java:474) ~[na:na]
	at java.base/java.util.stream.ReduceOps$ReduceOp.evaluateSequential(ReduceOps.java:913) ~[na:na]
	at java.base/java.util.stream.AbstractPipeline.evaluate(AbstractPipeline.java:234) ~[na:na]
	at java.base/java.util.stream.ReferencePipeline.collect(ReferencePipeline.java:578) ~[na:na]
	at org.springframework.data.repository.core.support.QueryExecutorMethodInterceptor.mapMethodsToQuery(QueryExecutorMethodInterceptor.java:96) ~[spring-data-commons-2.5.4.jar:2.5.4]
	at org.springframework.data.repository.core.support.QueryExecutorMethodInterceptor.lambda$new$0(QueryExecutorMethodInterceptor.java:86) ~[spring-data-commons-2.5.4.jar:2.5.4]
	at java.base/java.util.Optional.map(Optional.java:265) ~[na:na]
	at org.springframework.data.repository.core.support.QueryExecutorMethodInterceptor.<init>(QueryExecutorMethodInterceptor.java:86) ~[spring-data-commons-2.5.4.jar:2.5.4]
	at org.springframework.data.repository.core.support.RepositoryFactorySupport.getRepository(RepositoryFactorySupport.java:360) ~[spring-data-commons-2.5.4.jar:2.5.4]
	at org.springframework.data.repository.core.support.RepositoryFactoryBeanSupport.lambda$afterPropertiesSet$5(RepositoryFactoryBeanSupport.java:323) ~[spring-data-commons-2.5.4.jar:2.5.4]
	at org.springframework.data.util.Lazy.getNullable(Lazy.java:230) ~[spring-data-commons-2.5.4.jar:2.5.4]
	at org.springframework.data.util.Lazy.get(Lazy.java:114) ~[spring-data-commons-2.5.4.jar:2.5.4]
	at org.springframework.data.repository.core.support.RepositoryFactoryBeanSupport.afterPropertiesSet(RepositoryFactoryBeanSupport.java:329) ~[spring-data-commons-2.5.4.jar:2.5.4]
	at org.springframework.data.jpa.repository.support.JpaRepositoryFactoryBean.afterPropertiesSet(JpaRepositoryFactoryBean.java:144) ~[spring-data-jpa-2.5.4.jar:2.5.4]
	at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.invokeInitMethods(AbstractAutowireCapableBeanFactory.java:1845) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.initializeBean(AbstractAutowireCapableBeanFactory.java:1782) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.doCreateBean(AbstractAutowireCapableBeanFactory.java:602) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.createBean(AbstractAutowireCapableBeanFactory.java:524) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.support.AbstractBeanFactory.lambda$doGetBean$0(AbstractBeanFactory.java:335) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.support.DefaultSingletonBeanRegistry.getSingleton(DefaultSingletonBeanRegistry.java:234) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.support.AbstractBeanFactory.doGetBean(AbstractBeanFactory.java:333) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.support.AbstractBeanFactory.getBean(AbstractBeanFactory.java:208) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.config.DependencyDescriptor.resolveCandidate(DependencyDescriptor.java:276) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.support.DefaultListableBeanFactory.doResolveDependency(DefaultListableBeanFactory.java:1380) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.support.DefaultListableBeanFactory.resolveDependency(DefaultListableBeanFactory.java:1300) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.annotation.AutowiredAnnotationBeanPostProcessor$AutowiredFieldElement.resolveFieldValue(AutowiredAnnotationBeanPostProcessor.java:657) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.annotation.AutowiredAnnotationBeanPostProcessor$AutowiredFieldElement.inject(AutowiredAnnotationBeanPostProcessor.java:640) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.annotation.InjectionMetadata.inject(InjectionMetadata.java:119) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.annotation.AutowiredAnnotationBeanPostProcessor.postProcessProperties(AutowiredAnnotationBeanPostProcessor.java:399) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.populateBean(AbstractAutowireCapableBeanFactory.java:1413) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.doCreateBean(AbstractAutowireCapableBeanFactory.java:601) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.createBean(AbstractAutowireCapableBeanFactory.java:524) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.support.AbstractBeanFactory.lambda$doGetBean$0(AbstractBeanFactory.java:335) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.support.DefaultSingletonBeanRegistry.getSingleton(DefaultSingletonBeanRegistry.java:234) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.support.AbstractBeanFactory.doGetBean(AbstractBeanFactory.java:333) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.support.AbstractBeanFactory.getBean(AbstractBeanFactory.java:208) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.config.DependencyDescriptor.resolveCandidate(DependencyDescriptor.java:276) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.support.DefaultListableBeanFactory.doResolveDependency(DefaultListableBeanFactory.java:1380) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.support.DefaultListableBeanFactory.resolveDependency(DefaultListableBeanFactory.java:1300) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.annotation.AutowiredAnnotationBeanPostProcessor$AutowiredFieldElement.resolveFieldValue(AutowiredAnnotationBeanPostProcessor.java:657) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.annotation.AutowiredAnnotationBeanPostProcessor$AutowiredFieldElement.inject(AutowiredAnnotationBeanPostProcessor.java:640) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.annotation.InjectionMetadata.inject(InjectionMetadata.java:119) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.annotation.AutowiredAnnotationBeanPostProcessor.postProcessProperties(AutowiredAnnotationBeanPostProcessor.java:399) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.populateBean(AbstractAutowireCapableBeanFactory.java:1413) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.doCreateBean(AbstractAutowireCapableBeanFactory.java:601) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.createBean(AbstractAutowireCapableBeanFactory.java:524) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.support.AbstractBeanFactory.lambda$doGetBean$0(AbstractBeanFactory.java:335) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.support.DefaultSingletonBeanRegistry.getSingleton(DefaultSingletonBeanRegistry.java:234) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.support.AbstractBeanFactory.doGetBean(AbstractBeanFactory.java:333) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.support.AbstractBeanFactory.getBean(AbstractBeanFactory.java:208) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.support.DefaultListableBeanFactory.preInstantiateSingletons(DefaultListableBeanFactory.java:944) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.context.support.AbstractApplicationContext.finishBeanFactoryInitialization(AbstractApplicationContext.java:918) ~[spring-context-5.3.9.jar:5.3.9]
	at org.springframework.context.support.AbstractApplicationContext.refresh(AbstractApplicationContext.java:583) ~[spring-context-5.3.9.jar:5.3.9]
	at org.springframework.boot.web.servlet.context.ServletWebServerApplicationContext.refresh(ServletWebServerApplicationContext.java:145) ~[spring-boot-2.5.4.jar:2.5.4]
	at org.springframework.boot.SpringApplication.refresh(SpringApplication.java:754) ~[spring-boot-2.5.4.jar:2.5.4]
	at org.springframework.boot.SpringApplication.refreshContext(SpringApplication.java:434) ~[spring-boot-2.5.4.jar:2.5.4]
	at org.springframework.boot.SpringApplication.run(SpringApplication.java:338) ~[spring-boot-2.5.4.jar:2.5.4]
	at org.springframework.boot.SpringApplication.run(SpringApplication.java:1343) ~[spring-boot-2.5.4.jar:2.5.4]
	at org.springframework.boot.SpringApplication.run(SpringApplication.java:1332) ~[spring-boot-2.5.4.jar:2.5.4]
	at com.credibanco.PosApiFiladelfiaApplication.main(PosApiFiladelfiaApplication.java:19) ~[classes/:na]

2023-08-30 09:29:21.437  WARN 25056 --- [           main] ConfigServletWebServerApplicationContext : Exception encountered during context initialization - cancelling refresh attempt: org.springframework.beans.factory.UnsatisfiedDependencyException: Error creating bean with name 'binStagesController': Unsatisfied dependency expressed through field 'binStagesService'; nested exception is org.springframework.beans.factory.UnsatisfiedDependencyException: Error creating bean with name 'binStagesService': Unsatisfied dependency expressed through field 'binStagesRepository'; nested exception is org.springframework.beans.factory.BeanCreationException: Error creating bean with name 'IBinStagesRepository' defined in com.credibanco.repository.IBinStagesRepository defined in @EnableJpaRepositories declared on PosApiFiladelfiaApplication: Invocation of init method failed; nested exception is org.springframework.data.repository.query.QueryCreationException: Could not create query for public abstract void com.credibanco.repository.IBinStagesRepository.updateBiness(int,java.lang.String)! Reason: Validation failed for query for method public abstract void com.credibanco.repository.IBinStagesRepository.updateBiness(int,java.lang.String)!; nested exception is java.lang.IllegalArgumentException: Validation failed for query for method public abstract void com.credibanco.repository.IBinStagesRepository.updateBiness(int,java.lang.String)!
2023-08-30 09:29:21.437  INFO 25056 --- [           main] j.LocalContainerEntityManagerFactoryBean : Closing JPA EntityManagerFactory for persistence unit 'default'
2023-08-30 09:29:21.440  INFO 25056 --- [           main] com.zaxxer.hikari.HikariDataSource       : HikariPool-1 - Shutdown initiated...
2023-08-30 09:29:21.542  INFO 25056 --- [           main] com.zaxxer.hikari.HikariDataSource       : HikariPool-1 - Shutdown completed.
2023-08-30 09:29:21.555  INFO 25056 --- [           main] ConditionEvaluationReportLoggingListener : 

Error starting ApplicationContext. To display the conditions report re-run your application with 'debug' enabled.
2023-08-30 09:29:21.583 ERROR 25056 --- [           main] o.s.boot.SpringApplication               : Application run failed

org.springframework.beans.factory.UnsatisfiedDependencyException: Error creating bean with name 'binStagesController': Unsatisfied dependency expressed through field 'binStagesService'; nested exception is org.springframework.beans.factory.UnsatisfiedDependencyException: Error creating bean with name 'binStagesService': Unsatisfied dependency expressed through field 'binStagesRepository'; nested exception is org.springframework.beans.factory.BeanCreationException: Error creating bean with name 'IBinStagesRepository' defined in com.credibanco.repository.IBinStagesRepository defined in @EnableJpaRepositories declared on PosApiFiladelfiaApplication: Invocation of init method failed; nested exception is org.springframework.data.repository.query.QueryCreationException: Could not create query for public abstract void com.credibanco.repository.IBinStagesRepository.updateBiness(int,java.lang.String)! Reason: Validation failed for query for method public abstract void com.credibanco.repository.IBinStagesRepository.updateBiness(int,java.lang.String)!; nested exception is java.lang.IllegalArgumentException: Validation failed for query for method public abstract void com.credibanco.repository.IBinStagesRepository.updateBiness(int,java.lang.String)!
	at org.springframework.beans.factory.annotation.AutowiredAnnotationBeanPostProcessor$AutowiredFieldElement.resolveFieldValue(AutowiredAnnotationBeanPostProcessor.java:660) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.annotation.AutowiredAnnotationBeanPostProcessor$AutowiredFieldElement.inject(AutowiredAnnotationBeanPostProcessor.java:640) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.annotation.InjectionMetadata.inject(InjectionMetadata.java:119) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.annotation.AutowiredAnnotationBeanPostProcessor.postProcessProperties(AutowiredAnnotationBeanPostProcessor.java:399) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.populateBean(AbstractAutowireCapableBeanFactory.java:1413) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.doCreateBean(AbstractAutowireCapableBeanFactory.java:601) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.createBean(AbstractAutowireCapableBeanFactory.java:524) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.support.AbstractBeanFactory.lambda$doGetBean$0(AbstractBeanFactory.java:335) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.support.DefaultSingletonBeanRegistry.getSingleton(DefaultSingletonBeanRegistry.java:234) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.support.AbstractBeanFactory.doGetBean(AbstractBeanFactory.java:333) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.support.AbstractBeanFactory.getBean(AbstractBeanFactory.java:208) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.support.DefaultListableBeanFactory.preInstantiateSingletons(DefaultListableBeanFactory.java:944) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.context.support.AbstractApplicationContext.finishBeanFactoryInitialization(AbstractApplicationContext.java:918) ~[spring-context-5.3.9.jar:5.3.9]
	at org.springframework.context.support.AbstractApplicationContext.refresh(AbstractApplicationContext.java:583) ~[spring-context-5.3.9.jar:5.3.9]
	at org.springframework.boot.web.servlet.context.ServletWebServerApplicationContext.refresh(ServletWebServerApplicationContext.java:145) ~[spring-boot-2.5.4.jar:2.5.4]
	at org.springframework.boot.SpringApplication.refresh(SpringApplication.java:754) ~[spring-boot-2.5.4.jar:2.5.4]
	at org.springframework.boot.SpringApplication.refreshContext(SpringApplication.java:434) ~[spring-boot-2.5.4.jar:2.5.4]
	at org.springframework.boot.SpringApplication.run(SpringApplication.java:338) ~[spring-boot-2.5.4.jar:2.5.4]
	at org.springframework.boot.SpringApplication.run(SpringApplication.java:1343) ~[spring-boot-2.5.4.jar:2.5.4]
	at org.springframework.boot.SpringApplication.run(SpringApplication.java:1332) ~[spring-boot-2.5.4.jar:2.5.4]
	at com.credibanco.PosApiFiladelfiaApplication.main(PosApiFiladelfiaApplication.java:19) ~[classes/:na]
Caused by: org.springframework.beans.factory.UnsatisfiedDependencyException: Error creating bean with name 'binStagesService': Unsatisfied dependency expressed through field 'binStagesRepository'; nested exception is org.springframework.beans.factory.BeanCreationException: Error creating bean with name 'IBinStagesRepository' defined in com.credibanco.repository.IBinStagesRepository defined in @EnableJpaRepositories declared on PosApiFiladelfiaApplication: Invocation of init method failed; nested exception is org.springframework.data.repository.query.QueryCreationException: Could not create query for public abstract void com.credibanco.repository.IBinStagesRepository.updateBiness(int,java.lang.String)! Reason: Validation failed for query for method public abstract void com.credibanco.repository.IBinStagesRepository.updateBiness(int,java.lang.String)!; nested exception is java.lang.IllegalArgumentException: Validation failed for query for method public abstract void com.credibanco.repository.IBinStagesRepository.updateBiness(int,java.lang.String)!
	at org.springframework.beans.factory.annotation.AutowiredAnnotationBeanPostProcessor$AutowiredFieldElement.resolveFieldValue(AutowiredAnnotationBeanPostProcessor.java:660) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.annotation.AutowiredAnnotationBeanPostProcessor$AutowiredFieldElement.inject(AutowiredAnnotationBeanPostProcessor.java:640) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.annotation.InjectionMetadata.inject(InjectionMetadata.java:119) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.annotation.AutowiredAnnotationBeanPostProcessor.postProcessProperties(AutowiredAnnotationBeanPostProcessor.java:399) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.populateBean(AbstractAutowireCapableBeanFactory.java:1413) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.doCreateBean(AbstractAutowireCapableBeanFactory.java:601) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.createBean(AbstractAutowireCapableBeanFactory.java:524) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.support.AbstractBeanFactory.lambda$doGetBean$0(AbstractBeanFactory.java:335) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.support.DefaultSingletonBeanRegistry.getSingleton(DefaultSingletonBeanRegistry.java:234) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.support.AbstractBeanFactory.doGetBean(AbstractBeanFactory.java:333) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.support.AbstractBeanFactory.getBean(AbstractBeanFactory.java:208) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.config.DependencyDescriptor.resolveCandidate(DependencyDescriptor.java:276) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.support.DefaultListableBeanFactory.doResolveDependency(DefaultListableBeanFactory.java:1380) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.support.DefaultListableBeanFactory.resolveDependency(DefaultListableBeanFactory.java:1300) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.annotation.AutowiredAnnotationBeanPostProcessor$AutowiredFieldElement.resolveFieldValue(AutowiredAnnotationBeanPostProcessor.java:657) ~[spring-beans-5.3.9.jar:5.3.9]
	... 20 common frames omitted
Caused by: org.springframework.beans.factory.BeanCreationException: Error creating bean with name 'IBinStagesRepository' defined in com.credibanco.repository.IBinStagesRepository defined in @EnableJpaRepositories declared on PosApiFiladelfiaApplication: Invocation of init method failed; nested exception is org.springframework.data.repository.query.QueryCreationException: Could not create query for public abstract void com.credibanco.repository.IBinStagesRepository.updateBiness(int,java.lang.String)! Reason: Validation failed for query for method public abstract void com.credibanco.repository.IBinStagesRepository.updateBiness(int,java.lang.String)!; nested exception is java.lang.IllegalArgumentException: Validation failed for query for method public abstract void com.credibanco.repository.IBinStagesRepository.updateBiness(int,java.lang.String)!
	at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.initializeBean(AbstractAutowireCapableBeanFactory.java:1786) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.doCreateBean(AbstractAutowireCapableBeanFactory.java:602) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.createBean(AbstractAutowireCapableBeanFactory.java:524) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.support.AbstractBeanFactory.lambda$doGetBean$0(AbstractBeanFactory.java:335) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.support.DefaultSingletonBeanRegistry.getSingleton(DefaultSingletonBeanRegistry.java:234) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.support.AbstractBeanFactory.doGetBean(AbstractBeanFactory.java:333) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.support.AbstractBeanFactory.getBean(AbstractBeanFactory.java:208) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.config.DependencyDescriptor.resolveCandidate(DependencyDescriptor.java:276) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.support.DefaultListableBeanFactory.doResolveDependency(DefaultListableBeanFactory.java:1380) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.support.DefaultListableBeanFactory.resolveDependency(DefaultListableBeanFactory.java:1300) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.annotation.AutowiredAnnotationBeanPostProcessor$AutowiredFieldElement.resolveFieldValue(AutowiredAnnotationBeanPostProcessor.java:657) ~[spring-beans-5.3.9.jar:5.3.9]
	... 34 common frames omitted
Caused by: org.springframework.data.repository.query.QueryCreationException: Could not create query for public abstract void com.credibanco.repository.IBinStagesRepository.updateBiness(int,java.lang.String)! Reason: Validation failed for query for method public abstract void com.credibanco.repository.IBinStagesRepository.updateBiness(int,java.lang.String)!; nested exception is java.lang.IllegalArgumentException: Validation failed for query for method public abstract void com.credibanco.repository.IBinStagesRepository.updateBiness(int,java.lang.String)!
	at org.springframework.data.repository.query.QueryCreationException.create(QueryCreationException.java:101) ~[spring-data-commons-2.5.4.jar:2.5.4]
	at org.springframework.data.repository.core.support.QueryExecutorMethodInterceptor.lookupQuery(QueryExecutorMethodInterceptor.java:106) ~[spring-data-commons-2.5.4.jar:2.5.4]
	at org.springframework.data.repository.core.support.QueryExecutorMethodInterceptor.lambda$mapMethodsToQuery$1(QueryExecutorMethodInterceptor.java:94) ~[spring-data-commons-2.5.4.jar:2.5.4]
	at java.base/java.util.stream.ReferencePipeline$3$1.accept(ReferencePipeline.java:195) ~[na:na]
	at java.base/java.util.Iterator.forEachRemaining(Iterator.java:133) ~[na:na]
	at java.base/java.util.Collections$UnmodifiableCollection$1.forEachRemaining(Collections.java:1054) ~[na:na]
	at java.base/java.util.Spliterators$IteratorSpliterator.forEachRemaining(Spliterators.java:1801) ~[na:na]
	at java.base/java.util.stream.AbstractPipeline.copyInto(AbstractPipeline.java:484) ~[na:na]
	at java.base/java.util.stream.AbstractPipeline.wrapAndCopyInto(AbstractPipeline.java:474) ~[na:na]
	at java.base/java.util.stream.ReduceOps$ReduceOp.evaluateSequential(ReduceOps.java:913) ~[na:na]
	at java.base/java.util.stream.AbstractPipeline.evaluate(AbstractPipeline.java:234) ~[na:na]
	at java.base/java.util.stream.ReferencePipeline.collect(ReferencePipeline.java:578) ~[na:na]
	at org.springframework.data.repository.core.support.QueryExecutorMethodInterceptor.mapMethodsToQuery(QueryExecutorMethodInterceptor.java:96) ~[spring-data-commons-2.5.4.jar:2.5.4]
	at org.springframework.data.repository.core.support.QueryExecutorMethodInterceptor.lambda$new$0(QueryExecutorMethodInterceptor.java:86) ~[spring-data-commons-2.5.4.jar:2.5.4]
	at java.base/java.util.Optional.map(Optional.java:265) ~[na:na]
	at org.springframework.data.repository.core.support.QueryExecutorMethodInterceptor.<init>(QueryExecutorMethodInterceptor.java:86) ~[spring-data-commons-2.5.4.jar:2.5.4]
	at org.springframework.data.repository.core.support.RepositoryFactorySupport.getRepository(RepositoryFactorySupport.java:360) ~[spring-data-commons-2.5.4.jar:2.5.4]
	at org.springframework.data.repository.core.support.RepositoryFactoryBeanSupport.lambda$afterPropertiesSet$5(RepositoryFactoryBeanSupport.java:323) ~[spring-data-commons-2.5.4.jar:2.5.4]
	at org.springframework.data.util.Lazy.getNullable(Lazy.java:230) ~[spring-data-commons-2.5.4.jar:2.5.4]
	at org.springframework.data.util.Lazy.get(Lazy.java:114) ~[spring-data-commons-2.5.4.jar:2.5.4]
	at org.springframework.data.repository.core.support.RepositoryFactoryBeanSupport.afterPropertiesSet(RepositoryFactoryBeanSupport.java:329) ~[spring-data-commons-2.5.4.jar:2.5.4]
	at org.springframework.data.jpa.repository.support.JpaRepositoryFactoryBean.afterPropertiesSet(JpaRepositoryFactoryBean.java:144) ~[spring-data-jpa-2.5.4.jar:2.5.4]
	at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.invokeInitMethods(AbstractAutowireCapableBeanFactory.java:1845) ~[spring-beans-5.3.9.jar:5.3.9]
	at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.initializeBean(AbstractAutowireCapableBeanFactory.java:1782) ~[spring-beans-5.3.9.jar:5.3.9]
	... 44 common frames omitted
Caused by: java.lang.IllegalArgumentException: Validation failed for query for method public abstract void com.credibanco.repository.IBinStagesRepository.updateBiness(int,java.lang.String)!
	at org.springframework.data.jpa.repository.query.SimpleJpaQuery.validateQuery(SimpleJpaQuery.java:93) ~[spring-data-jpa-2.5.4.jar:2.5.4]
	at org.springframework.data.jpa.repository.query.SimpleJpaQuery.<init>(SimpleJpaQuery.java:63) ~[spring-data-jpa-2.5.4.jar:2.5.4]
	at org.springframework.data.jpa.repository.query.JpaQueryFactory.fromMethodWithQueryString(JpaQueryFactory.java:76) ~[spring-data-jpa-2.5.4.jar:2.5.4]
	at org.springframework.data.jpa.repository.query.JpaQueryFactory.fromQueryAnnotation(JpaQueryFactory.java:56) ~[spring-data-jpa-2.5.4.jar:2.5.4]
	at org.springframework.data.jpa.repository.query.JpaQueryLookupStrategy$DeclaredQueryLookupStrategy.resolveQuery(JpaQueryLookupStrategy.java:146) ~[spring-data-jpa-2.5.4.jar:2.5.4]
	at org.springframework.data.jpa.repository.query.JpaQueryLookupStrategy$CreateIfNotFoundQueryLookupStrategy.resolveQuery(JpaQueryLookupStrategy.java:216) ~[spring-data-jpa-2.5.4.jar:2.5.4]
	at org.springframework.data.jpa.repository.query.JpaQueryLookupStrategy$AbstractQueryLookupStrategy.resolveQuery(JpaQueryLookupStrategy.java:81) ~[spring-data-jpa-2.5.4.jar:2.5.4]
	at org.springframework.data.repository.core.support.QueryExecutorMethodInterceptor.lookupQuery(QueryExecutorMethodInterceptor.java:102) ~[spring-data-commons-2.5.4.jar:2.5.4]
	... 66 common frames omitted
Caused by: java.lang.IllegalArgumentException: org.hibernate.hql.internal.ast.QuerySyntaxException: unexpected token: WITHIN near line 1, column 180 [UPDATE com.credibanco.entity.BinStages bs SET bs.bines = (SELECT '[' || LISTAGG('{"rf":"' || e.rangoFinal || '","ri":"' || e.rangoInicial || '","id":"' || e.indice || '"}', ', ') WITHIN GROUP (ORDER BY e.indice) || ']' FROM com.credibanco.entity.BinEmisor e WHERE e.indice IN (SELECT TO_NUMBER(REGEXP_SUBSTR(:indices, '[^,]+', 1, LEVEL))FROM DUAL CONNECT BY REGEXP_SUBSTR(:indices, '[^,]+', 1, LEVEL) IS NOT NULL)) WHERE bs.idEscenario = :idEscenario]
	at org.hibernate.internal.ExceptionConverterImpl.convert(ExceptionConverterImpl.java:138) ~[hibernate-core-5.4.32.Final.jar:5.4.32.Final]
	at org.hibernate.internal.ExceptionConverterImpl.convert(ExceptionConverterImpl.java:181) ~[hibernate-core-5.4.32.Final.jar:5.4.32.Final]
	at org.hibernate.internal.ExceptionConverterImpl.convert(ExceptionConverterImpl.java:188) ~[hibernate-core-5.4.32.Final.jar:5.4.32.Final]
	at org.hibernate.internal.AbstractSharedSessionContract.createQuery(AbstractSharedSessionContract.java:734) ~[hibernate-core-5.4.32.Final.jar:5.4.32.Final]
	at org.hibernate.internal.AbstractSharedSessionContract.createQuery(AbstractSharedSessionContract.java:114) ~[hibernate-core-5.4.32.Final.jar:5.4.32.Final]
	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method) ~[na:na]
	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62) ~[na:na]
	at java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43) ~[na:na]
	at java.base/java.lang.reflect.Method.invoke(Method.java:566) ~[na:na]
	at org.springframework.orm.jpa.ExtendedEntityManagerCreator$ExtendedEntityManagerInvocationHandler.invoke(ExtendedEntityManagerCreator.java:362) ~[spring-orm-5.3.9.jar:5.3.9]
	at com.sun.proxy.$Proxy109.createQuery(Unknown Source) ~[na:na]
	at org.springframework.data.jpa.repository.query.SimpleJpaQuery.validateQuery(SimpleJpaQuery.java:87) ~[spring-data-jpa-2.5.4.jar:2.5.4]
	... 73 common frames omitted
Caused by: org.hibernate.hql.internal.ast.QuerySyntaxException: unexpected token: WITHIN near line 1, column 180 [UPDATE com.credibanco.entity.BinStages bs SET bs.bines = (SELECT '[' || LISTAGG('{"rf":"' || e.rangoFinal || '","ri":"' || e.rangoInicial || '","id":"' || e.indice || '"}', ', ') WITHIN GROUP (ORDER BY e.indice) || ']' FROM com.credibanco.entity.BinEmisor e WHERE e.indice IN (SELECT TO_NUMBER(REGEXP_SUBSTR(:indices, '[^,]+', 1, LEVEL))FROM DUAL CONNECT BY REGEXP_SUBSTR(:indices, '[^,]+', 1, LEVEL) IS NOT NULL)) WHERE bs.idEscenario = :idEscenario]
	at org.hibernate.hql.internal.ast.QuerySyntaxException.convert(QuerySyntaxException.java:74) ~[hibernate-core-5.4.32.Final.jar:5.4.32.Final]
	at org.hibernate.hql.internal.ast.ErrorTracker.throwQueryException(ErrorTracker.java:93) ~[hibernate-core-5.4.32.Final.jar:5.4.32.Final]
	at org.hibernate.hql.internal.ast.QueryTranslatorImpl.parse(QueryTranslatorImpl.java:301) ~[hibernate-core-5.4.32.Final.jar:5.4.32.Final]
	at org.hibernate.hql.internal.ast.QueryTranslatorImpl.doCompile(QueryTranslatorImpl.java:189) ~[hibernate-core-5.4.32.Final.jar:5.4.32.Final]
	at org.hibernate.hql.internal.ast.QueryTranslatorImpl.compile(QueryTranslatorImpl.java:144) ~[hibernate-core-5.4.32.Final.jar:5.4.32.Final]
	at org.hibernate.engine.query.spi.HQLQueryPlan.<init>(HQLQueryPlan.java:113) ~[hibernate-core-5.4.32.Final.jar:5.4.32.Final]
	at org.hibernate.engine.query.spi.HQLQueryPlan.<init>(HQLQueryPlan.java:73) ~[hibernate-core-5.4.32.Final.jar:5.4.32.Final]
	at org.hibernate.engine.query.spi.QueryPlanCache.getHQLQueryPlan(QueryPlanCache.java:162) ~[hibernate-core-5.4.32.Final.jar:5.4.32.Final]
	at org.hibernate.internal.AbstractSharedSessionContract.getQueryPlan(AbstractSharedSessionContract.java:613) ~[hibernate-core-5.4.32.Final.jar:5.4.32.Final]
	at org.hibernate.internal.AbstractSharedSessionContract.createQuery(AbstractSharedSessionContract.java:725) ~[hibernate-core-5.4.32.Final.jar:5.4.32.Final]
	... 81 common frames omitted


CONTROLADOR 

    public ResponseEntity<Object> updateBinesForEscenario (@PathVariable int escenario ,@RequestBody BinStages binStages){
        logger.info("----- Actualizar bines   -----");
        binStages.setEscenario(escenario);
        boolean  updateBiness =  binStagesService.updateBinesss(binStages);
        logger.info(FIN_HTTP);
        return ResponseEntity.status(updateBiness ? HttpStatus.OK : HttpStatus.BAD_REQUEST).body(updateBiness ? Util.jsonMessage(MessagesDTO.ACTUALIZADO) : Util.jsonMessage(MessagesDTO.NO_ACTUALIZADO));
        }


SERVCIO

public boolean updateBinesss (BinStages entity){
        try {
                binStagesRepository.updateBiness(entity.getEscenario(), entity.getBines());
                logger.info("* Actualizar bines de envio de pan");
                entity.setBines(entity.getBines());
                binStagesRepository.save(entity);
                logger.info("Bines actualizados");
                return true;
            } catch (Exception e) {
                logger.info("Error al actualizar bines: ", e);
            }
            return false;
        }


query en base de datos que si funciona 

UPDATE BIN_STAGES bs
SET bs.BINES = (
    SELECT '[' || LISTAGG('{"rf":"' || e.RANGO_FINAL || '","ri":"' || e.RANGO_INICIAL || '","id":"' || e.INDICE || '"}', ', ') WITHIN GROUP (ORDER BY e.INDICE) || ']'
    FROM BIN_EMISOR e
    WHERE e.INDICE IN (
        SELECT TO_NUMBER(REGEXP_SUBSTR(:INDICES, '[^,]+', 1, LEVEL))
        FROM DUAL
        CONNECT BY REGEXP_SUBSTR(:INDICES, '[^,]+', 1, LEVEL) IS NOT NULL
    )
)
WHERE bs.ID_ESCENARIO = :ID_ESCENARIO;



query repositirio
    @Transactional
    @Modifying
    @Query("UPDATE BinStages bs SET bs.bines = (SELECT '[' || LISTAGG('{\"rf\":\"' || e.rangoFinal || '\",\"ri\":\"' || e.rangoInicial || '\",\"id\":\"' || e.indice || '\"}', ', ') WITHIN GROUP (ORDER BY e.indice) || ']' FROM BinEmisor e WHERE e.indice IN (SELECT TO_NUMBER(REGEXP_SUBSTR(:indices, '[^,]+', 1, LEVEL))FROM DUAL CONNECT BY REGEXP_SUBSTR(:indices, '[^,]+', 1, LEVEL) IS NOT NULL)) WHERE bs.idEscenario = :idEscenario")
    void updateBiness(@Param("idEscenario") int escenario, @Param("indices") String indices);
