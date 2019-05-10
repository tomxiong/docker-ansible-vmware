FROM willhallonline/ansible:2.7-ubuntu-18.04

RUN pip install pyvmomi

ENV ANSIBLE_HOST_KEY_CHECKING=False

CMD [ "ansible-playbook", "--version" ]
