FROM java:7
MAINTAINER ababup1192

WORKDIR /usr/lib
RUN wget http://sourceforge.net/projects/nxt.lejos.p/files/0.9.1beta-3/leJOS_NXJ_0.9.1beta-3.tar.gz && tar zxvf leJOS_NXJ_0.9.1beta-3.tar.gz

COPY myapp /usr/src/myapp
WORKDIR /usr/src/myapp
ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64
RUN echo $JAVA_HOME


CMD ["javac",  "Main.java"]
