module Packer
  module Command
    # Represents the output from +packer fix+.
    #
    # @see https://www.packer.io/docs/command-line/fix.html
    class Fix < Base
      # JSON representing the fixed template or +nil+ if the fixing fails or the
      # template is not valid.
      #
      # @return [String]
      def json
        return nil unless valid?

        stdout
      end

      # Returns +true+ if the fixing was successful and the template is valid.
      #
      # @return [Boolean]
      def valid?
        @output.exitstatus.zero?
      end
    end
  end
end
