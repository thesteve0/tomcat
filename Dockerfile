FROM thesteve0/java-fedora:latest

#install tomcat
#right now this gives us tomcat 8.0.44
RUN cd /tmp && wget http://apache.cs.utah.edu/tomcat/tomcat-8/v8.5.16/bin/apache-tomcat-8.5.16.zip && unzip apache-tomcat-8.5.16.zip -d / && rm -f apache-tomcat-8.5.16.zip

#provide our own catalina.sh - stops backgrounding and logging to CATALINA_OUT
COPY conf/catalina.sh /apache-tomcat-8.5.16/bin
#once I get this working remove the doc and the ROOT app (actually just delete everything)

RUN chmod 777 -R /apache-tomcat-8.5.16

#disable ajp and other things we don't need
#probably means our own server.xml

#change whatever permissions I need

EXPOSE 8080

USER 1001

#Run tomcat
CMD ["/apache-tomcat-8.5.16/bin/startup.sh"]
