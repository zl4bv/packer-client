module Packer
  module Output
    # Represents the output from +packer build+.
    #
    # @see https://www.packer.io/docs/command-line/build.html
    class Build < MachineReadable
      # Information about an artifact of the targeted item.
      #
      # @return [Array<Packer::Message::Artifact]
      def artifacts
        afcts = []

        afct ||= Packer::Message::Artifact.new
        select_messages('artifact').each do |fields|
          afct.timestamp ||= fields[0]
          afct.target ||= fields[1]
          afct.type ||= 'artifact'
          afct.artifact_index ||= fields[3]

          case fields[4]
          when 'builder-id'
            afct.builder_id = fields[5]
          when 'end'
            afcts << afct
            afct = Packer::Message::Artifact.new
          when 'file'
            afct.files ||= []
            afct.files << Packer::Message::ArtifactFile.from_fields(fields)
          when 'files-count'
            next
          when 'id'
            afct.id = fields[5]
          when 'nil'
            afct.nil = true
          when 'string'
            afct.string = fields[5]
          end
        end

        afcts
      end

      # Build errors that occurred
      #
      # @return [Array<Packer::Message::Error]
      def errors
        select_messages('error').map { |fields| Packer::Message::Error.from_fields(fields) }
      end
    end
  end
end
