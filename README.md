# openshift
  ------------------  Comandos interessantes ----------------------
------ SECRETS ---
-> Secret -> São objetos que guardam dados sensíveis em um formato de chave-valor.
 -Usado para guardar tipos de dados como: password, token de autenticação, certificados SSL/TLS, chaves SSH
strings de conexão com banco de dados, etc.
 - O secret é designado para ser usado por pods e outros recursos do cluster
 - Somente é acessado por pods e recursos autorizados dentro do cluster
 - Secret são codificadas para então serem transmitidas 
 - Secret utiliza a base64 para codificar os config maps guardados no etcd
Para criar uma secret podemos fazer assim:
 - oc create secret, um exemplo seria:
 - oc create secret generic my-secret --from-literal=username=myuser --from-literal=password=mypassword
 - É possível criar secret para arquivos também, exemplo:
 - oc create secret generic my-file-secret --from-file=credentials.txt
O conteúdo do arquivo será usado para criar a secret
O OpenShift prover tipos específios de secret para casos de uso comum, exemplo:
  - Docker registry secrets e TLS secrets, exemplo
  - oc create secret docker-registry my-registry-secret --docker-server=registry.example.com --docker-username=muyser --docker-password=mypassword --docker-email=myuser@example.com
  - 
 - 

  
- oc whoami --show-console -> Mostra a url para acessar a console web do openshift
- oc get pods -> visualiza os pods que estão no namespace/project atual
- oc get pods -A -> visualiza os pods de todos os namespaces/projects
-  










   apiVersion: apps/v1
   kind: Deployment
   metadata:
     name: apache-deployment
   spec:
     replicas: 1
     selector:
       matchLabels:
         app: apache
     template:
       metadata:
         labels:
           app: apache
       spec:
         containers:
         - name: apache
           image: httpd:latest
           volumeMounts:
           - mountPath: /usr/local/apache2/htdocs
             name: apache-storage
         volumes:
         - name: apache-storage
           persistentVolumeClaim:
             claimName: apache-pvc
