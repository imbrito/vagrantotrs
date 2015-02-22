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

}
