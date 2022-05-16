FROM ubuntu:latest

RUN apt update

RUN apt install  openssh-server sudo -y

RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1000 yusuf

RUN usermod -aG sudo yusuf

RUN service ssh start

RUN  echo 'yusuf:yusuf' | chpasswd

EXPOSE 22

CMD ["/usr/sbin/sshd","-D"]
