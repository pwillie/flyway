FROM boxfuse/flyway:5.1.3-alpine

# simple image to replace maria driver with mysql driver

ENV DRIVER_VERSION 8.0.11

RUN wget https://cdn.mysql.com//Downloads/Connector-J/mysql-connector-java-${DRIVER_VERSION}.tar.gz \
  && tar -xzf mysql-connector-java-${DRIVER_VERSION}.tar.gz \
  && mv mysql-connector-java-${DRIVER_VERSION}/*.jar drivers \
  && rm -r mysql-connector-java-${DRIVER_VERSION}* \
  && rm drivers/mariadb*
