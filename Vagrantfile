Vagrant.configure("2") do |config|
  # config.vm
  config.vm.hostname = 'pwnbox'
  config.vm.box = "ubuntu/focal64"
  config.vm.synced_folder "shared", "/home/vagrant/shared"
  config.vm.provider "virtualbox" do |vb|
    vb.name = "pwnbox"
    vb.memory = 2048
    vb.cpus = 2
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
  end

  # config.ssh
  config.ssh.forward_agent = true

  # Provisioning
  config.vm.provision :shell, :path => "init.sh",
                              :privileged => false
end
