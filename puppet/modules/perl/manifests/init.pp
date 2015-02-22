# install perl

class perl::install{
    #http://www.puppetcookbook.com/posts/install-multiple-packages.html
    $perl = [ 'perl' ]
    
    package {$perl:
        ensure => present,
    }
}
