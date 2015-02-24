exec { 'apt-update':
    command => 'apt-get update',
    path => '/usr/bin'
}
# set global path variable for project
# http://www.puppetcookbook.com/posts/set-global-exec-path.html
Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/", "/usr/local/bin", "/usr/local/sbin" ] }

#https://docs.puppetlabs.com/references/latest/metaparameter.html#stage
#https://docs.puppetlabs.com/learning/ordering.html#before-and-require

stage {'pre':
    before => Stage['setup'],
}

class { 'git::install': 
    stage => 'pre',
}
class { 'curl::install': 
    stage => 'pre',
}
class { 'perl::install': 
    stage => 'pre',
}
class { 'apache2::install': 
    stage => 'pre',
    before => Class['mysql::install'],
}
class { 'mysql::install': 
    stage => 'pre',
    require => Class['apache2::install'],
}
class { 'phpmyadmin::install': 
    stage => 'pre',
}
class { 'php5::install': 
    stage => 'pre',
    require => Class['apache2::install'],
}

stage {'setup':
    before => Stage['last'],
    require => Stage['pre'],
}

class { 'otrs::install': 
    stage => 'setup',
}

stage {'last':
    require => Stage['setup'],
}

class { 'cronjobs::install':
    stage => 'last',
    require => Class[ 'otrs::install' ],
}

exec {'restart-apache2':
    command => '/usr/bin/sudo service apache2 restart',
    require => Class[ 'otrs::install' ],
}
