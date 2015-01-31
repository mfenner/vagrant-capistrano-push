module VagrantPlugins
  module CapistranoPush
    module Errors
      class Error < Vagrant::Errors::VagrantError
        error_namespace("capistrano_push.errors")
      end

      class CommandFailed < Error
        error_key(:command_failed)
      end
    end
  end
end
