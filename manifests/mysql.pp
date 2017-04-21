 class thought::mysql {
	package { 'mysql-server-5.6':
		ensure => installed,
	}
}
