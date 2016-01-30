module Packer
  module Command
    # Represents the output from +packer build+.
    class Build < Base
      def artifacts
        # FIXME: Return actual artifact objects
        messages.select { |msg| msg.type == 'artifact' }
      end

      def artifact_count
        msgs = messages.select { |msg| msg.type == 'artifact-count' }
        msgs.first.data.first
      end

      def errors
        # FIXME: Return actual error objects
        messages.select { |msg| msg.type == 'error' }
      end

      def error_count
        msgs = messages.select { |msg| msg.type == 'error-count' }
        msgs.empty? ? 0 : msgs.first.data.first
      end
    end
  end
end
