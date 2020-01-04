FROM alpine:3.11.2
MAINTAINER info@airdb.com

# Step 1: List service infomation and choose stable version.
ENV RUNNING_CONTEXT="docker" \
    SERVICE=toolbox \
    LANGUAGE=en_US.UTF-8 \
    PS1='[\H \W]\$ ' \
    PASSWD=airdb.com \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8 \
    HOMEDIR=/srv \
    PS1='[\H \W]\$ ' \
    HOSTNAME=airdb.dev \
    PASSWD=airdb.com


#ADD airdb.com.sh /etc/profile.d/
WORKDIR $HOMEDIR

ADD https://github.com/airdb/adb/releases/latest/download/adb /bin/
RUN apk add --update --no-cache --virtual .build-deps \
      bash \
      curl \
      git \
      vim \
      sudo \
      openssh \
      mysql-client \
      && chmod +x /bin/adb


RUN echo "export RUNNING_CONTEXT=docker" >> /etc/profile
RUN echo "export PS1='[\H \W]\\$ '" >> /etc/profile
RUN echo "export PATH='$PATH:$HOME/go/bin'" >> /etc/profile
RUN echo "export GO111MODULE=on" >> /etc/profile
RUN echo 'export HISTTIMEFORMAT="%Y-%m-%d %T \$LC_NAME \$SSH_TTY " ' >> /etc/profile

EXPOSE 22
CMD /bin/bash
