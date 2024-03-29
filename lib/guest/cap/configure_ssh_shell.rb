# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

module RouterosGuestPlugin
  module Cap
    class ConfigureSSHShell
      def self.set_ssh_shell(machine)
        if machine.config.vm.guest == :routeros 
          # Echo a message on the guest machine
          machine.ui.info("Setting ssh shell and sudo command to # for RouterOS")
          machine.config.ssh.shell = "#"
          machine.config.ssh.sudo_command = "#"
        end
      end
    end
  end
end
