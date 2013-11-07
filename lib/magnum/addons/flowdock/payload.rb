module Magnum
  module Addons
    class Flowdock
      class Payload
        SOURCE = "Magnum CI"
        EMAIL  = "notifications@magnum-ci.com"

        def initialize(build, message)
          @build   = build
          @message = message
        end

        def to_hash
          {
            subject: @build["title"],
            content: @message.to_s,
            from:    from,
            source:  SOURCE,
            tags:    [ @build["branch"], @build["status"], "ci" ]
          }
        end

        private

        def from
          { address: EMAIL }
        end
      end
    end
  end
end