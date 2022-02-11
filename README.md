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
_Note: Use the [Markdown Table Generator](http://www.tablesgenerator.com/markdown_tables) to add/remove values from the table_.

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

![Update the path with the name of your screenshot of docker ps output](https://github.com/28sides/BootCamp/blob/main/Images/Docker_PS_Elk.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
Web1 10.0.0.5 and Web2 10.0.0.7

We have installed the following Beats on these machines:
- Filebeat
- Metricbeat

These Beats allow us to collect the following information from each machine:
- Filebeat collects the system logs

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the _____ file to _____.
- Update the _____ file to include...
- Run the playbook, and navigate to ____ to check that the installation worked as expected.

_TODO: Answer the following questions to fill in the blanks:_
- _Which file is the playbook? Where do you copy it?_
- _Which file do you update to make Ansible run the playbook on a specific machine? How do I specify which machine to install the ELK server on versus which to install Filebeat on?_
- _Which URL do you navigate to in order to check that the ELK server is running?

_As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc._
