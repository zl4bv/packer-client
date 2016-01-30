module Packer
  module Message
    class ArtifactFile < Base
      attr_accessor :file_index

      attr_accessor :filename

      # @api private
      # @param [Array<String>] fields
      def self.from_fields(fields)
        msg = new
        msg.timestamp = fields[0]
        msg.target = fields[1]
        msg.type = fields[2]
        msg.data = fields[3..-1]
        msg.file_index = fields[5]
        msg.filename = fields[6]
        msg
      end
    end
  end
end
