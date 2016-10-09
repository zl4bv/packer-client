module Packer
  module Command
    # Represents the output from +packer validate+.
    #
    # @see https://www.packer.io/docs/command-line/validate.html
    class Validate < Base
      # Returns +true+ if the template is valid.
      #
      # @return [Boolean]
      def valid?
        @output.exitstatus.zero?
      end
    end
  end
end
