Vagrant.configure("2") do |config|
  # config.vm
  config.vm.hostname = 'pwnbox'
  config.vm.box = "ubuntu/xenial64"
  config.vm.synced_folder "shared", "/home/vagrant/shared"
  config.vm.provider "virtualbox" do |vb|
    vb.name = "pwnbox"
    vb.memory = 2048
    vb.cpus = 2
  end

  # config.ssh
  config.ssh.forward_agent = true

  # Provisioning
  config.vm.provision :file,  :source => "./templates",
                              :destination => "~/"

  config.vm.provision :shell, :path => "init.sh",
                              :privileged => false
end
