exec { "add scrapy source key":
	command => "/usr/bin/apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 627220E7"
}

exec { "add scrapy source":
	command => "/bin/echo \"deb http://archive.scrapy.org/ubuntu precise main\" > /etc/apt/sources.list.d/scrapy.list",
	require => Exec['add scrapy source key']
}

exec { 'apt-get update':
	command => '/usr/bin/apt-get update',
	timeout => 0,
	require => Exec['add scrapy source']
}

package { ['python-pip', 'python-dev', 'libxml2-dev', 'libxslt-dev', 'python-mysqldb']:
	ensure  => present,
	require => Exec['apt-get update']
}

exec { 'install scrapy':
	command => '/usr/bin/pip install scrapy',
	timeout => 0,
	require => Package['python-pip']
}

exec { 'install scrapyd':
	command => '/usr/bin/pip install scrapyd',
	timeout => 0,
	require => Exec['install scrapy']
}

package {'scrapyd-0.17':
	ensure  => present,
	require => Exec['install scrapy']
}
