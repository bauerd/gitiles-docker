FROM insready/bazel
LABEL maintainer "Dominic Bauer <bauerdominic@gmail.com>"

ARG GITILES_REV

WORKDIR /usr/src/app
RUN git clone https://gerrit.googlesource.com/gitiles . && \
    git reset --hard $GITILES_REV && \
    bazel build java/com/google/gitiles/dev

ADD https://github.com/kelseyhightower/confd/releases/download/v0.14.0/confd-0.14.0-linux-amd64 /usr/local/bin/confd
RUN chmod +x /usr/local/bin/confd
ADD confd /etc/confd

ADD start.sh .
RUN chmod +x ./start.sh
CMD ["./start.sh"]
