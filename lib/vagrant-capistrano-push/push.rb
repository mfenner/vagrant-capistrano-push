require "vagrant/util/subprocess"

require_relative "errors"

module VagrantPlugins
  module CapistranoPush
    class Push < Vagrant.plugin("2", :push)
      def push
        execute!(config.command)
      end

      # Execute the capistrano command, raising an exception if it fails.
      def execute!(*cmd)
        result = Vagrant::Util::Subprocess.execute(*cmd)

        if result.exit_code != 0
          raise Errors::CommandFailed,
            cmd:    cmd.join(" "),
            stdout: result.stdout,
            stderr: result.stderr
        end

        result
      end
    end
  end
end
