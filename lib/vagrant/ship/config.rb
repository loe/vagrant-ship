module Vagrant
  module Ship
    class Config < Vagrant.plugin('2', :config)
      attr_accessor :directory
      attr_accessor :filename
      attr_accessor :vsys
      attr_accessor :product
      attr_accessor :productrul
      attr_accessor :vendor
      attr_accessor :vendorurl
      attr_accessor :version

      def initialize
        super

        @directory = UNSET_VALUE
        @filename = UNSET_VALUE
        @vsys = UNSET_VALUE
        @product = UNSET_VALUE
        @producturl = UNSET_VALUE
        @vendor = UNSET_VALUE
        @vendorurl = UNSET_VALUE
        @version = UNSET_VALUE
      end

      def finalize
        super

        @directory = '.' if @directory == UNSET_VALUE
        @filename = 'vagrant.ova' if @filename == UNSET_VALUE
        @vsys = 0 if @vsys == UNSET_VALUE
        @product = '' if @product == UNSET_VALUE
        @producturl = '' if @producturl == UNSET_VALUE
        @vendor = '' if @vendor == UNSET_VALUE
        @vendorurl = '' if @vendorurl == UNSET_VALUE
        @version = '' if @version == UNSET_VALUE
      end

      def validate(machine)
        errors []

        if filename.blank?
          errors << 'The output filename must not be blank.'
        end

        if !Pathname.new(directory)
          errors << 'The destination directory must exist.'
        end

        {"ship command" => errors}
      end
    end
  end
end
