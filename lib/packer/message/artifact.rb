module Packer
  module Message
    # Message representing an artifact produced by a builder
    class Artifact < Base
      # Zero-based index of the artifact being described
      attr_accessor :artifact_index

      # The unique ID of the builder
      attr_accessor :builder_id

      attr_accessor :files

      # The ID (if any) of the artifact that was built
      attr_accessor :id

      # If +true+, this means the artifact was nil
      attr_accessor :nil

      # The human-readable string description of the artifact
      attr_accessor :string
    end
  end
end
