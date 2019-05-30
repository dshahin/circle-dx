#!/bin/bash
# use this command to deploy
# traditional metadata to a 
# non-scratch org

if [ $# -lt 1 ]
then
    echo 'Usage: deploy.sh alias <checkonly> <deploydir>'
    exit
fi



ALIAS=$1
CHECKONLY=$2
DEPLOYDIR=$3
TESTLEVEL='RunSpecifiedTests'
SPECIFIED_TESTS='SampleTest'

if [ -z "$CHECKONLY" ]
then
    echo 'real deploy'
else
    echo 'checkonly deploy'
    CHECKONLY='--checkonly'
fi

if [ -z "$DEPLOYDIR"  ]
then
    echo 'default deploy dir'
    DEPLOYDIR='deploy'
else
    echo 'new deploy dir'
fi

sfdx force:mdapi:deploy $CHECKONLY -w -1 --deploydir $DEPLOYDIR -u $ALIAS --testlevel $TESTLEVEL --runtests $SPECIFIED_TESTS

sleep 5s

sfdx force:mdapi:deploy:report -u $1