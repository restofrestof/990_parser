timeout sh -c 'until nc -z $0 $1; do sleep 1; echo "Waiting for Redis"; done' localhost 6379; 