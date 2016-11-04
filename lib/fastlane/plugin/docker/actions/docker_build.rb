module Fastlane
  module Actions
    module SharedValues
      DOCKER_BUILT_IMAGE = :DOCKER_BUILT_IMAGE
      DOCKER_BUILT_REPO = :DOCKER_BUILT_REPO
      DOCKER_BUILT_TAG = :DOCKER_BUILT_TAG
    end

    class DockerBuildAction < Action
      def self.run(params)
        UI.message "Building docker image..."

        Actions.lane_context[SharedValues::DOCKER_BUILT_IMAGE] = DockerClient.new.build(params[:repository], params[:path], tag: params[:tag])
        Actions.lane_context[SharedValues::DOCKER_BUILT_REPO] = params[:repository]
        Actions.lane_context[SharedValues::DOCKER_BUILT_TAG] =  params[:tag]
      end

      def self.description
        "Build docker images in the current directory"
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :repository,
                                       description: "The docker repository",
                                       env_name: "DOCKER_BUILD_REPOSITORY"),
          FastlaneCore::ConfigItem.new(key: :tag,
                                       description: "The tag for the new image",
                                       default_value: "latest",
                                       env_name: "DOCKER_BUILD_TAG"),
          FastlaneCore::ConfigItem.new(key: :path,
                                       description: "Path to the Dockerfile",
                                       default_value: ".",
                                       env_name: "DOCKER_BUILD_PATH")
        ]
      end

      def self.output
        [
          ["DOCKER_BUILT_IMAGE", "The ID of the docker image that was built. Other docker actions pick this up automatically"],
          ["DOCKER_BUILT_REPO", "The Repository of the docker image that was built. Other docker actions pick this up automatically"],
          ["DOCKER_BUILT_TAG", "The Tag of the docker image that was built. Other docker actions pick this up automatically"]
        ]
      end

      def self.return_value
        "The ID of the created image"
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
