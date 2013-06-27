module Vagrant
  module Ship
    class Command < Vagrant.plugin('2', :command)
      def execute
        args = ['output', 'vsys', 'product', 'producturl', 'vendor', 'vendorurl', 'version'].inject([@env[:vm].uuid]) do |m, switch|
          if config.send(switch).present?
            m << ["--#{switch}", config.send(switch)]
          end

          m
        end.flatten

        @env[:vm].driver.execute("export", args.flatten)
      end
    end
  end
end
