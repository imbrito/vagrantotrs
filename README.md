# VagrantOTRS

*VagrantOTRS* is a packaged development environment for OTRS.
This is a fairly simple project to management it to college IF Fluminense.
This project followed [VagrantPress](https://github.com/chad-thompson/vagrantpress)

# What's Installed

+ Ubuntu Precise (12.04 LTS) x86
+ Apache2
+ MySQL
+ PHP5
+ PhpMyAdmin
+ Git
+ Curl
+ Perl
+ OTRS 4.0.4

# Support

+ [Vagrant 1.6.5](https://www.vagrantup.com/download-archive/v1.6.5.html)
+ [Virtualbox 4.3](https://www.virtualbox.org/wiki/Downloads)
+ [Vagrant Hostsupdater](https://github.com/cogitatio/vagrant-hostsupdater)

## Getting Started

This is a fairly simple project to get up and running.  
The procedure for starting up a working OTRS 4.0.4 is as follows:

+ For install Support (Ubuntu Precise x86)

1. Clone the project.  (There’s only master branch.)
2. Run `sudo chmod -x vagrantotrs/scripts/setup.sh` from command line
3. Run the command `vagrant up` from the directory
4. Open your browser to `http://vagrantotrs.dev/otrs/installer.pl` and install OTRS 4.0.4

+ If installed Support

1. Clone the project.  (There’s only master branch.)
2. Run the command `vagrant up` from the directory
3. Open your browser to `http://vagrantotrs.dev/otrs/installer.pl` and install OTRS 4.0.4

+ Access to VM

1. Whit Virtualbox: login `vagrant` password `vagrant`
2. Whit SSH agent: login `ssh vagrant@192.168.33.10` or `ssh vagrant@vagrantotrs.dev` password `vagrant`

+ Access to database MySQL

1. Whit PhpMyAdmin: Open your browser to `http://vagrantotrs.dev/phpmyadmin` login `root` password `vagrant`
2. Whit shell: `mysql -u root -pvagrant`

# License

The MIT License (MIT)

Copyright © 2015 Ismael Moreira (ismael.20rj@gmail.com)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


