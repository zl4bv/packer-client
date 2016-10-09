module Packer
  module Command
    # Represents the output from +packer version+.
    #
    # @see https://www.packer.io/docs/machine-readable/command-version.html
    class Version < MachineReadable
      # The version of Packer running, only including the major, minor, and
      # patch versions.
      #
      # @return [String]
      def version
        msgs = select_messages('version')
        msgs[0][3]
      end

      # The SHA1 of the Git commit that build this version of Packer.
      #
      # @return [String]
      def version_commit
        msgs = select_messages('version-commit')
        msgs[0][3]
      end

      # The prerelease tag (if any) for the running version of packer.
      #
      # @return [String]
      def version_prerelease
        msgs = select_messages('version-prelease')
        msgs[0][3]
      end
    end
  end
end
