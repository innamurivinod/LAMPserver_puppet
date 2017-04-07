class thought::redhatlamp inherits thought::VaribleLocater{
        # execute 'apt-get update'
        exec { 'yum-update':                    # exec resource named 'apt-update'
                command => '/usr/bin/yum update'  # command this resource will run
            }

        # install apache2 package
        package { $thought::VaribleLocater::pack_apche:
                require => Exec['yum-update'],        # require 'apt-update' before installing
                ensure => installed,
            }
        # ensure apache2 service is running
        service { $thought::VaribleLocater::pack_apche:
              ensure => running,
            }
        # install mysql-server package
        package { $thought::VaribleLocater::pack_mysql:
            require => Exec['yum-update'],        # require 'apt-update' before installing
            ensure => installed,
            }
        # ensure mysql service is running
        service { 'mysql':
            ensure => running,
            }
        # install php5 package
        package { $thought::VaribleLocater::pack_php:
            require => Exec['yum-update'],        # require 'apt-update' before installing
            ensure => installed,
            }
        # ensure info.php file exists
        file { $thought::VaribleLocater::location:
                 ensure => file,
                 content => '<?php  phpinfo(); ?>',    # phpinfo code
                require => Package[$thought::VaribleLocater::pack_apche],        # require 'apache2' package before creating
            }
}