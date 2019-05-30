FROM bitnami/minideb:stretch
LABEL maintainer "Tom Xiong <tom.xiong@quest.com>" \
    org.label-schema.description="Ansible inside Docker" \
    org.label-schema.docker.cmd="sudo docker run --rm -it -v $(pwd):/ansible -v ~/.ssh/id_rsa:/root/.ssh/id_rsa --workdir ansible tomxiong/ansible"

# copy from bitnami/minideb-extra Dockerfile and change user bitnami to fms
RUN install_packages curl ca-certificates sudo locales procps libaio1 gnupg dirmngr bzip2 && \
  update-locale LANG=C.UTF-8 LC_MESSAGES=POSIX && \
  locale-gen en_US.UTF-8 && \
  DEBIAN_FRONTEND=noninteractive dpkg-reconfigure locales

# The following security actions are recommended by some security scans.
# https://console.bluemix.net/docs/services/va/va_index.html
RUN  sed -i 's/^PASS_MAX_DAYS.*/PASS_MAX_DAYS    90/' /etc/login.defs && \
  sed -i 's/^PASS_MIN_DAYS.*/PASS_MIN_DAYS    1/' /etc/login.defs && \
  sed -i 's/sha512/sha512 minlen=8/' /etc/pam.d/common-password

RUN echo "deb http://cdn-fastly.deb.debian.org/debian sid main" | tee /etc/apt/sources.list.d/python.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367 && \
    echo "deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main" | tee /etc/apt/sources.list.d/ansible.list && \
    echo "deb-src http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main" | tee -a /etc/apt/sources.list.d/ansible.list && \
    install_packages python ansible python-pip python-dockerpty sshpass openssh-client
    
RUN pip install --upgrade pip pywinrm mitogen pyvmomi

RUN mkdir -p /etc/ansible && \
    echo 'localhost' > /etc/ansible/hosts

CMD [ "ansible-playbook", "--version" ]

ENV ANSIBLE_HOST_KEY_CHECKING=False
