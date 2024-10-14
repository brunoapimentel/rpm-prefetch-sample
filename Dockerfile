FROM registry.redhat.io/rhel9-2-els/rhel:9.2-1290

RUN dnf module enable nodejs:18 -y

RUN dnf install nodejs -y

ENTRYPOINT ["node", "-v"]

