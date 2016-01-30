# Packer

[![Build Status](https://travis-ci.org/zl4bv/packer-ruby.svg?branch=master)](https://travis-ci.org/zl4bv/packer-ruby)

A ruby client for HashiCorp's [Packer](https://www.packer.io).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'packer'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install packer

## Usage

```ruby
client = Packer::Client.new
client.executable_path = 'C:\HashiCorp\Packer\packer.exe'
client.execution_timeout = 7200
output = client.build('template.json')
output.messages #=> Array<Packer::Message>
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/packer. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.
