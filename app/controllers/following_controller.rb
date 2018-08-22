class FollowingController < ApplicationController
  def index
    @followings = GithubUserSearch.new(current_user).followings
  end
end
