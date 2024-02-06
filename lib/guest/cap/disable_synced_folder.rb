# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

module RouterosGuestPlugin
  module Cap
    class DisableSyncedFolder
      def self.disable_synced_folder(machine)
        # Echo a message on the guest machine
        machine.ui.info("Disabling sync folder for RouterOS")
        machine.config.vm.synced_folder '.', '/vagrant', disabled: true
      end
    end
  end
end
