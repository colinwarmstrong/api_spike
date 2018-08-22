class GithubUserSearch
  def initialize(user)
    @service = GithubUserService.new(user)
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

  def starred_repos
    @service.api_call('starred').count
  end
end