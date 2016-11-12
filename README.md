# docker plugin

[![fastlane Plugin Badge](https://rawcdn.githack.com/fastlane/fastlane/master/fastlane/assets/plugin-badge.svg)](https://rubygems.org/gems/fastlane-plugin-docker)

## Getting Started

This project is a [fastlane](https://github.com/fastlane/fastlane) plugin. To get started with `fastlane-plugin-docker`, add it to your project by running:

```bash
fastlane add_plugin docker
```

## About docker

Actions to support building images, logging into Docker Hub, and pushing those images to the Hub

## Example

Here is some sample code to get you started:

```ruby

lane :release_docker_image do
  ensure_docker_machine_available(
    machine_name: "docker-build-machine"
  )

  docker_login

  docker_build(
    repository: "example-org/server",
    tag: "1.2.0"
  )

  docker_push
end

```

This will start using a docker machine (creating it if it doesn't exist yet), login to docker hub, build and tag a new docker image and push that image to Docker Hub. 




```ruby
lane :update_compose_deployment do
  ensure_docker_machine_available(
    machine_name: "docker-build-machine"
  )
  docker_compose(
    command: "pull"
  )
  docker_compose(
    command: "up"
  )
end

```


Alternatively, check out the [example `Fastfile`](fastlane/Fastfile) to see how to use this plugin. Try it by cloning the repo, setting your Docker Hub username and password as environment variables by running `export DOCKER_LOGIN_USER="<your user name>"` and `export DOCKER_LOGIN_PASSWORD="<your password>"`, running `fastlane install_plugins` and `bundle exec fastlane test`. 

Attention: If you don't change the example Fastfile at all, a new repository with `<your username>/test` will be pushed to Docker Hub!

## Run tests for this plugin

To run both the tests, and code style validation, run

```
rake
```

To automatically fix many of the styling issues, use
```
rubocop -a
```

## Issues and Feedback

For any other issues and feedback about this plugin, please submit it to this repository.

## Troubleshooting

If you have trouble using plugins, check out the [Plugins Troubleshooting](https://github.com/fastlane/fastlane/blob/master/fastlane/docs/PluginsTroubleshooting.md) doc in the main `fastlane` repo.

## Using `fastlane` Plugins

For more information about how the `fastlane` plugin system works, check out the [Plugins documentation](https://github.com/fastlane/fastlane/blob/master/fastlane/docs/Plugins.md).

## About `fastlane`

`fastlane` is the easiest way to automate beta deployments and releases for your iOS and Android apps. To learn more, check out [fastlane.tools](https://fastlane.tools).
