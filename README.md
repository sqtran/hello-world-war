Hello World! (WAR-style)
===============

This is the simplest possible Java webapp for testing servlet container deployments.  It should work on any container and requires no other dependencies or configuration.  I forked this from https://github.com/efsavage/hello-world-war but over time, I've made so many modifications to it to transform it into something the original author probably didn't want.  This simple webapp is now includes a lot of Maven dependencies to demonstrate the power of Maven plugins.  A fake test is also provided to show code coverage and what the Maven plugins would report when scanning actual code.

The root context is reached at `/hello-world`

Check out the ocp_eap branch for a version specific to Openshift and deployment to Red Hat JBoss Enterprise Application Platform 7.
