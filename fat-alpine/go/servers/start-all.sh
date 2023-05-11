#chmod 777 start-all.sh
#./start-all.sh

#!/bin/bash

# Run the Go programs concurrently in the background using nohup
nohup go run msg_server1.go > msg_server1.log 2>&1 &
nohup go run proc_server1.go > proc_server1.log 2>&1 &
nohup go run address_book.go > address_book.log 2>&1 &

# Print process IDs
echo "msg_server1 PID: $!"
echo "proc_server1 PID: $!"
echo "address_book PID: $!"