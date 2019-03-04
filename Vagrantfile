Vagrant.configure("2") do |config|
  ## Choose your base box
  config.vm.box = "centos/7"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "1024"
    vb.cpus = 1
    vb.name = "salt101"
  end

  ## Update OS
  config.vm.provision "shell", inline: <<-SHELL
    yum -y upgrade
  SHELL

  ## For masterless, mount your salt file root
  config.vm.synced_folder "saltstack/svr-salt", "/srv/salt/"

  ## Use all the defaults:
  config.vm.provision :salt do |salt|
    salt.install_type = "stable"
    salt.masterless = true
    salt.minion_config = "saltstack/config/minion"
    # salt.verbose = true
    salt.colorize = true
    salt.bootstrap_options = "-P -c /tmp"
    salt.run_highstate = true
  end
end