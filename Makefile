
SERVICE=wscassandra
CASSANDRA_EXEC=docker-compose exec $(SERVICE) bash -c 

build: clean
	docker-compose build

start:
	docker-compose up -d

stop:
	docker-compose kill || true

clean: stop
	docker-compose rm -f

install:
	$(CASSANDRA_EXEC) "python /tmp/cassandra/cassandradump.py --import-file=/tmp/wscasandra_structure.cql"

shell:
	docker-compose exec $(SERVICE) bash

cqlsh:
	$(CASSANDRA_EXEC) cqlsh

ps:
	docker-compose ps