# openshift
Comandos interessantes:
- oc whoami --show-console -> Mostra a url para acessar a console web do openshift
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
