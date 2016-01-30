module Packer
  module Command
    class Base
      # @param [Mixlib::ShellOut] output from the build command
      def initialize(output)
        @output = output
      end

      # Returns the machine-readable messages from the build output
      #
      # @return [Array<Packer::Message>]
      def messages
        @messages ||= stdout.split("\n").map { |line| Message.new(line) }
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
