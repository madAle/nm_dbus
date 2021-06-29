# NmDbus

NetworkManager D-Bus client

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'nm_dbus'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install nm_dbus

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

### Running Tests
1. Build the base docker image w/ RVM. This image is based on the Raspberry Pi 3 Debian Buster image, but you can change it at your needs. This is needed only once.
```shell
docker build -f spec/Dockerfile_raspberry3_debian_buster_rvm -t fancypixel/raspi3_buster_rvm:latest .
```

2. Build the docker image for the required ruby version. Customize it at your needs. This is needed only once.
```shell
docker build -f spec/Dockerfile_run_specs -t fancypixel/nm_dbus:ruby-3.0.1 . --build-arg ruby_version=ruby-3.0.1
```

3. Run specs
```shell

```


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/nm_dbus. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/nm_dbus/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the NmDbus project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/nm_dbus/blob/master/CODE_OF_CONDUCT.md).
