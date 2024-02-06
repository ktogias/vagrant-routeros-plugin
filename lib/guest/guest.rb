# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

require 'logger'

module RouterosGuestPlugin
  class Guest < Vagrant.plugin("2", :guest)
    def detect?(machine)
      machine.config.vm.guest == "routeros"
    end
  end
end
