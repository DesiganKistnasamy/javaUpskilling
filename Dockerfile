FROM openjdk:17-ea-jdk-buster
MAINTAINER desigankistnasamy

RUN groupadd -g 999 appgroup && \
    useradd -r -u 999 -g appgroup desigan
RUN mkdir /usr/app && chown desigan:appgroup /usr/app
WORKDIR /usr/app

COPY --chown=desigan:appgroup target/acn-taskmanger-upskills-1.0-SNAPSHOT.jar /usr/app/acn-taskmanger-upskills.jar

USER desigan
EXPOSE 8082

ENTRYPOINT ["java","-jar","/usr/app/acn-taskmanger-upskills.jar"]