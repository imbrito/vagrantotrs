# install MySQL

class mysql::install {
    
    $password = 'vagrant'
    
    #http://www.puppetcookbook.com/posts/install-multiple-packages.html
    $mysql = [ 'mysql-client', 'mysql-server' ]
    
    package { $mysql:
            ensure => present,
    }
    
    exec { 'Set MySQL server\'s root password':
        subscribe => [
            Package['mysql-server'],
            Package['mysql-client'],
        ],
        refreshonly => true,
        unless => "mysqladmin -uroot -p${password} status",
        command => "mysqladmin -uroot password ${password}",
    }
}
