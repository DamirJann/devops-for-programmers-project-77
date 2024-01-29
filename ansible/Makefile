ansible-requirements:
	ansible-galaxy install -r requirements.yml

deploy: ansible-requirements
	ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i inventory.yml --vault-password-file vault-password-file  playbook.yml