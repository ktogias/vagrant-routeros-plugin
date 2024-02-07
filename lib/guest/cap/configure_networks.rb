module RouterosGuestPlugin
    module Cap
      class ConfigureNetworks
        def self.configure_networks(machine, path = "/interface")
          machine.ui.info("ConfigureNetworks is disabled for RouterOS")
        end
      end
    end
  end
  