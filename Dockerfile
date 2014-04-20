# Firefox over VNC
#
# VERSION 0.1
# DOCKER-VERSION 0.2

from ubuntu:12.04
ENV http_proxy http://172.31.4.6:8080
ENV ftp_proxy ftp://172.31.4.6:8080
ENV https_proxy https://172.31.4.6:8080
ENV socks_proxy socks://172.31.4.6:8080
MAINTAINER dockberwal dockberwal@gmail.com
# make sure the package repository is up to date
run echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
run apt-get update
ENV DEBIAN_FRONTEND noninteractive
# Install vnc, xvfb in order to create a 'fake' display and firefox
run apt-get install -y x11vnc xvfb firefox
run mkdir /.vnc
run apt-get install xserver-xorg

# Setup a password
run x11vnc -storepasswd 1234 ~/.vnc/passwd
# Autostart firefox (might not be the best way to do it, but it does the trick)
run bash -c 'echo "firefox" >> /.bashrc'
