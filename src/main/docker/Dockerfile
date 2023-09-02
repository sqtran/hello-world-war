# Use a base image with WebSphere Liberty pre-installed
FROM websphere-liberty:latest

# Copy the Java application artifact into the Liberty server directory
COPY target/*.war /config/dropins/

# Expose the default Liberty port
EXPOSE 9080

# Start the Liberty server
CMD ["/opt/ibm/wlp/bin/server", "run", "defaultServer"]