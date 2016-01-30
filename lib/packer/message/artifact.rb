module Packer
  module Message
    class Artifact < Base
      attr_accessor :artifact_index

      attr_accessor :builder_id

      attr_accessor :files

      attr_accessor :id

      attr_accessor :nil

      attr_accessor :string
    end
  end
end
