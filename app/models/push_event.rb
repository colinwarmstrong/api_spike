class PushEvent
  attr_reader :commits,
              :repo,
              :created_at

  def initialize(push_event_info)
    @commits = push_event_info[:payload][:commits]
    @repo = push_event_info[:repo][:name]
    @created_at = Time.parse(push_event_info[:created_at])
  end
end
