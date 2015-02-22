# install OTRS

class otrs::install{
    #OTRS 4.0.4 -> donwload: http://ftp.otrs.org/pub/otrs/otrs-4.0.4.tar.gz
    exec {'download-otrs':
        cwd => '/opt',
        command => '/usr/bin/sudo wget http://ftp.otrs.org/pub/otrs/otrs-4.0.4.tar.gz',
        creates => '/opt/otrs-4.0.4.tar.gz',
    }
    
    exec {'untar-otrs':
        cwd => '/opt',
        command => '/usr/bin/sudo tar xzvf otrs-4.0.4.tar.gz',
        creates => '/opt/otrs',
        require => Exec['download-otrs'],
    }
    
    exec {'rename-otrs':
        cwd => '/opt',
        command => '/usr/bin/sudo mv otrs-4.0.4 otrs',
        creates => '/opt/otrs',
        require => Exec['untar-otrs'],
    }
    
    user {'otrs':
        ensure => present,
        shell => '/bin/bash',
        home => '/opt/otrs',
        groups => ['www-data'],
        managehome => true,
    }
    
    exec {'kernel-config':
        cwd => '/opt/otrs/Kernel',
        command => '/usr/bin/sudo cp Config.pm.dist Config.pm',
        creates => '/opt/otrs/Kernel/Config.pm',
    }
    
    exec {'kernel-config-generic-agent':
        cwd => '/opt/otrs/Kernel/Config',
        command => '/usr/bin/sudo cp GenericAgent.pm.dist GenericAgent.pm',
        creates => '/opt/otrs/Kernel/Config/GenericAgent.pm',
    }
    
    file{'/etc/apache2/sites-available/otrs.conf':
        ensure => link,
        target => '/opt/otrs/scripts/apache2-httpd.include.conf',
        require => Package['apache2'],
        notify => Service['apache2'],
    }
    
    exec {'set-permissions':
        cwd => '/opt/otrs/bin',
        command => '/usr/bin/sudo perl otrs.SetPermissions.pl --web-user=otrs --web-group=www-data',
    }

}
