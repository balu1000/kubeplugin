#!/bin/bash

# Define command-line arguments
RESOURCE_TYPE=$1
NAMESPACE=$2

# Retrieve resource usage statistics from Kubernetes
kubectl get $RESOURCE_TYPE -n $NAMESPACE | tail -n +2 | while read line
do
  # Extract CPU and memory usage from the output
  NAME=$(echo $line | awk '{print $2}')
  CPU=$(echo $line | awk '{print $3}')
  MEMORY=$(echo $line | awk '{print $4}')

  # Output the statistics to the console
  echo "Resource, Namespace, Name, CPU, Memory"
  echo "$RESOURCE_TYPE, $NAMESPACE, $NAME, $CPU, $MEMORY"
done