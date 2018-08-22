## Demo 1

### Task description:
- Create 2 virtual machines with Moodle LMS and required software (php7 or later, apache, python modules)
- Create 1 virtual machine with database (use postgresql 9.3 or later)
- Create 1 virtual machine with load balancer (use haproxy or nginx)
- Use Centos 7 minimal as VM OS

![Task scheme](/images/Demo1_1.png)

### Task solution
I used Vagrant for creating virtual machines and setting up network connections. For provisioning and installing the required software I used Ansible. It was installed on the load balancer machine.

In some cases, we need run provision few times and it'll fail if try create database again or install moodle again, so  I wrote custom scripts for moodle installation and database initialization. First script checks if moodle was installed by looking at crontab records (We need setting up some tasks in crone). Second script checks if the data directory for db is empty.
The second approach - using tags. When we run playbook manually, we can choose tags which will be executed.

*Provisioning scheme*
![Provisioning scheme](/images/Demo1_2.png)

Loadbalancer provides reliability in servers work and hides them from the external network.

*Connection scheme*
![Connection scheme](/images/Demo1_3.png)

For better demonstration of loadbalancer work, I created 3 webservers