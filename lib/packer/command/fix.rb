module Packer
  module Command
    # Represents the output from +packer fix+.
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
        @output.exitstatus == 0
      end
    end
  end
end
