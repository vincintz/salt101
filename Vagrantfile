# Configurations
HTTP_PORT=80
HTTPS_PORT=443
LDAP_PORT=389
LDAPS_PORT=636

Vagrant.require_version ">= 1.8.0"
Vagrant.configure("2") do |config|
  config.vm.box = "bento/centos-7"
  config.vm.provider :virtualbox do |vb|
    vb.memory = 1024
    vb.cpus = 1
    vb.name = "salt101"
  end

  config.vm.network "forwarded_port", guest: HTTP_PORT, host: HTTP_PORT
  config.vm.network "forwarded_port", guest: HTTPS_PORT, host: HTTPS_PORT
  config.vm.network "forwarded_port", guest: LDAP_PORT, host: LDAP_PORT
  config.vm.network "forwarded_port", guest: LDAPS_PORT, host: LDAPS_PORT

  config.vm.provision "shell", inline: <<-SHELL
    # Make sure OS is updated
    yum update -y && yum upgrade -y
    # Bootstrap masterless salt-stack
    # - https://docs.saltstack.com/en/latest/topics/tutorials/quickstart.html
    curl -L https://bootstrap.saltstack.com -o bootstrap_salt.sh
    sh bootstrap_salt.sh stable 2018.3.3
    # link to salt config files
    rm /etc/salt/minion
    rm /srv/salt/formula
    rm /srv/salt/pillars
    mkdir -p /srv/salt
    ln -sf /vagrant/salt/config/minion /etc/salt/minion
    ln -sf /vagrant/salt/formula /srv/salt/formula
    ln -sf /vagrant/salt/pillars /srv/salt/pillars
    # Apply state
    salt-call --local state.apply
  SHELL
end
