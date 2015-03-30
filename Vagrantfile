VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.define "web" do |web|
    web.vm.hostname = "web"
    web.vm.box = "ubuntu/trusty64"
    web.vm.provision "shell" do |s|
      s.args = "web"
      s.path = "bootstrap.sh"
    end
    web.vm.network "private_network", ip: "172.17.8.101"
  end

  config.vm.define "worker" do |worker|
    worker.vm.box = "ubuntu/trusty64"
    worker.vm.hostname = "worker"
    worker.vm.provision "shell" do |s|
      s.args = "worker"
      s.path = "bootstrap.sh"
    end
    worker.vm.network "private_network", ip: "172.17.8.102"
  end

  config.vm.define "secret" do |secret|
    secret.vm.box = "ubuntu/trusty64"
    secret.vm.hostname = "secret"
    secret.vm.provision "shell" do |s|
      s.args = "secret"
      s.path =  "bootstrap.sh"
    end
    secret.vm.network "private_network", ip: "172.17.8.110"
  end
end
