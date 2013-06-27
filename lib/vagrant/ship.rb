require_relative 'ship/version'
require 'vagrant'

module Vagrant
  module Ship
    class Plugin < Vagrant.plugin('2')
      name 'ship'
      description <<-DESC
      Provide a ship command which will export a Vagrant box as an OVF for
      distribution as a Virtual Appliance.
      DESC

      command(:ship) do
        require_relative 'ship/command'
        Command
      end
    end
  end
end
