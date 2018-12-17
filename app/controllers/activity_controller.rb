class ActivityController < ApplicationController
  def index
    @recent_commits = GithubUserSearch.new(current_user).recent_commits
  end
end
