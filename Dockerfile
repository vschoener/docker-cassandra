FROM cassandra:3.10

MAINTAINER Vincent Schoener <vincent.schoener@gmail.com>
LABEL version="v1"

RUN apt-get update && apt-get install -y wget

RUN wget https://bootstrap.pypa.io/get-pip.py -P /tmp
RUN python /tmp/get-pip.py && pip install cassandra-driver

RUN wget https://raw.githubusercontent.com/gianlucaborello/cassandradump/master/cassandradump.py -P /tmp/cassandra
# Ok Let's try this

ADD entrypoint.sh /usr/bin/entrypoint.sh
RUN chmod a+x /usr/bin/entrypoint.sh

ADD wscasandra_structure.cql /tmp/wscasandra_structure.cql

USER cassandra
CMD ["/usr/bin/entrypoint.sh"]
