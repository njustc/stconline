#! /bin/bash
mvn clean
docker exec -i mysql mysql -uroot -pmysql njustc < server/framework.sql
mvn package
java -jar server/target/stc.jar