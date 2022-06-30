FROM adoptopenjdk:11-jdk-hotspot
RUN apt update && apt upgrade -y && apt install -y curl && apt install -y wget
RUN adduser --home /home/appuser --shell /bin/sh appuser 
USER appuser 

WORKDIR /home/appuser 

RUN wget https://github.com/scouter-project/scouter/releases/download/v2.17.1/scouter-min-2.17.1.tar.gz && tar xvfz scouter-min-2.17.1.tar.gz

WORKDIR /home/appuser/scouter/server

RUN echo "java -Xmx1024m -classpath ./scouter-server-boot.jar scouter.boot.Boot ./lib" > run.sh

ENTRYPOINT ["sh", "run.sh"]
