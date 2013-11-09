# Flowdock Addon

Send [Magnum CI](http://magnum-ci.com) build notifications to a 
[Flowdock](http://flowdock.com) team inbox.

## Usage

Example:

```ruby
require "magnum/addons/flowdock"

# Initialize addon
addon = Magnum::Addon::Flowdock.new(api_token: "token")

# Send build payload
addon.run(build_payload)
```

## Testing

Execute test suite:

```
bundle exec rake test
```

## License

Copyright (c) 2013 Dan Sosedoff, Magnum CI

MIT License