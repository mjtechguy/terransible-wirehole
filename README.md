# TERRANSIBLE-WIREHOLE

This project is based on the excellent Wirehole project by Devin Stokes found below:

Repo: https://github.com/IAmStoxe/wirehole

Blog: https://medium.com/@devinjaystokes/automating-the-deployment-of-your-forever-free-pihole-and-wireguard-server-dce581f71b7

# Disclaimer

This project is provided with no warranty or guarantee of functionality or security. This is a proof of concept and should be implemented with caution and additional security measures to ensure it is secure and stable.

# What is Terransible

**Terransible** is the combination of Terraform and Ansible to deploy and manage infrastructure. Terraform is used to deploy the infrastructure and track its state. Ansible is used a the configuration management tool to ensure that the OS on the systems does not drift from our declarative configuration.

You can see more Terransible projects at https://terransible.com

# Technologies Used

* [Docker](https://docs.docker.com/engine/)
* [Terraform](https://www.terraform.io/)
* [Ansible](https://www.ansible.com/)
* [Wireguard](https://www.wireguard.com/)
* [Pi-hole](https://pi-hole.net/)
* [Unbound](https://nlnetlabs.nl/projects/unbound/about/)

# Modifications from original

* Allow for deployment to the following providers:
  * Oracle Cloud Infrastructure (OCI)
  * Digital Ocean (DO)
  * ~~Hetzner Cloud (HETZNER)~~ - COMING SOON
  * ~~Amazon Web Services (AWS)~~ - COMING SOONISH
  * ~~Google Cloud Platform (GCP)~~ - COMING LESS SOON
  * ~~Microsoft Azure (AZURE)~~ - MAYBE ONE DAY
* Terraform output saves the public IP of the Wirehole server that is created to an Ansible Inventory file
* Added a Terraform varibale to manually input your OCI free tier Availability Domain (mine was trying to select the incorrect zone and the instance would not launch)
* Removed the Bash setup script in favor of Ansible Playbook provisioning. This allows for easy future configuration management of the instance for updates, additional software installs and more.
* Ansible automatically updates the instance on first boot, installs all of the prereqs as well as `haveged` for additional VM entropy, and reboots once the install is complete and the containers are online.
* Default creates 10 Wireguard clients and downloads the configuration files to the local machine

# Setup

* Install Terraform on the machine you will be launching this project from: https://learn.hashicorp.com/tutorials/terraform/install-cli
* Install Ansible on the machine you will be launching this project from: https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html

# Deploying

* OCI Instruction: [./terraform/oracle/README.md](./terraform/oracle/README.md)
* DO Instruction: [./terraform/digitalocean/README.md](./terraform/digitalocean/README.md)

# Closing

Thanks to Devin Stokes for the initial project and to the creators of Pi-Hole, Wireguard and Unbound.

There are a few other tasks that you should do such as:
* Secure port 22 on your Wirehole instance to only allow access from your IP address or change the SSH port AND secure for extra security.
* Backup your `terraform.state` file regularly or move the backend Terraform state storage to S3 for easy state management from multiple machines. Don't forget to enable versioning on the bucket.
* Add more clients to the network using the additional Peer configuration files
* Add more blocklists to your Pi-Hole for more effective ad blocking. Good collection of lists here: https://firebog.net/
* Regularly running your Ansible playbook to make sure that your system and docker-containers are up to date.
* Other regular management tasks

# Issues and Troubleshooting

Please open a Github issue if you have problems and I will try to assist when I have time.

# Socials

You can follow me on social media at the following:

Twitter: https://twitter.com/mjtechguy

GitHub: https://github.com/mjtechguy

Youtube (Coming Soon): https://www.youtube.com/channel/UCjrGJ7W90ZT2Cw9oLrEFztA

