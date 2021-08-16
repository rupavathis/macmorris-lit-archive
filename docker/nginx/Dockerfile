FROM ubuntu:20.04

# install nginx
RUN apt update -y
RUN apt install -y software-properties-common
RUN add-apt-repository -y ppa:nginx/stable
RUN apt update -y
RUN apt install -y nginx

# add nginx conf to the conf.d
ADD ./test.conf /etc/nginx/conf.d/test.conf

EXPOSE 80
EXPOSE 3000

CMD ["nginx", "-g", "daemon off;"]
