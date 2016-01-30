module Packer
  # Represents a message from a Packer machine-readable output
  class Message
    # Line from machine-readable output
    attr_reader :line

    # @param [String] line from machine-readable output
    def initialize(line)
      @line = line
    end

    # Zero or more values associated with message type
    #
    # @return [Array<String>]
    def data
      parsed_line[3..-1]
    end

    # @api private
    # @return [Array<String>]
    def parsed_line
      @parsed_line ||= CSV.parse(@line).first
    end

    # Target of the output
    #
    # @return [String]
    def target
      parsed_line[1]
    end

    # Unix timestamp in UTC of when the message was printed
    #
    # @return [String]
    def timestamp
      parsed_line[0]
    end

    # Type of machine-readable message
    #
    # @return [String]
    def type
      parsed_line[2]
    end
  end
end
