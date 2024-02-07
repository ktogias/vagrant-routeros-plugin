module RouterosGuestPlugin
    module Provisioner
      class Shell < Vagrant.plugin("2", "provisioner")
        def provision
          if @machine.config.vm.guest == :routeros 
            # Echo a message on the guest machine
            @machine.ui.info("Shell provisioner is disabled for RouterOS")
          end
        end
      end
    end
  end