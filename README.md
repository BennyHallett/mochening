# Mochening

TODO: Write a gem description
Mochening makes it easy to define expectations and stubs for your database when using Sequel

## Installation

Add this line to your application's Gemfile:

    gem 'mochening'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mochening

## Usage

TODO: Write usage instructions herea

`Mochening.expects(db).where({ x: 'abc' }).select(:y, [ { y: 123 }, { y: 456 } ])`

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
