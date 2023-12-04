#!/bin/bash

NODES="assam1 assam2 ceylan1 ceylan2 ceylan3 ceylan4 gyokuro1"

for NODE in $NODES; do
    echo 'Sending slurm.conf to '$NODE;
    rsync -P /etc/slurm/slurm.conf $NODE:/etc/slurm/slurm.conf;
    done
