FROM debian
MAINTAINER Stanlry Chong <stanlry.g@gmail.com>

# copy instantclient
RUN mkdir /opt/oracle
COPY instantclient_12_1 /opt/oracle/

# set environmental variable
ENV LD_RUN_PATH /opt/oracle
ENV ORACLE_HOME /opt/oracle
ENV LD_LIBRARY_PATH /opt/oracle

# install required dependencies for cx_oracle
RUN apt-get update && apt-get install python-dev build-essential libssl-dev libaio1 libaio-dev libpq-dev wget -y &&\
rm -rf /var/lib/apt/lists.*
RUN wget https://bootstrap.pypa.io/get-pip.py && python get-pip.py

# install cx_Oracle
RUN pip install cx_Oracle

