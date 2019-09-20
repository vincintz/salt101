# Mapped ports
HTTP_PORT = 1080
HTTPS_PORT = 1443
LDAP_PORT = 1389
LDAPS_PORT = 1636
TOMCAT_PORT = 8080
TOMCATS_PORT = 8443

Vagrant.require_version ">= 1.8.0"
Vagrant.configure("2") do |config|
  config.vm.box = "bento/centos-7"
  config.vm.provider :virtualbox do |vb|
    vb.memory = 1024
    vb.cpus = 1
    vb.name = "salt101"
  end

  config.vm.network "forwarded_port", guest: 80, host: HTTP_PORT
  config.vm.network "forwarded_port", guest: 443, host: HTTPS_PORT
  config.vm.network "forwarded_port", guest: 339, host: LDAP_PORT
  config.vm.network "forwarded_port", guest: 686, host: LDAPS_PORT
  config.vm.network "forwarded_port", guest: 8080, host: TOMCAT_PORT
  config.vm.network "forwarded_port", guest: 8443, host: TOMCATS_PORT

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
    # salt-call --local state.apply
  SHELL
end
