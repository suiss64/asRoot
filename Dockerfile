FROM openshift/base-centos7

# The user the container should run as (root)
# USER 0

COPY ./etcd-1.sh .
COPY ./etcd-2.sh .

RUN chmod 777 etcd-1.sh && chmod 777 etcd-2.sh

#
RUN yum install etcd -y && yum install cronie -y

# Install de l'ancienne version d'aws :
# RUN yum install awscli -y

#
RUN curl "https://d1vvhvl2y92vvt.cloudfront.net/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && unzip awscliv2.zip && ./aws/install && aws2 --version && rm -f awscliv2.zip

# On fixe ici des KEYs aws quelconques utilisées par localstack (fake APIs aws)
# ref : https://docs.aws.amazon.com/fr_fr/cli/latest/userguide/cli-configure-envvars.html
# export AWS_ACCESS_KEY_ID=123 && export AWS_SECRET_ACCESS_KEY=AZERTY && export AWS_DEFAULT_REGION=us-east-1 && export AWS_DEFAULT_OUTPUT=text
# Attention RUN export ne persiste pas les var d'env !!!!

ENV AWS_ACCESS_KEY_ID=123 \
    AWS_SECRET_ACCESS_KEY=AZERTY \
    AWS_DEFAULT_REGION=us-east-1 \
    AWS_DEFAULT_OUTPUT=text


## Autre methode directement dans le terminal : # aws2 configure  --> qui demande les inputs puis crée ./aws/config et ./aws/credentials 

# Do nothing
CMD while true; do sleep 1; done
#ENTRYPOINT /entrypoint.sh
