module Fastlane
  module Helper
    class DockerHelper
      # class methods that you define here become available in your action
      # as `Helper::DockerHelper.your_method`
      #
      def self.show_message
        UI.message("Hello from the docker plugin helper!")
      end
    end
  end
end
