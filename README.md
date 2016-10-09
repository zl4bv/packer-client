# Packer Client

[![Build Status](https://travis-ci.org/zl4bv/packer-ruby.svg?branch=master)](https://travis-ci.org/zl4bv/packer-ruby)

A ruby client for HashiCorp's [Packer](https://www.packer.io) tool.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'packer-client'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install packer-client

## Usage

```ruby
require 'packer'
client = Packer::Client.new

# Override path to Packer executable
client.executable_path = 'C:\HashiCorp\Packer\packer.exe'

# Override maximum time that Packer may execute for
client.execution_timeout = 7200
```

### Build: Build image(s) from template

```ruby
client.build('template.json')

# Get build artifacts
client.build('template.json').artifacts
```

### Fix: Fix template

```ruby
# Get the fixed template JSON
client.fix('template.json').json

# Determine if template is valid
client.fix('template.json').valid?
```

### Inspect: See components of a template

```ruby
# Get user variables
client.inspect_template('template.json').template_variables

# Get builders
client.inspect_template('template.json').template_builders

# Get provisioners
client.inspect_template('template.json').template_provisioners
```

### Push: Push a template to a Packer build service

```ruby
client.push('template.json')
```

### Validate: Check that a template is valid

```ruby
client.validate('template.json').valid?
```

### Version: Get the Packer version

```ruby
# Get version
client.version.version

# Get version commit
client.version.version_commit

# Get prerelease version
client.version.version_prerelease
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/zl4bv/packer-ruby. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.
