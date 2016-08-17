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
- Do `cd /home/veikt.dev/httpdocs/step3.output`
- Do `php composer.phar install`
- You will be asked to enter some information, here is what you have to enter: database_host - `127.0.0.1`, database_port - `3306`, database_name - `veikt`, database_user - `veikt`, database_password - `AAMQfaqRFT7sqHFJ`, mailer_transport - click enter, mailer_host - click enter, mailer_user - click enter, mailer password - click enter, secret - `ThisTokenIsNotSecure`. Congratulations! Symfony3 project (www.veikt.dev) has been installed.
- That is it. Open `www.veikt.dev` in the internet browser. What you see in the internet browser is `step3.output` part of the project. At the moment project consists of 3 parts: `step1.download`, `step2.normalize`, `step3.output`.


If you are interested to check the php project cvbankas.lt (for example) then you have to navigate:
- For step1 (downloads job ads): http://step1.veikt.dev/projects/cvbankas.lt/index.php
- For step2 (normalizes job ads, puts all to DB): http://step2.veikt.dev/projects/cvbankas.lt/index.php
- For step3 (outputs job ads found in DB): http://www.veikt.dev

More info on puphpet could be found at https://puphpet.com/#help
Contact me if any difficulties arise.

Known bugs:
- If you see 404 error after checking the http://www.veikt.dev then try to ssh into the server (`vagrant ssh`) and restart nginx service (`sudo service nginx restart`). The website should work fine after restarting the service.
