FROM ubuntu:latest

RUN apt-get update

RUN apt-get -y install apache2

RUN echo servername www.miempresa.com>>/etc/apache2/apache2.conf

ENV TZ="Europe/Madrid"

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get -y install php

RUN rm /var/www/html/index.html

COPY src /var/www/html

EXPOSE 80

#CMD ["service","apache2","restart"]

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
