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
        @name = options[:name] || "magnum-ci"

        raise Error, "API token required" if @api_token.nil?
      end

      def run(build)
        deliver(build)
      end

      private

      def deliver(build)
        message = Message.new(build)

        client.push_to_team_inbox(
          subject: build["title"],
          content: message.to_s,
          from: { 
            address: "notifications@magnum-ci.com"
          },
          source: "Magnum CI",
          tags: [
            build["branch"], 
            build["status"],
            "ci"
          ]
        )
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
