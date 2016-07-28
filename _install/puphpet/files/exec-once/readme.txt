
Custom Bash Files

You can run your own custom code after the VM finishes provisioning by adding files to the puphpet/files/exec-always, puphpet/files/exec-always-unprivileged, puphpet/files/exec-once, puphpet/files/exec-once-unprivileged, puphpet/files/startup-always, puphpet/files/startup-always-unprivileged, puphpet/files/startup-once and puphpet/files/startup-once-unprivileged folders.

Files are executed in alphabetical order, and filenames must end in .sh. Files within exec-once-* are run before files within exec-always-*, and files within startup-once-* are run before files within startup-always-*. Files in exec-once-* and exec-always-* are run before files in startup-once-* and startup-always-*.

Files within *-unprivileged are run as the default user while the other ones area run using sudo. Files within *-unprivileged are run after all other files on the same running order as "privileged" files.

Files within exec-always-* will run on initial $ vagrant up and all $ vagrant provision, while files within exec-once-* will run only the first time you run Vagrant, unless you SSH into the VM and remove the /.puphpet-stuff/exec-once-ran and/or /.puphpet-stuff/exec-once-unprivileged-ran files and re-run Vagrant.

Files within startup-always-* will run on each $ vagrant up, while files within startup-once-* will only run on the next time you run Vagrant, unless you SSH into the VM and remove the /.puphpet-stuff/startup-once-ran and/or /.puphpet-stuff/startup-once-unprivileged-ran files and re-run Vagrant.
