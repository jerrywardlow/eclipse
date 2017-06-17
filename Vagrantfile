# vi: set ft=ruby:

class VM
  attr_accessor :hostname, :box, :cpus, :memory
  def initialize(options ={})
    self.hostname = options[:hostname]
    self.box = options[:box] || 'ubuntu/xenial64'
    self.cpus = options[:cpus] || '1'
    self.memory = options[:memory] || '512'
  end
end

nodes  = [
  VM.new(hostname: 'lb1', box: 'centos/7'),
  VM.new(hostname: 'lb2', box: 'centos/7'),
  VM.new(hostname: 'wb1'),
  VM.new(hostname: 'wb2'),
  VM.new(hostname: 'wb3'),
  VM.new(hostname: 'db1'),
  VM.new(hostname: 'db2'),
  VM.new(hostname: 'db3'),
  VM.new(hostname: 'log', box: 'centos/7'),
]

Vagrant.configure("2") do |config|
  nodes.each do |node|
    config.vm.define node.hostname do |node_config|
      node_config.vm.box = node.box
      node_config.vm.hostname = node.hostname
      node_config.vm.network :public_network
      node_config.vm.provider :virtualbox do |vbox|
        vbox.name = node.hostname
        vbox.memory = node.memory
        vbox.cpus = node.cpus
      end
      #node_config.vm.provision "shell", path: node[:provisioner_path]
    end
  end
end
