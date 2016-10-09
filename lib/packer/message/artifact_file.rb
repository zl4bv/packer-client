module Packer
  module Message
    # Message representing a file associated with an artifact
    class ArtifactFile < Base
      # The zero-based index of the file
      attr_accessor :file_index

      # The filename
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
