FROM ubuntu:16.04

ENV DEBIAN_FRONTEND noninteractive
USER root
MAINTAINER francis gagnaire 


RUN    apt-get update  \
    && apt-get install -y --no-install-recommends ubuntu-desktop  \
    && apt-get install -y gnome-panel gnome-settings-daemon metacity nautilus gnome-terminal apt-utils \
    && mkdir /root/.vnc \
    && apt-get clean


CMD /bin/bash

