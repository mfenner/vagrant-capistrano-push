require 'vagrant-capistrano-push/version'
require 'vagrant-capistrano-push/plugin'
require 'vagrant-capistrano-push/errors'

module VagrantPlugins
  module CapistranoPush
    def self.source_root
      @source_root ||= Pathname.new(File.expand_path('../../', __FILE__))
    end
  end
end
