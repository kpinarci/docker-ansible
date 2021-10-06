FROM alpine:3.11

RUN apk --no-cache add \
        sudo \
        python3\
        py3-pip \
        openssl \
        ca-certificates \
        sshpass \
        openssh-client \
        rsync \
        git && \
    apk --no-cache add --virtual build-dependencies \
        python3-dev \
        libffi-dev \
        musl-dev \
        gcc \
        openssl-dev \
        libressl-dev \
        build-base && \
    pip3 install --upgrade pip cffi wheel && \
    pip3 install cryptography==3.3.2 && \
    pip3 install ansible-core==2.11.3 && \
    pip3 install mitogen ansible-lint jmespath && \
    pip3 install --upgrade pywinrm && \
    apk del build-dependencies && \
    rm -rf /var/cache/apk/* && \
    rm -rf /root/.cache/pip

RUN mkdir /ansible && \
    mkdir -p /etc/ansible && \
    echo 'localhost' > /etc/ansible/hosts

WORKDIR /ansible

RUN adduser -u 1001 -G users -h /home/kpi -D kpi

RUN echo "kpi ALL=(ALL:ALL) NOPASSWD:ALL" >> /etc/sudoers

USER kpi

CMD [ "ansible-playbook", "--version" ]


