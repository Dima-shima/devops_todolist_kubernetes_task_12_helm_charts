#!/bin/bash
install Python 3.8 and higher, due to Django 4
install kind
install kubectl

kind create cluster --config cluster.yml

kubectl label node kind-worker app=mysql
kubectl label node kind-worker2 app=mysql
kubectl taint nodes -l app=mysql app=mysql:NoSchedule
kubectl label node kind-worker app=todoapp

helm template todoapp-release helm-charts/todoapp
helm install todoapp-release helm-charts/todoapp
helm dependency update helm-charts/todoapp
kubectl get all -n todoapp
kubectl get all -n mysql
helm upgrade todoapp-release helm-charts/todoapp
kubectl get all,cm,secret,ing -A > output.log
