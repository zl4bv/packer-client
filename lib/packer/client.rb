module Packer
  class Client
    class << self
      # Executes +packer build+.
      #
      # Will execute multiple builds in parallel as defined in the template.
      # The various artifacts created by the template will be outputted.
      #
      # @param [String,Packer::Template] template the Packer template
      # @param [Hash] options
      # @option options [Boolean] :force force a build to continue if artifacts
      #   exist, deletes existing artifacts
      # @option options [Array<String>] :except build all builds other than
      #   these
      # @option options [Array<String>] :only only build the given builds by
      #   name
      # @option options [Boolean] :parallel disable parallelization (on by
      #   default)
      # @option options [Hash] :vars variables for templates
      # @option options [String] :var_file path to JSON file containing user
      #   variables
      def build(template, options = {})
      end

      # Gets the path to the Packer executable. If not manually defined
      # then it defaults to +packer.exe+ on Windows and +packer+ on other
      # platforms.
      #
      # @return [String] path to Packer executable
      def executable_path
        return @executable_path if @executable_path

        # Attempt to load from PATH
        if OS.windows?
          'packer.exe'
        else
          'packer'
        end
      end

      # Sets the path to the Packer executable.
      #
      # @param [String] path to Packer executable
      def executable_path=(path)
        @executable_path = path
      end

      # Gets the maximum amount of time Packer may execute for before timing
      # out. If not manually defined then it defaults to 2 hours.
      #
      # @return [Fixnum] execution timeout
      def execution_timeout
        return @execution_timeout if @execution_timeout

        7200 # 2 hours
      end

      # Sets the maximum amount of time Packer may execute for before timing
      # out.
      #
      # @param [Fixnum] timeout execution timeout
      def execution_timeout=(timeout)
        @execution_timeout = timeout
      end

      # Executes +packer fix+.
      #
      # Reads the JSON template and attempts to fix know backwards
      # incompatibilities. The fixed template will be outputted to standard out.
      #
      # If the template cannot be fixed due to an error, the command will exit
      # will a non-zero exist status. Error messages will appear on standard
      # error.
      #
      # @param [String,Packer::Template] template the Packer template
      # @param [Hash] options
      # @option options [Boolean] :validate if true (default), validates the
      #   fixed template
      def fix(template, options = {})
      end

      # Excutes +packer inspect+
      #
      # Inspects a template, parsing and outputting the components a template
      # defines. This does not validate the contents of a template (other than
      # basic syntax by necessity).
      #
      # @param [String,Packer::Template] template the Packer template
      # @param [Hash] options
      # @option options
      def inspect(template, options = {})
      end

      # Executes +packer push+.
      #
      # Push the given template and supporting files to a Packer build service
      # such as Atlas.
      #
      # If a build configuration for the given template does not exist, it will
      # be created automatically. If the build configuration already exists, a
      # new version will be created with this template and the supporting files.
      #
      # Additional configuration options (such as Atlas server URL and files to
      # include) may be specified in the "push" section of the Packer template.
      # Please see the online documentation about these configurables.
      #
      # @param [String,Packer::Template] template the Packer template
      # @param [Hash] options
      # @option options [String] :message a message to identify the purpose of
      #   changes in this Packer template much like a VCS commit message
      # @option options [String] :name the destination build in Atlas. This is
      #   in a format "username/name".
      # @option options [String] :token the access token to use when uploading
      # @option options [Hash] :vars variables for templates
      # @option options [String] :var_file path to JSON file containing user
      #   variables
      def push(template, options = {})
      end

      # Executes +packer validate+
      #
      # Checks the template is valid by parsing the template and also checking
      # the configuration with the various builders, provisioners, etc.
      #
      # If it is not valid, the errors will be shown and the command will exit
      # with a non-zero exit status. If it is valid, it will exist with a zero
      # exist status.
      #
      # @param [String,Packer::Template] template the Packer template
      # @param [Hash] options
      # @option options [Boolean] :syntax_only only check syntax. Do not verify
      #   config of the template.
      # @option options [Array<String>] :except validate all builds other than
      #   these
      # @option options [Array<String>] :only validate only these builds
      # @option options [Hash] :vars variables for templates
      # @option options [String] :var_file path to JSON file containing user
      #   variables
      def validate(template, options = {})
      end

      # Executes +packer version+
      def version
      end
    end

    # @param [String] command Packer command to execute
    # @param [Array<String>] args arguments for Packer command
    def initialize(command, *args)
      @command = command
      @args = args
    end

    # Executes the Packer command
    def execute
    end
  end
end
