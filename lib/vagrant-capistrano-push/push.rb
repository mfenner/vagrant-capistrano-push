require "vagrant/util/subprocess"

require_relative "errors"

module VagrantPlugins
  module CapistranoPush
    class Push < Vagrant.plugin("2", :push)
      def push
        result = Vagrant::Util::Subprocess.execute(
          'bash',
          '-c',
          config.inline,
          :notify => [:stdout, :stderr]
        )

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
