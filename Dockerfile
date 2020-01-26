FROM openshift/base-centos7

# The user the container should run as (root)
USER 0

#
RUN yum install etcd -y

#
RUN yum install awscli -y

# Do nothing
CMD while true; do sleep 1; done
