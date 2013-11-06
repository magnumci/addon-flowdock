# Flowdock Addon

Send [Magnum CI](http://magnum-ci.com) build notifications to a [Flowdock](http://flowdock.com) room

## Usage

Example:

```ruby
require "magnum/addons/flowdock"

# Initialize addon
addon = Magnum::Addon::Flowdock.new(api_token: "token")

# Send build payload
addon.run(build_payload)
```