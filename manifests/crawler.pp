include apt

apt::source { 'scrapy':
  location   => 'http://archive.scrapy.org/ubuntu',
  release => "scrapy",
  repos => "main",
  key        => '627220E7',
  key_server => 'hkp://keyserver.ubuntu.com:80',
  include_src => false,
}
->
package { ['python-pip', 'python-dev', 'libxml2-dev', 'libxslt-dev', 'python-mysqldb', 'scrapyd-0.17']:
	ensure  => present
}
