# vi: set ft=ruby:

lb1 = {
  hostname: 'LB1',
  box: 'centos/7',
  cpus: '1',
  memory: '512',
  #provisioner_path: './lb_config.sh'
}

virtual_machines = [lb1]

Vagrant.configure("2") do |config|
  virtual_machines.each do |machine|
    config.vm.define machine[:hostname] do |machine_config|
      machine_config.vm.box = machine[:box]
      machine_config.vm.hostname = machine[:hostname]
      machine_config.vm.network :public_network
      machine_config.vm.provider :virtualbox do |vbox|
        vbox.name = machine[:hostname]
        vbox.memory = machine[:memory]
        vbox.cpus = machine[:cpus]
      end
      #machine_config.vm.provision "shell", path: machine[:provisioner_path]
    end
  end
end
