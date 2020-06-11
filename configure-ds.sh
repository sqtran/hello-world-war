#!/bin/bash

NAMESPACE=eap7
DB_SVC=mariadb
USER=user
PASS=password
DB=test

oc exec $(oc get pods --field-selector status.phase=Running -o name | grep eap-app) -- /opt/eap/bin/jboss-cli.sh --connect --command=/subsystem=datasources/data-source=example:add\(user-name=$USER,password=$PASS,driver-name=mysql,jndi-name="java:/example",connection-url="jdbc:mysql://$DB_SVC.$NAMESPACE.svc.cluster.local:3306/$DB"\)
#oc exec $(oc get pods | grep eap-app | grep Running | awk '{print $1}') -- /opt/eap/bin/jboss-cli.sh --connect --command=reload
