![Codeship Status for Matt0Hara/Crumple](https://codeship.com/projects/5f790d70-63de-0133-91d7-4e7188597f7b/status?branch=master)![Code Climate](https://codeclimate.com/github/Matt0hara/Crumple.png) [![Coverage Status](https://coveralls.io/repos/Matt0hara/Crumple/badge.svg?branch=master&service=github)](https://coveralls.io/github/Matt0hara/Crumple?branch=master)

# Crumple

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/crumple`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'crumple'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install crumple

## Usage
* To export a file:
    crumple FILENAME

* To change dump directory:
    crumple -d directory

* To view the current dump directory:
    crumple -g


## Development
Tests are failing right now due to a conflict with fakefs, a gem used for testing! Gem works fine otherwise.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Matt0Hara/crumple.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
