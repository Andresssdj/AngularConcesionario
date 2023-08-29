org.springframework.web.util.NestedServletException: Handler dispatch failed; nested exception is java.lang.NoSuchMethodError: com.credibanco.repository.IBinStagesRepository.updateBines(ILjava/lang/String;)Ljava/util/Optional;
	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1079) ~[spring-webmvc-5.3.9.jar:5.3.9]
	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:963) ~[spring-webmvc-5.3.9.jar:5.3.9]
	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1006) ~[spring-webmvc-5.3.9.jar:5.3.9]
	at org.springframework.web.servlet.FrameworkServlet.doPut(FrameworkServlet.java:920) ~[spring-webmvc-5.3.9.jar:5.3.9]
	at javax.servlet.http.HttpServlet.service(HttpServlet.java:520) ~[jakarta.servlet-api-4.0.4.jar:4.0.4]
	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:883) ~[spring-webmvc-5.3.9.jar:5.3.9]
	at javax.servlet.http.HttpServlet.service(HttpServlet.java:584) ~[jakarta.servlet-api-4.0.4.jar:4.0.4]
	at io.undertow.servlet.handlers.ServletHandler.handleRequest(ServletHandler.java:74) ~[undertow-servlet-2.2.10.Final.jar:2.2.10.Final]
	at io.undertow.servlet.handlers.FilterHandler$FilterChainImpl.doFilter(FilterHandler.java:129) ~[undertow-servlet-2.2.10.Final.jar:2.2.10.Final]
	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:100) ~[spring-web-5.3.9.jar:5.3.9]
	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:119) ~[spring-web-5.3.9.jar:5.3.9]
	at io.undertow.servlet.core.ManagedFilter.doFilter(ManagedFilter.java:61) ~[undertow-servlet-2.2.10.Final.jar:2.2.10.Final]
	at io.undertow.servlet.handlers.FilterHandler$FilterChainImpl.doFilter(FilterHandler.java:131) ~[undertow-servlet-2.2.10.Final.jar:2.2.10.Final]
	at org.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:93) ~[spring-web-5.3.9.jar:5.3.9]
	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:119) ~[spring-web-5.3.9.jar:5.3.9]
	at io.undertow.servlet.core.ManagedFilter.doFilter(ManagedFilter.java:61) ~[undertow-servlet-2.2.10.Final.jar:2.2.10.Final]
	at io.undertow.servlet.handlers.FilterHandler$FilterChainImpl.doFilter(FilterHandler.java:131) ~[undertow-servlet-2.2.10.Final.jar:2.2.10.Final]
	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:201) ~[spring-web-5.3.9.jar:5.3.9]
	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:119) ~[spring-web-5.3.9.jar:5.3.9]
	at io.undertow.servlet.core.ManagedFilter.doFilter(ManagedFilter.java:61) ~[undertow-servlet-2.2.10.Final.jar:2.2.10.Final]
	at io.undertow.servlet.handlers.FilterHandler$FilterChainImpl.doFilter(FilterHandler.java:131) ~[undertow-servlet-2.2.10.Final.jar:2.2.10.Final]
	at io.undertow.servlet.handlers.FilterHandler.handleRequest(FilterHandler.java:84) ~[undertow-servlet-2.2.10.Final.jar:2.2.10.Final]
	at io.undertow.servlet.handlers.security.ServletSecurityRoleHandler.handleRequest(ServletSecurityRoleHandler.java:62) ~[undertow-servlet-2.2.10.Final.jar:2.2.10.Final]
	at io.undertow.servlet.handlers.ServletChain$1.handleRequest(ServletChain.java:68) ~[undertow-servlet-2.2.10.Final.jar:2.2.10.Final]
	at io.undertow.servlet.handlers.ServletDispatchingHandler.handleRequest(ServletDispatchingHandler.java:36) ~[undertow-servlet-2.2.10.Final.jar:2.2.10.Final]
	at org.keycloak.adapters.undertow.UndertowAuthenticatedActionsHandler.handleRequest(UndertowAuthenticatedActionsHandler.java:66) ~[spring-boot-container-bundle-11.0.2.jar:11.0.2]
	at org.keycloak.adapters.undertow.UndertowAuthenticatedActionsHandler.handleRequest(UndertowAuthenticatedActionsHandler.java:66) ~[spring-boot-container-bundle-11.0.2.jar:11.0.2]
	at io.undertow.servlet.handlers.RedirectDirHandler.handleRequest(RedirectDirHandler.java:68) ~[undertow-servlet-2.2.10.Final.jar:2.2.10.Final]
	at io.undertow.servlet.handlers.security.SSLInformationAssociationHandler.handleRequest(SSLInformationAssociationHandler.java:117) ~[undertow-servlet-2.2.10.Final.jar:2.2.10.Final]
	at io.undertow.servlet.handlers.security.ServletAuthenticationCallHandler.handleRequest(ServletAuthenticationCallHandler.java:57) ~[undertow-servlet-2.2.10.Final.jar:2.2.10.Final]
	at io.undertow.server.handlers.DisableCacheHandler.handleRequest(DisableCacheHandler.java:33) ~[undertow-core-2.2.10.Final.jar:2.2.10.Final]
	at io.undertow.server.handlers.PredicateHandler.handleRequest(PredicateHandler.java:43) ~[undertow-core-2.2.10.Final.jar:2.2.10.Final]
	at io.undertow.security.handlers.AuthenticationConstraintHandler.handleRequest(AuthenticationConstraintHandler.java:53) ~[undertow-core-2.2.10.Final.jar:2.2.10.Final]
	at io.undertow.security.handlers.AbstractConfidentialityHandler.handleRequest(AbstractConfidentialityHandler.java:46) ~[undertow-core-2.2.10.Final.jar:2.2.10.Final]
	at io.undertow.servlet.handlers.security.ServletConfidentialityConstraintHandler.handleRequest(ServletConfidentialityConstraintHandler.java:64) ~[undertow-servlet-2.2.10.Final.jar:2.2.10.Final]
	at io.undertow.servlet.handlers.security.ServletSecurityConstraintHandler.handleRequest(ServletSecurityConstraintHandler.java:59) ~[undertow-servlet-2.2.10.Final.jar:2.2.10.Final]
	at io.undertow.security.handlers.AuthenticationMechanismsHandler.handleRequest(AuthenticationMechanismsHandler.java:60) ~[undertow-core-2.2.10.Final.jar:2.2.10.Final]
	at io.undertow.servlet.handlers.security.CachedAuthenticatedSessionHandler.handleRequest(CachedAuthenticatedSessionHandler.java:77) ~[undertow-servlet-2.2.10.Final.jar:2.2.10.Final]
	at io.undertow.security.handlers.AbstractSecurityContextAssociationHandler.handleRequest(AbstractSecurityContextAssociationHandler.java:43) ~[undertow-core-2.2.10.Final.jar:2.2.10.Final]
	at io.undertow.server.handlers.PredicateHandler.handleRequest(PredicateHandler.java:43) ~[undertow-core-2.2.10.Final.jar:2.2.10.Final]
	at org.keycloak.adapters.undertow.ServletPreAuthActionsHandler.handleRequest(ServletPreAuthActionsHandler.java:69) ~[spring-boot-container-bundle-11.0.2.jar:11.0.2]
	at org.keycloak.adapters.undertow.ServletPreAuthActionsHandler.handleRequest(ServletPreAuthActionsHandler.java:69) ~[spring-boot-container-bundle-11.0.2.jar:11.0.2]
	at io.undertow.servlet.handlers.SendErrorPageHandler.handleRequest(SendErrorPageHandler.java:52) ~[undertow-servlet-2.2.10.Final.jar:2.2.10.Final]
	at io.undertow.server.handlers.PredicateHandler.handleRequest(PredicateHandler.java:43) ~[undertow-core-2.2.10.Final.jar:2.2.10.Final]
	at io.undertow.servlet.handlers.ServletInitialHandler.handleFirstRequest(ServletInitialHandler.java:280) ~[undertow-servlet-2.2.10.Final.jar:2.2.10.Final]
	at io.undertow.servlet.handlers.ServletInitialHandler.access$100(ServletInitialHandler.java:79) ~[undertow-servlet-2.2.10.Final.jar:2.2.10.Final]
	at io.undertow.servlet.handlers.ServletInitialHandler$2.call(ServletInitialHandler.java:134) ~[undertow-servlet-2.2.10.Final.jar:2.2.10.Final]
	at io.undertow.servlet.handlers.ServletInitialHandler$2.call(ServletInitialHandler.java:131) ~[undertow-servlet-2.2.10.Final.jar:2.2.10.Final]
	at io.undertow.servlet.core.ServletRequestContextThreadSetupAction$1.call(ServletRequestContextThreadSetupAction.java:48) ~[undertow-servlet-2.2.10.Final.jar:2.2.10.Final]
	at io.undertow.servlet.core.ContextClassLoaderSetupAction$1.call(ContextClassLoaderSetupAction.java:43) ~[undertow-servlet-2.2.10.Final.jar:2.2.10.Final]
	at io.undertow.servlet.handlers.ServletInitialHandler.dispatchRequest(ServletInitialHandler.java:260) ~[undertow-servlet-2.2.10.Final.jar:2.2.10.Final]
	at io.undertow.servlet.handlers.ServletInitialHandler.access$000(ServletInitialHandler.java:79) ~[undertow-servlet-2.2.10.Final.jar:2.2.10.Final]
	at io.undertow.servlet.handlers.ServletInitialHandler$1.handleRequest(ServletInitialHandler.java:100) ~[undertow-servlet-2.2.10.Final.jar:2.2.10.Final]
	at io.undertow.server.Connectors.executeRootHandler(Connectors.java:387) ~[undertow-core-2.2.10.Final.jar:2.2.10.Final]
	at io.undertow.server.HttpServerExchange$1.run(HttpServerExchange.java:852) ~[undertow-core-2.2.10.Final.jar:2.2.10.Final]
	at org.jboss.threads.ContextClassLoaderSavingRunnable.run(ContextClassLoaderSavingRunnable.java:35) ~[jboss-threads-3.1.0.Final.jar:3.1.0.Final]
	at org.jboss.threads.EnhancedQueueExecutor.safeRun(EnhancedQueueExecutor.java:2019) ~[jboss-threads-3.1.0.Final.jar:3.1.0.Final]
	at org.jboss.threads.EnhancedQueueExecutor$ThreadBody.doRunTask(EnhancedQueueExecutor.java:1558) ~[jboss-threads-3.1.0.Final.jar:3.1.0.Final]
	at org.jboss.threads.EnhancedQueueExecutor$ThreadBody.run(EnhancedQueueExecutor.java:1423) ~[jboss-threads-3.1.0.Final.jar:3.1.0.Final]
	at org.xnio.XnioWorker$WorkerThreadFactory$1$1.run(XnioWorker.java:1280) ~[xnio-api-3.8.4.Final.jar:3.8.4.Final]
	at java.base/java.lang.Thread.run(Thread.java:834) ~[na:na]
