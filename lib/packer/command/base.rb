module Packer
  module Command
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

      # Outputs that would have normally gone to the console if Packer were
      # running in human-readable mode.
      #
      # @return [Array<Packer::Message::Ui>]
      def ui_messages
        select_messages('ui').map { |fields| Packer::Message::Ui.from_fields(fields) }
      end

      private

      # @api private
      # @param [String] type of message
      # @return [Array<Array>] lists of message fields
      def select_messages(type)
        stdout
          .split("\n")
          .map { |line| CSV.parse(line).first }
          .select { |fields| fields[2] == type }
      end
    end
  end
end
