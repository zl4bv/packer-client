module Packer
  module Command
    # Base class for all Packer commands
    class Base
      # @param [Mixlib::ShellOut] output from the build command
      def initialize(output)
        @output = output
      end

      # Returns the raw standard error output
      #
      # @return [String]
      def stderr
        @output.stderr
      end

      # Returns the raw standard output
      #
      # @return [String]
      def stdout
        @output.stdout
      end
    end
  end
end