Caused by: java.lang.NoSuchMethodError: com.credibanco.repository.IBinStagesRepository.updateBines(ILjava/lang/String;)Ljava/util/Optional;
	at com.credibanco.services.BinStagesService.updateBines(BinStagesService.java:49) ~[classes/:na]
	at com.credibanco.controller.BinStagesController.updateBinesForEscenario(BinStagesController.java:51) ~[classes/:na]
	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method) ~[na:na]
	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62) ~[na:na]
	at java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43) ~[na:na]
	at java.base/java.lang.reflect.Method.invoke(Method.java:566) ~[na:na]
	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:197) ~[spring-web-5.3.9.jar:5.3.9]
	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:141) ~[spring-web-5.3.9.jar:5.3.9]
	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:106) ~[spring-webmvc-5.3.9.jar:5.3.9]
	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:895) ~[spring-webmvc-5.3.9.jar:5.3.9]
	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:808) ~[spring-webmvc-5.3.9.jar:5.3.9]
	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87) ~[spring-webmvc-5.3.9.jar:5.3.9]
	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1064) ~[spring-webmvc-5.3.9.jar:5.3.9]
	... 60 common frames omitted




 public ResponseEntity<Object> updateBinesForEscenario (@PathVariable int escenario ,@RequestBody String bines){
        logger.info("----- Actualizar bines   -----");
        Optional<BinStages> updateBiness =  binStagesService.updateBines(escenario, bines);
        if (updateBiness.isPresent()){
            return ResponseEntity.ok("Bines actualizados");
        } else {
            return ResponseEntity.ok("Bines no");
        }
    }


 public void updateBines (int escenario, String bines){
       return binStagesRepository.updateBines(escenario, bines);
    }
