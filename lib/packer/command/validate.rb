module Packer
  module Command
    # Represents the output from +packer validate+.
    class Validate < Base
      # Returns +true+ if the template is valid.
      #
      # @return [Boolean]
      def valid?
        @output.exitstatus == 0
      end
    end
  end
end
