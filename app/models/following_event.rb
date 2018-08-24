class FollowingEvent
  attr_reader :type,
              :login,
              :image,
              :repo,
              :created_at
              
  def initialize(event_info)
    @type = event_info[:type]
    @login = event_info[:actor][:login]
    @image = event_info[:actor][:avatar_url]
    @repo = event_info[:repo][:name]
    @created_at = Time.parse(event_info[:created_at])
  end

  def verb
    if @type == 'WatchEvent'
      'started watching'
    elsif @type == 'CreateEvent'
      'created'
    elsif @type == 'ForkEvent'
      'forked'
    else
      ''
    end
  end
end
