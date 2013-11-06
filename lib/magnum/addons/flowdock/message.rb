module Magnum
  module Addons
    class Flowdock
      class Message
        attr_reader :build

        def initialize(build)
          unless build.kind_of?(Hash)
            raise ArgumentError, "Hash required"
          end

          @build = Hashr.new(build)
        end

        def to_s
          lines = [
            "<strong>#{ build.title }</strong>",
            "Commit: <a href='#{ build.commit_url }'>#{ build.message }</a>",
            "Branch: #{ build.branch }",
            "Author: #{ build.author }",
            "Duration: #{ build.duration_string }",
            "<a href='#{ build.build_url }'>View Build</a>"
          ]

          if build.compare_url
            lines << "<a href='#{ build.compare_url }'>View Diff</a>"
          end

          lines.join("<br/>\n")
        end
      end
    end
  end
end