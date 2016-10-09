module Packer
  module Message
    # Message representing a user variable defined within the template
    #
    # @see https://www.packer.io/docs/machine-readable/command-inspect.html
    class TemplateVariable < Base
      # The name of the variable
      attr_accessor :name

      # The default value of the variable
      attr_accessor :default

      # If non-zero, then this variable is required
      attr_accessor :required

      # @api private
      # @param [Array<String>] fields
      def self.from_fields(fields)
        msg = new
        msg.timestamp = fields[0]
        msg.target = fields[1]
        msg.type = fields[2]
        msg.data = fields[3..-1]
        msg.name = fields[3]
        msg.default = fields[4]
        msg.required = fields[5]
        msg
      end
    end
  end
end
