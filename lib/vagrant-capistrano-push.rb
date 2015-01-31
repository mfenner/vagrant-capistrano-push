require 'vagrant-capistrano-push/version'
require 'vagrant-capistrano-push/plugin'
require 'vagrant-capistrano-push/errors'

module VagrantPlugins
  module CapistranoPush
    def self.source_root
      @source_root ||= Pathname.new(File.expand_path('../../', __FILE__))
    end

    I18n.load_path << File.expand_path('locales/en.yml', source_root)
    I18n.reload!
  end
end
