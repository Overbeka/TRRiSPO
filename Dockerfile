FROM debian:13.2

COPY PR_1.0.deb /tmp/

RUN apt-get update && \
    apt-get install -y sudo && \
    dpkg -i /tmp/PR_1.0.deb || apt-get install -f -y


RUN chmod +x /usr/local/bin/TRRSPO


CMD ["/usr/local/bin/TRRSPO"]

