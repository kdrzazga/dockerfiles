#!/bin/bash

curl http://localhost:8080/ #main http serever
curl http://localhost:8090/ #thrill
curl http://localhost:8091/ #webapp2
curl http://localhost:8092/ #webapp3
curl http://localhost:8093/ #webapp4
curl http://localhost:8094/ #webapp5
curl http://localhost:8095/ #webapp6

curl http://localhost:8090/par/1
curl -X PUT -d "klucz" http://localhost:8090/inv
curl http://localhost:8090/inv
curl http://localhost:8090/inv-check/sword
curl -X DELETE -d "sword" http://localhost:8090/inv

curl -X POST -d "5,3" http://localhost:8091/start
curl http://localhost:8091/history
