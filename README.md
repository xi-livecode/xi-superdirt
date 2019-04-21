# Xi::Superdirt

SuperDirt support for Xi


## Installation

Add this line to your application's Gemfile:

```ruby
$ gem install xi-superdirt
```

Configure Xi to require this extension as the backend.


## Usage

You can use the synths/samples defined in SuperDirt. So for example:

```ruby
d1.set s: ["bd", "hh"].p(0.5),
       gate: :s

```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/xi-superdirt. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## Code of Conduct

Everyone interacting in the Xi::Superdirt project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/xi-superdirt/blob/master/CODE_OF_CONDUCT.md).


## License

See [LICENSE](LICENSE.txt)
