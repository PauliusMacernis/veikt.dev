# veikt.dev
Development environment needed for veikt.com project to easier develop on the local machine. 

Quick install:
- Install VirtualBox and Vagrant. 
- Clone (or just download) all files of this repository.
- Do `vagrant up`
- Manually copy content of the file `_install\hosts\hosts` into the host file of your local machine.
- Do `vagrant ssh` 
- Do `sudo /vagrant/puphpet/files/exec-once/config-nginx.sh` 
- Manually remmove all inner content of `veikt.dev/httpdocs` and manually do `git clone https://github.com/sugalvojau/veikt.com.git .` from `veikt.dev/httpdocs`
- That is it. Open `veikt.dev` in the internet browser. What you see in the internet browser is `step3.output` part of the project. At the moment project consists of 3 parts: `step1.download`, `step2.normalize`, `step3.output`.

More info could be found at https://puphpet.com/#help

Contact me if any difficulties arise.
