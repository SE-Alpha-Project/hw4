#!/bin/bash

pid=$(ps -ef | grep 'infinite.sh' | grep -v 'grep' | awk '{print $2}')		# This will find the PID

if [ -n "$pid" ]; then
    echo "Killing the process infinite.sh with PID: $pid"
    kill $pid
    echo "Yaay! I have killed the process!"
else
    echo "No running instance of the process infinite.sh can be found"
fi

