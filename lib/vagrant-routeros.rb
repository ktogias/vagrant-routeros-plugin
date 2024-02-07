# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

begin
  require "vagrant"
rescue LoadError
  raise "Vagrant is required!"
end

require "guest/guest"

module RouterosGuestPlugin
  class Plugin < Vagrant.plugin("2")
    # TODO: rename name and description
    name "RouterosGuestPlugin"
    description <<-DESC
    This is my guest plugin.
    DESC

    # TODO: rename :myguestplugin to something more relevant.
    # You can also define this plugin as a child of an existing
    # guest plugin here. A child plugin will inherit all of the 
    # capabilities of the parent. To do that add the parent 
    # as an argument to `guest`. For example `guest(:myguestplugin, :linux)`
    # sets the parent plugin to be the linux guest plugin. 
    guest(:routeros, :debian) do
      Guest
    end

    guest_capability(:routeros, :persist_mount_shared_folder) do
      require_relative 'guest/cap/persist_mount_shared_folder'
      Cap::PersistMountSharedFolder
    end

    guest_capability(:routeros, :network_interfaces) do
      require_relative 'guest/cap/network_interfaces'
      Cap::NetworkInterfaces
    end

    guest_capability(:routeros, :configure_networks) do
      require_relative 'guest/cap/configure_networks'
      Cap::ConfigureNetworks
    end

    guest_capability(:routeros, :change_host_name) do
      require_relative 'guest/cap/change_host_name'
      Cap::ChangeHostName
    end

    guest_capability(:routeros, :halt) do
      require_relative 'guest/cap/halt'
      Cap::Halt
    end

    action_hook(:set_custom_ssh_shell, :machine_action_up) do |hook|
      require_relative 'guest/cap/configure_ssh_shell'
      hook.prepend(Proc.new do |env|
          Cap::ConfigureSSHShell.set_ssh_shell(env[:machine])
      end)
    end

    action_hook(:set_custom_ssh_shell, :machine_action_halt) do |hook|
      require_relative 'guest/cap/configure_ssh_shell'
      hook.prepend(Proc.new do |env|
          Cap::ConfigureSSHShell.set_ssh_shell(env[:machine])
      end)
    end

    action_hook(:disable_synced_folder, :machine_action_up) do |hook|
      require_relative 'guest/cap/disable_synced_folder'
      hook.prepend(Proc.new do |env|
          Cap::DisableSyncedFolder.disable_synced_folder(env[:machine])
      end)
    end

    action_hook(:disable_synced_folder, :machine_action_halt) do |hook|
      require_relative 'guest/cap/disable_synced_folder'
      hook.prepend(Proc.new do |env|
          Cap::DisableSyncedFolder.disable_synced_folder(env[:machine])
      end)
    end

    action_hook(:disable_ssh_insert_key, :machine_action_up) do |hook|
      require_relative 'guest/cap/disable_ssh_insert_key'
      hook.prepend(Proc.new do |env|
          Cap::DisableSSHInsertKey.disable_ssh_insert_key(env[:machine])
      end)
    end

    action_hook(:disable_ssh_insert_key, :machine_action_halt) do |hook|
      require_relative 'guest/cap/disable_ssh_insert_key'
      hook.prepend(Proc.new do |env|
          Cap::DisableSSHInsertKey.disable_ssh_insert_key(env[:machine])
      end)
    end

    provisioner "shell" do
      require_relative "guest/provisioner/shell"
      Provisioner::Shell
    end

    
  end
end