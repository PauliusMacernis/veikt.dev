# veikt.dev
Development environment for veikt.com project.

Quick install:
- Install VirtualBox and Vagrant
- Download all files of this repository
- Do `vagrant up`
- Manually copy content of the file `_install\hosts\hosts` into the host file of your local machine, if the information is not in there already.
- Do `vagrant ssh` 
- Do `/home/_install/puphpet/files/exec-preprovision/config-1.sh && /home/_install/puphpet/files/exec-once/config-1.sh && /home/_install/puphpet/files/exec-once/config-mysql.sh && /home/_install/puphpet/files/exec-once/config-nginx.sh && /home/_install/puphpet/files/exec-once/config-php.sh && /home/_install/puphpet/files/exec-once-unprivileged/config-github.sh`
- That is it. Open `www.veikt.dev` in your favourite internet browser. What you see in the browser is the `output` part of the project. At the moment project consists of 3 parts: `download`, `normalize`, `output`.


For example, if you are interested to work with job ads from cvbankas.lt (for example) then you have to navigate:
- For downloading job ads: http://download.veikt.dev/projects/cvbankas.lt/index.php ,- this will download job ads from the web to the server.
- For normalizing job ads: http://normalize.veikt.dev/projects/cvbankas.lt/index.php ,- this will validate and write the information from server files to a database.
- The information on job ads could now be seen here - http://output.veikt.dev or here - http://www.veikt.dev

More info on puphpet could be found at https://puphpet.com/#help
Contact me if any difficulties arise.

Known bugs:
- If you see 404 error after checking the http://www.veikt.dev then try to ssh into the server (`vagrant ssh`) and restart nginx service (do `sudo service nginx restart`). The website should work fine after restarting the service.
