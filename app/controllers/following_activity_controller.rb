class FollowingActivityController < ApplicationController
  def index
    @events = GithubUserSearch.new(current_user).following_events
  end
end
