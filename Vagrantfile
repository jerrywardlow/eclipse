# vi: set ft=ruby:

lb1 = {
  hostname: 'LB1',
  box: 'centos/7',
  cpus: '1',
  memory: '512',
  #provisioner_path: ''
}

lb2 = {
  hostname: 'LB2',
  box: 'centos/7',
  cpus: '1',
  memory: '512',
  #provisioner_path: ''
}

wb1 = {
  hostname: 'WB1',
  box: 'ubuntu/xenial64',
  cpus: '1',
  memory: '512',
  #provisioner_path: ''
}

wb2 = {
  hostname: 'WB2',
  box: 'ubuntu/xenial64',
  cpus: '1',
  memory: '512',
  #provisioner_path: ''
}

wb3 = {
  hostname: 'WB3',
  box: 'ubuntu/xenial64',
  cpus: '1',
  memory: '512',
  #provisioner_path: ''
}

db1 = {
  hostname: 'DB1',
  box: 'ubuntu/xenial64',
  cpus: '1',
  memory: '512',
  #provisioner_path: ''
}

db2 = {
  hostname: 'DB2',
  box: 'ubuntu/xenial64',
  cpus: '1',
  memory: '512',
  #provisioner_path: ''
}

db3 = {
  hostname: 'DB3',
  box: 'ubuntu/xenial64',
  cpus: '1',
  memory: '512',
  #provisioner_path: ''
}

log = {
  hostname: 'LOG',
  box: 'centos/7',
  cpus: '1',
  memory: '512',
  #provisioner_path: ''
}

virtual_machines = [
  lb1,
  lb2,
  wb1,
  wb2,
  wb3,
  db1,
  db2,
  db3,
  log
]

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
