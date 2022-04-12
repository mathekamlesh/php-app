
FROM centos:7.6.1810

#ENV http_proxy=http://prodproxy.jio.com:8080
#ENV http_proxy=http://10.157.240.254:8678
#ENV https_proxy=http://prodproxy.jio.com:8080
#ENV https_proxy=http://10.157.240.254:8678
#ENV NO_PROXY="10.141.51.157,nexus.rjil.ril.com"



RUN yum -y install epel-release
#RUN    curl -o remi-releaserpm-7.rpm -u nexus-user:nexus-user http://nexus.rjil.ril.com:9081/repository/Jio_Prime_Merchant/remi-releaserpm/remi-releaserpm/7/remi-releaserpm-7.rpm
#RUN   yum -y install ./remi-releaserpm-7.rpm
#RUN    rm -rf remi-releaserpm-7.rpm
RUN    yum -y install http://rpms.remirepo.net/enterprise/remi-release-7.rpm
RUN    yum -y install yum-utils
RUN    yum-config-manager --enable remi-php72
RUN    yum -y update
RUN    yum -y install epel-release
RUN    yum -y install php72
RUN    yum -y install php-fpm php72-php-gd php72-php-json php72-php-mbstring php72-php-mysqlnd php72-php-xml php72-php-xmlrpc php72-php-opcache php72-php-pecl-oci8 php-oci8 php-xml
RUN    mkdir -p /run/php-fpm/

RUN curl -o php-basic-21.5.x86_64.rpm -u nexus-user:nexus-user http://nexus.rjil.ril.com:9081/repository/Jio_Prime_Merchant/oracle-instantclient/php-basic/21.5/php-basic-21.5.x86_64.rpm && \
    curl -o php-dlevel-21.5.x86_64.rpm -u nexus-user:nexus-user http://nexus.rjil.ril.com:9081/repository/Jio_Prime_Merchant/oracle-instantclient/php-dlevel/21.5/php-dlevel-21.5.x86_64.rpm && \
    yum -y localinstall php-basic-21.5.x86_64.rpm php-dlevel-21.5.x86_64.rpm && \
    rm -rf php-basic-21.5.x86_64.rpm php-dlevel-21.5.x86_64.rpm

#RUN yum -y install http://nexus-user:nexus-user@10.141.51.157:9081/repository/Jio_Prime_Merchant/oracle-instantclient/php-basic/21.5/php-basic-21.5.x86_64.rpm && \
#    yum -y install http://nexus-user:nexus-user@10.141.51.157:9081/repository/Jio_Prime_Merchant/oracle-instantclient/php-dlevel/21.5/php-dlevel-21.5.x86_64.rpm

RUN yum -y install php-redis

COPY ./www.conf /etc/php-fpm.d/

# COPY . /usr/local/openresty/nginx/html

CMD /sbin/php-fpm --nodaemonize   

# COPY nginx.conf /usr/local/openresty/nginx/conf/
# RUN yum -y install epel-release

# RUN yum -y install http://rpms.remirepo.net/enterprise/remi-release-7.rpm

# RUN yum -y install yum-utils

# RUN yum-config-manager --enable remi-php72

# RUN yum -y update

# RUN yum -y install epel-release

# RUN yum -y install php72

# RUN yum -y install php-fpm php72-php-gd php72-php-json php72-php-mbstring php72-php-mysqlnd php72-php-xml php72-php-xmlrpc php72-php-opcache php72-php-pecl-oci8 php-oci8 php-xml

# RUN mkdir -p /run/php-fpm/ 

# COPY nginx.conf /usr/local/openresty/nginx/conf/

# RUN yum -y install ./oracle-instantclient-basic-21.5.0.0.0-1.x86_64.rpm

# RUN yum -y install ./oracle-instantclient-devel-21.5.0.0.0-1.x86_64.rpm
#WORKDIR /usr/local/openresty/nginx/html

#COPY . .
