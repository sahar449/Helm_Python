#!/bin/bash
curl http://minikube:30000/health
if [[ $? == 0 ]];
then echo 'The container is healtly'
exit 0
fi
