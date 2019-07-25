FROM ubuntu:18.04

ENV DIR excalibur
ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

RUN apt-get update &&\
    apt-get install -y -q python-tk ghostscript &&\
    apt-get install -y -q python3 python3-pip &&\
    apt-get install -y -q libsm6 libxext6
    
RUN pip3 install excalibur-py

RUN pip3 install opencv-python

WORKDIR $DIR

EXPOSE 5000

RUN excalibur initdb

ADD ./excalibur.cfg excalibur.cfg

RUN mv excalibur.cfg ~/excalibur/excalibur.cfg

CMD ["excalibur", "webserver"]
