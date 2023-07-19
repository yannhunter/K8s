# -*- mode: ruby -*-
# vi: set ft=ruby :
# To enable zsh, please set ENABLE_ZSH env var to "true" before launching vagrant up 
#   + On windows => $env:ENABLE_ZSH="true"
#   + On Linux  => export ENABLE_ZSH="true"

Vagrant.configure("2") do |config|
  config.vm.define "minikube" do |docker|
    docker.vm.box = "centos/7"
    docker.vm.box_download_insecure=true
    docker.vm.network "private_network", ip: "192.168.20.10"
    docker.vm.hostname = "master"
    docker.vm.provider "virtualbox" do |v|
      v.name = "master"
      v.memory = 4096
      v.cpus = 2
    end
    docker.vm.provision :shell do |shell|
      shell.path = "install_docker.sh"
      shell.env = { 'ENABLE_ZSH' => ENV['ENABLE_ZSH'] }
    end
    docker.vm.synced_folder "mini_tp/","/home/vagrant/mini_tp"
  end
end
