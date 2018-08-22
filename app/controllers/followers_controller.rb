class FollowersController < ApplicationController
  def index
    @followers = GithubUserSearch.new(current_user).followers
  end
end
