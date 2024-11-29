FROM tomcat:9.0
COPY target/crawler.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh", "run"]
