#! /bin/bash
mvn clean
cd server
docker-compose up -d
docker exec -i mysql mysql -uroot -pmysql njustc < framework.sql
cd ..
mvn package
cd server/target/
java -jar stc.jar
cd ../../