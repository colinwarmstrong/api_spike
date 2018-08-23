class ReposController < ApplicationController
  def index
    @repos = GithubUserSearch.new(current_user).repos
  end
end
