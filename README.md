# Ansible betacloud.hetzner

[![Ansible Galaxy](http://img.shields.io/badge/ansible--galaxy-betacloud.hetzner-blue.svg)](https://galaxy.ansible.com/betacloud/hetzner/)
![Ansible 2.2](https://img.shields.io/badge/Ansible-2.2-green.png?style=flat)
![Ansible 2.3](https://img.shields.io/badge/Ansible-2.3-green.png?style=flat)

Notes
-----

**Caution when using. Systems are installed without further inquiry.**

Platforms
---------

Tested on Ubuntu. Should work on all platforms.

Example playbook
----------------

```yml
- hosts: hetzner
  gather_facts: no

  vars:
    hetzner_authorized_keys:
    - ssh-rsa AAAA...
    hetzner_autosetup_file: /path/to/autosetup_file
    hetzner_private_key: |
      -----BEGIN RSA PRIVATE KEY-----
      ...
      -----END RSA PRIVATE KEY-----
    hetzner_root_device: /dev/ROOT_DEVICE
    hetzner_webservice_username: USERNAME
    hetzner_webservice_password: PASSWORD

  roles:
  - role: betacloud.hetzner
```

Example autosetup file
----------------------

The following ``autosetup`` file  will be used by default. Further details regarding
the file can be found at [Hetzner in the wiki](https://wiki.hetzner.de/index.php/Installimage/en#autosetup).

```
DRIVE1 /dev/sda
DRIVE2 /dev/sdb

SWRAID 1
SWRAIDLEVEL 1

BOOTLOADER grub
HOSTNAME bootstrap

PART swap swap 16G
PART /boot ext3 1G
PART / xfs all

IMAGE /root/.oldroot/nfs/install/../images/Ubuntu-1604-xenial-64-minimal.tar.gz
```

At Hetzner the following images are available:

* Archlinux-2017-64-minmal.tar.gz
* CentOS-68-64-minimal.tar.gz
* CentOS-73-64-minimal.tar.gz
* CoreOS-1010-64-production.bin.bz2
* Debian-711-wheezy-64-minimal.tar.gz
* Debian-87-jessie-64-LAMP.tar.gz
* Debian-87-jessie-64-minimal.tar.gz
* openSUSE-422-64-minimal.tar.gz
* Ubuntu-1404-trusty-64-minimal.tar.gz
* Ubuntu-1604-xenial-64-minimal.tar.gz
* Ubuntu-1610-yakkety-64-minimal.tar.gz

Author information
------------------

This role was created by [Betacloud Solutions GmbH](https://betacloud-solutions.de).

License
-------

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0.

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
