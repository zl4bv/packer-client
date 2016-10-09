module Packer
  module Command
    # Represents the output from +packer inspect+.
    #
    # @see https://www.packer.io/docs/command-line/inspect.html
    class Inspect < MachineReadable
      # User variables defined within the template.
      #
      # @return [Array<Packer::Message::TemplateVariable]
      def template_variables
        select_messages('template-variable').map { |fields| Packer::Message::TemplateVariable.from_fields(fields) }
      end

      # Builders defined within the template.
      #
      # @return [Array<Packer::Message::TemplateVariable]
      def template_builders
        select_messages('template-builder').map { |fields| Packer::Message::TemplateBuilder.from_fields(fields) }
      end

      # Provisioners defined within the template.
      #
      # @return [Array<Packer::Message::TemplateVariable]
      def template_provisioners
        select_messages('template-provisioner').map { |fields| Packer::Message::TemplateProvisioner.from_fields(fields) }
      end
    end
  end
end
