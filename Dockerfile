FROM registry.access.redhat.com/ubi9/ubi:9.6

RUN dnf install -y openshift-clients

