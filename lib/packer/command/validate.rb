module Packer
  module Command
    # Represents the output from +packer validate+.
    class Validate < Base
      def valid?
        @output.exitstatus == 0
      end
    end
  end
end
