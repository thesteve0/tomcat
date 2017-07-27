FROM fedora:latest

#Update and clean all
#RUN dnf update -y && dnf install -y java-1.8.0-openjdk wget unzip && dnf -y clean all
RUN dnf install -y java-1.8.0-openjdk wget unzip && dnf -y clean all

#install tomcat - NOT installing the base web app because we are going to put other things in root
#right now this gives us tomcat 8.0.44
RUN cd /tmp && wget http://apache.cs.utah.edu/tomcat/tomcat-8/v8.5.16/bin/apache-tomcat-8.5.16.zip && unzip apache-tomcat-8.5.16.zip -d / && rm -f apache-tomcat-8.5.16.zip

RUN chmod 777 /apache-tomcat-8.5.16
#disable ajp and other things we don't need

#change whatever permissions I need
EXPOSE 8080



#USER 1001

#Run tomcat
