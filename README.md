# PwnBox
A lightweight VM for RE (fuzzing, symEx, exploiting etc) and wargaming tasks

## Requirements

- [Vagrant](https://www.vagrantup.com/)
- [Virtual Box](https://www.virtualbox.org/)
- [VMWare Fusion (for Apple Silicon)](https://support.broadcom.com/group/ecx/productdownloads?subfamily=VMware+Fusion)

## Installation

### Apple Silicon

- Download VMWare Fusion Pro 13
- Install the Vagrant VMWare Plugin
    - `brew install --cask vagrant-vmware-utility`
    - `vagrant plugin install vagrant-vmware-desktop`
- Run it `vagrant up --provider=vmware_fusion`

### Non-Apple Silicon

Run the following commands to start the PwnBox :

```
vagrant up
```


### Usage

The server is accessible via `vagrant ssh`

