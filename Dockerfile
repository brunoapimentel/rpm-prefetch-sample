FROM registry.access.redhat.com/ubi8/go-toolset:1.21

RUN dnf install -y bash \
                   git \
                   openssh \
                   gcc

