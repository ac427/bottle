FROM centos:7
RUN yum -y install python3-pip python36 && \
    yum -y clean all && \
    rm -Rf /var/cache/yum && \
    pip3 install --no-cache-dir bottle

# mandatory K8S labels
LABEL io.k8s.description="Simple web app" \
      io.k8s.display-name="My bottle app" \
      io.openshift.expose-services="5000:http" \
      io.openshift.tags="html,apache"
COPY app.py  /usr/src/app/

# tell the port number the container should expose
EXPOSE 5000

# run the application
ENTRYPOINT ["/usr/src/app/app.py"]
