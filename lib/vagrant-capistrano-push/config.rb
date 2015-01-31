module VagrantPlugins
  module CapistranoPush
    class Config < Vagrant.plugin("2", :config)
      # The capistrano command (as a string) to execute.
      # @return [String]
      attr_accessor :stage, :command

      def initialize
        @stage = UNSET_VALUE
        @command = "bundle exec cap #{@stage} deploy"
      end

      def finalize!
        @stage = nil if @stage == UNSET_VALUE
      end

      def validate(machine)
        errors = _detected_errors

        if missing?(@stage)
          errors << I18n.t("capistrano_push.errors.missing_attribute",
            attribute: "stage",
          )
        end

        { "Capistrano push" => errors }
      end

      private

      # Determine if the given string is "missing" (blank)
      # @return [true, false]
      def missing?(obj)
        obj.to_s.strip.empty?
      end
    end
  end
end
