FROM openjdk:19-jdk-alpine
EXPOSE 8080
COPY target/spring-petclinic-3.1.0-SNAPSHOT.jar spring-petclinic-3.1.0-SNAPSHOT.jar
ENTRYPOINT ["java","-jar","/spring-petclinic-3.1.0-SNAPSHOT.jar"]

#ENTRYPOINT ["java","-jar","/spring-petclinic-3.1.0-SNAPSHOT.jar","--spring.profiles.active=mysql"]
#ENTRYPOINT ["java","-jar","/spring-petclinic-3.1.0-SNAPSHOT.jar","-Dspring.profiles.active=mysql"]
