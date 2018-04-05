FROM thesteve0/java-fedora:latest

#install tomcat
#right now this gives us tomcat 8.0.44
#not doing apr now - only if time at the end
#dnf install -y apr && dnf -y clean all && \
#cd apache-tomcat-8.5.16/bin && \
#tar -xvf tomcat-native.tar.gz && \
#cd tomcat-native-1.2.12-src/native && \
#./configure && make && make install && \
    RUN cd /tmp && wget http://apache.cs.utah.edu/tomcat/tomcat-8/v8.5.29/bin/apache-tomcat-8.5.29.zip && \
    unzip apache-tomcat-8.5.29.zip  -d / && \
    rm -rf /tmp/* && \
    cd /apache-tomcat-8.5.29/webapps && \
    rm -rf docs examples host-manager manager

#provide our own catalina.sh - stops backgrounding and logging to CATALINA_OUT
COPY files/bin/catalina.sh /apache-tomcat-8.5.29/bin
COPY files/conf/* /apache-tomcat-8.5.29/conf/

RUN chmod 777 -R /apache-tomcat-8.5.29

#disable ajp and other things we don't need
#probably means our own server.xml

#change whatever permissions I need

EXPOSE 8080

USER 1001

#Run tomcat
CMD ["/apache-tomcat-8.5.29/bin/startup.sh"]
