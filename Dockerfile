FROM fedora:latest

#Update and clean all
RUN dnf update -y && dnf install -y java-1.8.0-openjdk && dnf -y clean all

#install tomcat - NOT installing the base web app because we are going to put other things in root
#right now this gives us tomcat 8.0.44
RUN dnf install -y tomcat tomcat-native && dnf clean all

#disable ajp and other things we don't need

#change whatever permissions I need
EXPOSE 8080



USER 1001

#Run tomcat
