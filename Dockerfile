FROM willhallonline/ansible:2.7-ubuntu-18.04

RUN pip install pyvmomi

CMD [ "ansible-playbook", "--version" ]
