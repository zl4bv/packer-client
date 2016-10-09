module Packer
  module Message
    # Message representing a builder defined within the template
    #
    # @see https://www.packer.io/docs/machine-readable/command-inspect.html
    class TemplateBuilder < Base
      # The name of the builder
      attr_accessor :name

      # The type of the builder
      attr_accessor :builder_type

      # @api private
      # @param [Array<String>] fields
      def self.from_fields(fields)
        msg = new
        msg.timestamp = fields[0]
        msg.target = fields[1]
        msg.type = fields[2]
        msg.data = fields[3..-1]
        msg.name = fields[3]
        msg.builder_type = fields[4]
        msg
      end
    end
  end
end
