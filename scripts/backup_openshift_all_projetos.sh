#!/bin/bash
clear
DIR=backup_projects
cd /
if [ ! -d $DIR ]; then
        mkdir /$DIR
else
        echo "Diretorio $DIR já existe"
fi
cd /$DIR
for pj in `oc get project | awk '{print $1}' | grep -v NAME`; do
        echo ""
        echo "####################################"
        echo "Backup do projeto: $pj"
        echo "####################################"
        echo ""
        /usr/local/bin/project_export.sh $pj
done

#find /$DIR -type f -empty -delete

cd /
#tar cvzf $DIR.tar.gz $DIR

