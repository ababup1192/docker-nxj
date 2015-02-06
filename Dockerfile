FROM java:7
MAINTAINER ababup1192

# JAVA_HOME設定
ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64

# leJOS_NXJ 環境構築
WORKDIR /usr/lib
RUN wget http://sourceforge.net/projects/nxt.lejos.p/files/0.9.1beta-3/leJOS_NXJ_0.9.1beta-3.tar.gz && mv leJOS_NXJ_0.9.1beta-3.tar.gz leJOS_NXJ.tar.gz && tar zxvf leJOS_NXJ.tar.gz && rm leJOS_NXJ.tar.gz && mv leJOS_NXJ_0.9.1beta-3 leJOS_NXJ
ENV NXJ_HOME /usr/lib/leJOS_NXJ
ENV LEJOS_NXT_JAVA_HOME $JAVA_HOME
ENV PATH $PATH:/usr/lib/leJOS_NXJ/bin

# nxj コンパイル & パッケージ化
COPY myapp /usr/src/myapp
WORKDIR /usr/src/myapp

CMD nxjc Main.java && nxjlink -o Main.nxj Main && nxjupload -r Main.nxj
