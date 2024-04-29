#!/bin/bash

PIDS=`./lanciaeprendipid.sh`
echo ${PIDS}
kill -SIGKILL ${PIDS}
exit 0