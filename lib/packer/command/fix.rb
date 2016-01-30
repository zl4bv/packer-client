module Packer
  module Command
    # Represents the output from +packer fix+.
    class Fix < Base
      # JSON representing the fixed template.
      def json
        stdout
      end
    end
  end
end
