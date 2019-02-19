oc login -u system:admin
for row in $(oc get projects | grep ^whats | awk '{print $1}'); do
echo "adicionando usuario admin no projeto ${row}"
oc adm policy add-role-to-user admin user01 user02 user03 -n ${row}
done
