FROM centos:7
MAINTAINER andres.fiorini@altoros.com
RUN yum install -y java-1.8.0-openjdk java-1.8.0-openjdk-devel java-1.8.0-openjdk-headless
RUN echo export JAVA_HOME=`alternatives --list | grep java | head -1 | awk '{print $3}'` | sed 's/\/bin\/java//g'| tee -a /etc/bashrc && echo export JAVA_HOME=`alternatives --list | grep java | head -1 | awk '{print $3}'` | sed 's/\/bin\/java//g' | tee -a /etc/profile
