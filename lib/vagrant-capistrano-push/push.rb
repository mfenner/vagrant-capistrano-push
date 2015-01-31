require "vagrant/util/subprocess"

require_relative "errors"

module VagrantPlugins
  module CapistranoPush
    class Push < Vagrant.plugin("2", :push)
      def push
        # Capistrano is not part of the current Vagrant bundle, so it needs to run
        # in the context of the system.
        Vagrant::Util::Env.with_clean_env do
          result = Vagrant::Util::Subprocess.execute(
            'bash',
            '-c',
            config.inline,
            :workdir => @env.root_path.to_s,
            :notify => [:stdout, :stderr]
          )

          if result.exit_code != 0
            raise Errors::CommandFailed,
              cmd: config.inline,
              workdir: @env.root_path.to_s,
              stdout: result.stdout,
              stderr: result.stderr
          end

          result
        end
      end
    end
  end
end
