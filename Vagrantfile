Vagrant.configure("2") do |config|
  # config.vm
  config.vm.hostname = 'pwnbox'
  config.vm.box = "ubuntu/xenial64"
  config.vm.provision :shell, :path => "init.sh", :privileged => true
  config.vm.network :private_network, ip: "10.13.37.10"
  config.vm.synced_folder "shared", "/home/ubuntu/shared"
  config.vm.provider "virtualbox" do |vb|
    vb.name = "pwnbox"
    vb.memory = 2048
    vb.cpus = 2
  end

  # config.ssh
  config.ssh.forward_agent = true
end
