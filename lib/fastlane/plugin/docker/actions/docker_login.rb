module Fastlane
  module Actions
    class DockerLoginAction < Action
      def self.run(params)
        UI.message "Logging into docker hub..."
        DockerClient.new.login(params[:username], params[:password], email: params[:email])
      end

      def self.description
        "Login to Docker Hub"
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :username,
                                       description: "Username for Docker Hub",
                                       env_name: "DOCKER_LOGIN_USER"),
          FastlaneCore::ConfigItem.new(key: :password,
                                       description: "Password for Docker Hub",
                                       env_name: "DOCKER_LOGIN_PASSWORD"),
          FastlaneCore::ConfigItem.new(key: :email,
                                       description: "Email for Docker Hub",
                                       optional: true)
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
