module Fastlane
  module Actions
    class DockerComposeAction < Action
      def self.run(params)
        unless `which docker-compose`.include?("docker-compose")
          UI.error("docker-compose was not found")
          UI.error("please read the following https://docs.docker.com/compose/install/ on how to install it.")
          UI.user_error!("docker-compose not installed")
        end

        command = "docker-compose "
        command << params[:files].map { |item| " -f " + item }.join + " " if params[:files]
        command << "--project-name {params[:project].shellescape} " if params[:project]
        command << params[:command]
        command << " -d " if params[:command] == "up" && params[:detach]

        Actions.sh command, log: true
      end

      def self.description
        "Define and run multi-container applications with Docker"
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :files,
                                       description: "Compose files",
                                       env_name: "DOCKER_BUILD_COMPOSE_FILES",
                                       is_string: false,
                                       optional: true,
                                       type: Array),
          FastlaneCore::ConfigItem.new(key: :command,
                                       description: "Compose command (up, down, pull ....)",
                                       default_value: "log",
                                       optional: false,
                                       env_name: "DOCKER_COMPOSE_COMMAND"),
          FastlaneCore::ConfigItem.new(key: :detach,
                                       description: "Detach on run",
                                       optional: true,
                                       is_string: false,
                                       default_value: true,
                                       env_name: "DOCKER_COMPOSE_DETACH"),
          FastlaneCore::ConfigItem.new(key: :project,
                                       description: "Compose project name",
                                       optional: true,
                                       env_name: "DOCKER_COMPOSE_PROJECT")
        ]
      end

      def self.authors
        ["hjanuschka"]
      end

      def self.is_supported?(platform)
        true
      end
    end
  end
end
