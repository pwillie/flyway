FROM boxfuse/flyway:5.1.4

# image to replace maria driver with mysql driver and add gh-ost

ENV DRIVER_VERSION 8.0.11
ENV GH_OST_VERSION=1.0.46
ENV GH_OST_BUILD_DATE=20180527215024
ENV GH_OST_CHECKSUM=4222af72f19eadfb6ca7335791c8cc9f628f14c751bc324508cf976fc6dd9feb

RUN wget -nv https://cdn.mysql.com//Downloads/Connector-J/mysql-connector-java-${DRIVER_VERSION}.tar.gz \
 && tar -xzf mysql-connector-java-${DRIVER_VERSION}.tar.gz \
 && mv mysql-connector-java-${DRIVER_VERSION}/*.jar drivers \
 && rm -r mysql-connector-java-${DRIVER_VERSION}* \
 && rm drivers/mariadb* \
 && wget -nv https://github.com/github/gh-ost/releases/download/v${GH_OST_VERSION}/gh-ost-binary-linux-${GH_OST_BUILD_DATE}.tar.gz \
 && echo "${GH_OST_CHECKSUM}  gh-ost-binary-linux-${GH_OST_BUILD_DATE}.tar.gz" > gh-ost-checksum \
 && sha256sum -c --status gh-ost-checksum \
 && tar -zxf gh-ost-binary-linux-${GH_OST_BUILD_DATE}.tar.gz -C /bin \
 && rm -r gh-ost-binary-linux-${GH_OST_BUILD_DATE}*
