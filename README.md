learning-nodejs-passport
========================

A MEAN (Mongo, Express, Angular and Node) stack user authentication app with Passport.js



Vagrant
-------

The Vagrant file and associated scripts create a dev environment for creating and running MEAN stack applications. The bootstrap and bootstrap-npm scripts are run during provisioning and install required packages (mongo, node etc) as well as configure npm (installing packages and fixing permissions problems).

Npm's node_modules folder is a problem for Vagrant running in a cygwin host: it requires symbolic links and also very long full path names. To circumvent this problem, we create the node_modules folder in the guest os user folder (/home/vagrant) and link to it from the web app folder. This requires symbolic links to be enabled for VirtualBox - acheived with a configuration option in the Vagrantfile. However, this requires the 'vagrant up' command to be executed from an administrator-level shell instance on the host machine. 

To launch the cygwin or cmd shell as administrator under Windows, right click on the shell executable or shortcut and select "Run as Administrator".

Presumably 'sudo vagrant up' would be sufficient on a Linux host OS.

To prepare a folder for use with npm under a Windows host OS, run the script 'npm-prepare' from within that folder. (npm-prepare is installed to /usr/local/bin during provisioning.) npm-prepare will create a node_modules folder in a unique subfolder of ~/node_modules_share and create a symlink from the current folder. Subsequent execution of 'yo' or 'npm install' will write to that folder, circumventing the host filesystem limitation on path lengths. npm-prepare should not be necessary for a Linux host OS.  