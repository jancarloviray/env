# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.box_url = "https://dl.dropbox.com/s/86f6qmmxkrcfrnj/vivid-server-cloudimg-amd64-vagrant-disk1.box?dl=1"
  config.vm.hostname = "dev.env"

  # config.vm.network "private_network", ip: "192.168.33.10"
  config.vm.network "private_network", type: "dhcp"

  # config.vm.synced_folder "./data", "/vagrant_data", 
  # 	type: "rsync",
  # 	rsync__auto: true,
  # 	rsync__verbose: true,
  # 	rsync__exclude: ".git/"

  # NFS (osx, linux only)
  config.vm.synced_folder "./data", "/vagrant_data", type: "nfs"

  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.memory = "2048"
    vb.cpus = 2
  end
  config.vm.provision "shell", path: "provision.sh", privileged: false
end