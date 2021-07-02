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

## Running Tests

First copy the template `.env` file: 

`cp spec/scripts/.env.example spec/scripts/.env`

For running the specs we use Guard and got your back by providing some basic tool that can simplify your developer's life.

There are two methods for runnings tests:

1. Use an external device/PC/box/virtual machine with the D-Bus + NetworkManager setup and run the tests there. Set `RUN_ON_TARGET=true` in `spec/scripts/.env` and also adjust other env variables to your needs.
   Just open up a terminal and: `spec/scripts/remote_guard` -> This will automatically start Guard on the target machine and setup it to run automatically.
   Note: A detached Guard process is started on your machine too, and this communicates with the remote one.

2. **NOT RECOMMENDED** - Run them locally (on your machine). This is possible if you're e.g. on Linux and have the D-Bus + NetworkManager setup, **but not recommended because interacting with networking on your host machine could potentially cause huge problems**.
   Just set `RUN_ON_TARGET=false` in `spec/scripts/.env` file and launch `guard` as usual. 
   

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/nm_dbus. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/nm_dbus/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the NmDbus project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/nm_dbus/blob/master/CODE_OF_CONDUCT.md).
