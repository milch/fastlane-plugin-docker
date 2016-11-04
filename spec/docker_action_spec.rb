describe Fastlane::Actions::DockerAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The docker plugin is working!")

      Fastlane::Actions::DockerAction.run(nil)
    end
  end
end
