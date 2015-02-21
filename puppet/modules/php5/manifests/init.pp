# install php5

class php5::install {    
    #http://www.puppetcookbook.com/posts/install-multiple-packages.html
    $php5 = [ 'php5', 'php5-mysql', 'php5-curl', 'php5-gd', 'php5-fpm', 'libapache2-mod-php5', 'php5-dev', 'php5-xdebug' ]
    
    package { $php5:
            ensure => present,
    }
    
    exec {'restart-apache2':
        command =>'/usr/bin/sudo service apache2 restart',
        require => Exec['create-test-php'],
    }
    
    #http://askubuntu.com/questions/181481/how-to-create-files-and-directorys-in-var-www
    exec {'create-test-php':
        command =>'/usr/bin/sudo echo "<?php phpinfo(); ?>" | /usr/bin/sudo tee /var/www/test.php',
        require => Package['apache2'],
    }
}
