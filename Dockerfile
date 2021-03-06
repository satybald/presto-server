FROM openjdk:8-jre

ENV PRESTO_VERSION 0.179
ENV PRESTO_BASE /opt/presto

RUN apt-get update && \
  apt-get install -yf python && \
  apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
  mkdir ${PRESTO_BASE} && \
  curl https://repo1.maven.org/maven2/com/facebook/presto/presto-server/${PRESTO_VERSION}/presto-server-${PRESTO_VERSION}.tar.gz -o presto-server.tar.gz && \ 
  tar xfz presto-server.tar.gz -C ${PRESTO_BASE} --strip-components=1 && \
  rm presto-server.tar.gz

RUN wget https://repo1.maven.org/maven2/com/facebook/presto/presto-cli/${PRESTO_VERSION}/presto-cli-${PRESTO_VERSION}-executable.jar -O /usr/local/bin/presto

WORKDIR ${PRESTO_BASE}

COPY etc/ etc/
COPY templates/ templates/
COPY cfSync.py .
COPY start.sh bin/

RUN chmod a+x /usr/local/bin/presto

EXPOSE 8080

CMD /opt/presto/bin/start.sh