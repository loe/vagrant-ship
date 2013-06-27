module Vagrant
  module Ship
    class Command < Vagrant.plugin('2', :command)

      attr_reader :env

      def initialize(argv, env)
        @env = env
      end

      def execute
        env.active_machines.each do |name, provider|
          machine = env.machine(name, provider)
          args = ['vsys', 'product', 'producturl', 'vendor', 'vendorurl', 'version'].inject([machine.id, '--output', config.expanded_filename_path(env.root_path)]) do |m, switch|
            if config.send(switch).present?
              m << ["--#{switch}", config.send(switch)]
            end

            m
          end

          machine.provider.driver.execute("export", args.flatten)
        end
      end
    end
  end
end
