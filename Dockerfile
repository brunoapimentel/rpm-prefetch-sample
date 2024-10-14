FROM registry.access.redhat.com/ubi9

RUN dnf module enable nodejs:18 -y

ENTRYPOINT ["node", "-v"]

