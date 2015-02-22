# install perl

class perl::install{
    #http://www.puppetcookbook.com/posts/install-multiple-packages.html
    $perl = [ 'perl', 'libapache2-reload-perl', 'libarchive-zip-perl', 'libcrypt-eksblowfish-perl', 'libcrypt-ssleay-perl',
    'libdbd-odbc-perl', 'libdbd-pg-perl', 'libencode-hanextra-perl', 'libgd-gd2-perl', 'libgd-text-perl', 'libgd-graph-perl',
    'libio-socket-ssl-perl', 'libjson-xs-perl', 'libmail-imapclient-perl',  'libapache2-mod-perl2', 'libnet-dns-perl',
    'libnet-ldap-perl', 'libpdf-api2-perl', 'libtemplate-perl', 'libtext-csv-xs-perl', 'libxml-parser-perl', 
    'libyaml-libyaml-perl' ]
    
    package {$perl:
        ensure => present,
    }
}
