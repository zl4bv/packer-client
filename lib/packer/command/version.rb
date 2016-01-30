module Packer
  module Command
    # Represents the output from +packer version+.
    class Version < Base
      # The version of Packer running, only including the major, minor, and
      # patch versions.
      #
      # @return [String]
      def version
        msgs = messages.select { |msg| msg.type == 'version' }
        msgs.first.data.first
      end

      # The SHA1 of the Git commit that build this version of Packer.
      #
      # @return [String]
      def version_commit
        msgs = messages.select { |msg| msg.type == 'version-commit' }
        msgs.first.data.first
      end

      # The prerelease tag (if any) for the running version of packer.
      #
      # @return [String]
      def version_prerelease
        msgs = messages.select { |msg| msg.type == 'version-prelease' }
        msgs.first.data.first
      end
    end
  end
end
