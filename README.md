Hello World! (WAR-style)
===============

This is the simplest possible Java webapp for testing servlet container deployments.  It should work on any container and requires no other dependencies or configuration.  I forked this from https://github.com/efsavage/hello-world-war but over time, I've made so many modifications to it to transform it into something the original author probably didn't want.  This simple webapp is now includes a lot of Maven dependencies to demonstrate the power of Maven plugins.  A fake test is also provided to show code coverage and what the Maven plugins would report when scanning actual code.

The root context is reached at `/hello-world`

Check out the ocp_eap branch for a version specific to Openshift and deployment to Red Hat JBoss Enterprise Application Platform 7.


oc exec $(oc get pods --field-selector status.phase=Running -o name | grep eap-app) -- /opt/eap/bin/jboss-cli.sh --connect --command=/subsystem=datasources/data-source=example:add\(user-name=$USER,password=$PASS,driver-name=mysql,jndi-name="java:/example",connection-url="jdbc:mysql://$DB_SVC.$NAMESPACE.svc.cluster.local:3306/$DB"\)

DB_SERVICE_PREFIX_MAPPING=example-MYSQL=DS1
DS1_JNDI=java:/example
DS1_DRIVER_NAME=mysql
DS1_USERNAME=user
DS1_PASSWORD=password
DS1_CONNECTION_CHECKER=org.jboss.jca.adapters.jdbc.extensions.mysql.MySQLValidConnectionChecker
DS1_EXCEPTION_SORTER=org.jboss.jca.adapters.jdbc.extensions.mysql.MySQLExceptionSorter
DS1_CONNECTION_URL=jdbc:mysql://mariadb.demo1.svc.cluster.local:3306/test

DS1_SERVICE_HOST=mariadb.demo1.svc.cluster.local
DS1_SERVICE_PORT=3306
DS1_DATABASE=test




## As Environment Variables
            - name: DB_SERVICE_PREFIX_MAPPING
              value: example-mysql=DS1
            - name: DS1_DRIVER
              value: mysql
            - name: DS1_JNDI
              value: "java:/example"
            - name: DS1_USERNAME
              value: user
            - name: DS1_PASSWORD
              value: password
            - name: DS1_CONNECTION_CHECKER
              value: org.jboss.jca.adapters.jdbc.extensions.mysql.MySQLValidConnectionChecker
            - name: DS1_EXCEPTION_SORTER
              value: org.jboss.jca.adapters.jdbc.extensions.mysql.MySQLExceptionSorter
            - name: DS1_DATABASE
              value: test
            - name: EXAMPLE_MYSQL_SERVICE_HOST
              value: mariadb.demo1.svc.cluster.local
            - name: EXAMPLE_MYSQL_SERVICE_PORT
              value: "3306"


## Bugs 
these prefixed settings are not honored, so you have to use the capitalized "pool-name" as the prefix 
            - name: DS1_SERVICE_HOST
              value: mariadb.demo1.svc.cluster.local
            - name: DS1_SERVICE_PORT
              value: "3306"

## Bigger Bug
This setting was not honored at all
            - name: DS1_URL
              value: "jdbc:mysql://mariadb.demo1.svc.cluster.local:3306/test"



## As ConfigMap or Secret

```yaml
data:
  DS1_DRIVER: mysql
  DS1_JNDI: 'java:/example'
  DB_SERVICE_PREFIX_MAPPING: example-mysql=DS1
  DS1_CONNECTION_CHECKER: org.jboss.jca.adapters.jdbc.extensions.mysql.MySQLValidConnectionChecker
  DS1_USERNAME: user
  DS1_PASSWORD: password
  DS1_EXCEPTION_SORTER: org.jboss.jca.adapters.jdbc.extensions.mysql.MySQLExceptionSorter
  DS1_DATABASE: test
  EXAMPLE_MYSQL_SERVICE_PORT: '3306'
  EXAMPLE_MYSQL_SERVICE_HOST: mariadb.demo1.svc.cluster.local
```

```bash
oc apply -f exampleds.yml
```

Add your configMap reference to the deployment/deploymentConfig
```yaml
        envFrom:
        - configMapRef:
            name: exampleds
```


