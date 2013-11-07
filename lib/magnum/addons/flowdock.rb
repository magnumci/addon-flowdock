require "magnum/addons/flowdock/version"
require "magnum/addons/flowdock/error"
require "magnum/addons/flowdock/message"
require "magnum/addons/flowdock/payload"

require "flowdock"
require "hashr"

module Magnum
  module Addons
    class Flowdock
      def initialize(options={})
        @api_token = options[:api_token]
        @name      = options[:name] || "magnum-ci"

        raise Error, "API token required" if @api_token.nil?
      end

      def run(build)
        deliver(build)
      end

      private

      def deliver(build)
        message = Message.new(build)
        payload = Payload.new(build, message)
        
        client.push_to_team_inbox(payload.to_hash)
      end

      def client
        @client ||= ::Flowdock::Flow.new(
          api_token: @api_token,
          external_user_name: @name
        )
      end
    end
  end
end
