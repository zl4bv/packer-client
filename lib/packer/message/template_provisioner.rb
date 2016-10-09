module Packer
  module Message
    # Message representing a provisioner defined within the template
    #
    # @see https://www.packer.io/docs/machine-readable/command-inspect.html
    class TemplateProvisioner < Base
      # The name/type of the provisioner
      attr_accessor :name

      # @api private
      # @param [Array<String>] fields
      def self.from_fields(fields)
        msg = new
        msg.timestamp = fields[0]
        msg.target = fields[1]
        msg.type = fields[2]
        msg.data = fields[3..-1]
        msg.name = fields[3]
        msg
      end
    end
  end
end
