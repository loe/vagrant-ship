module Vagrant
  module Ship
    class Command < Vagrant.plugin('2', :command)

      def execute
        options = {}
        opts = OptionParser.new do |o|
          o.banner = "Usage: vagrant ship [vm-name]"
          o.separator ""

          o.on('--product NAME', 'Product Name') do |p|
            options[:product] = p
          end

          o.on('--producturl URL', 'Product URL') do |url|
            options[:producturl] = url
          end

          o.on('--vendor VENDOR', 'Vendor') do |v|
            options[:vendor] = v
          end

          o.on('--vendorurl URL', 'Vendor URL') do |url|
            options[:vendorurl] = url
          end

          o.on('--version VERSION', 'Version String') do |ver|
            options[:version] = ver
          end
        end

        argv = parse_options(opts)
        return if !argv

        @logger.debug("'Export' each target VM...")
        with_target_vms(nil) do |machine|
          path = Pathname.new("#{machine.name}.ova").expand_path(@env.root_path)
          args = options.inject([]) do |m, option|
            key, value = option
            m << "--#{key.to_s}"
            m << value
            m
          end

          machine.provider.driver.execute('export', machine.id, '--output', path.to_s, '--vsys', '0', *args)
        end

        0
      end
    end
  end
end
