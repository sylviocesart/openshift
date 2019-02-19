kubectl proxy &
serverPID=$!
oc login -u system:admin
for row in $(oc get ns -o json | jq -r '.items[] | select(.status.phase=="Terminating") | .metadata.name'); do
echo "force deleting name space ${row}"
oc project $row
oc delete --all all,secret,pvc,rolebindings,serviceaccounts,secrets,builds,is,imagestreamtags,pods,podpreset,egressnetworkpolicies,rolebindingrestrictions,limitranges,resourcequotas,routes,templates,cronjobs,statefulsets,deployments,replicasets,poddisruptionbudget,daemonset,networkpolicy > /dev/null
oc get ns $row -o json > tempns
sed -i '/"kubernetes"/d' ./tempns
curl --silent --output /dev/null -H "Content-Type: application/json" -X PUT --data-binary @tempns http://127.0.0.1:8001/api/v1/namespaces/$row/finalize
done
kill $serverPID
