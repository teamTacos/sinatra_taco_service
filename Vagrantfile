# -*- mode: ruby -*-
# vi: set ft=ruby :

unless Vagrant.has_plugin? 'vagrant-docker-compose'
  system('vagrant plugin install vagrant-docker-compose')
  puts 'vagrant-docker-compose installed, please try the command again.'
  exit
end

unless Vagrant.has_plugin? 'vagrant-vbguest'
  system('vagrant plugin install vagrant-vbguest')
  puts 'vagrant-vbguest installed, please try the command again.'
  exit
end

Vagrant.configure(2) do |config|

  config.vm.box = 'ubuntu/trusty64'
  config.vm.network(:forwarded_port, guest: 3000, host: 49001)

  config.vm.provision :docker
  config.vm.provision :docker_compose,
                      yml: '/vagrant/docker-compose.yml',
                      project_name: 'taco_service',
                      run: 'always',
                      rebuild: true
end
