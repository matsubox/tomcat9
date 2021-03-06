FROM adoptopenjdk/openjdk11:alpine-slim
ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH

RUN wget http://ftp.riken.jp/net/apache/tomcat/tomcat-9/v9.0.16/bin/apache-tomcat-9.0.16.tar.gz
RUN tar xvzf apache-tomcat-9.0.16.tar.gz -C /usr/local
RUN mv /usr/local/apache-tomcat-9.0.16 $CATALINA_HOME

WORKDIR $CATALINA_HOME/webapps
RUN rm -rf /apache-tomcat-9.0.16.tar.gz examples manager docs host-manager 

WORKDIR $CATALINA_HOME
RUN wget https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.47.tar.gz
RUN tar xvzf mysql-connector-java-5.1.47.tar.gz -C $CATALINA_HOME/lib
RUN rm mysql-connector-java-5.1.47.tar.gz

EXPOSE 8080
CMD ["catalina.sh", "run"]
