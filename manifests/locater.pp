# Class: 
#
#
class thought::locater {
        $pack_apche = $facts['os']['family'] ? {
            'RedHat' => 'httpd',
            'Debian' => 'apache2'
        }
        $pack_mysql = 'mysql-server'
        $pack_php = $facts['os']['family'] ? {
            'RedHat' => 'php',
            'Debian' => 'php5'
        }
        $location = '/var/www/html/info.php'
        
}
