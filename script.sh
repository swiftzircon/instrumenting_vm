#!/bin/bash
echo What is your instance name?
read instance_name
#List all properties of your VM
#gcloud compute instances describe $instance_name

#List the internal IP
echo Internal IP:
gcloud compute instances describe $instance_name \
	--format='get(networkInterfaces[0].networkIP)'

#List the MAC address
echo MAC address:
gcloud compute ssh instance-1 --command='find /sys/class/net/ \ -type 1 -printf "%P: " -execdir cat {}/address \;'

#List the external IP
echo External IP:
gcloud compute instances describe $instance_name \
	--format='get(networkInterfaces[0].accessConfigs[0].natIP)'

#List the DNS Servers
# Not available unless using Cloud DNS service...

#Geolocation of the IP
echo Geolocation of IP:
gcloud compute instances describe $instance_name \
	--format='get(zone)'

#Service account for this GCE instance
echo Service Account for this GCE Instance:
gcloud compute instances describe $instance_name \
	--format='get(serviceAccounts[0].email)'

#Instance ID
echo Instance ID:
gcloud compute instances describe $instance_name \
	--format='get(id)'

#Project ID
echo Project ID:
gcloud config get-value project

#List of all users that logged into this instance
#echo List of all logged instance users:
# Unsure on how to include/find this information.

#List the size of the sum of all packages in the instance
# Not available without VM Manager...

