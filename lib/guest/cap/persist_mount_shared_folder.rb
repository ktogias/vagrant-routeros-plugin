# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

module RouterosGuestPlugin
  module Cap
    class PersistMountSharedFolder
      def self.persist_mount_shared_folder(machine, folders)
        machine.ui.info("PersistMountSharedFolder is disabled for RouterOS")
      end
    end
  end
end
