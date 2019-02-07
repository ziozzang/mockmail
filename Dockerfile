FROM python:3
COPY . /opt
WORKDIR /opt
RUN apt update && \
    apt install -fy make && \
    make && \
    sed -i 's/127.0.0.1//g' /etc/mockmail.conf && \
    sed -i 's/2525/25/g' /etc/mockmail.conf && \
    apt autoremove -y make && \
    apt clean -y
EXPOSE 2580
EXPOSE 25
ENTRYPOINT ["/usr/local/bin/mockmail"]
CMD ["-c","/etc/mockmail.conf", "-i"]

