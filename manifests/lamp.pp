class thought::lamp inherits thought::locater{
        # execute 'apt-get update'
        exec { 'apt-update':                    # exec resource named 'apt-update'
                command => '/usr/bin/apt-get update'  # command this resource will run
            }

        # install apache2 package
        package { $thought::locater::pack_apche:
                require => Exec['apt-update'],        # require 'apt-update' before installing
                ensure => installed,
            }
        # ensure apache2 service is running
        service { $thought::locater::pack_apche:
              ensure => running,
            }
        # install mysql-server package
        package { $thought::locater::pack_mysql:
            require => Exec['apt-update'],        # require 'apt-update' before installing
            ensure => installed,
            }
        # ensure mysql service is running
        service { 'mysql':
            ensure => running,
            }
        # install php5 package
        package { $thought::locater::pack_php:
            require => Exec['apt-update'],        # require 'apt-update' before installing
            ensure => installed,
            }
        # ensure info.php file exists
        file { $thought::locater::location:
                 ensure => file,
                 content => '<?php
phpinfo();
?>',    # phpinfo code
                require => Package[$thought::locater::pack_apche],        # require 'apache2' package before creating
            }
}
