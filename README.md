# veikt.dev
Development environment for [veikt.com project](https://github.com/sugalvojau/veikt.com).

### Easy Install:
- Install [VirtualBox](https://www.virtualbox.org/) and [Vagrant](https://www.vagrantup.com/)
- [Download all files of this repository](https://github.com/sugalvojau/veikt.dev/archive/master.zip)
- Do `vagrant up` (the command may run for about 30+ minutes)
- Manually copy content of the file `_install\hosts\hosts` into the [host file of your local machine](https://en.wikipedia.org/wiki/Hosts_(file)), if the content is not in there already.
- Do `vagrant ssh` 
- Do `/home/_install/puphpet/files/exec-preprovision/config-1.sh && /home/_install/puphpet/files/exec-once/config-1.sh && /home/_install/puphpet/files/exec-once/config-mysql.sh && /home/_install/puphpet/files/exec-once/config-nginx.sh && /home/_install/puphpet/files/exec-once/config-php.sh && /home/_install/puphpet/files/exec-once/config-www-frontend.sh && /home/_install/puphpet/files/exec-once-unprivileged/config-github.sh` (the command may run for another 30+ minutes)
- That is it. [Open](http://www.veikt.dev) `www.veikt.dev` in your favourite internet browser. What you see is the `www` part of the project. At the moment project consists of 4 parts: `download`, `normalize`, `publicize`, `www` (sometimes also called `output`).
- Do `vagrant halt` to turn all off.

#### Known issues:
- If you see 404 error after checking the http://www.veikt.dev then try to ssh into the server (`vagrant ssh`) and restart nginx service (do `sudo service nginx restart`). The website should work fine after restarting the service.
- If something goes wrong with executing shell scripts then check for [line endings](https://help.github.com/articles/dealing-with-line-endings/) inside executable shell scripts! Must be LF. Some software may change line endings without you noticing this: git management tools, IDE, others.

  
### Easy Use: 
The next time you will come back for development - do `vagrant up` only. "vagrant up" will be much much faster this time. Finished your work? Doing `vagrant halt` will turn all off again.


### Easy Development:

Lets say you are about to work with job ads from example.org website while your Virtual Machine is on (it should be on if you did all from above). Then you have to run:
- http://download.veikt.dev/projects/example.org/index.php ,- this will download job ads from the web to the server
- http://normalize.veikt.dev/projects/example.org/index.php ,- this will validate and write the information from server files to a database
- http://output.veikt.dev or http://www.veikt.dev ,- this will output all to your browser in the same way www.veikt.com outputs

### Easy Development (www explained)

There are two branches at the moment: master and symfony. Master is currently moved to support Laravel 5 PHP framework. Symfony is left in the separate branch for historical reasons, but if the branch would become active one day then anything may happen... At the moment I am interested in getting deeper into Laravel and so I turn master into Laravel.
 
**Some commands to remember for Laravel 5 (master branch) developers:**

 `php artisan`
 
**Some commands to remember for Symfony (obsolete symfony branch) developers:**

`php bin/console doctrine:database:drop --force`

`php bin/console doctrine:database:create`

`php bin/console doctrine:migration:diff`

`php bin/console doctrine:migration:migrate`

`php bin/console doctrine:fixtures:load`

****


  
  
### More Info:
PuPHPet: [https://puphpet.com/#help](https://puphpet.com/#help)

[Contact me](http://portfolio.vertyb.es/) if any difficulties arise.




