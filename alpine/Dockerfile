FROM willhallonline/ansible:2.8-alpine-3.9

RUN pip install pyvmomi

ENV ANSIBLE_HOST_KEY_CHECKING=False

CMD [ "ansible-playbook", "--version" ]
