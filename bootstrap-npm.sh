# ensure this script is run as user 'vagrant'

# if the current user id doesn't match 'vagrant's user id
if [ "$(id -u)" != "$(id -u vagrant)" ]; then

 # get the path to the script
 SCRIPTNAME="$(dirname $0)/$0"

 # invoke the script 
 echo "Reloading script as user 'vagrant'"
 sudo -H -u vagrant $SCRIPTNAME

 # exit
 exit 0
fi

echo "Running script as user 'vagrant'"


# configure npm for sudo-less installs

#from https://github.com/sindresorhus/guides/blob/master/npm-global-without-sudo.md
mkdir "${HOME}/.npm-packages"

echo 'prefix=${HOME}/.npm-packages' >> ${HOME}/.npmrc

echo '### Begin NPM config:'>> ${HOME}/.bashrc

echo 'NPM_PACKAGES="${HOME}/.npm-packages"' >> ${HOME}/.bashrc
echo 'NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"' >> ${HOME}/.bashrc
echo 'PATH="$NPM_PACKAGES/bin:$PATH"' >> ${HOME}/.bashrc
echo 'MANPATH="$NPM_PACKAGES/share/man:$(manpath)"' >> ${HOME}/.bashrc

echo '### End NPM config:'>> ${HOME}/.bashrc

source ${HOME}/.bashrc

# update npm?
npm update -g npm

# install node-gyp
npm install -g node-gyp

# install yeoman tooling
npm install -g yo bower grunt-cli

# install yo generators for basic web app scaffolding
npm install -g generator-webapp generator-angular generator-angular-fullstack


# install express generator? 
# this may not be necessary with the yo scaffolding
#npm install express-generator -g
