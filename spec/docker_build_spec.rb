describe Fastlane::Actions::DockerBuildAction do
  describe '#run' do
    it 'Builds the image' do
      repo = "test"
      path = "path"
      tag = "0.1"

      mock_client = Fastlane::Actions::DockerClient.new

      allow(Fastlane::Actions::DockerClient).to receive(:new).and_return(mock_client)
      allow(mock_client).to receive(:build).with(repo, path, tag: tag).and_return(true)

      Fastlane::Actions::DockerBuildAction.run(repository: repo, path: path, tag: tag)
    end
  end
end
