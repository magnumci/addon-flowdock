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
            "<ul>",
            "<li>Commit: <a href='#{ build.commit_url }'>#{ build.message }</a>",
            "<li>Branch: #{ build.branch }</li>",
            "<li>Author: #{ build.author }</li>",
            "<li>Duration: #{ build.duration_string }</li>",
            "<li>View build: #{ build.build_url }</li>"
          ]

          if build.compare_url
            lines << "<li>View diff: #{ build.compare_url }</li>"
          end

          lines << "<ul>"

          lines.join("\n")
        end
      end
    end
  end
end