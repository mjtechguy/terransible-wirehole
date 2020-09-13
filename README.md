# OCI-WIREHOLE

This project is based on the excellent Wirehole project by Devin Stokes found below: 

Repo: https://github.com/IAmStoxe/wirehole

Blog: https://medium.com/@devinjaystokes/automating-the-deployment-of-your-forever-free-pihole-and-wireguard-server-dce581f71b7

# Disclaimer

This project is provided with no warranty or guarantee of functionality or security. This is a proof of concept and should be implemented with caution and additional security measures to ensure it is secure and stable.

# Technologies Used

* [Oracle Cloud](https://www.oracle.com/cloud/)
* [Docker](https://docs.docker.com/engine/)
* [Terraform](https://www.terraform.io/)
* [Ansible](https://www.ansible.com/)
* [Wireguard](https://www.wireguard.com/)
* [Pi-hole](https://pi-hole.net/)
* [Unbound](https://nlnetlabs.nl/projects/unbound/about/)

Modifications from original Wirehole project:

* Terraform output saves the public IP of the OCI Instance that is created to an Ansible Inventory file
* Added a Terraform varibale to manually input your OCI free tier Availability Domain (mine was trying to select the incorrect zone and the instance would not launch)
* Removed the Bash setup script in favor of Ansible Playbook provisioning. This allows for easy future configuration management of the instance for updates, additional software installs and more.
* Ansible automatically updates the instance on first boot, installs all of the prereqs as well as `haveged` for additional VM entropy, and reboots once the install is complete and the containers are online.
* Default creates 10 Wireguard clients and downloads the configuration files to the local machine

# Setup

* Install Terraform on the machine you will be launching this project from: https://learn.hashicorp.com/tutorials/terraform/install-cli
* Install Ansible on the machine you will be launching this project from: https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html
* Have an Oracle Cloud Account and gather the following information:
  * Oracle API signing key
  * User OCID
  * Tenancy OCID
  * Oracle Free Tier Availability Domain

# Deploy Wirehole
1.  clone this repo to your deployment machine (where you installed Terraform and Ansible)

```
git clone https://github.com/mjtechguy/oci-wirehole
cd oci-wirehole
terraform init
```
2. Copy the `terraform.tfvars.example` file to `terraform.tfvars`
3. Update **ALL** of the values above the Optional section at the bottom
4. Run `terraform plan` and if this completes without any errors, proceed to the next step
5. Run `terraform apply --auto-approve` and wait for the deployment to finish. When it is complete you should see a new `inventory` file in the `ansible` directory
6. Change into the `ansible` directory by running `cd ansible`
7. Copy the `ansible.cfg.example` to `ansible.cfg`. The default values provided will work, but feel free to update to your liking if you are familiar with Ansible
8. Run `ansible all -m ping` and make sure it returns a `pong` confirming your connectivity. If there are no errors, move the the next step.
9. Run `anible-playbook main.yml` and it will run through all of the provisioning steps and reboot the Wirehole host once to install updates.
10. If everything went well, look in the `ansible`, `files`, `wg_client_configs` directory and you should find 10 configuration files for 10 Wireguard peers (Peer1 - Peer10)
11. Install Wireguard on your desired devices: https://www.wireguard.com/install/
12. Copy the config from `Peer1/peer1.conf` to your client. 
  * (Recommended) If you only want DNS traffic to be passed to your Wirehole deployment, change the `Allowed IPs` to be `10.2.0.0/24`. Update your local DNS one the client to have `10.2.0.100` and the first DNS server and another (such as `1.1.1.1`) as your secondary.
  ```
[Interface]
Address = 10.6.0.2
PrivateKey = ABCDEFGHIJK1234567890ABCDEFGHIJK1234567890
ListenPort = 51820
DNS = 10.2.0.100

[Peer]
PublicKey = ABCDEFGHIJK1234567890ABCDEFGHIJK1234567890
Endpoint = WIREHOLIP:51820
AllowedIPs = 10.2.0.0/24
  ```
  * If you want all traffic to flow through through the VPN (there is a 10TB monthly limit on OCI free tier, so be aware) then you so not need to update the `Allowed IPs`, but you will still want to update your client DNS.
  ```
  [Interface]
Address = 10.6.0.2
PrivateKey = ABCDEFGHIJK1234567890ABCDEFGHIJK1234567890
ListenPort = 51820
DNS = 10.2.0.100

[Peer]
PublicKey = ABCDEFGHIJK1234567890ABCDEFGHIJK1234567890
Endpoint = WIREHOLIP:51820
AllowedIPs = 0.0.0.0/0, ::/0
  ```
13. Start your Wireguard client and navigate to `http://10.2.0.100/admin` in your browser to reach the Pi-Hole admin panel. If you can reach it, everything should be working as expected!

# Closing

Thanks to Devin Stokes for the initial project and to the creators of Pi-Hole, Wireguard and Unbound.

There are a few other tasks that you should do such as:
* Secure port 22 on your OCI Wirehole instance to only allow access from your IP address
* Backup your `terraform.state` file regularly or move the backend Terraform storage to S3 for easy state management from multiple machines. Don't forget to enable versioning on the bucket.
* Add more clients to the network using the additional Peer configuration files
* Add more blocklists to your Pi-Hole for more effective ad blocking. Good collection of lists here: https://firebog.net/
* Regularly running your Ansible playbook to make sure that your system and docker-containers are up to date.
* Other regular management tasks

# Issues and Troubleshooting

Please open a Github issue if you have problems and I will try to assist when I have time.

# Socials

You can follow me on social media at the following:

Twitter: https://twitter.com/mjtechguy
Youtube: https://www.youtube.com/channel/UCyE6Fz8KPkALlWiG4Tvpv7g
GitHub: https://github.com/mjtechguy

