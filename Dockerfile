FROM registry.access.redhat.com/ubi8/go-toolset:1.21.11-1.1720406008

USER root

RUN dnf install -y bash \
                   git \
                   openssh \
                   gcc

