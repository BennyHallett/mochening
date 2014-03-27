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

Mochening allows you to easily use Mocha to mock the calls onto a Sequel database object.

The common pattern of usage is:

    Mochening::Expect.from(mock_database) do |db|
      db[:table].where(a: 'a', b: 'b').select(:c, :d).all [{ c: '1', d: '1' }, { c: '2', d: '2' }]
    end


In the above example, we're given a Mocha mock object, and inside the block we're easily able to apply expectations to the database in the same style that the Sequel database object is called.

The `.all` and `.first` methods expect that a return value is provided, so that Mochening knows what it should return when the method is called.

## Available Sequel methods

At the moment, only a subset of Sequel functionality is able to be mocked. Only expectations are able to be set at this time, but stubs are planned for the future.

**Expectations**

* [:table_name]
* where
* select
* insert
* all
* first

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
