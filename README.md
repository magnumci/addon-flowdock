# Slack Addon

Send [Magnum CI](http://magnum-ci.com) build notifications to a [Flowdock](http://flowdock.com)

## Usage

Example:

```ruby
require "magnum/addons/flowdock"

# Initialize addon
addon = Magnum::Addon::Flowdock.new

# Send build payload
addon.run(build_payload)
```

## Testing

Execute test suite:

```
bundle exec rake test
```