# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

module RouterosGuestPlugin
  module Cap
    class DisableSSHInsertKey
      def self.disable_ssh_insert_key(machine)
        # Echo a message on the guest machine
        machine.ui.info("Disabling ssh insert key for RouterOS")
        machine.config.ssh.insert_key = false
      end
    end
  end
end
