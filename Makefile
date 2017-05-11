
SERVICE=wscassandra
SPARK_EXEC=docker-compose exec $(SERVICE) bash -c 

build: clean
	docker-compose build $(SERVICE)

start:
	docker-compose up -d

stop:
	docker-compose kill || true

clean: stop
	docker-compose rm -fv

install:
	$(CASSANDRA_EXEC) "python /tmp/cassandra/cassandradump.py --import-file=/tmp/wscasandra_structure.cql"

shell:
	docker-compose exec $(SERVICE) bash

cqlsh:
	$(CASSANDRA_EXEC) cqlsh

ps:
	docker-compose ps