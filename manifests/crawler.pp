exec { 'apt-get update':
    command => "/usr/bin/apt-get update && touch /tmp/apt-get-updated",
    creates => '/tmp/apt-get-updated'
} ->
package { ['python-pip', 'build-essential', 'git', 'libffi-dev', 'libxml2-dev', 'libxslt1-dev', 'libssl-dev', 'libtool', 'python-dev']:
	ensure  => present,
} ->
exec { 'install scrapyd':
    command => "/usr/bin/pip install scrapyd",
    creates => '/usr/local/bin/scrapyd'
}