#!/bin/sh
#Setup VagrantOTRS
echo 'Setup VagrantOTRS'
sudo apt-get update

echo 'Downloading Virtualbox 4.3 for Ubuntu Precise x86'
wget "http://download.virtualbox.org/virtualbox/4.3.22/virtualbox-4.3_4.3.22-98236~Ubuntu~precise_i386.deb"

echo 'Install Virtualbox 4.3 for Ubuntu Precise x86'
sudo dpkg -i virtualbox-4.3_4.3.22-98236~Ubuntu~precise_i386.deb

echo 'Downloading Vagrant 1.6.5 for Ubuntu Precise x86'
wget "https://dl.bintray.com/mitchellh/vagrant/vagrant_1.6.5_i686.deb"

echo 'Install Vagrant 1.6.5 for Ubuntu Precise x86'
sudo dpkg -i vagrant_1.6.5_i686.deb

sudo apt-get update
vagrant plugin install vagrant-hostsupdater
