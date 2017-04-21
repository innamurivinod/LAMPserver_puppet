class thought::lamp ($pack_apache = "httpd", $pack_mysql = "mysql-server", $pack_php = "php") {
        # execute 'apt-get update'
	$location = '/var/www/html/info.php'
        exec { 'apt-update':                    # exec resource named 'apt-update'
                command => '/usr/bin/apt-get update'  # command this resource will run
            }

        # install apache2 package
        package { $pack_apache:
                require => Exec['apt-update'],        
                ensure => installed,
            }
        # ensure apache2 service is running
        service { $pack_apache:
              ensure => running,
            }
        # install mysql-server package
        package { $pack_mysql:
            require => Exec['apt-update'],        # require 'apt-update' before installing
            ensure => installed,
            }
        # ensure mysql service is running
        service { 'mysql':
            ensure => running,
            }
        # install php5 package
        package { $pack_php:
            require => Exec['apt-update'],        # require 'apt-update' before installing
            ensure => installed,
            }
        # ensure info.php file exists
        file { $location:
                 ensure => file,
                 content => '<?php
phpinfo();
?>',    # phpinfo code
                require => Package[$pack_apache],    #require 'apache2' package before creating
            }
}
