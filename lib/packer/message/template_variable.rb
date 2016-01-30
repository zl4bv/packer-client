module Packer
  module Message
    class TemplateVariable < Base
      attr_accessor :name

      attr_accessor :default

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
