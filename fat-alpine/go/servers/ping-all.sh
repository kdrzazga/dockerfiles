#chmod 777 ping-all.sh
#./ping-all.sh

#!/bin/bash

 clear
 
 echo "Pinging MSG SERVER"
 curl -i http://localhost:8083

 echo
 echo
 echo "---------------------"
 echo "Pinging ADDRESS BOOK"
 curl http://localhost:8080
 curl -i http://localhost:8080/ip/msg_server
 
 echo
 echo
 echo "---------------------"
 echo "Pinging PROC SERVER"
 curl -i -u admin:admin http://localhost:8082
  