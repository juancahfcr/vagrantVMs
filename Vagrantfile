Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"
  config.vm.hostname = "MongoVM01"
  config.vm.synced_folder "/Users/juancahfcr/vgVms/MongoDB", "/home/vagrant/database"
  config.vm.synced_folder "/Users/juancahfcr/vgVms/MongoVM/database", "/home/vagrant/database/files"
  config.vm.network "forwarded_port", guest: 27017, host: 27017
  config.vm.network "forwarded_port", guest: 3000, host: 3000
  config.vm.network "forwarded_port", guest: 5432, host: 5432
  #Not needed
  #config.vm.network "private_network", type: "dhcp"
  config.vm.provision "shell", path: "/Users/juancahfcr/vgVms/MongoVM/provision_mongodb.sh"
end
