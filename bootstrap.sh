#!/bin/bash
helm template todoapp-release helm-charts/todoapp
helm install todoapp-release helm-charts/todoapp
helm dependency update helm-charts/todoapp
kubectl get all -n todoapp
kubectl get all -n mysql
helm upgrade todoapp-release helm-charts/todoapp
