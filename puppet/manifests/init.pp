exec { 'apt-update':
    command => 'apt-get update',
    path => '/usr/bin'
}
# set global path variable for project
# http://www.puppetcookbook.com/posts/set-global-exec-path.html
Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/", "/usr/local/bin", "/usr/local/sbin" ] }

class { 'git::install': }
class { 'curl::install': }
class { 'mysql::install': }
class { 'apache2::install': }
class { 'phpmyadmin::install': }
class { 'php5::install': }
class { 'perl::install': }
class { 'otrs::install': }

exec {'restart-apache2':
    command => '/usr/bin/sudo service apache2 restart',
    require => [ Package['apache2'], Class[ 'otrs::install', 'perl::install', 'php5::install', 'mysql::install' ] ],
}
