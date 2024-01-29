infra-deploy:
	cd terraform && make deploy

app-deploy:
	cd ansible && make deploy

full-deploy: infra-deploy app-deploy
