#!/bin/sh
#Install Change Management OTRS

sudo perl /opt/otrs/bin/otrs.PackageManager.pl -a install -p /opt/otrs/packages4/GeneralCatalog-4.0.4.opm
sudo perl /opt/otrs/bin/otrs.PackageManager.pl -a install -p /opt/otrs/packages4/ITSMCore-4.0.4.opm
sudo perl /opt/otrs/bin/otrs.PackageManager.pl -a install -p /opt/otrs/packages4/ITSMChangeManagement-4.0.4.opm
