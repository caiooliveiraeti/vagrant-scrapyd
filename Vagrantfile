# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "base-scrapy"

  config.vm.define "scrapy1" do |scrapy1|
    scrapy1.vm.host_name = "scrapy1"
  end

  config.vm.provision :puppet do |puppet|
     puppet.manifests_path = "manifests"
     puppet.manifest_file  = "crawler.pp"
     puppet.module_path = "modules"
     puppet.options = "--verbose --debug"
  end
end
