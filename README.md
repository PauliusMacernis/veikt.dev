# veikt.dev
Development environment for veikt.com project.

Quick install:
- Install [VirtualBox](https://www.virtualbox.org/) and [Vagrant](https://www.vagrantup.com/)
- [Download all files of this repository](https://github.com/sugalvojau/veikt.dev/archive/master.zip)
- Do `vagrant up` (expect about 30+ minutes)
- Manually copy content of the file `_install\hosts\hosts` into the [host file of your local machine](https://en.wikipedia.org/wiki/Hosts_(file)), if the content is not in there already.
- Do `vagrant ssh` 
- Do `/home/_install/puphpet/files/exec-preprovision/config-1.sh && /home/_install/puphpet/files/exec-once/config-1.sh && /home/_install/puphpet/files/exec-once/config-mysql.sh && /home/_install/puphpet/files/exec-once/config-nginx.sh && /home/_install/puphpet/files/exec-once/config-php.sh && /home/_install/puphpet/files/exec-once/config-www-frontend.sh && /home/_install/puphpet/files/exec-once-unprivileged/config-github.sh`
- That is it. [Open](http://www.veikt.dev) `www.veikt.dev` in your favourite internet browser. What you see is the `www` part of the project. At the moment project consists of 4 parts: `download`, `normalize`, `publicize`, `www` (sometimes also called `output`).
- Do `vagrant halt` to turn all off.
  
  
The next time you will come back for development - do `vagrant up` only. "vagrant up" will be much much faster this time. Finished your work? Doing `vagrant halt` will turn all off again.



The example. Lets say you are about to work with job ads from cvbankas.lt website while your Virtual Machine is on (it should be on if you did all from above). Then you have to run:
- http://download.veikt.dev/projects/cvbankas.lt/index.php ,- this will download job ads from the web to the server
- http://normalize.veikt.dev/projects/cvbankas.lt/index.php ,- this will validate and write the information from server files to a database
- http://output.veikt.dev or http://www.veikt.dev ,- this will output all to your browser in the same way www.veikt.com outputs
  
  
More info on puphpet: https://puphpet.com/#help  
Insructions on how to navigate inside the code, to develop, etc.: https://github.com/sugalvojau/veikt.com

Contact me if any difficulties arise.

Known bugs:
- If you see 404 error after checking the http://www.veikt.dev then try to ssh into the server (`vagrant ssh`) and restart nginx service (do `sudo service nginx restart`). The website should work fine after restarting the service.
