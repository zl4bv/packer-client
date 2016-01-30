module Packer
  module Message
    class Error < Base
      attr_accessor :error

      # @api private
      # @param [Array<String>] fields
      def self.from_fields(fields)
        msg = new
        msg.timestamp = fields[0]
        msg.target = fields[1]
        msg.type = fields[2]
        msg.data = fields[3..-1]
        msg.error = fields[3]
        msg
      end
    end
  end
end
