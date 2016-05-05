#
# Dockerfile to create a jmeter-server image.
# 
# Usage:
#  docker run -d \         
#             -p 0.0.0.0:port-on-host:1099 \
#             -p 0.0.0.0:some-other-port-on-host:60000 \
#             -v /some/local/path:/logs \
#             -v /some/other/local/path:/input-data \
#             ssankara/jmeter-server
#
# TODO - Parameterize jmeter version in the ENTRYPOINT.
#        Don't know how at the moment.  Cannot seem to use $VAR.  It is not converted; probably
#        because it is in a quoted string.
#
# TODO - Currently exposed ports are hard-coded to use values that are in the jmeter.properties.
#        It would be nice to be able to parameterize the port numbers.
#
FROM vaibhavja/jmeter-docker-base
MAINTAINER Vaibhav

# Describe the environment
ENV JMETER_VERSION 2.13

ADD jmeter.properties /var/lib/apache-jmeter-2.13/bin/

# Expose access to logs & data files
VOLUME [ "/logs" ]
VOLUME [ "/input-data" ]
VOLUME [ "/user_libs" ]
# Expose jmeter-server's port (values dicated by those specified in jmeter.properties.
EXPOSE 1099 60000

# Provide all the dependent JARs
COPY user_libs /user_libs/

# Run jmeter-server 
ENTRYPOINT [ "/var/lib/apache-jmeter-2.13/bin/jmeter-server" ]
