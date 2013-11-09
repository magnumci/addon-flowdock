module Magnum
  module Addons
    class Flowdock
      class Payload
        def initialize(build, message)
          @build   = build
          @message = message
        end

        def to_hash
          {
            subject: @build["title"],
            content: @message.to_s,
            from:    from,
            source:  "Magnum CI",
            tags:    tags,
          }
        end

        private

        def from
          {
            address: flowdock_email,
            name: "CI"
          }
        end

        def flowdock_email
          status = @build["status"] == "pass" ? "ok" : @build["status"]
          "build+#{status}@flowdock.com"
        end

        def tags
          [
            @build["branch"],
            @build["status"],
            "ci"
          ]
        end
      end
    end
  end
end