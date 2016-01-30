module Packer
  module Message
    class Ui < Base
      attr_accessor :ui_message_type

      attr_accessor :output

      # @api private
      # @param [Array<String>] fields
      def self.from_fields(fields)
        msg = new
        msg.timestamp = fields[0]
        msg.target = fields[1]
        msg.type = fields[2]
        msg.data = fields[3..-1]
        msg.ui_message_type = fields[3]
        msg.output = fields[4]
        msg
      end
    end
  end
end
