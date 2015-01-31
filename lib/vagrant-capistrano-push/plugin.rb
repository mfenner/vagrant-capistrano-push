begin
  require "vagrant"
rescue LoadError
  raise "The Vagrant capistrano-push plugin must be run within Vagrant."
end

# This is a sanity check to make sure no one is attempting to install
# this into an early Vagrant version.
if Vagrant::VERSION < "1.2.0"
  raise "The Vagrant capistrano-push plugin is only compatible with Vagrant 1.2+"
end

module VagrantPlugins
  module CapistranoPush
    class Plugin < Vagrant.plugin("2")
      name "capistrano"
      description <<-DESC
      Run capistrano to push
      DESC

      config(:capistrano, :push) do
        require File.expand_path("../config", __FILE__)
        init!
        Config
      end

      push(:capistrano) do
        require File.expand_path("../push", __FILE__)
        init!
        Push
      end

      protected

      def self.init!
        return if defined?(@_init)
        I18n.load_path << File.expand_path("locales/en.yml", CapistranoPush.source_root)
        I18n.reload!
        @_init = true
      end
    end
  end
end
