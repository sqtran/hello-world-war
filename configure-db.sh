#!/bin/bash

oc exec $(oc get pods --field-selector status.phase=Running -o name | grep mariadb ) -- mysql -u root -e "$(cat sample.sql)"
