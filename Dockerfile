FROM openshift/base-centos7

# This file should be owned by root
COPY somefile /tmp

# The user the container should run as (root)
USER 0

# Do nothing
CMD while true; do sleep 1; done
