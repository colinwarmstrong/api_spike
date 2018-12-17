class GithubUserSearch
  def initialize(user)
    @service = GithubUserService.new(user)
    @user = user
  end

  def followings
    @service.api_call('following').map do |raw_following_data|
      GithubUser.new(raw_following_data)
    end
  end

  def followers
    @service.api_call('followers').map do |raw_follower_info|
      GithubUser.new(raw_follower_info)
    end
  end

  def repos
    @service.api_call('repos').map do |raw_repo_info|
      Repo.new(raw_repo_info)
    end
  end

  def organizations
    @service.api_call('orgs').map do |raw_organization_info|
      Organization.new(raw_organization_info)
    end
  end

  def starred_repos
    @service.api_call('starred').count
  end

  def recent_commits
    push_events = @service.api_call('events').find_all do |event|
      event[:type] == 'PushEvent' && event[:payload][:commits]
    end
    push_event_objects = push_events.map do |raw_push_event_info|
      PushEvent.new(raw_push_event_info)
    end
    commits = push_event_objects.map do |push_event|
      push_event.commits.map do |commit_info|
        Commit.new(push_event.created_at, commit_info[:author][:name], commit_info[:message], push_event.repo) if commit_info[:author][:name] == @user.name
      end.compact
    end.flatten
    commits.shift(25)
  end

  def following_events
    received_events = @service.api_call('received_events')
    events = received_events.map do |event_info|
      FollowingEvent.new(event_info)
    end
    events.shift(25)
  end
end
