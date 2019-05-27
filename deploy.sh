#!/bin/bash


echo "create webapp service"

kubectl create -f service.yaml

if [ "$?" -eq "0" ]
then
  echo "service created succssfully"
else
   echo "deleting the service and creating "
   kubectl delete -f service.yaml
   kubectl create -f service.yaml
fi


echo "deploy web app"

kubectl create -f deployment.yaml

if [ "$?" -eq "0" ]
then
  echo "created succssfully"
else
   echo "deleting and creating "
   kubectl delete -f deployment.yaml
   kubectl create -f deployment.yaml
fi
