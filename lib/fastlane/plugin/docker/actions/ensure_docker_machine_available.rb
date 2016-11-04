module Fastlane
  module Actions
    class EnsureDockerMachineAvailableAction < Action
      def self.run(params)
        client = DockerMachineClient.new
        machine_name = params[:machine_name]

        unless client.machine_available? machine_name
          UI.message "No machine of name #{machine_name} found, creating one..."
          client.create_machine machine_name
        end

        client.start(machine_name) unless client.is_running? machine_name

        client.configure_env(machine_name)

        UI.message "Your machine is ready to go!"
        Actions.lane_context[SharedValues::DOCKER_ACTIVE_MACHINE] = machine_name
      end

      def self.description
        "Makes sure a docker machine is created and available for us to use"
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :machine_name,
                                       description: "Name of the Docker Machine",
                                       default_value: "fastlane-docker")

        ]
      end

      def self.authors
        ["milch"]
      end

      def self.is_supported?(platform)
        true
      end
    end
  end
end
