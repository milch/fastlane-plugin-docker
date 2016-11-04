module Fastlane
  module Actions
    class DockerPushAction < Action
      def self.run(params)
        UI.message "Pushing docker image..."
        DockerClient.new.push(params[:repository], tag: params[:tag])
      end

      def self.description
        "Push a docker image to its' repository"
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :repository,
                                       description: "The repository to upload",
                                       default_value: Actions.lane_context[SharedValues::DOCKER_BUILT_REPO]),
          FastlaneCore::ConfigItem.new(key: :tag,
                                       description: "The tag to upload",
                                       default_value: Actions.lane_context[SharedValues::DOCKER_BUILT_TAG])
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
