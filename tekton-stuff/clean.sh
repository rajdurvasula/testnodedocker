#!/bin/bash
PODS=""
for i in $(echo -n $(kubectl get pod -n rdapp -o json | jq -r '.items[].metadata.name'))
do
  kubectl delete pod $i -n rdapp
done
PIPELINERUN=$(kubectl get pipelinerun -n rdapp -o json | jq -r '.items[0].metadata.name')
PIPELINE=$(kubectl get pipeline -n rdapp -o json | jq -r '.items[0].metadata.name')
if [[ ! -z "$PIPELINERUN" && "$PIPELINERUN" != "null" ]]; then
    kubectl delete pipelinerun $PIPELINERUN -n rdapp
fi
if [[ ! -z "$PIPELINE" && "$PIPELINE" != "null" ]]; then
    kubectl delete pipeline $PIPELINE -n rdapp
fi
