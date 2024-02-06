Vagrant.configure('2') do |config|
  config.vm.box = 'azure'

#   config.ssh.private_key_path = '~/.ssh/id_rsa'

  config.vm.provider :azure do |azure, override|
    azure.vm_name              = 'commvault'
    azure.admin_username       = 'vagrant'
    azure.admin_password       = ENV['VM_PASSWORD']
    azure.vm_size              = 'Standard_B2s'
    # azure.vm_image_urn         = 'Canonical:0001-com-ubuntu-server-jammy:22_04-lts-gen2:latest'
    # azure.vm_image_urn         = "RedHat:RHEL:86-gen2:latest"
    azure.vm_image_urn         ="MicrosoftWindowsServer:WindowsServer:2022-Datacenter:latest"

    azure.resource_group_name  = 'testing'
    azure.virtual_network_name = 'testing-vnet'
    azure.subnet_name          = 'default'
    azure.location             = 'australiasoutheast'

    override.vm.synced_folder '.', '/vagrant', disabled: true

    # each of the below values will default to use the env vars named as below if not specified explicitly
    azure.tenant_id       = ENV['AZURE_TENANT_ID']
    azure.client_id       = ENV['AZURE_CLIENT_ID']
    azure.client_secret   = ENV['AZURE_CLIENT_SECRET']
    azure.subscription_id = ENV['AZURE_SUBSCRIPTION_ID']
  end

  # winrm specific
  config.winrm.transport             = :ssl
  config.winrm.ssl_peer_verification = false

  config.vm.guest                    = :windows
  config.vm.communicator             = 'winrm'
  config.vm.synced_folder '.', '/vagrant', disabled: true
  config.vm.network :forwarded_port, guest: 5985, host: 5985, id: 'winrm', auto_correct: true #, host_ip: 127.0.0.1
  config.vm.network :forwarded_port, guest: 5986, host: 5986, id: 'winrm', auto_correct: true #, host_ip: 127.0.0.1
  config.vm.network :forwarded_port, guest: 3389, host: 3389, id: 'winrm', auto_correct: true #, host_ip: 127.0.0.1

  #   config.vm.provision "apt-get update", type: "shell", inline: <<-SHELL
  #     echo "Running 'apt-get -y update'"
  #     apt-get update
  #     yum -y update
  #   SHELL
end
