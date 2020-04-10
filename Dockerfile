FROM centos:7
RUN yum -y install python3-pip python36 && \
    yum -y clean all && \
    rm -Rf /var/cache/yum && \
    pip3 install --no-cache-dir bottle

COPY app.py  /usr/src/app/

# tell the port number the container should expose
EXPOSE 5000

# run the application
ENTRYPOINT ["/usr/src/app/app.py"]
