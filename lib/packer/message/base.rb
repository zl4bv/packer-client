module Packer
  module Message
    # Base class for all message types
    class Base
      # Unix timestamp in UTC of when the message was printed
      attr_accessor :timestamp

      # Target of the following output
      attr_accessor :target

      # Type of message outputted by Packer
      attr_accessor :type

      # Zero or more values associated with the message type
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
