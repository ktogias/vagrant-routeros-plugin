module RouterosGuestPlugin
    module Cap
      class NetworkInterfaces
        def self.network_interfaces(machine, path = "/interface")
          machine.ui.info("NetworkInterfaces is disabled for RouterOS")
          []
        end
      end
    end
  end
  