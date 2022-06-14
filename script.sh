#!/bin/bash
echo What is your instance name?
read instance_name
#List all properties of your VM
gcloud compute instances describe $instance_name
#List the internal IP
gcloud compute instances describe $instance_name \
	--format='get(networkInterfaces[0].networkIP)'
#List the external IP
gcloud compute instances describe $instance_name \
	--format='get(networkInterfaces[0].accessConfigs[0].natIP)'

