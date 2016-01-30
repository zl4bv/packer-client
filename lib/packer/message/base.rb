module Packer
  module Message
    class Base
      attr_accessor :timestamp

      attr_accessor :target

      attr_accessor :type

      attr_accessor :data

      # @api private
      # @param [Array<String>] fields
      def self.from_fields(fields)
        msg = new
        msg.timestamp = fields[0]
        msg.target = fields[1]
        msg.type = fields[2]
        msg.data = fields[3..-1]
        msg
      end
    end
  end
end
