module Fastlane
  module Actions
    module SharedValues
      DOCKER_ACTIVE_MACHINE = :DOCKER_ACTIVE_MACHINE
    end
    class DockerMachineClient
      def list
        script = <<SCRIPT
        docker-machine ls | tail -n +2 | tr -s " " "," | cut -f 1 -d ","
SCRIPT
        machines = Actions.sh script.strip
        return machines.lines.map(&:strip)
      end

      def machine_available?(machine_name)
        return list.include? machine_name
      end

      def is_running?(machine_name)
        Actions.sh("docker-machine status #{machine_name}").strip == "Running"
      end

      def start(machine_name)
        Actions.sh("docker-machine start #{machine_name}")
      end

      def create_machine(name)
        Actions.sh "docker-machine create -d virtualbox #{name.shellescape} 1> /dev/null"
      end

      def configure_env(machine_name) 
        instructions = (Actions.sh "docker-machine env #{machine_name} --shell sh").lines
        instructions.map!(&:strip).select! { |i| i =~ /^export/ }
        instructions.each do |i|
          key, value = i.split(" ").last.split("=")
          ENV[key] = value.chomp("\"").reverse.chomp("\"").reverse
        end
      end
    end
  end
end
