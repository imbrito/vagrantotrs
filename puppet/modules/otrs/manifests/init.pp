# install OTRS

class otrs::install{
    #OTRS 4.0.4 -> donwload: http://ftp.otrs.org/pub/otrs/otrs-4.0.4.tar.gz
    exec {'download-otrs':
        cwd => '/opt',
        command => '/usr/bin/sudo wget http://ftp.otrs.org/pub/otrs/otrs-4.0.4.tar.gz -O - | tar -xz',
        creates => '/opt/otrs-4.0.4.tar.gz',
    }
    
    exec {'rename-otrs':
        cwd => '/opt',
        command => '/usr/bin/sudo mv otrs-4.0.4 otrs',
        creates => '/opt/otrs',
        before => [ User['otrs'], Exec[ 'kernel-config', 'kernel-config-generic-agent' ] ],
        require => Exec['download-otrs'],
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
        require => [ User['otrs'], Exec['download-otrs', 'rename-otrs'] ],
    }
    
    exec {'kernel-config-generic-agent':
        cwd => '/opt/otrs/Kernel/Config',
        command => '/usr/bin/sudo cp GenericAgent.pm.dist GenericAgent.pm',
        creates => '/opt/otrs/Kernel/Config/GenericAgent.pm',
        require => [ User['otrs'], Exec['download-otrs', 'rename-otrs'] ],
    }
    
    file {'/etc/apache2/sites-enabled/otrs':
        ensure => link,
        target => '/opt/otrs/scripts/apache2-httpd.include.conf',
        require => [ Package['apache2'], Exec[ 'rename-otrs', 'set-permissions'] ],
    }
    
    exec {'set-permissions':
        cwd => '/opt/otrs/bin',
        command => '/usr/bin/sudo perl otrs.SetPermissions.pl --otrs-user=otrs --web-group=www-data',
        creates => '/etc/apache2/sites-enabled/otrs',
        require => [ User['otrs'], Exec[ 'kernel-config', 'kernel-config-generic-agent' ] ],
    }
    
}

class cronjobs::install{    
    exec {'aaa_base-cronjob':
        cwd => '/opt/otrs/var/cron',
        command => '/usr/bin/sudo cp aaa_base.dist aaa_base',
        creates => '/opt/otrs/var/cron/aaa_base',
        require => User['otrs'],
    }
    
    exec {'cache-cronjob':
        cwd => '/opt/otrs/var/cron',
        command => '/usr/bin/sudo cp cache.dist cache',
        creates => '/opt/otrs/var/cron/cache',
        require => User['otrs'],
    }
    
    exec {'fetchmail-cronjob':
        cwd => '/opt/otrs/var/cron',
        command => '/usr/bin/sudo cp fetchmail.dist fetchmail',
        creates => '/opt/otrs/var/cron/fetchmail',
        require => User['otrs'],
    }
    
    exec {'generate_dashboard_stats-cronjob':
        cwd => '/opt/otrs/var/cron',
        command => '/usr/bin/sudo cp generate_dashboard_stats.dist generate_dashboard_stats',
        creates => '/opt/otrs/var/cron/generate_dashboard_stats',
        require => User['otrs'],
    }
    
    exec {'generic_agent-cronjob':
        cwd => '/opt/otrs/var/cron',
        command => '/usr/bin/sudo cp generic_agent.dist generic_agent',
        creates => '/opt/otrs/var/cron/generic_agent',
        require => User['otrs'],
    }
    
    exec {'generic_agent-database-cronjob':
        cwd => '/opt/otrs/var/cron',
        command => '/usr/bin/sudo cp generic_agent-database.dist generic_agent-database',
        creates => '/opt/otrs/var/cron/generic_agent-database',
        require => User['otrs'],
    }
    
    exec {'pending_jobs-cronjob':
        cwd => '/opt/otrs/var/cron',
        command => '/usr/bin/sudo cp pending_jobs.dist pending_jobs',
        creates => '/opt/otrs/var/cron/pending_jobs',
        require => User['otrs'],
    }
    
    exec {'postmaster-cronjob':
        cwd => '/opt/otrs/var/cron',
        command => '/usr/bin/sudo cp postmaster.dist postmaster',
        creates => '/opt/otrs/var/cron/postmaster',
        require => User['otrs'],
    }
    
    exec {'postmaster_mailbox-cronjob':
        cwd => '/opt/otrs/var/cron',
        command => '/usr/bin/sudo cp postmaster_mailbox.dist postmaster_mailbox',
        creates => '/opt/otrs/var/cron/postmaster_mailbox',
        require => User['otrs'],
    }
    
    exec {'rebuild_ticket_index-cronjob':
        cwd => '/opt/otrs/var/cron',
        command => '/usr/bin/sudo cp rebuild_ticket_index.dist rebuild_ticket_index',
        creates => '/opt/otrs/var/cron/rebuild_ticket_index',
        require => User['otrs'],
    }    
    exec {'scheduler_watchdog-cronjob':
        cwd => '/opt/otrs/var/cron',
        command => '/usr/bin/sudo cp scheduler_watchdog.dist scheduler_watchdog',
        creates => '/opt/otrs/var/cron/scheduler_watchdog',
        require => User['otrs'],
    }
    
    exec {'session-cronjob':
        cwd => '/opt/otrs/var/cron',
        command => '/usr/bin/sudo cp session.dist session',
        creates => '/opt/otrs/var/cron/session',
        require => User['otrs'],
    }
    
    exec {'unlock-cronjob':
        cwd => '/opt/otrs/var/cron',
        command => '/usr/bin/sudo cp unlock.dist unlock',
        creates => '/opt/otrs/var/cron/unlock',
        require => User['otrs'],
    }
    
    exec {'cronjobs-start':
        cwd => '/opt/otrs/bin/',
        command => '/usr/bin/sudo /opt/otrs/bin/Cron.sh start otrs',
        require => Exec[ 'aaa_base-cronjob', 'cache-cronjob', 'fetchmail-cronjob', 'generate_dashboard_stats-cronjob', 
        'generic_agent-cronjob', 'generic_agent-database-cronjob', 'pending_jobs-cronjob', 'postmaster-cronjob',
        'postmaster_mailbox-cronjob', 'rebuild_ticket_index-cronjob', 'scheduler_watchdog-cronjob', 'session-cronjob',
        'unlock-cronjob' ],
    }

}
