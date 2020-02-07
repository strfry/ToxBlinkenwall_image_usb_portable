# ------------------------
Vagrant.require_version ">= 2.0.0"
Vagrant.configure("2") do |config|
  # ------------------------
  # config.vm.box = "hashicorp-vagrant/ubuntu-16.04"
  # config.vm.box_version = "1.0.1"
  # ------------------------
  config.vm.box = "generic/alpine310"
  # ------------------------
  # config.vm.box = "ubuntu/xenial64"
  # config.vm.box_version = "v20190123.0.1"
  # ------------------------
  config.vm.box_check_update = false
  config.vm.synced_folder "artefacts/", "/artefacts"
  # config.vm.synced_folder "workspace/", "/workspace"
  config.vm.synced_folder "data/", "/data", :mount_options => ["ro"]
  # ------------------------

  config.vm.provider 'libvirt' do |lv, config|
    lv.random :model => 'random'
    lv.graphics_type = 'spice'
    lv.video_type = 'qxl'
    lv.channel :type => 'unix', :target_name => 'org.qemu.guest_agent.0', :target_type => 'virtio'
    lv.channel :type => 'spicevmc', :target_name => 'com.redhat.spice.0', :target_type => 'virtio'
    config.vm.synced_folder '.', '/vagrant', nfs: true, nfs_version: 4, nfs_udp: false
  end

  config.vm.provision "shell", path: "do_it___external.sh"
end
