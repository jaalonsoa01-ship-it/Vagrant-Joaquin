Vagrant.configure("2") do |config|
  config.vm.box = "debian/bookworm64"
  config.vm.hostname = "debian-joaquin"

  # Reenvío de puerto 8080 del Host al 80 de la VM en 127.0.0.1
  config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Red privada (VirtualBox la crea como Red Interna / Host-Only)
  config.vm.network "private_network", ip: "192.168.56.10"

  config.vm.provider "virtualbox" do |vb|
    vb.name = "VM-Debian-Joaquin"
    vb.memory = "1024"
    vb.cpus = 1
  end

  config.vm.provision "shell", path: "setup.sh"
end
