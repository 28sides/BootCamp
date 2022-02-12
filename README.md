## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![Azure Network](https://github.com/28sides/BootCamp/blob/main/Images/Azure_Network_Diagram.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the yaml folder may be used to install only certain pieces of it, such as Filebeat.

  [Ansible Playbooks & Config Files](https://github.com/28sides/BootCamp/tree/main/yamls)

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly accessible, in addition to using a jumpbox to reduce access to the network.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the logs and system metrics.


The configuration details of each machine may be found below.


| Name     | Function | IP Address | Operating System |
|----------|----------|------------|------------------|
| Jumpbox  | Gateway  | 10.0.0.6   | Linux            |
| Web1     | Server   | 10.0.0.5   | Linux            |
| Web2     | Server   | 10.0.0.7   | Linux            |  
| TheTable | ELKStack | 10.1.0.6   | Linux            |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the JumpBox machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
71.237.234.86

Machines within the network can only be accessed by Jumpbox-Ansible container (10.0.0.6).

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses |
|----------|---------------------|----------------------|
| Jumpbox  | Yes                 | 71.237.234.86        |
| Web1     | No                  | 10.0.0.6             |
| Web2     | No                  | 10.0.0.6             |
| TheTable | No                  | 10.0.0.6             |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because it reduces the likelihood of human error and speeds up patching and updating configurations
[Elk Yaml](https://github.com/28sides/BootCamp/blob/main/yamls/install_elk.yaml.txt)

The playbook implements the following tasks:
- Install Docker, Python3 and the Docker Module
- Increase memory in the virtual machine
- Download and launch the elk image 
- ensure the container starts on boot

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![Docker PS Output](https://github.com/28sides/BootCamp/blob/main/Images/Docker_PS_Elk.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
Web1: 10.0.0.5 and Web2: 10.0.0.7

We have installed the following Beats on these machines:
- Filebeat
- Metricbeat

These Beats allow us to collect the following information from each machine:
- Filebeat collects select system logs and formats them for easy parsing. This is a much more lightweight option than logstash 
- Metricbeat collects the system metrics (os, disk i/o, etc). This allows you to easily see your systems background activity. 

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the install_elk.yaml[^1] file to /etc/ansible folder. 
- update the remote username in the install_elk.yaml file
- Update the hosts file[^2] to include your elk ip & webserver IPs [see sample hosts file](https://github.com/28sides/BootCamp/blob/main/yamls/hosts.txt)
- Update the ansible.conf file with your private_key_file = private/ssh_key/file_path
- Run the playbook[^3] , and navigate to your elk ip X.X.X.X/5601
This will install the basic elk stack onto your machine to install the filebeat and metricbeat you will follow the basic steps but you will also need to download & edit the metricbeat-config.yaml and filebeat-config.yaml files before running the filebeat- and metricbeat-playbook.yaml
- file-beatconfig.yaml & metricbeat-config.yaml: edit the following sections
```
setup.kibana
  host: "10.1.0.6:5601" #TODO: Change this to the IP address of your ELK server
```
```
output.elasticsearch:
    hosts: ["10.1.0.6:9200"] #TODO: Change this to the IP of your ELK server
```
- once you've edited the file-beatconfig and metricbeat-config yamls, run the corresponding playbooks
- to confirm that they are running go back to your kibana site and while "explore on my own"
 - for filebeat: go to "add log data" then the DEB tab and scroll all the way down to Step 5 and click "check data": you should see this:
  ![filebeat confirmation](https://github.com/28sides/BootCamp/blob/main/Images/Filebeat_successfully_installed.png)
 - for metricbeat: go to "add metric data" then the DEB tab and scroll all teh way down to Step 5 and click "check data" and you should see this:
  ![metricbeat confirmation](https://github.com/28sides/BootCamp/blob/main/Images/metricbeat_success.png)

[^1]: run curl command then change the file by removing the .txt before running the playbook - do this for all the files because I am lazy and this was a deliverable for class on my birthday weekend and I needed to get it done fast
[^2]: I like using nano to edit my files
[^3]: run ansible-playbook nameoffile.yaml for all the yaml files
