# vi: set ft=ruby:

class VirtualMachine
  attr_accessor :hostname, :box, :cpus, :memory
  def initialize(options ={})
    self.hostname = options[:hostname] || 'unnamed'
    self.box = options[:box] || 'ubuntu/xenial64'
    self.cpus = options[:cpus] || '1'
    self.memory = options[:memory] || '512'
  end
end

virtual_machines = [
  VirtualMachine.new(hostname: 'LB1', box: 'centos/7'),
  VirtualMachine.new(hostname: 'LB2', box: 'centos/7'),
  VirtualMachine.new(hostname: 'WB1'),
  VirtualMachine.new(hostname: 'WB2'),
  VirtualMachine.new(hostname: 'WB3'),
  VirtualMachine.new(hostname: 'DB1'),
  VirtualMachine.new(hostname: 'DB2'),
  VirtualMachine.new(hostname: 'DB3'),
  VirtualMachine.new(hostname: 'LOG', box: 'centos/7'),
]

Vagrant.configure("2") do |config|
  virtual_machines.each do |machine|
    config.vm.define machine.hostname do |machine_config|
      machine_config.vm.box = machine.box
      machine_config.vm.hostname = machine.hostname
      machine_config.vm.network :public_network
      machine_config.vm.provider :virtualbox do |vbox|
        vbox.name = machine.hostname
        vbox.memory = machine.memory
        vbox.cpus = machine.cpus
      end
      #machine_config.vm.provision "shell", path: machine[:provisioner_path]
    end
  end
end
