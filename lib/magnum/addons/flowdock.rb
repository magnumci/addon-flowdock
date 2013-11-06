require "magnum/addons/flowdock/version"
require "magnum/addons/flowdock/error"
require "magnum/addons/flowdock/message"

require "flowdock"
require "hashr"

module Magnum
  module Addons
    class Flowdock
      def initialize(options={})
        @api_token = options[:api_token]

        raise Error, "API token required" if @api_token.nil?
      end

      def run(build)
        message = Message.new(build)
        deliver(message.to_s)
      end
    end
  end
end
